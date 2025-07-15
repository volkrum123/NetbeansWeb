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


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
       String email = request.getParameter("txtEmail");
       String password = request.getParameter("txtPassword");
       
        Connection conn = null;
         ResultSet rs = null;
       try{
           ConnectionProvider provider = new ConnectionProvider();
           conn = provider.getCon();
           
           String sql = "SELECT * FROM students WHERE email = ? AND password = ?";
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setString(1, email);
           stmt.setString(2, password);
           
           rs = stmt.executeQuery();
           if(rs.next()){
               HttpSession session = request.getSession();
               session.setAttribute("student_id", Integer.valueOf(rs.getInt("student_id")));
               session.setAttribute("student_name",rs.getString("student_name"));
               session.setAttribute("student_surname",rs.getString("student_surname"));
               session.setAttribute("phone",rs.getString("phone"));
               session.setAttribute("email",rs.getString("email"));
               session.setAttribute("password",rs.getString("password"));
               response.sendRedirect("DashBoard.jsp");
           }
           else{
               response.sendRedirect("LoginError.jsp");
           }
       }
       catch(Exception e){
           e.printStackTrace();
           response.getWriter().println("Error occurred: " + e.getMessage());
           
       }
       
    }

   
    @Override
    public String getServletInfo() {
        return "Handles student login";
    }
}


