import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
 
/**
* Servlet implementation class Hospice
*/
 
public class Hospice extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uName = request.getParameter("user");
        String pass = request.getParameter("pass");
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        
        String correct = request.getParameter("credential");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
            PreparedStatement pst = conn.prepareStatement("Select user,pass,fName, lName from login where user=? and pass=? ");
            pst.setString(1, uName);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                out.println("Correct login credentials. Redirecting to next page");
                System.out.println("test");
                HttpSession session=request.getSession();  
                session.setAttribute("user",uName);
                request.getRequestDispatcher("/Homepage") .forward(request, response);
             }
            else {
               request.setAttribute("error","Invalid Username or Password");
                RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");            
                rd.include(request, response);;
            }
        }
        catch (ClassNotFoundException | SQLException e) {
        }finally{
            out.close();
        }
    
    }
}