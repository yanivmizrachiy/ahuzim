# ahuzim — RULES (מקור אמת / Canonical)

> מסמך זה הוא מקור האמת היחיד.
> כל שינוי באתר חייב להתיישר איתו, וכל שדרוג חייב לעדכן את המסמך הזה באותו קומיט.

---

## עקרונות ברזל
- GitHub (branch main) הוא מקור האמת.
- אין דמו. אין ניחושים. כל פיצ’ר חייב לעבוד ב־GitHub Pages.
- לא שוברים תכונות קיימות — רק שדרוגים מצטברים.
- כל שינוי מחייב:
  - QA מקומי (grep / sanity)
  - PROOF מהשרת (RAW + PAGES עם cache-buster)
- `app/index.html` הוא מקור האמת של האפליקציה.
- `data/chapters.json` הוא מקור האמת לתוכן.

---

## קישורים רשמיים
- Root: https://yanivmizrachiy.github.io/ahuzim/
- App:  https://yanivmizrachiy.github.io/ahuzim/app/
- Data: https://raw.githubusercontent.com/yanivmizrachiy/ahuzim/main/data/chapters.json

---

## מבנה נתונים מחייב: chapters.json
- JSON תקין בלבד.
- מבנה:
  - chapters: [{ id, title, questions: [{id,type,text,choices,correct,explain}] }]
- כל שאלה:
  - text בעברית
  - choices מערך
  - correct אינדקס מספרי

---

## markers מחייבים (לא מוחקים)
- AH_CHAPTERS_V1
- AH_RENDER_DYNAMIC_V1
- AH_PROGRESS_V1
- AH_PROGRESS_HOOK_V1 (ahProgBar)
- AH_CHAPTER_UI_BASE_V0
- AH_CHAPTER_UI_BASE_JS_V0
- AH_CHAPTER_LIST_DYNAMIC_V1

---

## סטטוס מערכת (אמת בלבד)

### ✅ קיים (Verified)
- טעינת chapters.json בפועל (fetch)
- שאלות דינמיות לפי פרק
- החלפת Q לפי פרק נבחר
- שמירת התקדמות לפי פרק (localStorage)
- פס התקדמות (ahProgBar)
- כפתור + מודל לבחירת פרק
- רשימת פרקים דינמית מתוך chapters.json

### 🟡 חלקי
- סטטוס פרק (locked / current / done) — לוגיקה קיימת אך לא מאוחדת
- אין API אחד ברור לסטטוס פרק

### ❌ לא קיים
- completion אמיתי עם סף (למשל 80%)
- פתיחת פרק הבא רק אחרי completion
- סטטיסטיקות לתלמיד
- מצב מורה / ניהול

---

## QA קשוח (חובה)
- כותרת “עולם של אחוזים” קיימת
- fetch("../data/chapters.json") קיים
- כל markers קיימים בקובץ
- chapters.json תקין
- פתיחה/סגירה של מודל פרקים עובדת
- PROOF:
  - RAW: grep markers
  - PAGES: cache-buster + retries

---

## Backlog רשמי (פריט אחד בכל פעם)

### הבא לביצוע
- API אחיד לסטטוס פרק:
  - AH.isChapterDone(cid)
  - AH.getChapterStatus(cid) → done/current/locked
  - מקור אמת יחיד למפתחות localStorage

### אחריו
- completion אמיתי לפרק (אחוז + מינימום שאלות)
- פתיחת פרק הבא אוטומטית
- מסך סטטיסטיקות בסיסי

---

## חוק עבודה
אם זה לא כתוב כאן — זה לא קיים.
אם זה קיים — לא בונים שוב.
