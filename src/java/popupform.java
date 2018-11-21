/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author saunak
 */
public class popupform extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String phoneno = request.getParameter("phoneno");
        String email = request.getParameter("email");
        String add = request.getParameter("add");
        
        String ct = request.getParameter("city");
        String st = request.getParameter("state");
        String zip = request.getParameter("zipcode");
        HttpSession session = request.getSession(false);
        String n = (String) session.getAttribute("user");
        System.out.println("test");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo", "root", "1Saunak2");
            PreparedStatement ps = conn.prepareStatement("update javademo.PatientInfo set Phoneno=?,email=?,Address=?,City=?, State=?, Zipcode=? where user='" + n + "';");
                ps.setString(1,phoneno);
                ps.setString(2, email);
                ps.setString(3, add);
                ps.setString(4, ct);
                ps.setString(5, st);
                ps.setString(6, zip);
                
                int i = ps.executeUpdate();
                
                
                conn.close();

                
            } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(popupform.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("personalInfo");
        } 

}


