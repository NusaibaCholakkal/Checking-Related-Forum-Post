<%-- 
    Document   : search1
    Created on : Dec 2, 2017, 1:33:12 PM
    Author     : DLK 1
--%>

<%@page import="algorithm.TFIDFCalculator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="algorithm.Stopwords"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    int zz=0;
    int count=1;
    String fname;
    String ffname;
    Set <String>fin = new LinkedHashSet<String>();
    Set oo = new HashSet();
    Map ma = new LinkedHashMap();
    Map na = new LinkedHashMap();
    ArrayList mmm = new ArrayList();
    ArrayList <String>all = new ArrayList<String>();
    List lis = new ArrayList();
    List lis1 = new ArrayList();
    System.out.println("before ");
    String cont="";
    String key=request.getParameter("key");
    System.out.println("after "+key);
    Stopwords sspp=new Stopwords();
        LinkedList<String>stoppp=new LinkedList<String>();
        stoppp = sspp.words(key);        
        String result1=""; 
        for(String zob : stoppp)
        {
            result1+=zob+" ";
        }
        result1 = result1.replaceAll("[,]"," "); 
        key=result1;
        key=key.toLowerCase();
        //out.println(key);
    String k=request.getParameter("k");     
    int kk = Integer.parseInt(k);
    String[] arr = key.split(" "); 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/relatedforum","root","root");
    PreparedStatement zop = con.prepareStatement("truncate table val");
    zop.executeUpdate();
    PreparedStatement yop = con.prepareStatement("truncate table result");
    yop.executeUpdate();    
    PreparedStatement pssw=con.prepareStatement("select * from forum");
    ResultSet rssw = pssw.executeQuery();   
    int iyz=0;
    while(rssw.next())
    {
    iyz=iyz+1;
    }
    TFIDFCalculator calc = new TFIDFCalculator();
     for ( String ss : arr) 
    {
        lis1.add(ss);
    ss=ss.toLowerCase();
    String sql="select * from forum where fname  like '%"+ss+"%' ";
    PreparedStatement pss=con.prepareStatement(sql);
    ResultSet rss = pss.executeQuery();             
    while(rss.next())
    {       
        int c=0;
        fname=rss.getString("id");
        oo.add(rss.getString("id"));
        cont=rss.getString("fname"); 
        cont=cont.toLowerCase();   
        c= cont.split(ss).length - 1;    
        PreparedStatement ps = con.prepareStatement("insert into val (fname,ke,count) values ('"+fname+"','"+ss+"','"+c+"') ");
        ps.executeUpdate();
    }
    }    
    String sql="select id from forum";
    PreparedStatement pss=con.prepareStatement(sql);
    List <String>god = new ArrayList<String>();
    ResultSet rss = pss.executeQuery();
    while(rss.next())
    {
        int temp=0;
        ffname=rss.getString("id");
        String sp="select * from val where fname='"+ffname+"' ";
    PreparedStatement sn=con.prepareStatement(sp);
    ResultSet snn = sn.executeQuery();
    while(snn.next())
    {
        temp+=snn.getInt("count");
    }
    if(temp!=0)
    {
    PreparedStatement uu = con.prepareStatement("insert into result (fname,count) values ('"+ffname+"','"+temp+"') ");
    uu.executeUpdate();    
    }    
    }
                //Extra Coding
                PreparedStatement del=con.prepareStatement("truncate table highlevel");
                del.executeUpdate();
    
                PreparedStatement p=con.prepareStatement("select * from result");
                ResultSet s = p.executeQuery();
                while(s.next())
                {
                    String file=s.getString("fname");System.out.println("First loop");
                    PreparedStatement p1=con.prepareStatement("select * from forum where id='"+file+"' ");
                    ResultSet s1 = p1.executeQuery();
                    while(s1.next())
                    {
                        String conts=s1.getString("fname");System.out.println("Second loop");
                        String word[]=conts.split(" ");
                        String qur[]=key.split(" ");
                        int cou=0; int high=0;
                        for(int i=0;i<qur.length;i++)
                        {
                            int dummy=0;
                            for(int j=0;j<word.length;j++)
                            {
				if(qur[i].equalsIgnoreCase(word[j]))
				{
                                    high++;
                                    if(dummy==0)
                                    {
                                        dummy++;
                                        cou++;
                                    }
				}
                            }
                        }
                        if(cou>=qur.length)
                        {
                           PreparedStatement insert=con.prepareStatement("insert into highlevel values('"+file+"','"+high+"') ");
                           insert.executeUpdate();
                        }
                    }
                }
                List <String>rel=new ArrayList<String>();
         //High Priority Files
          PreparedStatement p1=con.prepareStatement("SELECT * FROM highlevel ORDER BY rank+0 DESC");
          ResultSet s1 = p1.executeQuery();
          String zzz="";
          while(s1.next())
          {
              String file=s1.getString("filename");
              String rank=s1.getString("rank");
              fin.add(file);
              System.out.println("Relevance Count is "+Math.log((1+(8/(Integer.parseInt(rank))))));
              zzz +="Relevance Count of Forum Id  "+file+"  is : "+Math.log((1+(8/(Integer.parseInt(rank)))));
           zzz+=" </br>";zzz+=" ";
          }          
   
%>
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
            <li><a href="user.jsp">Home</a></li>
            <li><a href="addforum.jsp">Post Forum</a></li>
            <li><a href="viewforums.jsp">View Forums</a></li>
            <li><a href="search.jsp">Search</a></li>
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
            <h2 style="background-color: #7dc34d;">Search Result</h2>
            <br><br><br>
                          
                 
     <%
        List <String>god1=new ArrayList<String>();
        System.out.println("Final "+fin);
        int  y;
        y=fin.size(); 
        Iterator itr = fin.iterator();
        while(itr.hasNext())
        {          
           god.add((String)itr.next());
        } 
        if(kk<y)
        {
            for(int i=0;i<kk; i++)
            {
                god1.add(god.get(i));
            }
        }
        else
        {
        for(String zzmo: god)
        {
           god1.add(zzmo);
       }
        }
        for(String vel:god1)
        {
          PreparedStatement ptt=con.prepareStatement("SELECT * FROM forum where id='"+vel+"' ");
          ResultSet stt = ptt.executeQuery();
          int i=0;
          while(stt.next())
          {
             i=i+1; 
          
         %>
         <h2 style="color:black;font-size: 17px;">Id : <%=vel%> &emsp; <%=stt.getString("fname")%>?
                <br><img style="width:50px;height: 50px;" src="forum/<%=stt.getString("img")%>">&emsp;<span style="color:blue;font-size:14px;"><%=stt.getString("des")%></span><br>&emsp;Author: <%=stt.getString("uname")%>&emsp;&emsp;<i class="fa fa-users" aria-hidden="true"></i>&emsp;Category : <%=stt.getString("cate")%>&emsp;&emsp;<i class="fa fa-comments-o" aria-hidden="true"></i>&emsp;<a href="comment.jsp?id=<%=stt.getString("id")%>">Comments</a><br>
        
         </h2>
                <br>
         <%
        }   }
     %>
    <h2 style="color:blue;"> <%=zzz%></h2>             
            
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