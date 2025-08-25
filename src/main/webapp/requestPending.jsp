<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>

<html>
<head>
<meta charset="utf-8">
<style>
html, body {
  height: 100%;
  margin: 0;
  display: flex;
  flex-direction: column;
}
.content {
  flex: 1; /* pushes footer down */
}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}
#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
#customers tr:nth-child(even){ background-color: #f9f9f9; }
#customers tr:hover { background-color: #f1f1f1; }
#customers th {
  padding: 12px;
  background-color: #4CAF50;
  color: white;
}

/* ✅ Footer styling */
.footer {
  padding: 15px 0;
  background: #333;
  color: white;
  text-align: center;
  font-size: 14px;
  width: 100%;
  border-top: 3px solid #4CAF50;
}
</style>
</head>
<body>
<div class="content">
<br>
<center>
<h2>Pending Blood Requests</h2>
<table id="customers">
<tr>
  <th>Name</th>
  <th>Mobile Number</th>
  <th>Email</th>
  <th>Blood Group</th>
  <th>Done</th>
  <th>Delete</th>
</tr>
<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM bloodrequest WHERE status='pending'");
    boolean found = false;
    while (rs.next()) {
        found = true;
%>
<tr>
  <td><%= rs.getString("name") %></td>
  <td><%= rs.getString("mobilenumber") %></td>
  <td><%= rs.getString("email") %></td>
  <td><%= rs.getString("bloodgroup") %></td>
  <td><a href="requestForBloodDone.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Done</a></td>
  <td><a href="requestForBloodDelete.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Delete</a></td>
</tr>
<%  }
   if(!found) { %>
   <tr><td colspan="6">No pending requests found</td></tr>
<% } 
} catch(Exception e) {
    out.println("<tr><td colspan='6'>Error: "+e+"</td></tr>");
}
%>
</table>
</center>
</div>

<div class="footer">
  All Right Reserved @2025
</div>

</body>
</html>
