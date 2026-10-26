#!/usr/bin/env python3
"""Mutation checks for the static quality gate in a disposable repository copy."""

from __future__ import annotations

import shutil
import subprocess
import tempfile
from pathlib import Path

SOURCE = Path(__file__).resolve().parent.parent


def check(root: Path, expected: str | None) -> None:
    result = subprocess.run(
        ["python3", str(root / "scripts" / "quality_check.py")],
        cwd=root, capture_output=True, text=True, check=False,
    )
    if expected is None:
        assert result.returncode == 0, result.stdout + result.stderr
    else:
        assert result.returncode != 0 and expected in result.stdout, result.stdout + result.stderr


def main() -> None:
    with tempfile.TemporaryDirectory(prefix="skill-quality-") as tmp:
        root = Path(tmp) / "repo"
        shutil.copytree(SOURCE, root, ignore=shutil.ignore_patterns(".git", "__pycache__", "*.pyc"))
        check(root, None)

        entry = root / "skills" / "design" / "a11y-audit" / "SKILL.md"
        original = entry.read_text(encoding="utf-8")
        entry.write_text(original + "\n[missing](references/missing.md)\n", encoding="utf-8")
        check(root, "broken local link")
        entry.write_text(original, encoding="utf-8")

        script = root / "skills" / "design" / "design-reference-search" / "scripts" / "search.py"
        original = script.read_text(encoding="utf-8")
        script.write_text(original + "\n# unauthorized change\n", encoding="utf-8")
        check(root, "executable hash changed")
        script.write_text(original, encoding="utf-8")

        provenance = root / "UPSTREAM.md"
        original_provenance = provenance.read_text(encoding="utf-8")
        provenance.write_text(original_provenance.replace("| a11y-audit |", "| a11y-audit-stale |", 1), encoding="utf-8")
        check(root, "provenance table differs")
        provenance.write_text(original_provenance, encoding="utf-8")

        registry = root / "registry" / "skills.tsv"
        original = registry.read_text(encoding="utf-8")
        registry.write_text("\n".join(line for line in original.splitlines() if not line.startswith("a11y-audit\t")) + "\n", encoding="utf-8")
        check(root, "protected baseline skill missing")
    print("PASS quality gate rejects broken links, executable drift, provenance drift, and protected-ID removal")


if __name__ == "__main__":
    main()
