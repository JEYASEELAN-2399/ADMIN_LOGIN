<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("uname");
        String Uid = request.getParameter("uid");
        String  email= request.getParameter("email");
        String password = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/admin","root","password");
        pst = con.prepareStatement("insert into details(uname,uid,email,password)values(?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, Uid);
        pst.setString(3, email);
        pst.setString(4, password);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Adddeddddd");     
    </script> 
    <% 
    
    }
   %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin_Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Users_Details </h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="index1.jsp" > 
                    
                    <div align="left">
                        <label class="form-label">User Name</label>
                        <input align="center" type="text" class="form-control" placeholder="enter user_name" name="uname" id="uname" required >
                     </div>
                         
                    <div align="left">
                        <label class="form-label">User id</label>
                        <input align="center" type="text" class="form-control" placeholder="enter user_id" name="uid" id="uid" required >
                     </div>
                         
                     <div align="left">
                        <label class="form-label">Email</label>
                        <input align="center" type="email" class="form-control" placeholder="enter email_id" name="email" id="email" required >
                     </div>
                     
                     <div align="left">
                        <label class="form-label">Password</label>
                        <input align="center" type="text" class="form-control" placeholder="enter password" name="pass" id="pass" required >
                     </div>
                         </br>
                         
                     <div align="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>User Name</th>
                                    <th>User id</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/admin","root","password");
                                
                                  String query = "select * from details";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("uname") %></td>
                                 <td><%=rs.getString("uid") %></td>
                                 <td><%=rs.getString("email") %></td>
                                 <td><%=rs.getString("password") %></td>
                                <td><a href="update.jsp?id=<%=id%>"><button class="btn btn-info"> Edit</button></a></td>
                                 <td><a href="delete.jsp?id=<%=id%>"><button class="btn btn-warning">Delete</button></a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  
        </div>

    </body>
</html>