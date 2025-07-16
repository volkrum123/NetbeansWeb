<%-- 
    Document   : Index
    Created on : Jul 15, 2025, 12:57:13 PM
    Author     : Cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/index.css">
    </head>
    <body class="flex flex-col min-h-screen">
    <!-- Header Section -->
    <header class="header">
        <div class="header-container">
            <h1 class="header-title">
                Student Wellness Service
            </h1>
            <nav>
                <a href="Login.jsp" class="nav-link">Login</a>
                <a href="Register.jsp" class="nav-link">Register</a>
            </nav>
        </div>
    </header>

    <!-- Main Content Section -->
    <main class="main-content">
        <!-- Image Section -->
        <img src="LOGO/image.jpeg" alt="Students engaging in wellness activities" class="main-image">

        <!-- Content Card Section -->
        <div class="content-card">
            <h2 class="card-title">
                Welcome to the BC Student Wellness Management System
            </h2>
            <p class="card-description">
                Empowering students to thrive academically and personally through comprehensive wellness resources, personalized support, and a vibrant community. Join us to manage your well-being effectively.
            </p>

            <div class="button-group">
                <!-- Login Button -->
                <a href="Login.jsp" class="action-button login-button">
                    Login to Your Account
                </a>
                <!-- Register Button -->
                <a href="Register.jsp" class="action-button register-button">
                    Join Us - Register Now
                </a>
            </div>
            <p class="footer-text">
                New to our services? Register to get started. Already a member? Log in to access your personalized dashboard.
            </p>
        </div>
    </main>

</body>
</html>
