<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>


<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String path = "";
    String code = "";
    String query = "SELECT DISTINCT mId FROM shows WHERE date = CURRENT_DATE()";
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
            String photo = rs2.getString("photo");
            
            code += "<div class=\"movie\">";
            code += "<img src=\""+photo+"\" alt=\"Jurassic World Rebirth\">";
            code += "<h4><a href=\"booking.jsp?mid="+mId+"\">"+name+"</a><h4>";
            code += "</div>";
            
            
            
            
        
        
        }
}
    
    
    
    
    
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/logo.jpeg">
    <title>MovieRulzz</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            color: #000000;
        }
        .hero {
            text-align: center;
            padding: 80px 20px;
            background: url('img/hero.jpg') no-repeat center center / cover;
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        .hero button {
            padding: 15px 30px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .hero button:hover {
            background-color: #444444;
        }
        .section {
            text-align: center;
            padding: 50px 20px;
        }
        .section h2 {
            font-size: 32px;
            margin-bottom: 30px;
        }
        .movies {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .movie {
            width: 220px;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .movie img {
             width: 100%; /* Ensures the image fits the card's width */
             height: 350px; /* Sets a consistent height for all movie images */
             object-fit: cover; /* Prevents image distortion */
}

        .movie h4 {
            font-size: 18px;
            margin: 10px 0;
        }
        .movie p {
            font-size: 14px;
            margin: 0 10px 10px;
            color: #444;
        }
        .action-buttons {
            margin-top: 30px;
        }
        .action-buttons button {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .action-buttons button:hover {
            background-color: #444444;
        }
    </style>
</head>
<%@include file="nav.jsp" %>
<body>

<div class="hero">
    <h1>Welcome to MovieRulzz</h1>
    <p>Your destination for the latest blockbusters and classic favorites. Book your tickets now!</p>
    <button onclick="location.href='movies.jsp'">Explore Now Showing</button>
</div>

<div class="section" id="now-showing">
    <h2>Now Showing</h2>
    <div class="movies">
        
        <%=code%>
    </div>
</div>

<div class="section">
    <h2>Upcoming Releases</h2>
    <div class="movies">
        <div class="movie">
            <img src="img/Jurassic World Rebirth.jpg" alt="Jurassic World Rebirth">
            <h4>Jurassic World Rebirth</h4>
            <p>Action | 120 mins</p>
        </div>
        <div class="movie">
            <img src="img/Avatar Fire and Ash.webp" alt="Avatar: Fire and Ash">
            <h4>Avatar: Fire and Ash</h4>
            <p>Adventure | 159 mins</p>
        </div>
        <div class="movie">
            <img src="img/Mission Impossible.jpg" alt="Mission: Impossible">
            <h4>Mission: Impossible</h4>
            <p>Action | 110 mins</p>
        </div>
    </div>
    <div class="action-buttons">
        <button onclick="location.href='https://www.imdb.com/list/ls579577759/'">View All Upcoming</button>
        <button onclick="location.href='contactUs.jsp'">Contact Us</button>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>
