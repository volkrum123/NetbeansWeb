<!--Importing Classes From the Jakarta servlet API for 
"session.getAttribute()" and "response.sendRedirect()"-->
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>

<!--Ensures session tracking is enabled, 
"String studentName = (String)" depends on a valid session object -->
<%@ page session="true" %>

<!--Gets the value "studentName" form current session-->
<%String studentName = (String) session.getAttribute("studentName");
    
    //User gets loged out if "studentName" is null(not found)
    if (studentName == null) {
    // Redirects to login page
        response.sendRedirect("login.jsp");
        return;
    }%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="registerCss.css">
</head>
<body>
    //Class was used for CSS purposes
    <div class="container">
        
        //Welcoming user and displaying name saved in Session
        <h1>Welcome to our Wellness Services, <%= studentName %>!</h1>
        
        //Form and post where used for a more secure Logout
        <form action="LogoutServlet" method="post">
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>
</body>
</html>
