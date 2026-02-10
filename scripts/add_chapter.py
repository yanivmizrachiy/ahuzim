#!/usr/bin/env python3
from pathlib import Path
import json, time, sys

def die(msg):
    print("❌ " + msg)
    sys.exit(1)

def main():
    if len(sys.argv) < 3:
        die("שימוש: python scripts/add_chapter.py c2 "פרק 2 — ..."")

    cid = sys.argv[1].strip()
    title = sys.argv[2].strip()

    data_path = Path("data/chapters.json")
    if not data_path.exists():
        die("אין data/chapters.json. צור אותו קודם.")

    obj = json.loads(data_path.read_text(encoding="utf-8"))
    if obj.get("schema") != "ahuzim.chapters.v1":
        die("schema לא תואם (מצופה ahuzim.chapters.v1)")

    chapters = obj.get("chapters", [])
    if any(c.get("id") == cid for c in chapters):
        die(f"פרק {cid} כבר קיים")

    chapters.append({
        "id": cid,
        "title": title,
        "status": "draft",
        "notes": "נוצר אוטומטית. מלא questions ואז נשנה ל-active.",
        "questions": []
    })

    obj["chapters"] = chapters
    obj["updatedAt"] = int(time.time())
    data_path.write_text(json.dumps(obj, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("✅ נוסף פרק:", cid, "-", title)

if __name__ == "__main__":
    main()
