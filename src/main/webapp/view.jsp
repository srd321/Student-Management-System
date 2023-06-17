
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="navbar.jsp" %>
	
	<%
	try {
		   Class.forName("com.mysql.cj.jdbc.Driver") ;
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_app", "root", "root");
			String sql = "SELECT * FROM student" ;
			PreparedStatement ps = con.prepareStatement(sql) ;
			ResultSet rs = ps.executeQuery();%>
			
			<table border="2px" >
			<tr>
				<th>ROLL</th>
				<th>NAME</th>
				<th>AGE</th>
				<th>GENDER</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>
			
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%= rs.getInt(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getInt(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><a href=edit.jsp?roll=<%= rs.getInt(1)%>   >edit</a></td>
					<td><a href=delete?roll=<%= rs.getInt(1)%> >delete</a></td>
				</tr>
			<% 
				}
			%>
			</table>
		<% 	con.close() ;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
</body>
</body>
</html>