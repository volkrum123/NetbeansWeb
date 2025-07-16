/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Connection.DB;
import jakarta.servlet.*;
import java.io.IOException;
import java.sql.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String surname = request.getParameter("txtSurname");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        
        Connection conn = null;
        ResultSet rs = null;
        try 
        {
            ConnectionProvider provider = new ConnectionProvider();
            conn = provider.getCon();
            
           String sql = "SELECT * FROM students WHERE student_id = ? AND email = ?";
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setInt(1, Integer.parseInt(id));
           stmt.setString(2, email);
           rs = stmt.executeQuery();
           if(rs.next()){
               HttpSession session = request.getSession();
               session.setAttribute("student_id", Integer.valueOf(rs.getInt("student_id")));
               session.setAttribute("student_name",rs.getString("student_name"));
               session.setAttribute("student_surname",rs.getString("student_surname"));
               session.setAttribute("phone",rs.getString("phone"));
               session.setAttribute("email",rs.getString("email"));
               session.setAttribute("password",rs.getString("password"));
               response.sendRedirect("AlreadyRegistered.jsp");
           }
           else{
            provider.add(id, name, surname, phone, email, password);
            response.sendRedirect("SuccessfulRegistration.jsp");
           }   
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
              
        }
    }
}