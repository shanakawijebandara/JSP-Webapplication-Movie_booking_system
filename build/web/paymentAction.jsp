<%@page import="servlet.EmailSender"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String message = "";
    String email = (String) session.getAttribute("email");
    String name=request.getParameter("mname");
    String seat=request.getParameter("seatNo");
    String date=request.getParameter("date");
    int price = Integer.parseInt(request.getParameter("payment"));
    int uid = Integer.parseInt(request.getParameter("uid"));
    int sid = Integer.parseInt(request.getParameter("sid"));
    
    String query = "INSERT INTO orders(uId,sId,payment,seatNo,date) VALUES(?,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, uid);
    pstmt.setInt(2, sid);
    pstmt.setInt(3, price);
    pstmt.setString(4, seat);
    pstmt.setString(5, date);
    int r = pstmt.executeUpdate();
    if(r==1)
    {
        message += "Hi,\n";
        message += "We are pleased to inform you that your order has been successfully placed.\n\n";
        message += "Movie Name: " + name + "\n";
        message += "Seat No: " + seat + "\n";
        message += "Date: " + date + "\n\n";        
        message += "If you have any questions or issues, please don't hesitate to contact us at 0787556494.\n";
        message += "Thank you for choosing our service!";
        
        EmailSender es = new EmailSender();
        String res = es.sendEmail(email, "Confirmation of Your Movie Ticket Booking ", message);
        if(res.equals("Please Check your Email inbox"))
        {
            response.sendRedirect("account.jsp");
        }
        else
        {
            out.print(es);
        }
        

        
    }
    else
    {
        response.sendRedirect("payment.jsp?msg=error");
    }
    


%>