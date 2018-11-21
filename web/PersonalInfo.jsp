<%-- 
    Document   : Personal Info
    Created on : Apr 28, 2018, 9:58:41 AM
    Author     : saunak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Info</title>
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

        <div id = "personal" class="info">  
            <form name="myForm"  action="personalInfo">
                <label for="fname">First Name:</label>
                <input type="text" name="firstname" value="${FirstName}" id="fname" disabled/><br>
                <label for="lname">Last Name:</label>
                <input type="text" name="lastname" value="${LastName}" id="lname" disabled/><br>
                <label for="phone">Phone no:</label>
                <input type="text" name="add"  value="${Phoneno}"  id="phone" disabled/><br>
                <label for="em">E-mail:</label>
                <input type="text" name="phoneno" value = "${email}" id="em" disabled/><br>
                <label for="add">Address:</label>
                <input type="text" name="add"  value="${Address}"  id="add" disabled/><br>
                <label for="ct">City:</label>
                <input type="text" name="add"  value="${city}"  id="ct" disabled/><br>
                <label for="st">State:</label>
                <input type="text" name="add"  value="${state}"  id="st" disabled/><br>
                <label for="zip">Zip Code:</label>
                <input type="text" name="add"  value="${zipcode}"  id="zip" disabled/><br>

            </form>
                <!-- Trigger/Open The Modal -->
        <button id="myBtn">Update your info</button>
        </div>


        <div id="myModal" class="modal">

            <div class="modal-content">
                <form name="editInfo" action="popupform" method="POST">
                    <table>
                        <tr><td><label for="phoneno">Phone Number:</label></td>
                            <td><input type="text" name="phoneno" value = "${Phoneno}" id="phoneno" maxlength="10"/></td></tr>
                        <tr><td><label for="em">E-mail:</label></td>
                            <td><input type="text" name="email"  value="${email}"  id="em" maxlength="45"/><br></td></tr>
                        <tr><td><label for="address">Address:</label></td>
                            <td><input type="text" name="add"  value="${Address}"  id="address" maxlength="45" /></td></tr>
                        <tr><td><label for="ct">City:</label></td>
                            <td><input type="text" name="city"  value="${city}"  id="ct" maxlength="45" /></td></tr>
                        <tr><td><label for="st">State:</label></td>
                            <td><input type="text" name="state"  value="${state}"  id="st" maxlength="2"/></td></tr>
                        <tr><td><label for="zip">Zip Code:</label></td>
                            <td><input type="text" name="zipcode"  value="${zipcode}"  id="zip" maxlength="5" /></td></tr>
                        <tr><td><input type ="submit" name="submitform" value="Submit"/></td>
                            <td><input class="close" type ="Button" name="can" value="Cancel"/></td></tr>
                    </table>


                </form>
            </div>
        </div>






        <script>
            // Get the modal
            var modal = document.getElementById('myModal');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            };

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            };

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        </script>


    </body>
</html>
