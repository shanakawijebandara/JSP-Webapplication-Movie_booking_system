<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MovieRulzz | Register</title>
  <link rel="stylesheet" href="css/regstyle.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <div class="wrapper">
    <form action="registerAction" method="post">
      <h1>Register</h1>
      <div class="input-box">
        <input type="email" placeholder="Email" name="email" required>
        <i class='bx bx-user'></i>
      </div>
      <div class="input-box">
        <input type="text" placeholder="Username" name="uname" required>
        <i class='bx bx-user'></i>
      </div>
      <div class="input-box">
        <input type="password" placeholder="Password" name="password" required>
        <i class='bx bx-show'></i>
      </div>
      <div class="input-box">
        <input type="password" placeholder="Confirm Password" required>
        <i class='bx bx-show'></i>
      </div>
      <button type="submit" class="btn" name="submit">Register</button>
      <div class="register-link">
        <p>If you have an account? <a href="login.jsp">Login</a></p>
      </div>
    </form>
  </div>
    
    <%
        if((request.getParameter("msg") != null) && !request.getParameter("msg").isEmpty()){ String message="User already exist";%>
    <script>
         window.alert("<%=message%>");
    </script> 
    
    <% } %>

   

       
        
</body>
</html>
