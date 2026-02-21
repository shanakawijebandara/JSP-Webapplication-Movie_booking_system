<%-- 
    Document   : nav
    Created on : Dec 13, 2024, 4:37:47 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
  <!-- Font Awesome CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/moviestyle.css">
    </head>
    <body>
        <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white p-3 border-bottom w-100">
    <div class="container-fluid px-3">
      <a class="navbar-brand" href="home.jsp">Movie Rulzz   </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link mx-2 active" href="home.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link mx-2" href="movies.jsp">Films</a></li>
          <!--<li class="nav-item"><a class="nav-link mx-2" href="#">Tickets</a></li>-->
          <!--<li class="nav-item"><a class="nav-link mx-2" href="#">Sheets</a></li>-->
          <li class="nav-item"><a class="nav-link mx-2" href="about.jsp">About Us</a></li>
          <li class="nav-item"><a class="nav-link mx-2" href="contactUs.jsp">Contact Us</a></li>
        </ul>
        <ul class="navbar-nav ms-auto d-none d-lg-inline-flex">
          <!--<li class="nav-item mx-2"><a class="nav-link text-dark h5" href="#"><i class="fas fa-shopping-cart"></i></a></li>-->
          <!--<li class="nav-item mx-2"><a class="nav-link text-dark h5" href="#"><i class="fas fa-heart"></i></a></li>-->
          <li class="nav-item mx-2"><a class="nav-link text-dark h5" href="account.jsp"><i class="fas fa-user"></i></a></li>
        </ul>
      </div>
    </div>
  </nav>

    </body>
</html>
