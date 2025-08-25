<%@include file="header.html"%>
<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
  body {
    margin: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    font-family: Arial, sans-serif;
    background: #f9f9f9;
  }
  .container {
    flex: 1;
    width: 90%;
    margin: 30px auto;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  }
  input[type="text"], input[type="password"], input[type="email"], select, input[type="number"] {
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    padding: 15px;
    width: 60%;
    border-radius: 25px;
    margin-left: 20%;
  }
  h2,h1 { margin-left: 20%; }
  hr { width: 60%; }
  .footer {
    text-align: center;
    padding: 15px;
    background: #333;
    color: white;
    font-size: 14px;
    border-top: 3px solid #4CAF50;
  }
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)) {
%>
<center><font color="green" size="5">Successfully Updated</font></center>
<%
} else if("invalid".equals(msg)) {
%>
<center><font color="red" size="5">Something went wrong! Try Again!</font></center>
<%
}
int id = 1;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select max(id) from donor");
    if (rs.first()) {
        id = rs.getInt(1) + 1;
    }
} catch (Exception e) { e.printStackTrace(); }
%>

<div class="container">
    <h1 style="color:red;">Donor ID: <%= id %></h1>

    <form action="addNewDonorAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <h2>Name</h2>
        <input type="text" placeholder="Enter Name" name="name" required>
        <hr>

        <h2>Father Name</h2>
        <input type="text" placeholder="Enter Father Name" name="father" required>
        <hr>

        <h2>Mother Name</h2>
        <input type="text" placeholder="Enter Mother Name" name="mother" required>
        <hr>

        <h2>Mobile Number</h2>
        <input type="number" placeholder="Enter Mobile Number" name="mobilenumber" required>
        <hr>

        <h2>Gender</h2>
        <select name="gender" required>
            <option value="">--Select--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Others">Others</option>
        </select>
        <hr>

        <h2>Email</h2>
        <input type="email" placeholder="Enter Email" name="email" required>
        <hr>

        <h2>Blood Group</h2>
        <select name="bloodgroup" required>
            <option value="">--Select--</option>
            <option value="A+">A+</option><option value="A-">A-</option>
            <option value="B+">B+</option><option value="B-">B-</option>
            <option value="O+">O+</option><option value="O-">O-</option>
            <option value="AB+">AB+</option><option value="AB-">AB-</option>
        </select>
        <hr>

        <h2>Address</h2>
        <input type="text" placeholder="Enter Address" name="address" required>
        <br><br>
        <center><button type="submit" class="button">Save</button></center>
    </form>
</div>

<div class="footer">All Right Reserved @2025</div>

</body>
</html>
