package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import controller.dbConnect;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "uploadAction", urlPatterns = {"/uploadAction"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class uploadAction extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    private String message = "";
    private String fullpath = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get the upload folder's path (relative to servlet location)
        String uploadPath = getServletContext().getRealPath("") + "../../web/" + UPLOAD_DIR;

        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // Process the uploaded file
            Part filePart = request.getPart("imag");
            String fileName = extractFileName(filePart);
            String filePath = uploadPath + File.separator + fileName; 

            // Write the file to the upload directory
            filePart.write(filePath);
            
            message = "File uploaded successfully: <a href='" + UPLOAD_DIR + "/" + fileName + "'>" + fileName;
            fullpath = UPLOAD_DIR + "/" + fileName; 
        } catch (Exception e) {
            message = "File upload failed: " + e.getMessage();
        }
        
        //get values
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String actors = request.getParameter("actors");
        String price = request.getParameter("price");
        
        String query = "INSERT INTO movie(mName,descriprion,actors,price,photo) VALUES(?,?,?,?,?)";
        dbConnect db = new dbConnect();
        Connection conn = db.connect();
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, desc);
            pstmt.setString(3, actors);
            pstmt.setString(4, price);
            pstmt.setString(5, fullpath);
            
            int r = pstmt.executeUpdate();
            if(r==1)
            {
                message = "query added";
            }
            else
            {
                message = "query not added";
            }
        } catch (SQLException ex) {
            message = "Query failed: " + ex.getMessage();
        }
        
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
            
    }

    // Extract file name from content-disposition header
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "unknown";
    }
}
