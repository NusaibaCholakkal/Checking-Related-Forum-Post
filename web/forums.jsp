<%-- 
    Document   : forums
    Created on : Dec 1, 2017, 3:45:03 PM
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
            <h2 style="background-color: #7dc34d;">View Forums</h2>
            <br><br><br>
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum", "root", "root");
            String Query22="select * from forum ";
            PreparedStatement ps22=con.prepareStatement(Query22);
            ResultSet rs22=ps22.executeQuery();
            int i=0;
            String id="";
            while(rs22.next())
            {                 
                id=rs22.getString("id");
                i=i+1;
            PreparedStatement ps=con.prepareStatement("select * from comment where fid='"+id+"' ");
            ResultSet rs=ps.executeQuery();
            int j=0;
            while(rs.next())
            {
                j=j+1;
            }
            %>
            <h2 style="color:black;font-size: 17px;"><%=i%>) <%=rs22.getString("fname")%>?
                <br><img style="width:50px;height: 50px;" src="forum/<%=rs22.getString("img")%>">&emsp;<span style="color:blue;font-size:14px;"><%=rs22.getString("des")%></span><br><span style="color:#e91e63;">&emsp;Author: <%=rs22.getString("uname")%>&emsp;&emsp;<i class="fa fa-users" aria-hidden="true"></i>&emsp;Category : <%=rs22.getString("cate")%>&emsp;&emsp;<i class="fa fa-comments-o" aria-hidden="true"></i>&emsp;<%=j%>&emsp;Comments</span></h2>
                <br>
            <%
            }
            %>
            <br><br>      
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