<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String id = request.getParameter("id");
String name = "";
String father = "";
String mother = "";
String mobilenumber = "";
String gender = "";
String email = "";
String bloodgroup = "";
String address = "";

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM donor WHERE id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        father = rs.getString("father");
        mother = rs.getString("mother");
        mobilenumber = rs.getString("mobilenumber");
        gender = rs.getString("gender");
        email = rs.getString("email");
        bloodgroup = rs.getString("bloodgroup");
        address = rs.getString("address");
    }
} catch(Exception e) {
    out.println("Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Donor</title>
  <link rel="stylesheet" href="style.css">
  <style>
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
    .form-group {
      margin-bottom: 18px;
    }
    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 6px;
    }
    .form-group input, 
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }
    .form-group textarea {
      min-height: 80px; /* smaller but resizable */
      resize: vertical;
    }
    .form-actions {
      text-align: center;
      margin-top: 20px;
    }
    .btn {
      background: #4CAF50;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      margin: 0 10px;
    }
    .btn:hover {
      background: #45a049;
    }
    .btn.cancel {
      background: #f44336;
    }
    .btn.cancel:hover {
      background: #d32f2f;
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

<div class="container">
  <h2>Update Donor Details</h2>
  <form action="updateDonorAction.jsp" method="post">
    
    <input type="hidden" name="id" value="<%=id%>">
    
    <div class="form-group">
      <label>Name</label>
      <input type="text" name="name" value="<%=name%>" required>
    </div>

    <div class="form-group">
      <label>Father Name</label>
      <input type="text" name="father" value="<%=father%>" required>
    </div>

    <div class="form-group">
      <label>Mother Name</label>
      <input type="text" name="mother" value="<%=mother%>" required>
    </div>

    <div class="form-group">
      <label>Mobile Number</label>
      <input type="text" name="mobilenumber" value="<%=mobilenumber%>" required>
    </div>

    <div class="form-group">
      <label>Gender</label>
      <select name="gender" required>
        <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
        <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
        <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
      </select>
    </div>

    <div class="form-group">
      <label>Email</label>
      <input type="email" name="email" value="<%=email%>" required>
    </div>

    <div class="form-group">
      <label>Blood Group</label>
      <select name="bloodgroup" required>
        <option value="A+" <%= "A+".equals(bloodgroup) ? "selected" : "" %>>A+</option>
        <option value="A-" <%= "A-".equals(bloodgroup) ? "selected" : "" %>>A-</option>
        <option value="B+" <%= "B+".equals(bloodgroup) ? "selected" : "" %>>B+</option>
        <option value="B-" <%= "B-".equals(bloodgroup) ? "selected" : "" %>>B-</option>
        <option value="O+" <%= "O+".equals(bloodgroup) ? "selected" : "" %>>O+</option>
        <option value="O-" <%= "O-".equals(bloodgroup) ? "selected" : "" %>>O-</option>
        <option value="AB+" <%= "AB+".equals(bloodgroup) ? "selected" : "" %>>AB+</option>
        <option value="AB-" <%= "AB-".equals(bloodgroup) ? "selected" : "" %>>AB-</option>
      </select>
    </div>

    <div class="form-group">
      <label>Address</label>
      <textarea name="address"><%=address%></textarea>
    </div>

    <div class="form-actions">
      <button type="submit" class="btn">Update</button>
      <a href="editDeleteList.jsp" class="btn cancel">Cancel</a>
    </div>
  </form>
</div>

<div class="footer">
  All Right Reserved @2025
</div>

</body>
</html>
