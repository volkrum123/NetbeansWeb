/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection.DB;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.nio.charset.StandardCharsets;
import org.mindrot.jbcrypt.BCrypt;
public class ConnectionProvider {
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "Volkrum@123";
    private static final String CON_URL = "jdbc:postgresql://localhost:5432/Wellness";
    private static final String DRIVER = "org.postgresql.Driver";

    private Connection con;

    public ConnectionProvider() {
        // Empty constructor (optional)
    }

    public Connection getCon() throws ClassNotFoundException {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(CON_URL, USERNAME, PASSWORD);
            if (con != null) {
                System.out.println("Connected to Database!");
            }
        } catch (SQLException ex) {
            System.out.println("Could not connect: " + ex.getMessage());
        }
        return con;
    }
    
    public static String Hash(String password)throws NoSuchAlgorithmException{
       
       String hashed = BCrypt.hashpw(password,BCrypt.gensalt());
       return hashed;
    }
    public void add(String id, String name, String surname, String phone, String email, String password) throws ClassNotFoundException{
        Connection conn;
        PreparedStatement pst;
        
        try{
            conn = getCon();
            
            pst = conn.prepareStatement("INSERT INTO students (Student_ID,Student_Name,Student_Surname,Phone,Email,Password) VALUES (?,?,?,?,?,?)");
            
            int num = 0;
            try{
                num = Integer.parseInt(id);
                pst.setInt(1, num);
            }
            catch(NumberFormatException ex){
                ex.printStackTrace();
            }
            
            pst.setString(2,name);
            pst.setString(3,surname);
            pst.setString(4,phone);
            pst.setString(5,email);
            pst.setString(6,password);
            
            pst.executeUpdate();
            
            pst.close();
            conn.close();
        }
        catch(SQLException ex){
            System.out.println("Could not add data: " + ex.getMessage());
        }
        
    }
    
}
