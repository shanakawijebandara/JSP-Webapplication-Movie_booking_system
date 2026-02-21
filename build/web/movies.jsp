<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>


<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String path = "";
    String code = "";
    String query = "SELECT DISTINCT mId FROM shows WHERE date > CURRENT_DATE() OR date = CURRENT_DATE()";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    while(rs.next())
    {
        int mId = rs.getInt("mId");
        String query2 = "SELECT * FROM movie WHERE mid=?";
        PreparedStatement stmt2 = conn.prepareStatement(query2);
        stmt2.setInt(1, mId);
        ResultSet rs2 = stmt2.executeQuery();
        while(rs2.next())
        {
            String name = rs2.getString("mName");
            String desc = rs2.getString("descriprion");
            String photo = rs2.getString("photo");
            
            code += "<div class=\"item\"><div class=\"card\"><img src=\"";
            code += photo;
            code += "\" alt=\"Image 2\"></div><div class=\"circle circle1\"></div><div class=\"circle circle2\"></div><div class=\"content\"><h3>";
            code += "<a href=\"booking.jsp?mid="+mId+"\">"+name+"</a>";
            code += "</h3><p>"+desc+"</p></div></div>";
        
        }
}
    
    
    
    
    
    %>

    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="img/logo.jpeg">
  <title>Movies</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
  <!-- Font Awesome CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/moviestyle.css">
 
</head>
<body>
  <%@include file="nav.jsp" %>
  <!-- Animated Cards Section -->
  <div class="container my-5">
    <div class="container">
        <%=code%>        
    </div>
    
  </div>

  <%@include file="foot.jsp" %>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
