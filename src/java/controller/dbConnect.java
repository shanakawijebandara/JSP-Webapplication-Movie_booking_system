
package controller;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;



public class dbConnect {
        
    private String url = "jdbc:mysql://localhost:3306/cinema";
    private String user = "root";
    private String pass = "";
    
    // Make connection 
    public Connection connect()
    {
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,pass);
            
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
 
    
    
}
