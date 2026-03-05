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

# 📸 Preview

![Preview 1](https://media.discordapp.net/attachments/1477262282017865728/1479243521637486805/image.png?ex=69ab5462&is=69aa02e2&hm=63255af0476bf423086f0ea4e3f9e80fc575c110777e1937b3e0156a1c89e5ea&=&format=webp&quality=lossless&width=1532&height=864)
![Preview 2](https://media.discordapp.net/attachments/1477262282017865728/1479243522392723708/image.png?ex=69ab5462&is=69aa02e2&hm=fbf0d0d75b31d78e5f053a82d0eb84a8c101da3fb971aff2a02598a98b5c5550&=&format=webp&quality=lossless&width=1532&height=864)
![Preview 3](https://media.discordapp.net/attachments/1477262282017865728/1479243523520729279/image.png?ex=69ab5463&is=69aa02e3&hm=68c591e2a1afb4aeb081509c8de2d01812d53438b8c8d05ab254da1fc17c1281&=&format=webp&quality=lossless&width=1535&height=864)

---

# 🛠 Support

For support or questions, contact me on Discord:

**sol__**

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
