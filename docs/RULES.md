# AHUZIM — דף כללים (Source of Truth) ✅

> כלל ברזל: **אם זה לא כתוב כאן — זה לא קיים.**  
> כלל ברזל: **כל שינוי חייב Commit + Push לריפו.**  
> כלל ברזל: **לא בונים כפול. קודם קוראים כאן ואז פועלים.**

## קישורים רשמיים
- Site: https://yanivmizrachiy.github.io/ahuzim/
- App:  https://yanivmizrachiy.github.io/ahuzim/app/
- Data (RAW): https://raw.githubusercontent.com/yanivmizrachiy/ahuzim/main/data/chapters.json

---

## מבנה נתונים מחייב: chapters.json
- JSON תקין בלבד
- מבנה:
  - `chapters: [{ id, title, questions: [{id,type,text,choices,correct,explain}] }]`
- כל שאלה:
  - `text` בעברית
  - `choices` = מערך
  - `correct` = אינדקס מספרי

---

## markers מחייבים (לא מוחקים)
- AH_CHAPTER_UI_BASE_V0
- AH_CHAPTER_UI_BASE_JS_V0
- AH_CHAPTER_LIST_DYNAMIC_V1
- AH_CHAPTER_STATUS_API_V1

(בנוסף קיימים אצלנו markers פנימיים אחרים — אבל אלו הסט הבסיסי שחייב להישאר תמיד.)

---

## סטטוס מערכת (אמת בלבד)

### ✅ קיים (Verified)
- GitHub Pages פעיל
- App ב-`/app/` עם `app/index.html`
- טעינת `chapters.json` בפועל (fetch)
- בחירת פרק דרך כפתור + מודל (UI בסיסי)
- רשימת פרקים דינמית מתוך `chapters.json`
- API אחיד לסטטוס פרק:
  - `AH.getSelectedChapter()`
  - `AH.setSelectedChapter(cid)`
  - `AH.isChapterDone(cid)`
  - `AH.setChapterDone(cid,v)`
  - `AH.getChapterStatus(cid) -> done/current/locked`

### 🟡 חלקי
- לוגיקת “נעילה/נוכחי/הושלם” קיימת, אבל אין עדיין “השלמה אמיתית” (סף)
- אין “מעבר לפרק הבא” לפי הישג

### ❌ לא קיים עדיין
- Completion אמיתי לפי סף (למשל 80% + מינימום שאלות)
- פתיחת פרק הבא רק לאחר Completion
- מסך סטטיסטיקות לתלמיד
- מצב מורה / ניהול כיתה
- PWA מלא (offline/Install)

---

## QA קשוח (חובה בכל שינוי)
- `docs/RULES.md` מעודכן לפני/אחרי שינוי משמעותי
- `data/chapters.json` הוא JSON תקין
- markers לא נמחקו
- בדיקת שרת:
  - RAW: grep markers
  - PAGES: cache-buster

---

## Backlog רשמי (פריט אחד בכל פעם)

### הבא לביצוע (מס’ 1)
- **AH_COMPLETION_GATE_V1**  
  Completion אמיתי לפרק:
  - חישוב אחוז הצלחה בפרק
  - סף מעבר (ברירת מחדל 80%)
  - כפתור “לפרק הבא” (`ahNextBtn`) רק כשעברנו סף
  - כשפרק הושלם: `AH.setChapterDone(cur,true)` ואז פתיחת הפרק הבא

### אחריו
- מסך סטטיסטיקות בסיסי (לתלמיד)
- מצב מורה (Teacher Mode)
- PWA / Offline
- מנוע אדפטיבי (המלצות תרגול לפי חולשות)

---

## חוק עבודה
- פריט backlog אחד בכל פעם
- כל פריט = Commit מסודר + Proof (RAW+PAGES)

---


---
Last Sync: 2026-02-11 16:27 UTC
