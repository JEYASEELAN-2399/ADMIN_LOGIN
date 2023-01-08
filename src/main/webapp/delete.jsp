<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/admin","root","password");
        pst = con.prepareStatement("delete from details where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        <script>
            
            alert("Record Deletee");
            
       </script>
     

<%    
response.sendRedirect("index1.jsp");
%>
