<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    

    if(request.getParameter("showSubmit")!=null)
    {
        int movie = Integer.parseInt(request.getParameter("movie"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int noSeat = 0;
        float price = Float.parseFloat(request.getParameter("price"));
        
        String query = "INSERT INTO shows(mId,noSeat,time,date,price) VALUES(?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        try{
        pstmt.setInt(1, movie);
        pstmt.setString(4, date);
        pstmt.setString(3, time);
        pstmt.setInt(2, noSeat);
        pstmt.setFloat(5, price);
        
        int r = pstmt.executeUpdate(); 
        
        if(r==1)
        {
            response.sendRedirect("admin.jsp?msg=added");
        }
        
        }catch(Exception e)
        {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
        }
        
        
        
             
        
}



%>