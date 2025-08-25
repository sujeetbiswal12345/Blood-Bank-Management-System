<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.io.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM admin WHERE username=? AND password=?"
    );
    ps.setString(1, username);
    ps.setString(2, password);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("role", "admin");
        session.setAttribute("username", username);
        response.sendRedirect("home.jsp");
    } else {
        response.sendRedirect("adminLogin.jsp?msg=invalid");
    }

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
