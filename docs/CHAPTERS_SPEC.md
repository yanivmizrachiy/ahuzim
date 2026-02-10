# ahuzim — מפרט פרקים (Chapters Spec)

המטרה: פרקים 2–10 יתווספו כנתונים בלבד (JSON), בלי לערוך לוגיקה בכל פעם.

## קבצים קנוניים
- `data/chapters.json` — מקור אמת לפרקים (נתונים).
- `app/index.html` — מקור אמת ללוגיקת המשחק כרגע.
- בשלב הבא נחבר את המשחק לטעינת פרקים מתוך JSON (עם fallback כדי לא לשבור).

## סכמת פרק (v1)
כל פרק הוא אובייקט בתוך `chapters[]`:

- `id` (string): מזהה קצר, למשל `c2`
- `title` (string): כותרת פרק
- `status` (active|draft): פרק פעיל או טיוטה
- `questions` (array): שאלות הפרק

### שאלה (Question)
- `q` (string): נוסח השאלה
- `choices` (array[string]): 4 אפשרויות
- `correct` (number): אינדקס תשובה נכונה (0..3)
- `explain` (string): הסבר קצר
- `level` (1..5): רמת קושי

## כלל ברזל
- פרק חדש = הוספת נתונים בלבד (`data/chapters.json`) + תיעוד ב-`docs/RULES.md`.
- אין נגיעה ב-`app/index.html` בשביל “להוסיף שאלות” לאחר שנחבר את הטעינה.

