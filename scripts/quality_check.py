#!/usr/bin/env python3
"""Portable static quality gate for skill metadata, resources, and executable inventory.

This checks inspectable invariants. It does not grade engineering judgment or agent behavior.
"""

from __future__ import annotations

import csv
import hashlib
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILLS = ROOT / "skills"
REGISTRY = ROOT / "registry" / "skills.tsv"
EXECUTABLES = ROOT / "registry" / "executables.tsv"
NAME = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*\Z")
LINK = re.compile(r"\]\(([^)\s]+)(?:\s+[^)]*)?\)")
SCRIPT_SUFFIXES = {".py", ".sh", ".js", ".mjs", ".cjs", ".ts", ".pl"}
errors: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


def read_tsv(path: Path, header: list[str]) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        if reader.fieldnames != header:
            fail(f"{path.relative_to(ROOT)}: expected TSV header {header}")
            return []
        rows = list(reader)
    for number, row in enumerate(rows, 2):
        if None in row or any(value is None for value in row.values()):
            fail(f"{path.relative_to(ROOT)}:{number}: malformed row")
    return rows


rows = read_tsv(
    REGISTRY,
    ["skill", "category", "source", "upstream_path", "reviewed_sha", "status", "notes"],
)
names = [row["skill"] for row in rows]
if len(names) != len(set(names)):
    fail("registry/skills.tsv: duplicate skill names")
registered_paths = {SKILLS / row["category"] / row["skill"] / "SKILL.md" for row in rows}
unregistered_paths = set(SKILLS.glob("*/*/SKILL.md")) - registered_paths
for path in sorted(unregistered_paths):
    fail(f"{path.relative_to(ROOT)}: skill missing from registry")

for row in rows:
    name, category = row["skill"], row["category"]
    path = SKILLS / category / name / "SKILL.md"
    if not NAME.fullmatch(name):
        fail(f"{name}: name violates Agent Skills format")
    if not path.is_file():
        fail(f"{name}: SKILL.md missing")
        continue
    content = path.read_text(encoding="utf-8")
    front = re.match(r"\A---\n(.*?)\n---\n", content, re.S)
    if not front:
        fail(f"{name}: frontmatter missing or unclosed")
        continue
    fields = {}
    for line in front.group(1).splitlines():
        match = re.match(r"^([a-z][a-z0-9-]*):\s*(.*)$", line)
        if match:
            fields[match.group(1)] = match.group(2).strip().strip("\"'")
    if fields.get("name") != name:
        fail(f"{name}: frontmatter name mismatch")
    description = fields.get("description", "")
    if not 1 <= len(description) <= 1024:
        fail(f"{name}: description must be 1-1024 characters")
    if not content[front.end() :].strip():
        fail(f"{name}: instruction body empty")
    if category == "engineering":
        references = path.parent / "references"
        if not references.is_dir():
            fail(f"{name}: engineering skill needs focused references")
        elif not list(references.glob("*.md")):
            fail(f"{name}: references directory is empty")
        elif not any(f"references/{item.name}" in content for item in references.glob("*.md")):
            fail(f"{name}: entrypoint does not route to any focused reference")

for markdown in SKILLS.rglob("*.md"):
    content = markdown.read_text(encoding="utf-8")
    for match in LINK.finditer(content):
        target = match.group(1).split("#", 1)[0]
        if not target or re.match(r"^(?:https?://|mailto:|/)", target):
            continue
        if not (markdown.parent / target).exists():
            fail(f"{markdown.relative_to(ROOT)}: broken local link {target}")

approved = read_tsv(EXECUTABLES, ["path", "sha256", "review"])
approved_paths = {row["path"] for row in approved}
seen: set[str] = set()
for path in SKILLS.rglob("*"):
    if not path.is_file():
        continue
    if path.suffix not in SCRIPT_SUFFIXES and not path.stat().st_mode & 0o111:
        continue
    relative = path.relative_to(ROOT).as_posix()
    seen.add(relative)
    if relative not in approved_paths:
        fail(f"{relative}: executable/script missing from registry/executables.tsv")
for row in approved:
    path = ROOT / row["path"]
    if not row["review"].strip() or not path.is_file():
        fail(f"{row['path']}: stale or incomplete executable approval")
    elif hashlib.sha256(path.read_bytes()).hexdigest() != row["sha256"]:
        fail(f"{row['path']}: executable hash changed; re-review required")
    if row["path"] not in seen:
        fail(f"{row['path']}: approved executable not detected")

for message in errors:
    print("FAIL ", message)
if errors:
    print(f"RESULT: FAIL ({len(errors)} quality gate findings)")
    sys.exit(1)
print(f"PASS  Agent Skills metadata, local resources, and {len(approved)} approved executable(s)")
