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
        try 
        {
            ConnectionProvider provider = new ConnectionProvider();
            conn = provider.getCon();
            provider.add(id, name, surname, phone, email, password);
            
            response.sendRedirect("SuccessfulRegistration.jsp");    
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
              
        }
    }
}