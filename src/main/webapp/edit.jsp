<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   <%
     String roll =request.getParameter("roll");
   try {
	   Class.forName("com.mysql.cj.jdbc.Driver") ;
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_app", "root", "root");
		String sql = "SELECT * FROM student WHERE roll ="+roll ;
		PreparedStatement ps = con.prepareStatement(sql) ;
		ResultSet rs = ps.executeQuery();
		rs.next();
	%>
    <form action="update">
     ROLL : <input type="text" name="roll" value="<%=rs.getInt(1) %>" readonly ><br>
     NAME : <input type="text" name="name" value="<%=rs.getString(2) %>"> <br>
     AGE : <input type="text" name="age" value="<%=rs.getInt(3) %>"><br>
     GENDER : <input type="text" name="gender" value="<%=rs.getString(4) %>"><br>
             <input type="submit" value="update">
     </form>
	<% con.close();
		
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   %>

</body>
</html>