# BC Student Wellness Management Website
### Project Overview
This Java project demonstrates Core Java, Object-Oriented Programming (OOP), GUI development with Swing, and database integration using PostgreSQL. The system is developed for Belgium Campus to manage student wellness services through both a web and desktop application.

### Features
Web Application:

JSP-based login and registration system for students.

User authentication with PostgreSQL backend.

Session management with personalized dashboard and logout.

### Technologies Used
Technology	Purpose
Java	Core programming language
JSP (JavaServer Pages)	Web interface for login and registration
Servlets	Handle business logic for registration/login
Swing	Desktop GUI for wellness service management
PostgreSQL	Relational database for storing user and service data
NetBeans IDE	Development environment
Apache Tomcat	Web server to deploy JSP and Servlet applications
GitHub	Version control and collaboration platform

### Project Structure & Milestones
Milestone 1: Web Application – Login & Registration System (Due 14-07-25)
### JSP Pages
index.jsp
Home page with navigation links to login and register pages.

register.jsp
Registration form for new users, with client and server-side validation.

login.jsp
Login form for existing users.

dashboard.jsp
Personalized welcome page after successful login with logout option.

### Servlets
#### RegisterServlet
Handles user registration:

Validates fields (email format, password strength, phone format).

Checks for duplicate usernames/emails in the PostgreSQL database.

Provides user feedback messages.

Stores user data securely with hashed passwords.

#### LoginServlet
Handles user authentication:

Validates credentials against PostgreSQL.

Provides clear error messages for failed logins.

Maintains user session upon successful login.

Redirects to dashboard.jsp.

### Functional Requirements
Registration

Validate input fields thoroughly.

Prevent duplicate registrations.

Secure password storage using hashing.

Login

Authenticate users against database records.

Manage session state using HttpSession.

Dashboard

Display a personalized greeting (e.g., "Welcome, [Student Name]").

Include a logout button that invalidates the session and redirects to login.

### Database Schema (PostgreSQL)
sql
Copy
Edit
CREATE TABLE users (
  student_number SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(15),
  password VARCHAR(255) NOT NULL
);
### How to Run
### Prerequisites
Java JDK 8 or above

PostgreSQL installed and running

Apache Tomcat Server

NetBeans IDE (or any Java IDE supporting JSP and Servlets)

Git for version control

### Setup Instructions
Clone Repository

bash
Copy
Edit
git clone https://github.com/yourusername/bc-student-wellness.git
Database Setup

Create a PostgreSQL database for the project.

Run the provided SQL script (schema.sql) to create the users table.

Update the database connection parameters in the project (db.properties or relevant config).

### Build and Deploy

Open the project in NetBeans.

Configure the Apache Tomcat server.

Build the project and deploy the web application on Tomcat.

Run the Application

Access http://localhost:8080/yourappname/index.jsp in your web browser.

Register a new user and log in to access the dashboard.

Session Management & Security
User sessions are maintained using HttpSession for secure login persistence.

Passwords are hashed before storage to protect user data.

Input validation helps prevent common security issues like SQL injection and invalid data entry.

Contribution & Collaboration
This project is maintained on GitHub for version control and collaborative development.

All team members must have GitHub accounts for code commits and issue tracking.

Branching strategies and pull requests will be used to manage collaborative workflows.
