<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<%
    dbConnect db = new dbConnect();
    Connection conn = db.connect();
    
    String name=request.getParameter("mname");
    String seat=request.getParameter("seat");
    int sid= Integer.parseInt(request.getParameter("sid"));
    int uid = (int) session.getAttribute("uid"); 
    int price = 0;
    String date = null;
    
    
    String query = "SELECT * FROM shows WHERE sId=?";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, sid);
    ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {
        date= rs.getString("date");
        price = rs.getInt("price");
    }
    
    
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/logo.jpeg">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .payment-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 100%;
        }
        .payment-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        .input-group input[type="number"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        .logo-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .logo-container img {
            width: 30px;
            height: auto;
        }
        .pay-button {
            background-color: #0070ba;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 4px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
        }
        .pay-button:hover {
            background-color: #005fa3;
        }
        .hidden-inputs {
            display: none;
        }
    </style>
</head>
<body>

    <div class="payment-container">
        <h2>Secure Payment</h2>
        
        <form action="paymentAction.jsp" method="post">
            <div class="input-group">
                <label for="cardNumber">Card Number</label>
                <input type="number" id="cardNumber" name="cardNumber" required placeholder="1234 5678 9876 5432">
            </div>
            <div class="input-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="month" id="expiryDate" name="expiryDate" required>
            </div>
            <div class="input-group">
                <label for="cvv">CVV</label>
                <input type="number" id="cvv" name="cvv" required placeholder="123" maxlength="3">
            </div>
            
            <!-- Hidden Fields for additional payment data -->
            <div class="hidden-inputs">
                <input type="hidden" name="uid" value="<%=uid %>">
                <input type="hidden" name="sid" value="<%=sid %>">
                <input type="hidden" name="payment" value="<%=price %>">
                <input type="hidden" name="seatNo" value="<%=seat %>">
                <input type="hidden" name="date" value="<%=date %>">
                <input type="hidden" name="mname" value="<%=name %>">
            </div>
            
            <!-- Logos for Payment Methods -->
            <div class="logo-container">
                <img src="img/visa.png" alt="Visa">
                <img src="img/master.png" alt="Mastercard">
                <img src="img/paypal.jpg" alt="PayPal">
            </div>
            
            <input type="submit" class="pay-button" value="Pay Now">
        </form>
    </div>

</body>
</html>
