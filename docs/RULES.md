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

## מבנה קנוני (Source of Truth)
- `index.html` — כניסה “עולם של אחוזים” + redirect ל-/app
- `app/index.html` — משחק (לוגיקה)
- `docs/RULES.md` — דף כללים מאוחד (המסמך הזה)
- `data/chapters.json` — שכבת נתונים קנונית לפרקים (כעת הכנה; חיבור למשחק בשלב הבא)
- `scripts/qa_hard.sh` + `scripts/proof_server.sh` — אכיפת איכות והוכחה מהשרת
- `.github/workflows/qa.yml` — QA+PROOF אוטומטי בכל push

## מצב נוכחי (Verified מהשרת)
- כותרת “עולם של אחוזים” קיימת ב-root וב-app.
- radial-gradient קיים.
- localStorage קיים.
- חוק “3 טעויות” קיים.
- סימון תשובה נבחרת: .opt.sel + classList.add("sel").

## Roadmap קרוב (רק מה שמועיל)
- חיבור המשחק לטעינת פרקים מתוך `data/chapters.json` עם fallback (כדי לא לשבור).
- הוספת פרקים 2–10 כנתונים בלבד.
- מסך בחירת פרק + סיכום פרק.

## QA קשוח (חובה)
- radial-gradient
- localStorage
- "3 טעויות"
- .opt.sel + classList.add("sel")
- "עולם של אחוזים" (root+app)
- קיום data/chapters.json (שכבת פרקים)
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
