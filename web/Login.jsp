<%-- 
    Document   : Login
    Created on : Jul 15, 2025, 11:33:42 AM
    Author     : Cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
         <link rel="stylesheet" type="text/css" href="CSS/Register.css">
    </head>
    <body>
        <div class="RC">
            <h2>Student Login</h2>
            <form id="LF"  action="LoginServlet" method="POST" >

                <div class="form-group">
                    <input type="email" id="IN" name="txtEmail" placeholder="email" id=""required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Enter a valid email address like example@domain.com">
                </div>

                <div class="form-group">
                    <input type="password" id="IN" name="txtPassword" placeholder="Password" required>
                </div>

                <div class="form-actions">
                    <input type="submit" id="btn" value="Login" name="btnLogin">
                </div>
                <div class="form-footer">
                <p>Don't have an account?<a href="Register.jsp">Proceed to Register.</a></p>
                <p> Would you like to return to<a href="Index.jsp">Home.</a><p>
            </div>
            </form>
        </div>
        <script>
    // Only adds red borders AFTER submit button is pressed
    document.addEventListener("DOMContentLoaded", function () {
        const form2 = document.getElementById("LF");
        form2.addEventListener("submit", function (e) {
            if (!form2.checkValidity()) {
                e.preventDefault(); // Cancel submit
                form2.classList.add("was-validated"); // Trigger CSS styles
            }
        });
    });
    </body>
</html>
