# qb-cards 


---

# ✨ Features

- 📇 תעודת זהות
- 🚗 רישיון נהיגה
- 🔫 רישיון נשק
- ⚖️ רישיון עורך דין
- 🎨 עיצוב ייחודי בסגנון תעודות ישראליות
- 👁️ הצגת התעודה לשחקנים קרובים
- ⚡ שימוש מהיר דרך האייטם
- 🔧 התקנה פשוטה

---

# 🧩 Framework Support

הסקריפט תומך באופן מלא ב:

- **QB-Core**
- **ESX**

בנוסף ניתן לשלב עם:

- **ox_inventory**
- **qb-inventory**

---

# 📥 Installation

1. הורד את הסקריפט מה־GitHub  
2. חלץ את התיקייה לתוך:

```
resources/[local]
```

3. הוסף ל־`server.cfg`

```
ensure israeli-idcards
```

4. התקן את האייטמים לפי מערכת האינבנטורי שלך

---

# 📦 QB-Core Item Installation

פתח את הקובץ:

```
qb-core/shared/items.lua
```

והוסף את האייטמים הבאים:

```lua
id_card = {
    name = 'id_card',
    label = 'תעודת זהות',
    weight = 0,
    type = 'item',
    image = 'id_card.png',
    unique = true,
    useable = true,
    shouldClose = false,
    description = 'תעודת זהות לצורך זיהוי'
},

driver_license = {
    name = 'driver_license',
    label = 'רישיון נהיגה',
    weight = 0,
    type = 'item',
    image = 'driver_license.png',
    unique = true,
    useable = true,
    shouldClose = false,
    description = 'רישיון נהיגה המתיר לך לנהוג על רכב'
},

lawyerpass = {
    name = 'lawyerpass',
    label = 'רישיון עורך דין',
    weight = 0,
    type = 'item',
    image = 'lawyerpass.png',
    unique = true,
    useable = true,
    shouldClose = false,
    description = 'רישיון עורך דין המתיר לך לייצג מאושם בחקירה ובמשפט'
},

weaponlicense = {
    name = 'weaponlicense',
    label = 'רישיון נשק',
    weight = 0,
    type = 'item',
    image = 'weapon_license.png',
    unique = true,
    useable = true,
    shouldClose = true,
    description = 'רישיון נשק שמתיר לך לשאת נשק קל'
},
```

לאחר מכן:

1. הוסף את התמונות לתיקייה:

```
qb-inventory/html/images
```

2. הפעל מחדש את השרת.

---

# 📦 ox_inventory Installation

פתח את הקובץ:

```
ox_inventory/data/items.lua
```

והוסף:

```lua
['id_card'] = {
    label = 'תעודת זהות',
    weight = 0,
    stack = false,
    close = false,
    description = 'תעודת זהות לצורך זיהוי'
},

['driver_license'] = {
    label = 'רישיון נהיגה',
    weight = 0,
    stack = false,
    close = false,
    description = 'רישיון נהיגה המתיר לך לנהוג על רכב'
},

['lawyerpass'] = {
    label = 'רישיון עורך דין',
    weight = 0,
    stack = false,
    close = false,
    description = 'רישיון עורך דין המתיר לך לייצג מאושם בחקירה ובמשפט'
},

['weaponlicense'] = {
    label = 'רישיון נשק',
    weight = 0,
    stack = false,
    close = true,
    description = 'רישיון נשק שמתיר לך לשאת נשק קל'
},
```

לאחר מכן הוסף את האייקונים לתיקייה:

```
ox_inventory/web/images
```

והפעל מחדש את השרת.

---

# 🖼️ Images


---

# ⚙️ Configuration

אם קיימת תיקיית `cfg.lua` ניתן לשנות בה:

- מרחק הצגת התעודה
- מי יכול להציג תעודות
- הגדרות RP נוספות

---

# 🤝 Contributing

תרומות, הצעות ושיפורים תמיד מתקבלים בברכה.

אם אהבתם את הסקריפט:
⭐ תנו **Star** לפרויקט בגיטהאב.

---

# 📜 License

Free to use for FiveM servers.  
Do not resell the script.
Made by sol 
https://discord.gg/zNfeS5qMJM
---
