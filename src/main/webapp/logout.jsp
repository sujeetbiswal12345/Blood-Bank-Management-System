		<%
		  session.invalidate();
		  response.sendRedirect("index.jsp?msg=Logged+out");
		%>
