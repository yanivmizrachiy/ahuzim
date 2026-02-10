#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import argparse, json, time, sys
from pathlib import Path

def die(msg: str, code: int = 2):
    print(msg, file=sys.stderr)
    raise SystemExit(code)

def load_json(path: Path):
    if not path.exists():
        return {"schema": "ahuzim.chapters.v1", "updatedAt": int(time.time()), "chapters": []}
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception as e:
        die(f"❌ chapters.json לא תקין: {e}")

def save_json(path: Path, obj):
    obj["updatedAt"] = int(time.time())
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

def main():
    ap = argparse.ArgumentParser(
        description="Add or update a chapter in data/chapters.json (safe, idempotent).",
        add_help=True
    )
    ap.add_argument("--id", required=True, help="Chapter id, e.g. c2")
    ap.add_argument("--title", required=True, help="Chapter title")
    ap.add_argument("--status", default="draft", choices=["draft","active","archived"], help="Chapter status")
    ap.add_argument("--notes", default="", help="Notes (optional)")
    args = ap.parse_args()

    data_path = Path("data/chapters.json")
    obj = load_json(data_path)

    if obj.get("schema") != "ahuzim.chapters.v1":
        die(f"❌ schema לא צפוי: {obj.get(schema)}")

    chapters = obj.get("chapters", [])
    cid = args.id.strip()
    title = args.title.strip()
    status = args.status.strip()
    notes = args.notes.strip()

    found = None
    for c in chapters:
        if c.get("id") == cid:
            found = c
            break

    if found is None:
        chapters.append({
            "id": cid,
            "title": title,
            "status": status,
            "notes": notes,
            "questions": []
        })
        print(f"✅ נוסף פרק: {cid} - {title}")
    else:
        found["title"] = title
        found["status"] = status
        found["notes"] = notes
        found.setdefault("questions", [])
        print(f"✅ עודכן פרק: {cid} - {title}")

    obj["chapters"] = chapters
    save_json(data_path, obj)

if __name__ == "__main__":
    main()
