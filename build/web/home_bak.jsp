<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav.jsp" %>

<%
    
    String email = (String) session.getAttribute("email");
    int uid = (int) session.getAttribute("uid"); 

    
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    
    if ("Logout".equals(request.getParameter("logout"))) {
        session.invalidate(); 
        response.sendRedirect("login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
</head>
<body>
    <h1>Welcome to the Home Page!</h1>

    <%-- Display logged-in user's email --%>
    <p>Logged in as: <%= email %></p>
    <p>Logged in as: <%= uid %></p>
    
    <a href="movies.jsp">mekata palayan</a>

    <%-- Logout form --%>
    <form method="post" action="home.jsp">
        <button type="submit" name="logout" value="Logout">Logout</button>
    </form>
    
    <%@include file="foot.jsp" %>
</body>
</html>
