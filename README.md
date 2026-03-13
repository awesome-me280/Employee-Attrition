# Student Portfolio – ASP.NET Web Application

An ASP.NET Web Forms project built with C# and SQL Server for managing user accounts via a portfolio website.

## Features

| Page | Description |
|------|-------------|
| `Login.aspx` | Static-credentials login (hardcoded user) |
| `Login2.aspx` | Dynamic login authenticated against SQL database |
| `Register.aspx` | New user registration with SHA-256 password hashing |
| `update.aspx` | Update account details (password, name, year of birth) |
| `Delete.aspx` | Delete the currently logged-in account |
| `LoginSuccess.aspx` | Landing page after successful login |
| `RegSuccess.aspx` | Confirmation page after registration |
| `DeleteSuccess.aspx` | Confirmation page after account deletion |

## Project Structure

```
StudentPortfolio/
├── MasterPage.master          # Shared layout (header, nav, footer)
├── MasterPage.master.cs
├── Web.config                 # App config & DB connection string
├── Login.aspx / .cs           # Static credentials login
├── Login2.aspx / .cs          # Dynamic (DB) login
├── LoginSuccess.aspx / .cs
├── Register.aspx / .cs        # User registration
├── RegSuccess.aspx / .cs
├── update.aspx / .cs          # Update account
├── Delete.aspx / .cs          # Delete account
├── DeleteSuccess.aspx / .cs
├── Contact.aspx.cs            # Contact page (session-protected)
└── Styles/
    └── styles.css             # Site stylesheet
```

## Setup

1. Open in **Visual Studio** as an ASP.NET Web Application (.NET Framework 4.7.2).
2. In `Web.config`, add your SQL Server connection string under `<connectionStrings>`:
   ```xml
   <connectionStrings>
     <add name="5680LabsConnectionString"
          connectionString="Data Source=YOUR_SERVER;Initial Catalog=YOUR_DB;User ID=YOUR_USER;Password=YOUR_PASS"
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```
3. Ensure a `Logins` table exists with columns: `User_Email`, `User_Pass`, `User_FName`, `User_LName`, `User_YOB`.
4. Build and run.

## Notes

- Passwords are hashed with **SHA-256** before storage.
- Session variable `Session["UserID"]` is used to track login state.
- Protected pages redirect to the login page if no session is found.
