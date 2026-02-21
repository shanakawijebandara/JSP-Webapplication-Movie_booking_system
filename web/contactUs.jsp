<%-- 
    Document   : contact
    Created on : Dec 6, 2024, 12:53:48 PM
    Author     : Nathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            color: #000000;
        }
        .contact-section {
            padding: 50px 20px;
            max-width: 800px;
            margin: auto;
            text-align: center;
        }
        .contact-section h1 {
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .contact-section p {
            font-size: 18px;
            margin-bottom: 40px;
        }
        .contact-info {
            margin-bottom: 30px;
        }
        .contact-info div {
            margin-bottom: 10px;
            font-size: 16px;
        }
        .contact-info span {
            font-weight: bold;
        }
        .contact-form {
            text-align: left;
        }
        .contact-form label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .contact-form button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .contact-form button:hover {
            background-color: #444444;
        }
    </style>

</head>

<body>
    
    <div class="contact-section">
    <h1>Contact Us</h1>
    <p>We would love to hear from you! Please use the form below to get in touch with us.</p>

    <div class="contact-info">
        <div><span>Address:</span> Havelock City Mall, 324-10 Havelock Rd, Colombo 00500</div>
        <div><span>Phone:</span>0770288018</div>
        <div><span>Email:</span> snathandaniel81@gmail.com</div>
    </div>

    <div class="contact-form">
        <form action="contactAction.jsp" method="post">
            <label for="name">Your Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Your Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="message">Your Message</label>
            <textarea id="message" name="message" rows="5" placeholder="Enter your message" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>
</div>

   <%@include file="foot.jsp" %>
    
</body>
</html>