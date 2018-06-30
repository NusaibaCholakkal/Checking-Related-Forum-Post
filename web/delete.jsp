<%-- 
    Document   : delete
    Created on : Dec 1, 2017, 3:45:09 PM
    Author     : DLK 1
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>RelatedForum</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/font.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/structure.css">
<!--[if lt IE 9]>
<script src="assets/js/html5shiv.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div id="preloader">
  <div id="status">&nbsp;</div>
</div>
<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
<header id="header">
  <div class="container">
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header" style="width:1244px;">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="index.html"><span>Finding Related Forum Posts through Content Similarity over Intention-Based Segmentation</span></a> </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav custom_nav">
            <li><a href="admin.jsp">Home</a></li>
            <li><a href="users.jsp">View Users</a></li>
            <li><a href="forums.jsp">View Forums</a></li>
            <li><a href="delete.jsp">Delete</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</header>
<section id="contentbody">
<div class="container">
    <div class="row" style="width:944px;">
       <div class="middlebar_content">
            <h2 style="background-color: #7dc34d;">View Users</h2>
            <br><br><br><center>
            <%
        try{
        //Dis=no
        

//if(Fin.equals("yes")){
   // System.out.println(Fin);
    %>
  <table id="pro_display_table" border="0" cellspacing="1px"  style="border: 4px solid #FB9217; width:930px; height: auto;">
                                 <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
         <tr>  
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;&nbsp;Id</strong></b></td>
                                    <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&nbsp;Forum Post</strong></b></td>                                  
                                   <td align="center" style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;Delete</strong>&emsp;</b></td>
                                    
                                </tr>
         <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
<% 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum", "root", "root");
                        String Query22="select * from forum ";
                        PreparedStatement ps22=con.prepareStatement(Query22);
                        ResultSet rs22=ps22.executeQuery();
                                      while(rs22.next())
                                      {
                                          
                                          
                                          %>
                                <tr>                                  
                                    <td align="center" style="color:#080606;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs22.getString("id")%></td>
                                    <td align="center" style="color:#080606;font-weight: bold;">&emsp;&emsp;<%=rs22.getString("fname")%>&nbsp;&nbsp;</td>
                                    <td>&emsp;&emsp;&nbsp;&nbsp;<a style="color:red;" href="delete1.jsp?id=<%=rs22.getString("id")%>">Delete</a>&emsp;</td>
 <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
                                    <%}%>
              </table>

     <%//}
                                     
   }catch(Exception e){
   System.out.println(e);
   }
   %>    
                  </center> <br><br>      
      </div>
    </div>
  </div>
</section><br><br><br><br><br><br>

<script src="assets/js/jquery.min.js"></script> 
<script src="assets/js/bootstrap.min.js"></script> 
<script src="assets/js/wow.min.js"></script> 
<script src="assets/js/custom.js"></script>
</body>
</html>