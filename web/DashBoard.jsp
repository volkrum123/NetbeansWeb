<!--Importing Classes From the Jakarta servlet API for 
"session.getAttribute()" and "response.sendRedirect()"-->
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>

<!--Ensures session tracking is enabled, 
"String studentName = (String)" depends on a valid session object -->
<%@ page session="true" %>

<!--Gets the value "studentName" form current session-->
<% int student_id = (Integer) session.getAttribute("student_id");
   String student_name = (String) session.getAttribute("student_name");
   String student_surname = (String) session.getAttribute("student_surname");
   String phone = (String) session.getAttribute("phone");
   String email = (String) session.getAttribute("email");
   String password = (String) session.getAttribute("password");
   
    
    //User gets loged out if "studentName" is null(not found)
    if (student_name == null) {
    // Redirects to login page
        response.sendRedirect("login.jsp");
        return;
    }%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="CSS/DashBoard.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to our Wellness Services, <%= student_name %>!</h1>
    <hr>
        <h2>Student Information:</h2>
        <div>
            <div>
                <p>Student: <%= student_name +" "+ student_surname %></p>
                <p> Student email: <%= email %></p>
                <p>Student ID: <%= student_id %></p>       
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
        <form action="Index.jsp" method="post">
            <button type="submit" class="logout-button">Log Out</button>
        </form>
    </div>
</body>
</html>
