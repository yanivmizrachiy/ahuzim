#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

URL_ROOT="https://yanivmizrachiy.github.io/ahuzim/?v=$(date +%s)"
URL_APP="https://yanivmizrachiy.github.io/ahuzim/app/?v=$(date +%s)"

TMP1="$HOME/.ah_root_now.html"
TMP2="$HOME/.ah_app_now.html"

echo "🌐 PROOF root => $URL_ROOT"
curl -fsSL --retry 6 --retry-delay 1 "$URL_ROOT" -o "$TMP1" || true
if [ -s "$TMP1" ]; then
  grep -nE "עולם של אחוזים" "$TMP1" | head -n 3 || echo "⚠️ root נטען אבל לא מצאתי טקסט"
else
  echo "⚠️ root לא נמשך מהשרת כרגע"
fi
echo

echo "🌐 PROOF app  => $URL_APP"
curl -fsSL --retry 6 --retry-delay 1 "$URL_APP" -o "$TMP2" || true
if [ -s "$TMP2" ]; then
  grep -nE "עולם של אחוזים|radial-gradient|localStorage|3 טעויות|\\.opt\\.sel|classList.add\\(\"sel\"\\)" "$TMP2" | head -n 30 || true
else
  echo "⚠️ app לא נמשך מהשרת כרגע"
fi
echo

echo "📎 נשמר: $HOME/.ah_proof_last.txt"
{
  echo "root=$URL_ROOT"
  echo "app=$URL_APP"
  echo "---- root snippet ----"
  [ -s "$TMP1" ] && grep -nE "עולם של אחוזים" "$TMP1" | head -n 5 || true
  echo "---- app snippet ----"
  [ -s "$TMP2" ] && grep -nE "עולם של אחוזים|radial-gradient|localStorage|3 טעויות|\\.opt\\.sel|classList.add\\(\"sel\"\\)" "$TMP2" | head -n 30 || true
} > "$HOME/.ah_proof_last.txt"

echo "✅ OPEN: $URL_APP"
termux-open-url "$URL_APP" >/dev/null 2>&1 || true
