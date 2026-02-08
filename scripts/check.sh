#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "🔍 QA בסיסי..."
test -f index.html && echo "✅ index.html קיים" || { echo "❌ אין index.html"; exit 1; }
command -v grep >/dev/null 2>&1 || { echo "❌ grep חסר"; exit 1; }
grep -q "dir=\"rtl\"" index.html && echo "✅ RTL" || { echo "❌ RTL חסר"; exit 1; }
grep -q "localStorage" index.html && echo "✅ localStorage" || { echo "❌ localStorage חסר"; exit 1; }
grep -q "אחרי 3 טעויות" index.html && echo "✅ כלל 3 טעויות" || { echo "❌ כלל 3 טעויות לא נמצא"; exit 1; }
echo "✅ QA DONE"
