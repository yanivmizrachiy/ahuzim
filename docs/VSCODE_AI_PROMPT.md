# Visual Studio Code AI — פרומפט עבודה רשמי (AHUZIM)

אתה עובד על הריפו: **yanivmizrachiy/ahuzim**.  
כל שינוי = Commit + Push ל-main.  
לפני שינוי: פתח וקרא `docs/RULES.md` — זה מקור אמת יחיד.

## כללים קשיחים
- לא למחוק markers שמופיעים ב-RULES.md
- לא לשבור `data/chapters.json`
- פריט backlog אחד בכל פעם
- אחרי כל שינוי: להריץ QA (לוקאלי/CI) ולוודא שה-Workflow ירוק

## המשימה הבאה (Backlog #1)
לממש: **AH_COMPLETION_GATE_V1** בתוך `app/index.html` בלבד, בלי לשבור דברים קיימים:
- הגדרה: פרק “הושלם” אם אחוז הצלחה >= 80% (ברירת מחדל) + מינימום שאלות נענו (למשל 5)
- API:
  - `AH.isChapterCompleted(cid)` מחזיר true/false
  - `AH.getNextChapterId()` לפי סדר chapters.json
- UI:
  - כפתור `id="ahNextBtn"` מוצג רק אם הפרק הושלם
  - בלחיצה: `AH.setChapterDone(cur,true)` ואז מעבר לפרק הבא (setSelectedChapter + reload)
- מקור אמת: להשתמש ב-`AH.keys` שכבר הוגדר ב-`AH_CHAPTER_STATUS_API_V1` (localStorage keys אחידים)

## בדיקות חובה לפני Commit
- `tools/qa_local.sh` עובר
- GitHub Action “QA (markers + chapters.json)” עובר
- `docs/RULES.md` עודכן אם נוספה יכולת חדשה
