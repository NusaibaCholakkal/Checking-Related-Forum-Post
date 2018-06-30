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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DLK 1
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String name,pass;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        {
            try {
                name=request.getParameter("name");
                pass=request.getParameter("pass");
                HttpSession session = request.getSession();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum","root","root");
                PreparedStatement pss = con.prepareStatement("select * from admin where name='"+name+"' and password='"+pass+"' ");
                ResultSet rs = pss.executeQuery();
                PreparedStatement pss1 = con.prepareStatement("select * from user_reg where name='"+name+"' and password='"+pass+"' ");
                ResultSet rs1 = pss1.executeQuery();
                if(rs.next())
                {
                out.println("<script>"
                        +"alert('Welcome Admin')"
                        +"</script>");            
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.include(request, response);  
                }
                else if(rs1.next())
                {
                session.setAttribute("name", name);
                session.setAttribute("pass", pass);
                out.println("<script>"
                        +"alert('Welcome User')"
                        +"</script>");            
                RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
                rd.include(request, response);  
                }
                else
                {
                out.println("<script>"
                        +"alert('Invalid Username & Password')"
                        +"</script>");            
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response); 
                }
            } 
            catch (Exception ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
                
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
