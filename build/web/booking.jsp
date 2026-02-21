<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Arrays" %>

<%
    
    String email = (String) session.getAttribute("email");

    
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




<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    
    String query = "SELECT * FROM shows WHERE mId=? AND (date > CURRENT_DATE() OR date = CURRENT_DATE())";
    int mId=0;
    String mName = "Null";
    String date;
    String time;
    String list = "";
    int sId=0;
    String[] array = {"AL1", "AL2", "AL3", "AL4", "AL5", 
                  "BL1", "BL2", "BL3", "BL4", "BL5", 
                  "CL1", "CL2", "CL3", "CL4", "CL5", 
                  "DL1", "DL2", "DL3", "DL4", "DL5", 
                  "EL1", "EL2", "EL3", "EL4", "EL5", 
                  "FL1", "FL2", "FL3", "FL4", 
                  "AR1", "AR2", "AR3", "AR4", 
                  "BR1", "BR2", "BR3", "BR4", 
                  "CR1", "CR2", "CR3", "CR4", 
                  "DR1", "DR2", "DR3", "DR4", 
                  "ER1", "ER2", "ER3", "ER4", 
                  "FR1", "FR2", "FR3"};
    
    ArrayList<String> list2 = new ArrayList<>(Arrays.asList(array));
    
    
    if((request.getParameter("mid") != null) && !request.getParameter("mid").isEmpty())
    {
        
        mId = Integer.parseInt(request.getParameter("mid"));
        try
        {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,mId);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                date = rs.getString("date");
                time = rs.getString("time");
                sId  = rs.getInt("sId");
                list += "<option value=\""+sId+"\">"+date+"    "+time+"</option>";
//              
            }
            
            
            String query2 = "SELECT * FROM movie WHERE mid=?";
            PreparedStatement stmt2 = conn.prepareStatement(query2);
            stmt2.setInt(1, mId);
            ResultSet rs2 = stmt2.executeQuery();
            while(rs2.next())
            {
                mName = rs2.getString("mName");
            }
            
            
            
        
        
        }catch(Exception e)
        {
            out.print(e);
}
}
    int selectSid;
    if(request.getParameter("check")!= null)
    {
        try{
            selectSid = Integer.parseInt(request.getParameter("showlist")); 
            int movieid = Integer.parseInt(request.getParameter("movieid")); 
            response.sendRedirect("booking.jsp?mid="+movieid+"&sid="+selectSid);
    }catch(Exception e)
    {
        out.print(e);
    }
        
    }
    String seatdropdown="";
    if((request.getParameter("sid") != null) && !request.getParameter("sid").isEmpty())
    {
            int showId = Integer.parseInt(request.getParameter("sid"));
            String bookedSeat;
            
            String query3 = "SELECT * FROM orders WHERE sId=?";
            PreparedStatement stmt3 = conn.prepareStatement(query3);
            stmt3.setInt(1, showId);
            ResultSet rs3 = stmt3.executeQuery();
            while(rs3.next())
            {
                bookedSeat = rs3.getString("seatNo");
                list2.remove(bookedSeat);
            }
            for(String i : list2)
            {
                seatdropdown += "<option value=\""+i+"\">"+i+"</option>";
            
            }
         
    }
    
    
    
    
    %>





<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ticket</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
  <!-- Font Awesome CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/moviestyle.css">
  <link rel="stylesheet" href="css/bookingstyle.css">
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white p-3 border-bottom w-100">
    <div class="container-fluid px-3">
      <a class="navbar-brand" href="#">Logo</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link mx-2 active" href="home.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link mx-2" href="movie.jsp">Films</a></li>
          <li class="nav-item"><a class="nav-link mx-2" href="#">About Us</a></li>
          <li class="nav-item"><a class="nav-link mx-2" href="#">Contact Us</a></li>
        </ul>
        <ul class="navbar-nav ms-auto d-none d-lg-inline-flex">
          <!--<li class="nav-item mx-2"><a class="nav-link text-dark h5" href="#"><i class="fas fa-shopping-cart"></i></a></li>-->
          <!--<li class="nav-item mx-2"><a class="nav-link text-dark h5" href="#"><i class="fas fa-heart"></i></a></li>-->
          <li class="nav-item mx-2"><a class="nav-link text-dark h5" href="#"><i class="fas fa-user"></i></a></li>
        </ul>
      </div>
    </div>
  </nav>



  <!-- Form Section -->
  <div class="formbold-main-wrapper">
    <!-- Author: FormBold Team -->
    <!-- Learn More: https://formbold.com -->
    <div class="formbold-form-wrapper">
        <h1 class="h1">Book Your Tickets...</h1><br>
        <!--form 1--> 
        <form action="booking.jsp" method="POST">
            
          <div class="formbold-mb-5">
