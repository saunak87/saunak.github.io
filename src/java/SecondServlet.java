import java.io.*;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.*;  
import javax.servlet.http.*;  
  
public class SecondServlet extends HttpServlet {  
  
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) { 
        try{  
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
            //PreparedStatement pst = conn.prepareStatement("Select user,pass,fName, lName from login where user=? and pass=? ");
  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
          
        HttpSession session=request.getSession(false);  
        String n=(String)session.getAttribute("user"); 
        String query = 
                "SELECT * FROM login where user='"+ n+"';";
        
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        while(rs.next())
        {
            String fName = rs.getString("fName");
            String lName = rs.getString("lName");
            out.println("Welcome "+ fName + " " + lName);
        }
        out.close();  
  
                }catch(IOException | ClassNotFoundException | SQLException e){System.out.println(e);}  
    }
}
      
  
