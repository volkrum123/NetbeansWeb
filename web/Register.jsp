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
        <form id="RF" name="RegisterServlet" action="RegisterServlet" method="POST" novalidate>
            <div class="form-group">
                <input type="text" id="IN" name="txtID" placeholder="StudentID" required>
            </div>

            <div class="form-group">
                <input type="text" id="IN" name="txtName" placeholder="Name" required>
            </div>

            <div class="form-group">
                <input type="text" id="IN" name="txtSurname" placeholder="Surname" required>
            </div>

            <div class="form-group">
                <input type="text" id="IN" name="txtPhone" pattern="0[0-9]{9}" title="Phone number must start with 0 and be 10 digits long" placeholder="Phonenumber" required />
            </div>

            <div class="form-group">
                <input type="email" id="IN" name="txtEmail" placeholder="Email" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Enter a valid email address like example@domain.com">
            </div>

            <div class="form-group">
                <input type="password" id="IN" name="txtPassword" placeholder="Password" required>
            </div>

            <div class="form-actions">
                <input type="submit" id="btn" value="Register" name="btnRegister">
                <input type="reset" id="btn" value="Clear" name="btnClear">
            </div>
            
            <div class="form-footer">
    Already have a login account?
    <a href="login.jsp">Proceed to login</a>.
</div>
        </form>
    </div>
        <script>
    // Only adds red borders AFTER submit button is pressed
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("RF");
        form.addEventListener("submit", function (e) {
            if (!form.checkValidity()) {
                e.preventDefault(); // Cancel submit
                form.classList.add("was-validated"); // Trigger CSS styles
            }
        });
    });
</script>
    </body>
</html>
