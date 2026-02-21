<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String path = "";
    String code = "";
    String query = "SELECT * FROM movie";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    while(rs.next())
    {
        path = rs.getString("photo");
        code += "<div class=\"poster\"><img src=\""+path+"\" alt=\"Movie Poster 1\"></div>";
}
    
    
    
    
    
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Website</title>
    <link rel="stylesheet" href="css/favstyle.css">
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/b3136b502f.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav>
            <a href="#"><img src="logo.png" alt="logo"></a>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Films</a></li>
                <li><a href="#">Tickets</a></li>
                <li><a href="#">Seats</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
            <div class="icons">
                <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
                <a href="#"><i class="fa-solid fa-heart"></i></a>
                <a href="#"><i class="fa-solid fa-user"></i></a>
            </div>
        </nav>
    </header>

    <section class="hero">
        <h2>Your Favorite Movies...</h2>
        <div class="movie-posters">
            
            <%=code%>
<!--            
            <div class="poster">
                <img src="uploads/deadpool.jpg" alt="Movie Poster 1">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster ">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster 3">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster 4">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster 5">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster 5">
            </div>
            <div class="poster">
                <img src="img/fav1.jpg" alt="Movie Poster 5">
            </div>-->
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-logo">LOGO</div>
            <div class="footer-links">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Films</a></li>
                    <li><a href="#">Tickets</a></li>
                    <li><a href="#">Seats</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
            <div class="feedback-form">
                <h4>User Feedback</h4>
                <form>
                    <input type="email" placeholder="Email" required>
                    <textarea placeholder="Message" required></textarea>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>
