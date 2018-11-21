<%-- 
    Document   : index
    Created on : Apr 29, 2018, 9:09:57 PM
    Author     : saunak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"  type="text/css" href="Styling/loginPagecss.css"/>
        <title>Login form</title>
    </head>
    <body class="back">
        <p class="heading"> Welcome to EHR Portal. Please Enter Your User Id and Password to login</p>
        <form class="form-3" method="post" action="Hospice"> 
            <p class="clearfix">
                <label for="login">Username</label><input type="text" name="user" id="login" placeholder="Username" />
               
            </p>
        <p class="clearfix">
            <label for="password">Password</label>
            <input type="password" name="pass" id="password" placeholder="Password"/>
            </p>
            <p class="clearfix">
        <input type="checkbox" name="remember" id="remember">
        <label for="remember">Remember me</label>
        </p>
        <p class="clearfix">
        <input type="submit" name="submit" value="Login" >
        </p>
        
        <%
        String login_msg=(String)request.getAttribute("error");  
        if(login_msg!=null)
        out.println("<font color=red size=4px>"+login_msg+"</font>");
        %>
    
        
        
        </form>
       
        </body>
    </html>
