<%-- 
    Document   : comm
    Created on : Dec 1, 2017, 8:41:31 PM
    Author     : DLK 1
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fid,comm,uname,email;
    fid=request.getParameter("id");
    comm=request.getParameter("comment");
    uname=request.getParameter("uname");
    email=request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum","root","root");
    PreparedStatement pss = con.prepareStatement("insert into comment (fid,comm,uname,email) values ('"+fid+"','"+comm+"','"+uname+"','"+email+"')");
    pss.executeUpdate();
    out.println("<script>"
            +"alert('Comment Posted..')"
            +"</script>");            
RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
rd.include(request, response);   
%>