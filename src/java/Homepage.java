import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
 
/**
* Servlet implementation class Hospice
*/
 
public class Homepage extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);
        String n=(String)session.getAttribute("user");
        try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
        String sql = "SELECT * from javademo.PatientInfo where user='"+ n+"';";
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = (ResultSet) pst.executeQuery(); 
        while(rs.next()){
            //name
            String firstName = rs.getString("FirstName");
            request.setAttribute("FirstName",firstName);
            

            //descripton
            String lastName = rs.getString("LastName");
            request.setAttribute("LastName",lastName);
            
            String Appointment = rs.getString("Appointment");
            request.setAttribute("Appointment",Appointment);

       request.getRequestDispatcher("mainpage.jsp").forward(request, response);
       
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