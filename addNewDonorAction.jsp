<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String mobileNumber=request.getParameter("mobileNumber");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String bloodGroup=request.getParameter("bloodGroup");
String address=request.getParameter("address");

try{
	Connection con = ConnectionProvider.getCon();
	String q="insert into donor values(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(q);
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,father);
	ps.setString(4,mother);
	ps.setString(5,mobileNumber);
	ps.setString(6,gender);
	ps.setString(7,email);
	ps.setString(8,bloodGroup);
	ps.setString(9,address);
	ps.executeUpdate();
	response.sendRedirect("addNewDonor.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("addNewDonor.jsp?msg=invalid");
}
%>