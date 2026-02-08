#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
git add -A
if git diff --cached --quiet; then
  echo "אין שינויים לסנכרון."
  exit 0
fi
MSG="sync: כללים/תוכן $(date +%F_%H-%M)"
git commit -m "$MSG" >/dev/null
echo "✅ Commit נוצר: $MSG"
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  if ! git remote get-url origin >/dev/null 2>&1; then
    echo "ℹ️ אין remote origin. אם תרצה, צור ריפו ב-GitHub ואז הרץ:"
    echo "   gh repo create אחוזים --public --source=. --remote=origin --push"
    exit 0
  fi
  git push -u origin main
  echo "✅ Push בוצע ל-origin/main"
else
  echo "ℹ️ gh לא מחובר. כשתרצה לדחוף ל-GitHub התחבר ואז הרץ שוב scripts/sync.sh"
fi
