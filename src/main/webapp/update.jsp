<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("uname");
        String Uid = request.getParameter("uid");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/admin","root","password");
        pst = con.prepareStatement("update details set uname= ?,uid= ?,email= ?,password= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, Uid);
        pst.setString(3, email);
        pst.setString(4, password);
        pst.setString(5, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updateddddd");           
       </script>
    <%   
    response.sendRedirect("index1.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title> 
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <h1>user Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/admin","root","password");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from details where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div align="left">
                        <label class="form-label">User_Name</label>
                        <input type="text" class="form-control" placeholder="enter_User_Name" value="<%= rs.getString("uname")%>" name="uname" id="uname" required >
                     </div>
                         
                    <div align="left">
                        <label class="form-label">User_id</label>
                        <input type="text" class="form-control" placeholder="enter_User_id" name="uid" value="<%= rs.getString("uid")%>" id="uid" required >
                     </div>
                         
                     <div align="left">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="enter_Email" name="email" id="email" value="<%= rs.getString("email")%>" required >
                     </div>
                     
                     <div align="left">
                        <label class="form-label">Password</label>
                        <input type="text" class="form-control" placeholder="enter_Password" name="pass" id="pass" value="<%= rs.getString("password")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div align="center">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         
                             
                             
                         </div>
  
                </form>
            </div>       
  
    </body>
</html>
<div align="right">
                             
                             <p><a href="index1.jsp">HOME</a></p>