<%-- 
    Document   : delete1
    Created on : Dec 2, 2017, 12:12:28 PM
    Author     : DLK 1
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum", "root", "root");
PreparedStatement ps=con.prepareStatement("delete from forum where id='"+id+"' ");
ps.executeUpdate();
PreparedStatement ps1=con.prepareStatement("delete from comment where fid='"+id+"' ");
ps1.executeUpdate();
RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.include(request, response); 
%>