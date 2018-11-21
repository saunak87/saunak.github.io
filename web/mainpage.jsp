<!DOCTYPE html>
<html>
<head>
    <title>My EHR</title>
    <link rel="stylesheet"  type="text/css" href="Styling/mainpage.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
            
            &nbsp;
            Welcome  ${FirstName} ${LastName} !
            <br>
            <br>
            <br>
            <br>
            <br>
            <p>
                &nbsp; Next Appointment
            ${Appointment}
            </p>
            <div class="midbox">
                <p>Electronic health records are the future. <br><br>That's right. Many hospitals and doctors offices have already implemented electronic health records (EHRs) 
                    <br>into their administrative systems. EHRs go beyond standard clinical data collected in a provider?s office and can offer a broader view of your care:

                    <br>Syncs your health history, diagnoses, medicines, treatment plans, immunization dates, allergies, radiology images, and lab and test results within an online portal
Allows all your doctors to access your record, making it easier for them to share information and coordinate your care
Helps you create a personal, secure account to review all of your health information
Gives providers evidence-based tools to help them make smarter decisions about your care
         </p>
       
        
        
    </div>   
    </body>
</html>