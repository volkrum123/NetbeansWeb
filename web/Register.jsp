<%-- 
    Document   : Register
    Created on : Jul 13, 2025, 12:33:11 PM
    Author     : Cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/Register.css">
    </head>
    <body>
       
    <div class="RC">
        <h2>Student Registration</h2>
        <form name="RegisterServlet" action="RegisterServlet" method="POST">
            <div class="form-group">
                <label for="txtID">Student ID:</label>
                <input type="text" id="txtID" name="txtID" required>
            </div>

            <div class="form-group">
                <label for="txtName">Name:</label>
                <input type="text" id="txtName" name="txtName" required>
            </div>

            <div class="form-group">
                <label for="txtSurname">Surname:</label>
                <input type="text" id="txtSurname" name="txtSurname" required>
            </div>

            <div class="form-group">
                <label for="txtPhone">Phone Number:</label>
                <input type="text" name="txtPhone" pattern="\d{10}" title="Enter 10-digit number" required />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <input type="email" id="txtEmail" name="txtEmail" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Enter a valid email address like example@domain.com">
            </div>

            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <input type="password" id="txtPassword" name="txtPassword" required>
            </div>

            <div class="form-actions">
                <input type="submit" value="Register" name="btnRegister">
                <input type="reset" value="Clear" name="btnClear">
            </div>
        </form>
    </div>
    </body>
</html>
