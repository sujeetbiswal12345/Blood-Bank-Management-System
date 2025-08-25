<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"] {
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    margin-left: 35%;
    padding: 15px;
    width: 33%;	
    border-radius: 25px;
}

body {
    background: #FDF5E6;
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
}

.container {
    flex: 1;
    width: 60%;
    margin: 30px auto;
    background: #fff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.button {
    background: #4CAF50;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
}

.button:hover {
    background: #45a049;
}

.header {
    background: #333;
    overflow: hidden;
    padding: 10px;
}

.header a {
    float: left;
    color: white;
    text-align: center;
    padding: 14px;
    text-decoration: none;
    font-size: 17px;
}

.header a.logo {
    font-size: 20px;
    font-weight: bold;
}

.header a.active {
    background-color: #4CAF50;
    color: white;
}

.header-right {
    float: right;
}

.footer {
    text-align: center;
    padding: 15px 0;
    background: #333;
    color: white;
    font-size: 14px;
    border-top: 3px solid #4CAF50;
}
</style>
</head>
<body>
<div class="header">
  <a href="index.jsp" class="logo"><img class="logo" src="Logo1.png" height="50"></a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<div class="container">
<br><br>
<%
String msg =request.getParameter("msg");
if("invalid".equals(msg)) {
%>
  <center><font color="red" size= "5">Invalid Username/Password</font></center>
<%
}
%>

<form action="adminLoginAction.jsp" method="post">
  <center><h2>Username</h2></center>
  <input type="text" placeholder="Enter Username" name="username" required >
  <center><h2>Password</h2></center>
  <input type="password" placeholder="Enter Password" name="password" required >
  <center><button type="Submit" class="button">Submit</button></center>
</form>
</div>

<div class="footer">
  All Rights Reserved @2025
</div>
</body>
</html>
