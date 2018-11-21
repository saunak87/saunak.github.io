import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
 
/**
* Servlet implementation class Hospice
*/
 
public class Medication extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);
        String n=(String)session.getAttribute("user");
        try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
        String sql = "SELECT * from MedicalInfo where user='"+ n+"';";
       
        
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = (ResultSet) pst.executeQuery(); 
        while(rs.next()){
           String firstName = rs.getString("FirstName");
            request.setAttribute("FirstName",firstName);
            

            //descripton
            String lastName = rs.getString("LastName");
            request.setAttribute("LastName",lastName);

            //images
            String medications = rs.getString("Medications");
            request.setAttribute("Medications",medications);
            
            String surgeries = rs.getString("Surgeries");
            request.setAttribute("Surgeries", surgeries);
            
            String primarycaremanager = rs.getString("PrimaryCareManager");
            request.setAttribute("PrimaryCareManager", primarycaremanager);
            
            String allergies = rs.getString("Allergies");
            request.setAttribute("Allergies", allergies);


       request.getRequestDispatcher("/medical.jsp").forward(request, response);
       
        }
        }
       catch (SQLException ex) {
            Logger.getLogger(personalInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            out.close();
        }
    }
}       