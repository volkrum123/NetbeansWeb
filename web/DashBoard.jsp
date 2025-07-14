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
    <link rel="stylesheet" type="text/css" href="DashBoard.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to our Wellness Services, <%= studentName %>!</h1>
    <hr>
        <h2>Student Information:</h2>
        <div>
            <div>
                <p>Name: <%= studentName %></p>
                <p>Surname: <%= studentSurname %></p>
                <p>Student ID: <%= studentid %></p>       
            </div>
        </div>
<hr>
        <div class="section">
            <h2>Scheduled Appointments</h2>
            <p>Dr. Johan Smith - Counselor</p>
            <div>
                <button class="btn">Reschedule</button>
                <button class="btn">Cancel</button>
            </div>
        </div>

        <div class="section">
            <h2>Wellness Metrics</h2>
            <div>
                <span>Happy</span>
                <div class="progress-container"><div class="progress" style="width: 85%;"></div></div>
            </div>
            <div>
                <span>Stress</span>
                <div class="progress-container"><div class="progress" style="width: 35%;"></div></div>
            </div>
            <div>
                <span>Anxiety</span>
                <div class="progress-container"><div class="progress" style="width: 45%;"></div></div>
            </div>
            <div>
                <span>Self-Care</span>
                <div class="progress-container"><div class="progress" style="width: 65%;"></div></div>
            </div>
        </div>

       
        <div class="section">
            <h2>Schedule a Session</h2>
            <button class="btn primary-btn">Book Now</button>
        </div>

    
        <div class="section">
            <h2>Emergency Contacts</h2>
            <p>
            Contact support at <a href="mailto:support@Wellness.edu">support@Wellness.edu</a>
            </p>
        </div>

        <div class="section">
            <h2>Urgent Assistance</h2>
            <button class="btn emergency-btn">Get Help</button>
        </div>

  <hr>
        <form action="LogoutServlet" method="post">
            <button type="submit" class="logout-button">Log Out</button>
        </form>
    </div>
</body>
</html>
