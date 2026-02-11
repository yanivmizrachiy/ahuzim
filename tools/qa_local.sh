#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
export PAGER=cat GIT_PAGER=cat

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

TARGET="app/index.html"
CH="data/chapters.json"

echo "=== QA LOCAL ==="
test -f "$TARGET" || { echo "❌ missing $TARGET"; exit 1; }
test -f "$CH" || { echo "❌ missing $CH"; exit 1; }

echo "1) markers"
grep -q "AH_CHAPTER_UI_BASE_V0" "$TARGET" || { echo "❌ missing AH_CHAPTER_UI_BASE_V0"; exit 1; }
grep -q "AH_CHAPTER_UI_BASE_JS_V0" "$TARGET" || { echo "❌ missing AH_CHAPTER_UI_BASE_JS_V0"; exit 1; }
grep -q "AH_CHAPTER_LIST_DYNAMIC_V1" "$TARGET" || { echo "❌ missing AH_CHAPTER_LIST_DYNAMIC_V1"; exit 1; }
grep -q "AH_CHAPTER_STATUS_API_V1" "$TARGET" || { echo "❌ missing AH_CHAPTER_STATUS_API_V1"; exit 1; }

echo "2) validate chapters.json"
python - <<PY
import json, sys
from pathlib import Path
p = Path("data/chapters.json")
data = json.loads(p.read_text(encoding="utf-8"))
assert isinstance(data, dict) and "chapters" in data, "chapters.json must have top-level {chapters:[...]}"
chs = data["chapters"]
assert isinstance(chs, list) and len(chs) > 0, "chapters must be non-empty list"
for c in chs:
  assert "id" in c and "title" in c and "questions" in c, "each chapter needs id,title,questions"
  assert isinstance(c["questions"], list) and len(c["questions"]) > 0, "questions must be non-empty"
print("✅ chapters.json ok (structure)")
PY

echo "✅ QA LOCAL PASS"
