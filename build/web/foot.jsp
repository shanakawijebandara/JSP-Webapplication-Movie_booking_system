<%-- 
    Document   : foot
    Created on : Dec 13, 2024, 4:38:02 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title>-->
        <link rel="stylesheet" href="css/moviestyle.css">
        <style>
            .app-name {
                display: flex;
                align-items: center;
              }

             .logo-icon {
                width: 7vw; /* Adjust as needed */
                height: 10vh; /* Adjust as needed */
                margin-left: 5px; /* Adds space between 'Your' and the image */
              }

        </style>
    </head>
    <body>
        <!-- Footer -->
  <footer class="w-100">
    <div class="f-item-con">
      <div class="app-info">
        <span class='app-name'>
          <span class='app-initial'></span>
          <img src="img/logo.png" alt="Logo" class="logo-icon">
        </span>
      </div>
      <div class="useful-links">
        <div class="footer-title">You May Useful</div>
        <ul>
          <!--<li>Courses</li>-->
          <li>Sign In</li>
          <li>About Us</li>
          <li>Become an Affiliate</li>
          <li>Advertise with Us</li>
          <!--<li>Terms and Conditions</li>-->
        </ul>
      </div>
      <div class="help-sec">
        <div class="footer-title">Help</div>
        <ul>
          <li>Help Me</li>
          <li>Feedback</li>
          <li>Report an Issue / Bug</li>
        </ul>
      </div>
      <div class="g-i-t">
        <div class="footer-title">User Feedback</div>
        
        <form action="feedback" method="post" class="space-y-2">
          <input type="text" name="name" class="g-inp" id="g-name" placeholder='Name' />
          <input type="email" name="email" class="g-inp" id="g-email" placeholder='Email' />
          <textarea type="text" name="feed" class="g-inp h-40 resize-none" id="g-msg" placeholder='Message...'></textarea>
          <button type="submit" class='f-btn' name="fsub">Submit</button>
        </form>
      </div>
    </div>
    <div class='cr-con'>Copyright &copy; 2024 | Made by MovieRullz (pvt)Ltd</div>
  </footer>
    </body>
</html>
s