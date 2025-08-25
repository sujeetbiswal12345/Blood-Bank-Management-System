<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String mobilenum = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("DELETE FROM bloodrequest WHERE mobilenumber=?");
    ps.setString(1, mobilenum);
    int n = ps.executeUpdate();
    response.sendRedirect("requestPending.jsp" + (n>0 ? "?msg=deleted" : "?msg=invalid"));
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("requestPending.jsp?msg=invalid");
}
%>
