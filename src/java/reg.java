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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DLK 1
 */
public class reg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String name,pass,gender,mobile,email,location;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        {
            try {
                name=request.getParameter("name");
                pass=request.getParameter("pass");
                gender=request.getParameter("gender");
                mobile=request.getParameter("mobile");
                email=request.getParameter("email");
                location=request.getParameter("location");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum","root","root");
                PreparedStatement pss = con.prepareStatement("insert into user_reg (name,email,phonenumber,password,address,gender) values ('"+name+"','"+email+"','"+mobile+"','"+pass+"','"+location+"','"+gender+"')");
                pss.executeUpdate();
                out.println("<script>"
                        +"alert('Registration Process Completed')"
                        +"</script>");            
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.include(request, response);   
            } 
            catch (Exception ex) 
            {
            System.out.println("catch block");
            System.out.println(ex);
             out.println("<script>"
                        +"alert('Check Your Database Connections')"
                        +"</script>");              
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.include(request, response); 
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
