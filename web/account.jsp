<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>
<%@page import="servlet.EmailSender"%>




<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int isAdmin = (int) session.getAttribute("isAdmin"); 
    String uname="";
    String tp="Contact Number";
    int uid=0;
    String tableCode = "";
//    out.print(isAdmin);

    // Redirect to login.jsp if not logged in
    
    if(isAdmin==1)
    {
       response.sendRedirect("admin.jsp"); 
    }
    
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String query = "SELECT * FROM user WHERE email=?";
    
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, email);
    ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {
        uname = rs.getString("uname");
        tp = rs.getString("tp");
        uid = rs.getInt("id");
    }
    try{
        
        String query2 = "SELECT * FROM orders WHERE uId=?";
        PreparedStatement pstmt2 = conn.prepareStatement(query2);
        pstmt2.setInt(1,uid);
        ResultSet rs2 = pstmt2.executeQuery();
        while(rs2.next())
        {
            
            String seat=rs2.getString("seatNo");
            int oId = rs2.getInt("oId");
            int sId = rs2.getInt("sId");
            int mId=0;
            String mName="";
//            out.print(sId);
            
            String query3 = "SELECT * FROM shows WHERE sId=?";
            PreparedStatement pstmt3 = conn.prepareStatement(query3);
            pstmt3.setInt(1,sId);
            ResultSet rs3 = pstmt3.executeQuery();
            while(rs3.next())
            {
                mId = rs3.getInt("mId");
            }
            
            String query4 = "SELECT * FROM movie WHERE mid=?";
            PreparedStatement pstmt4 = conn.prepareStatement(query4);
            pstmt4.setInt(1,mId);
            ResultSet rs4 = pstmt4.executeQuery();
            while(rs4.next())
            {
                mName = rs4.getString("mName");
                
            }
            
            
            tableCode += "<tr><td>"+oId+"</td><td>"+mName+"</td><td>"+seat+"</td><td><a href=\"account.jsp?oid="+oId+"\">Cancel</a></td></tr>";
        }
    
    }catch(Exception ex)
    {
        out.print(ex);
    }
        
%>

<%
    String outp = "";
    if((request.getParameter("oid") != null) && !request.getParameter("oid").isEmpty())
    {
        int oid = Integer.parseInt(request.getParameter("oid"));
    try{        
        String q = "INSERT INTO corders(email,oid,refund) VALUES(?,?,0)";
        PreparedStatement p= conn.prepareStatement(q);
        p.setString(1, email);
        p.setInt(2, oid);
        int r = p.executeUpdate();
        
        String q2 = "DELETE FROM orders WHERE oId=?";
        PreparedStatement p2= conn.prepareStatement(q2);
        p2.setInt(1, oid);
        int r2 = p2.executeUpdate();
        
        EmailSender es = new EmailSender();
        outp = es.sendEmail(email, "Order Cancellation", "Your order (Order Number: "+oid+") has been successfully cancelled.\nOur admin team will contact you shortly to collect the necessary bank details for processing your refund. If you have any questions, please feel free to reach out.");
        response.sendRedirect("account.jsp");
}catch(Exception e){out.print(e);}
        
    }
    
%>
<!--Logout Action-->
<%
    if ("Logout".equals(request.getParameter("logout"))) {
        session.invalidate(); 
        response.sendRedirect("login.jsp");
        return; 
    }
    
    
    %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="img/logo.jpeg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>User Account</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff; /* White background */
        color: #000; /* Black text */
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 1200px;
        padding: 20px;
        background-color: #f9f9f9; /* Light gray background for the container */
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        text-align: center;
    }

    a {
        color: #000; /* Black text for links */
        text-decoration: none;
        font-weight: bold;
        margin-bottom: 20px;
        display: inline-block;
    }

    a:hover {
        text-decoration: underline;
    }

    h1 {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .profile-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-image: url('img/profile.png'); /* Adjust the path as needed */
        background-size: cover;
        background-position: center;
    }

    form {
        margin-bottom: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="text"], input[type="submit"] {
        width: 100%;
        max-width: 400px;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc; /* Light gray border */
        border-radius: 5px;
        background-color: #fff; /* White background for inputs */
        color: #000; /* Black text */
    }
    
    .btn{
        width: 100%;
        max-width: 400px;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc; /* Light gray border */
        border-radius: 5px;
        color: #000; /* Black text */
        background-color: #f0f0f0; /* Light gray background */
        cursor: pointer;
    }

    input[type="submit"] {
        background-color: #f0f0f0; /* Light gray background */
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #e0e0e0; /* Darker gray on hover */
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff; /* White table background */
    }

    table, th, td {
        border: 1px solid #ccc; /* Light gray border */
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f0f0f0; /* Light gray background for table headers */
    }

td a {
    padding: 5px 10px;
    background-color: #f9f9f9; /* Light gray button background */
    border: 1px solid #ccc; /* Light gray border for buttons */
    color: #000; /* Black text */
    cursor: pointer;
    border-radius: 5px;
    margin-top: 2vh;
    text-decoration: none; /* Remove underline by default */
}

td a:hover {
    background-color: #e0e0e0; /* Darker gray on hover */
    text-decoration: none; /* Ensure underline remains hidden on hover */
}


    @media (max-width: 768px) {
        h1 {
            flex-direction: column;
        }

        input[type="text"], input[type="submit"] {
            max-width: 100%;
        }
    }
</style>

</head>
<body>
    <div class="container">
        <a href="home.jsp">&larr; Home</a>

        <h1>
            <div class="profile-icon"></div>
            Hi <%= uname %>
        </h1>

        <form action="accountAction" method="post">
            <input type="text" name="uname" placeholder="Username" value="<%=uname%>" disabled>
            <input type="text" name="email" placeholder="Email" value="<%=email%>" disabled>
            <input type="text" name="tp" placeholder="Telephone" >
            <input type="submit" name="detSub" value="Submit">
        </form>

        <form action="accountAction" method="post">
            <h1>Change Password</h1>
            <input type="hidden" name="email" value="<%= email %>">
            <input type="text" name="pass" placeholder="New Password">
            <input type="text" name="cpass" placeholder="Confirm Password">
            <input type="submit" name="cpsub" value="Submit">
        </form>
            

        <table>
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Movie Name</th>
                    <th>Seat</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%=tableCode%>
            </tbody>
        </table>
            <form action="account.jsp" method="post"><button type="submit" name="logout" class="btn" value="Logout">Logout</button></form>
    </div>
<% if(!outp.isEmpty()) { %>
    <script>
         window.alert("<%=outp%>");
    </script> 
    
    <% } %>
</body>
</html>
