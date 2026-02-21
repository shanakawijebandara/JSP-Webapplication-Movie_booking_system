<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<%
    String message = "";
    if(request.getParameter("submit")!=null)
    {
    
          String email = request.getParameter("email");
          String pass = request.getParameter("password");
          int ue = 0;
          int uid = 0;
          int isAdmin=0;
          
          String query = "SELECT * FROM user WHERE email=? and password=?";
          
          dbConnect db = new dbConnect();
          Connection conn = db.connect();
          
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                uid = rs.getInt("id");
                isAdmin = rs.getInt("isAdmin");
                ue +=1;
            }
            if(ue==1)
            {
                session.setAttribute("email", email);
                session.setAttribute("uid", uid);
                session.setAttribute("isAdmin", isAdmin);
                response.sendRedirect("home.jsp");
            }
            else
            {
                message = "Invalid Username or Password";
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    
    
    
    
    } 
    
    
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MovieRulzz | Login</title>
  <link rel="stylesheet" href="css/loginstyles.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <div class="wrapper">
    <form action="login.jsp" method="post">
      <h1>Login</h1>
      <div class="input-box">
        <input type="email" placeholder="Email" name="email" required>
        <i class='bx bxs-user'></i>
      </div>
      <div class="input-box">
        <input type="password" placeholder="Password" name="password" required>
        <i class='bx bxs-lock-alt' ></i>
      </div>
      <div class="remember-forgot">
        <label><input type="checkbox">Remember Me</label>
        <a href="#">Forgot Password</a>
      </div>
      <button type="submit" class="btn" name="submit">Login</button>
      <div class="register-link">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
      </div>
    </form>
  </div>
    <% if(!message.isEmpty()) { %>
    <script>
         window.alert("<%=message%>");
    </script> 
    
    <% } %>
</body>
</html>
