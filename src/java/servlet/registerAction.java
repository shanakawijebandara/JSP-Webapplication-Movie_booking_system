package servlet;

import java.sql.*;
import controller.dbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "registerAction", urlPatterns = {"/registerAction"})
public class registerAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        try (Connection conn = new dbConnect().connect()) {
            String email = request.getParameter("email"); //assign data for the variables
            String uname = request.getParameter("uname");
            String password = request.getParameter("password");

            // Check if email already exists
            String query0 = "SELECT email FROM user WHERE email = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query0)) {
                pstmt.setString(1, email);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        
                        response.sendRedirect("register.jsp?msg=have");
                    } else {
                        
                        String query = "INSERT INTO user(email, uname, password, tp, isAdmin) VALUES (?, ?, ?, ' ', 0)";
                        try (PreparedStatement insertStmt = conn.prepareStatement(query)) {
                                                        
                            insertStmt.setString(1, email);
                            insertStmt.setString(2, uname);
                            insertStmt.setString(3, password);
                            int r = insertStmt.executeUpdate();
                            if (r == 1) {
                                response.sendRedirect("login.jsp");
                            }
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            out.print("Error: " + ex.getMessage());
        }
    }
}

