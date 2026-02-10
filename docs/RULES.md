<!-- AUTO:BEGIN -->
# ahuzim — דף כללים מאוחד (Canonical)

## עקרונות ברזל
- GitHub הוא מקור האמת. כל שינוי: pull --rebase → commit → push.
- לא שוברים תכונות קיימות. רק שדרוגים מצטברים.
- כל שינוי חייב QA מקומי + PROOF מהשרת (curl+grep).
- app/index.html הוא מקור האמת למשחק. .meta/ זה גיבויים בלבד.

## Entrypoints רשמיים
- Root: https://yanivmizrachiy.github.io/ahuzim/
- App:  https://yanivmizrachiy.github.io/ahuzim/app/

## מצב נוכחי (Verified מהשרת)
- כותרת “עולם של אחוזים” קיימת ב-root וב-app.
- radial-gradient קיים.
- localStorage קיים.
- חוק “3 טעויות” קיים.
- סימון תשובה נבחרת: .opt.sel + classList.add("sel").
- ✅ AH_CHAPTERS_V1 קיים ב-app + fetch("../data/chapters.json") (fallback).

## שכבת פרקים (Canonical Data)
- קובץ אמת: data/chapters.json
- כלי הוספה: scripts/add_chapter.py

## QA קשוח (חובה בכל שינוי)
- radial-gradient
- localStorage
- "3 טעויות"
- .opt.sel + classList.add("sel")
- "עולם של אחוזים" (root+app)
- AH_CHAPTERS_V1 + fetch("../data/chapters.json")
- data/chapters.json (must exist + valid JSON)
<!-- AUTO:END -->


\n\n# RULES – כללי ברזל (מחייב)

## מקור אמת
- GitHub repo הוא מקור האמת היחיד.
- כל שינוי חייב Commit אמיתי ל-main.

## תיעוד לפני קוד
- לפני שינוי התנהגות/מבנה/מסכים: לעדכן docs/ (STATE/RULES/ROADMAP).

## איסור שבירה
- אסור למחוק/להחליף דברים שעובדים.
- רק שדרוגים תוספתיים, שמרניים, עם QA.

## סנכרון
- לפני push: git pull --rebase
- אחרי שינוי: QA מקומי + commit + push

## נקודת כניסה
- חייב להיות URL רשמי אחד שמוגדר ב-README.
