#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

fail(){ echo "❌ $1"; exit 1; }
ok(){ echo "✅ $1"; }

test -f app/index.html || fail "אין app/index.html (מקור אמת למשחק)"
test -f index.html || fail "אין index.html (Root entry)"

grep -q "radial-gradient" app/index.html || fail "אין radial-gradient"
grep -q "localStorage" app/index.html || fail "אין localStorage"
grep -q "3 טעויות" app/index.html || fail "אין טקסט 3 טעויות"
grep -q "\\.opt\\.sel" app/index.html || fail "אין CSS סימון (.opt.sel)"
grep -q "classList.add(\"sel\")" app/index.html || fail "אין JS סימון classList.add(\"sel\")"
grep -q "עולם של אחוזים" app/index.html || fail "אין עולם של אחוזים בתוך המשחק"
grep -q "עולם של אחוזים" index.html || fail "אין עולם של אחוזים ב-root"

test -f docs/RULES.md || fail "אין docs/RULES.md"
grep -q "AUTO:BEGIN" docs/RULES.md || fail "RULES.md ללא AUTO:BEGIN"
grep -q "AUTO:END" docs/RULES.md || fail "RULES.md ללא AUTO:END"

ok "QA HARD local עבר"
