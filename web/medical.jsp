<%-- 
    Document   : medical
    Created on : Apr 28, 2018, 9:58:41 AM
    Author     : saunak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medical</title>
        <link rel="stylesheet"  type="text/css" href="Styling/mainpage.css"/>
    </head>
    <body>
        <form method="post">
            <button class="tablink" type='submit' formaction ='Homepage'> Home</button>
        </form>
        <form>
            <button class="tablink" type='submit' formaction ='personalInfo'>Personal Info</button>
            <button class="tablink" type='submit' formaction ='Medication'>Medical</button>
        </form>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <input class="tablink" type="submit" value="Logout" />
        </form>
            
            <div id="medi" class="info">
        <form name="myForm1" method="get" action="Medication">
            <label for="fname">First Name: </label>
            <input type="text" name="firstname" value="${FirstName}" id="fname" disabled/><br>
            <label for="lname">Last Name: </label>
            <input type="text" name="lastname" value="${LastName}" id="lname" disabled/><br>
            <label for="medications">Medications: </label>
            <input type="text" name="medications" value = "${Medications}" id="medications" disabled/><br>
            <label for="surgeries">Surgeries: </label>
            <input type="text" name="surgeries"  value="${Surgeries}"  id="surgeries" disabled/><br>
            <label for="primarycaremanager">Primary Care Manager: </label>
            <input type="text" name="primarycaremanager"  value="${PrimaryCareManager}"  id="primarycaremanager" disabled/><br>
            <label for="allergies">Allergies: </label>
            <input type="text" name="allergies"  value="${Allergies}"  id="allergies" disabled/><br>
        </form>
            </div>
        

    </body>
</html>
