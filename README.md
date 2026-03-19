# 🟩 Word Game — Wordle-Style Web App

A full-stack ASP.NET web application built around a Wordle-inspired word-guessing game. Players register, log in, and compete to guess the daily word — with scores tracked in a live leaderboard.

---

## 🚀 Features

- 🎮 **Wordle-style game** — guess the word in 6 attempts with color-coded feedback
- 👤 **User system** — Guest / Registered User / Admin with full session management
- 🏆 **ScoreBoard** — live leaderboard pulling stats from the database
- 📚 **Words Archive** — browse past words and game history
- ❓ **Quiz page** — trivia questions with real-time stats (how many answered, how many got it right)
- 🛠️ **Admin panel** — update and delete user records (admin only)
- 📋 **Registration & Login** — full form validation with real-time error messages
- 🎨 **Fully styled** — custom CSS per page with smooth design

---

## 🗂️ Project Structure

```
2.0/
├── ASPX Pages/         # All .aspx pages
│   ├── homepage.aspx
│   ├── login.aspx
│   ├── forms.aspx
│   ├── quiz.aspx
│   ├── deleteData.aspx
│   ├── updateData.aspx
│   ├── displayDataTables1.aspx
│   ├── displayDataTables2.aspx
│   ├── ScoreBoard.aspx
│   ├── WordsArchive.aspx
│   ├── TUTORIAL.aspx
│   └── about.aspx
├── Designs/            # All CSS files
├── Images/             # All images
└── App_Data/           # Database (.mdf)
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML, CSS, JavaScript |
| Backend | C# / ASP.NET Web Forms |
| Database | Microsoft SQL Server (`.mdf`) |
| Hosting | IIS / Visual Studio Dev Server |

---

## ⚙️ How to Run

1. Clone the repo
2. Open `Eyal Braun Projects.csproj` in **Visual Studio**
3. Make sure the database path in `Web.config` points to `App_Data/Database1.mdf`
4. Press **F5** to run

> Requires: Visual Studio 2019+, .NET Framework 4.x

---

## 📌 Pages Overview

| Page | Description |
|------|-------------|
| `homepage.aspx` | Main landing page, shows guest/user greeting |
| `login.aspx` | Login with server-side validation |
| `forms.aspx` | Registration with full JS + server validation |
| `quiz.aspx` | Trivia quiz with DB-tracked stats |
| `ScoreBoard.aspx` | Live leaderboard from DB |
| `WordsArchive.aspx` | History of past game words |
| `displayDataTables1.aspx` | View & filter table 1 from DB |
| `displayDataTables2.aspx` | View & filter table 2 from DB |
| `updateData.aspx` | Admin: update user records |
| `deleteData.aspx` | Admin: delete user records |
| `TUTORIAL.aspx` | How to play guide |
| `about.aspx` | About the site & contact |

---

## 👤 User Roles

| Role | Permissions |
|------|------------|
| Guest | Browse content, see greeting "Hello Guest" |
| Registered User | Play game, view scores, take quiz |
| Admin | All of the above + access to updateData & deleteData |

---

## 🧠 Built by

**Eyal Braun** — Grade 10, Eliezer Ben Yehuda School, Nes Ziona  
Final Internet Project — April 2026
