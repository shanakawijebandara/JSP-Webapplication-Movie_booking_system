<%-- 
    Document   : contactAction
    Created on : Dec 16, 2024, 1:07:48 PM
    Author     : User
--%>

<%@page import="servlet.EmailSender"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    
    EmailSender e = new EmailSender();
    String o = e.sendEmail("snathandaniel81@gmail.com", "Contact", "User: "+name+"\nEmail: "+email+"\nMessage: "+message);
    out.print(o);
    response.sendRedirect("contactUs.jsp");




%>