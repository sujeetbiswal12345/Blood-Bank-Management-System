<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.html" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Completed Requests</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;   /* ✅ full page height */
    }
    h2 {
      text-align: center;
      margin-top: 20px;
      color: #333;
    }
    .content {
      flex: 1;   /* ✅ pushes footer down */
    }
    #customers {
      border-collapse: collapse;
      width: 90%;
      margin: 20px auto;
      background: #fff;
      box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    #customers th, #customers td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }
    #customers th {
      background-color: #4CAF50;
      color: white;
    }
    #customers tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    #customers tr:hover {
      background-color: #f1f1f1;
    }
    .footer {
      text-align: center;
      padding: 15px;
      background: #333;
      color: white;
      border-top: 3px solid #4CAF50;
      font-size: 14px;
    }
  </style>
</head>
<body>

<div class="content">
  <h2>Completed Blood Requests</h2>

  <table id="customers">
    <tr>
      <th>Name</th>
      <th>Mobile Number</th>
      <th>Email</th>
      <th>Blood Group</th>
    </tr>

  <%
  boolean found = false;
  try {
      Connection con = ConnectionProvider.getCon();
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("SELECT name, mobilenumber, email, bloodgroup FROM bloodrequest WHERE status='completed'");
      while(rs.next()) {
          found = true;
  %>
    <tr>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("mobilenumber") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getString("bloodgroup") %></td>
    </tr>
  <%
      }
      if(!found) {
  %>
    <tr>
      <td colspan="4">No completed requests found</td>
    </tr>
  <%
      }
  } catch(Exception e) {
  %>
    <tr>
      <td colspan="4">Error: <%= e %></td>
    </tr>
  <%
  }
  %>
  </table>
</div>

<div class="footer">All Right Reserved @2025</div>

</body>
</html>
