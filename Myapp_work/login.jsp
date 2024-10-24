<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            background-image: url('<%= request.getContextPath() %>/images/background.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            transform: scale(0.9);
            animation: fadeInScale 0.8s ease-out forwards;
        }
        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 600;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #495057;
            font-size: 16px;
        }
        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
            color: #495057;
            transition: border-color 0.3s ease;
        }
        input:focus {
            border-color: #007BFF;
            outline: none;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .error {
            color: #dc3545;
        }
        .success {
            color: #28a745;
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            max-width: 150px;
            animation: fadeIn 1s ease-out;
        }
        @keyframes fadeInScale {
            0% {
                opacity: 0;
                transform: scale(0.85);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div>
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo" class="logo">
    </div>
    <div class="container">
        <h2>Login</h2>
        
        <form action="login.jsp" method="post" autocomplete="off">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required 
                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>

        <div class="message">
            <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "Mihir0209");

                    String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setString(1, username);
                    stmt.setString(2, password); // Use hashed password in a real app
                    
                    ResultSet rs = stmt.executeQuery();
                    
                    if (rs.next()) {
                        session.setAttribute("username", username); // Set session attribute
                        response.sendRedirect("welcome.jsp");
                    } else {
                        out.println("<p class='error'>Invalid username or password.</p>");
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                }
            }
            %>
        </div>
    </div>
</body>
</html>
