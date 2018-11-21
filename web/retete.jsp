<%-- 
    Document   : retete
    Created on : Apr 28, 2018, 9:58:41 AM
    Author     : saunak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="myForm" method="get" action="personalInfo">
  <label for="fname">First Name:</label>
  <input type="text" name="firstname" value="${FirstName}" id="fname" disabled/><br>
  <label for="lname">Last Name:</label>
  <input type="text" name="lastname" value="${LastName}" id="lname" disabled/><br>
  <label for="gender">Gender:</label>
  <input type="text" name="phoneno" value = "${Phoneno}" id="gender" disabled/><br>
  <label for="phone1">Phone 1:</label>
  <input type="text" name="add"  value="${Address}"  id="phone1" disabled/><br>
        
        </form>
        
        
    </body>
</html>
