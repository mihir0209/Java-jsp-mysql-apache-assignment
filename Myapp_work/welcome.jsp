<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            background-color: #e9ecef;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;

        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #007BFF;
        }
        p {
            color: #333;
        }
        .logo {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 100px;
            height: auto;
        }
    </style>
</head>
<body style="background-image: url('<%= request.getContextPath() %>/images/background.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;">
    <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo" class="logo">

    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
        <p>You have successfully entered this portal.</p>
    </div>
</body>
</html>
