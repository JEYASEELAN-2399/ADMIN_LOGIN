<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>login_page</title>
</head>
<body>
        <h1>Admin_Login</h1>
    <div class="form">
        <h3>Log in</h3>
        <form action="Login" method="post">
      
            <div class="input">
                <label class="lb" for="uname">User Name</label>
        
                <input type="text" id="uname" name="uname" required ="required">  
            </div>
          
            <div class="input">
       
                <label class="lb" for="password">Password</label>
              
                <input type="password" id="password" name="password" required ="required">
            </div>
            
            <div class="button">
                <button type="submit" value="">login</button>
            </div>
        </form>

    </div>

</body>
</html>