package servlet;

import controller.dbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "accountAction", urlPatterns = {"/accountAction"})
public class accountAction extends HttpServlet {
    
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter output = response.getWriter();
        output.println("");
        
        if(request.getParameter("detSub")!=null)
        {
            try {
                String email = request.getParameter("email");
                String tp= "";
                tp = request.getParameter("tp");
                String query = "UPDATE user SET tp=? WHERE email=?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, tp);
                pstmt.setString(2, email);
                int r = pstmt.executeUpdate();
                if(r==1)
                {
                    output.println("yes");
                    response.sendRedirect("account.jsp?msg=updated");
                }
                else
                {
                    output.println("no ");
                    response.sendRedirect("account.jsp?msg=error");
                }
                
            } catch (SQLException ex) {
                output.println(ex);
            }            
            
        }
        if(request.getParameter("cpsub")!=null)
        {
            try {
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String query = "UPDATE user SET password=? WHERE email=?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, pass);
                pstmt.setString(2, email);
                int r = pstmt.executeUpdate();
                if(r==1)
                {
                    output.println("yes");
                    response.sendRedirect("account.jsp?msg=updated");
                }
                else
                {
                    output.println("no ");
                    response.sendRedirect("account.jsp?msg=error");
                }
            } catch (SQLException ex) {
                output.println(ex);
            }
        }
        
        
    }

    

}
