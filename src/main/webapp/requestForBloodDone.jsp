<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
    String mobilenum = request.getParameter("mobilenumber");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE bloodrequest SET status='completed' WHERE mobilenumber=?"
        );
        ps.setString(1, mobilenum);

        int updated = ps.executeUpdate();

        if (updated > 0) {
            response.sendRedirect("requestPending.jsp?msg=valid");
        } else {
            response.sendRedirect("requestPending.jsp?msg=invalid");
        }
    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("requestPending.jsp?msg=error");
    }
%>
