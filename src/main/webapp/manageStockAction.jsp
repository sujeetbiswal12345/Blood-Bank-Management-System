<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
    String bloodgroup = request.getParameter("bloodgroup");
    String incdec = request.getParameter("incdec");
    String units = request.getParameter("units");

    try {
        int units1 = Integer.parseInt(units);
        if (units1 <= 0) throw new Exception("Units must be positive");

        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();

        int rowsAffected = 0;

        if ("inc".equals(incdec)) {
            rowsAffected = st.executeUpdate(
                "UPDATE stock SET units = units + " + units1 + " WHERE bloodgroup = '" + bloodgroup + "'"
            );
        } else if ("dec".equals(incdec)) {
            rowsAffected = st.executeUpdate(
                "UPDATE stock SET units = CASE WHEN units >= " + units1 + 
                " THEN units - " + units1 + " ELSE units END WHERE bloodgroup = '" + bloodgroup + "'"
            );
        }

        if (rowsAffected > 0) {
            response.sendRedirect("manageStock.jsp?msg=valid");
        } else {
            response.sendRedirect("manageStock.jsp?msg=invalid");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("manageStock.jsp?msg=invalid");
    }
%>
