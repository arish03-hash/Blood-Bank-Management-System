<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String mobileNumber=request.getParameter("mobileNumber");
try{
	Connection con= ConnectionProvider.getCon();
	String q= "delete from bloodrequest where mobileNumber='"+mobileNumber+"'";
	Statement st = con.createStatement();
	st.executeUpdate(q);
	response.sendRedirect("requestForBlood.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("requestForBlood.jsp?msg=invalid");
}
%>