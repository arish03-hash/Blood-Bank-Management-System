<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String mobileNumber=request.getParameter("mobileNumber");
String email=request.getParameter("email");
String address=request.getParameter("address");

try{
	Connection con = ConnectionProvider.getCon();
	String q = "update donor set name=?,father=?,mother=?,mobileNumber=?,email=?,address=? where id=?";
	PreparedStatement ps = con.prepareStatement(q);
	ps.setString(1,name);
	ps.setString(2,father);
	ps.setString(3,mother);
	ps.setString(4,mobileNumber);
	ps.setString(5,email);
	ps.setString(6,address);
	ps.setString(7,id);
	ps.executeUpdate();
	response.sendRedirect("editDeleteList.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("editDeleteList.jsp?msg=invalid");
}
%>