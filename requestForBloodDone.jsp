<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String mobileNumber=request.getParameter("mobileNumber");
try{
	Connection con= ConnectionProvider.getCon();
	String q= "update bloodrequest set status='completed' where mobileNumber=?";
	PreparedStatement ps = con.prepareStatement(q);
	ps.setString(1,mobileNumber);
	ps.executeUpdate();
	response.sendRedirect("requestCompleted.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("requestForBlood.jsp?msg=invalid");
}
%>