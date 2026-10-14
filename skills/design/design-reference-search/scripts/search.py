#!/usr/bin/env python3
"""Small, offline search over the reviewed Pro Max CSV subset.

Local adaptation; source data: nextlevelbuilder/ui-ux-pro-max-skill at
7246805992a42b7bba37d4cac83b01416f0c6c44 (MIT).
"""
import argparse
import csv
import json
import re
from pathlib import Path

DOMAINS = (
    "products", "app-interface", "styles", "colors", "typography",
    "charts", "ux-guidelines", "landing",
)
DATA = Path(__file__).resolve().parent.parent / "data"
STOP = {"a", "an", "and", "for", "in", "of", "on", "the", "to", "ui", "ux"}


def words(value):
    return [w for w in re.findall(r"[a-z0-9]+", value.lower()) if w not in STOP]


def search(domain, query, limit):
    terms = set(words(query))
    if not terms:
        return []
    with (DATA / f"{domain}.csv").open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.DictReader(handle))
    found = []
    for row in rows:
        keyword = " ".join(v for k, v in row.items() if k and "keyword" in k.lower())
        title = " ".join(v for k, v in row.items() if k and k.lower() in {
            "product type", "style category", "font pairing name", "data type",
            "category", "issue", "pattern name",
        })
        matched = terms & set(words(keyword + " " + title))
        # Weak one-word overlaps on multi-term briefs caused false categories in audit.
        if len(terms) > 1 and len(matched) < 2:
            continue
        all_text = " ".join(v or "" for v in row.values())
        score = 3 * len(terms & set(words(keyword))) + 2 * len(terms & set(words(title)))
        score += len(terms & set(words(all_text)))
        if score <= 0:
            continue
        found.append((score, row))
    found.sort(key=lambda item: (-item[0], item[1].get("No", "")))
    return [{"score": score, "row": row} for score, row in found[:limit]]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--domain", required=True, choices=DOMAINS)
    parser.add_argument("--query", required=True)
    parser.add_argument("--limit", type=int, default=3)
    args = parser.parse_args()
    if not 1 <= args.limit <= 10:
        parser.error("--limit must be between 1 and 10")
    print(json.dumps(search(args.domain, args.query, args.limit), ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
