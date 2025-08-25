<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<meta charset="utf-8">
<style>
input[type="text"], input[type="email"], select {
  border: none;
  background: silver;
  height: 40px;
  font-size: 16px;
  padding: 10px;
  width: 60%;
  border-radius: 8px;
  margin-bottom: 15px;
}
</style>
</head>
<body>
<div class="container">
  <center><h2>Enter Your Details to Request For Blood</h2></center>

  <form action="requestBloodAction.jsp" method="post">
    <center>
    <input type="text" placeholder="Enter Name" name="name" required><br>
    <input type="text" placeholder="Enter Mobile Number" name="mobilenumber" required><br>
    <input type="email" placeholder="Enter Email Address" name="email" required><br>

    <select name="bloodgroup" required>
      <option value="">Select Blood Group</option>
      <option value="A+">A+</option>
      <option value="A-">A-</option>
      <option value="B+">B+</option>
      <option value="B-">B-</option>
      <option value="O+">O+</option>
      <option value="O-">O-</option>
      <option value="AB+">AB+</option>
      <option value="AB-">AB-</option>
    </select><br>

    <button type="submit" class="button">Submit</button>
    </center>
  </form>
</div>

<br><br>
<h3><center>All Right Reserved @2025</center></h3>
</body>
</html>
