package servlet;

import controller.dbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "feedback", urlPatterns = {"/feedback"})
public class feedback extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String feed = request.getParameter("feed");
            
            
            dbConnect db = new dbConnect();
            Connection conn = db.connect();
            
            String q = "INSERT INTO feedback(name,email,feed) VALUES(?,?,?)";
            PreparedStatement p = conn.prepareStatement(q);
            p.setString(1, name);
            p.setString(2, email);
            p.setString(3, feed);
            int r = p.executeUpdate();
            if(r==1)
            {
                response.sendRedirect("home.jsp");
            }
        } catch (SQLException ex) {
            out.print(ex);
        }
        
        
        
    }

}
