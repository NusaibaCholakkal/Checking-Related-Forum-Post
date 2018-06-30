<%-- 
    Document   : admin
    Created on : Dec 1, 2017, 3:19:27 PM
    Author     : DLK 1
--%>

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
    <div class="row">
      <div class=" col-sm-12 col-md-6 col-lg-6">
        <div class="row">
          <div class="leftbar_content">
            <h2 style="color: white;">Abstract</h2>
            <div class="single_stuff wow fadeInDown">
                <center>
                <img style="width: 60%;" src="images/archi.jpg">
                </center><br>
                <p style="text-align: justify;">
                We study the problem of finding related forum posts to a post at hand. In contrast to traditional approaches for finding related documents that perform content comparisons across the content of the posts as a whole, we consider each post as a set of segments, each written with a different goal in mind. We advocate that the relatedness between two posts should be based on the similarity of their respective segments that are intended for the same goal, i.e., are conveying the same intention. This means that it is possible for the same terms to weigh differently in the relatedness score depending on the intention of the segment in which they are found. We have developed a segmentation method that by monitoring a number of text features can identify the parts of a post where significant jumps occur indicating a point where a segmentation should take place. The generated segments of all the posts are clustered to form intention clusters and then similarities across the posts are calculated through similarities across segments with the same intention. We experimentally illustrate the effectiveness and efficiency of our segmentation method and our overall approach of finding related forum posts.
                </p>
            </div>     
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-2 col-lg-2">
        <div class="row">
          <div class="middlebar_content">
            <h2 style="background-color: #7dc34d;">What's Hot</h2>
            <div class="middlebar_content_inner wow fadeInUp">
              <ul class="middlebar_nav">
                <li> <a class="mbar_thubnail" href="#"><img src="images/hot_img1.jpg" alt=""></a> <a class="mbar_title" href="#">Politics Related Forums</a> </li>
                <li> <a class="mbar_thubnail" href="#"><img src="images/hot_img2.jpg" alt=""></a> <a class="mbar_title" href="#">Terrace Gardening Related Forums</a> </li>
                <li> <a class="mbar_thubnail" href="#"><img src="images/hot_img3.jpg" alt=""></a> <a class="mbar_title" href="#">Business Related Forums</a> </li>
                <li> <a class="mbar_thubnail" href="#"><img src="images/hot_img4.png" alt=""></a> <a class="mbar_title" href="#">Hardware Related Forums</a> </li>
                <li> <a class="mbar_thubnail" href="#"><img src="images/hot_img5.jpg" alt=""></a> <a class="mbar_title" href="#">Education Related Forums</a> </li>
               </ul>
            </div>            
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="row">
          <div class="rightbar_content">
            <div class="single_blog_sidebar wow fadeInUp">
              <h2 style="color: white;">The Featured Stuff</h2>
              <ul class="featured_nav">
                <li> <a class="featured_img" href="#"><img src="images/featured_img1.jpg" alt=""></a>
                  <div class="featured_title"> <a style="text-align: center;" class="" href="#">Politics Related Forums</a> </div>
                </li>
              </ul>
            </div> 
            <div class="single_blog_sidebar wow fadeInUp">
              <h2 style="color:white;">Popular Tags</h2>
              <ul class="poplr_tagnav">
                <li><a href="#">Arts</a></li>
                <li><a href="#">Games</a></li>
                <li><a href="#">Nature</a></li>
                <li><a href="#">Comedy</a></li>
                <li><a href="#">Sports</a></li>
                <li><a href="#">Tourism</a></li>
                <li><a href="#">Videos</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="footer_inner">
          <p class="pull-left">Copyright &copy; 2017 Forums</p>
        </div>
      </div>
    </div>
  </div>
</footer>
<script src="assets/js/jquery.min.js"></script> 
<script src="assets/js/bootstrap.min.js"></script> 
<script src="assets/js/wow.min.js"></script> 
<script src="assets/js/custom.js"></script>
</body>
</html>