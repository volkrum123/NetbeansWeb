/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Connection.DB;

import jakarta.servlet.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

// Servlet mapping to handle requests to /LoginServlet
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet
{
    // Redirect GET requests to POST handler
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request,response);
    }
    // Main login logic handled in POST request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        // Retrieve user input from login form
       String email = request.getParameter("txtEmail");
       String password = request.getParameter("txtPassword");
       
        Connection conn = null;
         ResultSet rs = null;
       try{
           // Get database connection
           ConnectionProvider provider = new ConnectionProvider();
           conn = provider.getCon();
           
           // Query to find the student with the given email
           String sql = "SELECT * FROM students WHERE email = ?";
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setString(1, email);
           
           rs = stmt.executeQuery();
           
            // Check if user exists
           if(rs.next()){
               
                // Get the hashed password stored in the database
               String hash = rs.getString("password");
               
                // Check the provided password against the stored hash
               if(BCrypt.checkpw(password,hash)){
                   
                   // Password is correct – create a session and store user data
                    HttpSession session = request.getSession();
                    session.setAttribute("student_id", Integer.valueOf(rs.getInt("student_id")));
                    session.setAttribute("student_name",rs.getString("student_name"));
                    session.setAttribute("student_surname",rs.getString("student_surname"));
                    session.setAttribute("phone",rs.getString("phone"));
                    session.setAttribute("email",rs.getString("email"));
                    response.sendRedirect("DashBoard.jsp");
                    
                   // Redirect to dashboard after successful logi
               }else{
                   // Password doesn't match
                   response.sendRedirect("LoginError.jsp");
               }
           }
           else{
               // Email not found in the database
               response.sendRedirect("LoginError.jsp");
           }
       }
       catch(Exception e){
           // Handle unexpected errors and print stack trace for debugging
           e.printStackTrace();
           response.getWriter().println("Error occurred: " + e.getMessage());
           
       }
       
    }

   // Optional method to describe the servlet
    @Override
    public String getServletInfo() {
        return "Handles student login";
    }
}


