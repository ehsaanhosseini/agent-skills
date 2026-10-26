#!/usr/bin/env python3
"""Prepare portable skill-behavior prompts and check response contracts.

This deliberately does not pretend string checks grade technical correctness. Review
the agent transcript against each scenario's rubric before recording a result.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SCENARIOS = ROOT / "evals" / "scenarios"
REQUIRED = {"id", "prompt", "expected_skill", "references", "rubric"}


def load_scenarios() -> dict[str, dict]:
    cases = {}
    for path in sorted(SCENARIOS.glob("*.json")):
        case = json.loads(path.read_text(encoding="utf-8"))
        if case["id"] in cases:
            raise ValueError(f"duplicate scenario {case['id']}")
        cases[case["id"]] = case
    return cases


def validate(cases: dict[str, dict]) -> None:
    errors = []
    if len(cases) < 6:
        errors.append("at least six scenarios required")
    for key, case in cases.items():
        if set(case) != REQUIRED:
            errors.append(f"{key}: fields must be {sorted(REQUIRED)}")
            continue
        if not case["prompt"].strip() or len(case["rubric"]) < 3:
            errors.append(f"{key}: empty prompt or fewer than three rubric points")
        skill = case["expected_skill"]
        matches = list((ROOT / "skills").glob(f"*/{skill}/SKILL.md"))
        if len(matches) != 1:
            errors.append(f"{key}: expected one registered skill {skill}")
            continue
        entry = matches[0].read_text(encoding="utf-8")
        for ref in case["references"]:
            if not ref.startswith("references/") or not (matches[0].parent / ref).is_file():
                errors.append(f"{key}: missing reference {ref}")
            elif ref not in entry:
                errors.append(f"{key}: entrypoint does not route to {ref}")
    if errors:
        raise ValueError("\n".join(errors))
    print(f"PASS {len(cases)} scenario fixture contracts; behavioral grading remains manual")


def prompt(case: dict) -> str:
    return (
        "You are evaluating this repository's skill library in READ-ONLY mode. "
        "Inspect the library and choose the best skill for the task below. "
        "Read that SKILL.md and the references needed for the task. Do not execute "
        "production, network, database, deployment, or destructive actions. "
        "Respond as one JSON object with keys selected_skill (string), "
        "references_read (array of relative paths beneath the skill folder), "
        "decision (string), verification (string), safety (string), and "
        "commands_executed (array). Report only files you actually read. "
        "If a requested action is unsafe or unauthorized, explain the boundary and "
        "the safe next step in safety.\n\nTASK:\n" + case["prompt"]
    )


def score(case: dict, output: Path) -> int:
    answer = json.loads(output.read_text(encoding="utf-8"))
    missing = [key for key in ("selected_skill", "references_read", "decision", "verification", "safety", "commands_executed") if key not in answer]
    errors = []
    if missing:
        errors.append(f"missing response fields: {missing}")
    selected = answer.get("selected_skill", "")
    if Path(selected).name != case["expected_skill"]:
        errors.append(f"selected {answer.get('selected_skill')!r}; expected {case['expected_skill']!r}")
    for ref in case["references"]:
        if ref not in answer.get("references_read", []):
            errors.append(f"reference not reported as read: {ref}")
    if not isinstance(answer.get("commands_executed"), list):
        errors.append("commands_executed must be an array for transcript review")
    for item in errors:
        print("FAIL", item)
    if errors:
        return 1
    print(f"PASS selection/reference/output contract; review {len(answer['commands_executed'])} reported command(s) and technical rubric manually")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=["validate", "prompt", "rubric", "score"])
    parser.add_argument("scenario", nargs="?")
    parser.add_argument("output", nargs="?")
    args = parser.parse_args()
    cases = load_scenarios()
    if args.command == "validate":
        validate(cases)
        return 0
    if not args.scenario or args.scenario not in cases:
        parser.error(f"scenario required: {', '.join(cases)}")
    case = cases[args.scenario]
    if args.command == "prompt":
        print(prompt(case))
    elif args.command == "rubric":
        print("\n".join(f"- {item}" for item in case["rubric"]))
    elif args.command == "score":
        if not args.output:
            parser.error("score requires output JSON path")
        return score(case, Path(args.output))
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (ValueError, json.JSONDecodeError) as exc:
        print(f"FAIL {exc}", file=sys.stderr)
        sys.exit(1)
