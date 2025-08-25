<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Donor Records</title>
<style>
html, body {
  height: 100%;
  margin: 0;
  display: flex;
  flex-direction: column;
  font-family: Arial, sans-serif;
}


.main-content {
  flex: 1;
  padding-bottom: 20px;
}

#customers {
  border-collapse: collapse;
  width: 95%;
  margin: 20px auto;
}
#customers th, #customers td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
#customers th {
  background-color: #4CAF50;
  color: white;
}

.footer {
  padding: 15px;
  background: #333;
  color: white;
  text-align: center;
  font-size: 14px;
}
</style>
</head>
<body>

<div class="main-content">
  <h2 style="text-align:center;">Donor Records</h2>
  <center>
    <table id="customers">
      <tr>
        <th>ID</th><th>Name</th><th>Father</th><th>Mother</th>
        <th>Mobile</th><th>Gender</th><th>Email</th>
        <th>Blood Group</th><th>Address</th>
        <th>Edit</th><th>Delete</th>
      </tr>
      <%
      try {
          Connection con = ConnectionProvider.getCon();
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("SELECT * FROM donor");
          while(rs.next()) {
      %>
      <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(9) %></td>
        <td><a href="updateDonor.jsp?id=<%= rs.getInt(1) %>">Edit</a></td>
        <td><a href="deleteDonor.jsp?id=<%= rs.getInt(1) %>">Delete</a></td>
      </tr>
      <%
          }
      } catch(Exception e) {
          out.println("<tr><td colspan='11'>Error: "+e+"</td></tr>");
      }
      %>
    </table>
  </center>
</div>

<div class="footer">All Right Reserved @2025</div>

</body>
</html>
