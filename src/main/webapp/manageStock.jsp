<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="style.css?v=20250824">
  <style>
    html, body {
      height: 100%;
      margin: 0;
      display: flex;
      flex-direction: column;
    }
    .container-flex {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin: 30px auto;
      width: 90%;
      gap: 40px;
      flex: 1; /* push footer down */
    }
    .form-box, .table-box {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.15);
      flex: 1;
    }
    .form-box h2 {
      margin-bottom: 8px;
      font-size: 18px;
      color: #333;
    }
    .form-box select, 
    .form-box input {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    .form-box button {
      background: #4CAF50;
      color: white;
      padding: 10px 18px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    .form-box button:hover { background: #45a049; }

    #customers {
      width: 100%;
      border-collapse: collapse;
    }
    #customers th, #customers td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }
    #customers th {
      background: #4CAF50;
      color: white;
    }
    #customers tr:nth-child(even) { background: #f9f9f9; }
    #customers tr:hover { background: #f1f1f1; }

    /* ✅ Footer style */
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
<div class="container-flex">
  <div class="form-box">
    <%
      String msg = request.getParameter("msg");
      if("invalid".equals(msg)) { %>
        <div style="color:red;">Something went wrong! Try again!</div>
    <% } else if("valid".equals(msg)) { %>
        <div style="color:green;">Successfully Updated</div>
    <% } %>

    <form action="manageStockAction.jsp" method="post">
      <h2>Select Blood Group</h2>
      <select name="bloodgroup">
        <option value="A+">A+</option><option value="A-">A-</option>
        <option value="B+">B+</option><option value="B-">B-</option>
        <option value="O+">O+</option><option value="O-">O-</option>
        <option value="AB+">AB+</option><option value="AB-">AB-</option>
      </select>

      <h2>Increase / Decrease</h2>
      <select name="incdec">
        <option value="inc">Increase</option>
        <option value="dec">Decrease</option>
      </select>

      <h2>Units</h2>
      <input type="number" min="1" name="units" required>

      <button type="submit">Save</button>
    </form>
  </div>

  <!-- Right: Stock Table -->
  <div class="table-box">
    <center><h2>Available Stock</h2></center>
    <table id="customers">
      <tr><th>Blood Group</th><th>Units</th></tr>
      <%
      try {
          Connection con = ConnectionProvider.getCon();
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("SELECT * FROM stock");
          while(rs.next()) {
              String bg = rs.getString("bloodgroup");
              int u = rs.getInt("units");
      %>
      <tr <%= (u==0) ? "style='background:#fdd;'" : "" %>>
        <td><%= bg %></td>
        <td><%= u %></td>
      </tr>
      <%
          }
      } catch(Exception e) {
          e.printStackTrace();
      }
      %>
    </table>
  </div>

</div>

<div class="footer">
  All Right Reserved @2025
</div>

</body>
</html>
