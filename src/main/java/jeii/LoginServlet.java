package jeii;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				PrintWriter out=response.getWriter();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","password");
				String n=request.getParameter("uname");
				String p=request.getParameter("password");
				PreparedStatement ps=con.prepareStatement("select uname from users where uname=? and password=?");
				ps.setString(1,n);
				ps.setString(2,p);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					
					RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
					rd.forward(request, response);
				}
				else {
					response.sendRedirect("index.jsp");
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		      catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}