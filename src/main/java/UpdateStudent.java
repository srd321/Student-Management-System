import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateStudent extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int roll = Integer.parseInt(req.getParameter("roll"));
	String name = req.getParameter("name");
	int age = Integer.parseInt(req.getParameter("age"));
	String gender = req.getParameter("gender");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_app?user=root&password=root");
		String sql ="UPDATE student SET name=?,age=?,gender=?, where roll=?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, roll);
		ps.setString(2, name);
		ps.setInt(3, age);
		ps.setString(4, gender);
		
		ps.execute();
		con.close();
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	RequestDispatcher rd = req.getRequestDispatcher("view.jsp");
	rd.forward(req, resp);
}

}
