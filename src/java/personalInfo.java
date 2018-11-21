import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
 
/**
* Servlet implementation class Hospice
*/
 
public class personalInfo extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);
        String n=(String)session.getAttribute("user");
        try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
        String sql = "SELECT * from PatientInfo where user='"+ n+"';";
       
        
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = (ResultSet) pst.executeQuery(); 
        while(rs.next()){
            //name
            String firstName = rs.getString("FirstName");
            request.setAttribute("FirstName",firstName);
            

            //descripton
            String lastName = rs.getString("LastName");
            request.setAttribute("LastName",lastName);

            //images
            String phoneno = rs.getString("Phoneno");
            request.setAttribute("Phoneno",phoneno);
            
            String add = rs.getString("Address");
            request.setAttribute("Address", add);
            
            String em = rs.getString("email");
            request.setAttribute("email", em);
            
            String ct = rs.getString("city");
            request.setAttribute("city", ct);
            
            String st = rs.getString("state");
            request.setAttribute("state", st);
            
            String zip = rs.getString("zipcode");
            request.setAttribute("zipcode", zip);
            
            


       request.getRequestDispatcher("/PersonalInfo.jsp").forward(request, response);
       
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