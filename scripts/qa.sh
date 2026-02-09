#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "🔍 QA קשוח..."
test -f index.html || { echo "❌ חסר: index.html"; exit 1; }
test -f app/index.html || { echo "❌ חסר: app/index.html"; exit 1; }
grep -q "radial-gradient" app/index.html || { echo "❌ אין radial-gradient"; exit 1; }
grep -q "localStorage" app/index.html || { echo "❌ אין localStorage"; exit 1; }
grep -q "3 טעויות" app/index.html || { echo "❌ אין 3 טעויות"; exit 1; }
echo "✅ QA עבר"
