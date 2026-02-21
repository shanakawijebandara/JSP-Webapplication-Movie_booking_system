<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.dbConnect" %>
<%@page import="java.sql.*" %>

<!--upload page error--> 
<% 
    int isAdmin = (int) session.getAttribute("isAdmin"); 
    if(isAdmin!=1)
    {
       response.sendRedirect("account.jsp"); 
    }
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
    <div class="alert-message"><%= message %></div>
<%
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/adminstyle.css">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            box-sizing: border-box;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form-section {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-section h2 {
            color: #343a40;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group input,
        .input-group select,
        .input-group textarea {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .input-group input:focus,
        .input-group select:focus,
        .input-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .input-group textarea {
            height: 120px;
            resize: vertical;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        table th,
        table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f1f1f1;
            color: #343a40;
        }

        .alert-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 16px;
        }

        .hidden-section {
            display: none;
        }

        .hidden-section.active {
            display: block;
        }

        .form-section .toggle-btn {
            background-color: #28a745;
            color: white;
            font-size: 16px;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-section .toggle-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="container">

        <!-- Error message display -->
        <% 
            if (message != null) {
        %>
            <div class="alert-message"><%= message %></div>
        <% 
            }
        %>

        <!-- Movie Upload Section -->
        <div class="form-section">
            <h2>Add Movie</h2>
            <form action="uploadAction" method="post" enctype="multipart/form-data">
                <div class="input-group">
                    <input type="text" name="name" placeholder="Movie Name" required>
                </div>
                <div class="input-group">
                    <input type="text" name="actors" placeholder="Actors" required>
                </div>
                <div class="input-group">
                    <input type="text" name="price" placeholder="Ticket Price" required>
                </div>
                <div class="input-group">
                    <input type="file" name="imag" required>
                </div>
                <div class="input-group">
                    <textarea name="desc" placeholder="Description" required></textarea>
                </div>
                <input type="submit" value="Submit" name="addsubmit" class="button">
            </form>
        </div>

        <!-- Add Movie to Showing Section -->
        <div class="form-section">
            <h2>Add Movie to Showing</h2>
            <form action="adminAction.jsp" method="post">
                <% 
                    dbConnect db = new dbConnect();
                    Connection conn = db.connect();
                    String mnamecode = "";
                    String query = "SELECT * FROM movie";
                    try {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            String mname = rs.getString("mName");
                            int mid = rs.getInt("mid");
                            mnamecode += "<option value=\"" + mid + "\">" + mname + "</option>";
                        }
                    } catch (SQLException e) {
                        message = e.getMessage();
                    }
                    String pd="";
                    int pr  = 0;
                    if((request.getParameter("pd") != null) && !request.getParameter("pd").isEmpty())
                    {
                        pd = request.getParameter("pd");
                        String q = "SELECT payment FROM orders WHERE date = ?";
                        PreparedStatement p = conn.prepareStatement(q);
                        p.setString(1, pd);
                        ResultSet r = p.executeQuery();

                        while(r.next())
                        {
                            pr += r.getInt("payment");

                        }
                    }
                    

                %>

                <div class="input-group">
                    <select name="movie">
                        <%= mnamecode %>
                    </select>
                </div>

                <div class="input-group">
                    <select name="time">
                        <option value="10:00:00">10:00 AM</option>
                        <option value="14:00:00">2:00 PM</option>
                        <option value="18:00:00">6:00 PM</option>
                    </select>
                </div>

                <div class="input-group">
                    <input type="date" name="date" required>
                </div>

                <div class="input-group">
                    <input type="text" name="price" placeholder="Price" required>
                </div>

                <input type="submit" name="showSubmit" value="Add Showing" class="button">
            </form>
        </div>

        <!-- Profit Summary Section -->
        <div class="form-section">
            <h2>Daily Income</h2>
            <form action="" method="get">
                <div class="input-group">
                    <input type="date" name="pd">
                </div>
                <input type="submit" name="showSubmit" value="Show Profit" class="button">
            </form>

            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Income</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= pd %></td>
                        <td><%= pr %></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="form-section">
            <h2>FeedBack</h2>
            
            <%
                
                String fq = "SELECT * FROM feedback";
                Statement s = conn.createStatement();
                ResultSet fr = s.executeQuery(fq);
                String fTable = "";
                while(fr.next())
                {
                    String name = fr.getString("name");
                    String email = fr.getString("email");
                    String feed = fr.getString("feed");
                    
                    fTable += "<tr><td>"+name+"</td><td>"+email+"</td><td>"+feed+"</td></tr>";
                }
                
                
                
                %>
            <table>
                <thead>
                    <tr>
                        <th>name</th>
                        <th>Email</th>
                        <th>Feedback</th>
                    </tr>
                    <%=fTable%>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            
                        
        </div>
                
        <form action="account.jsp" method="post"><button type="submit" name="logout" value="Logout" class="button">Logout</button></form>

    </div>

<!--    <script>
        // Toggle visibility for hidden sections
        const toggleButtons = document.querySelectorAll('.toggle-btn');
        toggleButtons.forEach(button => {
            button.addEventListener('click', () => {
                const hiddenSection = button.nextElementSibling;
                hiddenSection.classList.toggle('active');
            });
        });
    </script>-->

</body>
</html>