<!--          <label for="name" class="formbold-form-label"> Full Name </label>-->
          <input
            type="text"
            name="mname"
            id="name"
            placeholder="<%=mName%>"
            class="formbold-form-input"
            disabled
          />
          <input type="hidden" name="movieid" value="<%=mId %>">
        </div>
          <div class="formbold-mb-5">
            <label for="phone-no" class="formbold-form-label"> Available Shows</label>
            <select class="formbold-form-input" name="showlist">
                <!--<option>2024-12-06 14:00:00.000000</option>-->     
                <%=list%>
            </select>
          </div>
            <div>
                <button class="formbold-btn" type="submit" name="check">Check Availability</button>
        </div>
        </form>
      <form action="payment.jsp" method="POST">
          
        <div class="formbold-mb-5">
          <label for="name" class="formbold-form-label"> Full Name </label>
          <input
            type="text"
            name="name"
            id="name"
            placeholder="Full Name"
            class="formbold-form-input"
          />
        </div>
        <div class="formbold-mb-5">
            <label for="email" class="formbold-form-label"> Email Address </label>
            <input
              type="email"
              name="email"
              id="email"
              placeholder="Enter your Email Here"
              class="formbold-form-input"
            />
          </div>
        <div class="formbold-mb-5">
          <label for="phone" class="formbold-form-label"> NIC</label>
          <input
            type="text"
            name="nic"
            id="nic"
            placeholder="Enter your NIC Here"
            class="formbold-form-input"
          />
        </div>

        <div class="formbold-mb-5">
            <label for="phone-no" class="formbold-form-label"> Phone Number</label>
            <input
              type="phone-no"
              name="phone-no"
              id="phone-no"
              placeholder="Enter your Phone Number Here"
              class="formbold-form-input"
            />
          </div>
                    
          
        
          <div class="w-full sm:w-half formbold-px-3">
            <div class="formbold-mb-5">
              <label for="seat" class="formbold-form-label">Select Seat</label>
              <select
                name="seat"
                id="seat"
                class="formbold-form-input"
              >
                  <%=seatdropdown%>              
              </select>
            </div>
        </div>
          
        
  
        <div>
            <input type="hidden" name="mname" value="<%=mName%>">
            <input type="hidden" name="sid" value="<%=sId%>">
            
            <button class="formbold-btn" type="bookSub">Book Appointment</button>
        </div>
      </form>
    </div>
  </div>



  <!-- Footer -->
  <footer class="w-100">
    <div class="f-item-con">
      <div class="app-info">
        <span class='app-name'>
          <span class='app-initial'>Your</span>Logo
        </span>
      </div>
      <div class="useful-links">
        <div class="footer-title">You May Useful</div>
        <ul>
          <li>Courses</li>
          <li>Sign In</li>
          <li>About Us</li>
          <li>Become an Affiliate</li>
          <li>Advertise with Us</li>
          <li>Terms and Conditions</li>
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
        <form action="/" method="post" class="space-y-2">
          <input type="text" name="g-name" class="g-inp" id="g-name" placeholder='Name' />
          <input type="email" name="g-email" class="g-inp" id="g-email" placeholder='Email' />
          <textarea type="text" name="g-msg" class="g-inp h-40 resize-none" id="g-msg" placeholder='Message...'></textarea>
          <button type="submit" class='f-btn'>Submit</button>
        </form>
      </div>
    </div>
    <div class='cr-con'>Copyright &copy; 2024 | Made by Lahini Nulekaa</div>
  </footer>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
