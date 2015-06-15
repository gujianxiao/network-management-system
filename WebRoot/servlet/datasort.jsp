<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>datasort</title>
    <script src="functionjs.js" type="text/javascript"></script>

    <!-- Bootstrap core CSS -->
    <link href="Navbar%20Template%20for%20Bootstrap_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="Navbar%20Template%20for%20Bootstrap_files/navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="Navbar%20Template%20for%20Bootstrap_files/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body style="margin:10px auto; padding:0px;">

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Order By</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="#" onclick="javascript:orderBy('interests')">Name</a></li>
              <li><a href="#"onclick="javascript:orderBy('nodeId')">NodeId</a></li>
              <li><a href="#"onclick="javascript:orderBy('data')">Data</a></li>
              <li><a href="#"onclick="javascript:orderBy('type')">Type</a></li>
              <li><a href="#"onclick="javascript:orderBy('time')">Time</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
            <div class="col-md-6">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>Interests Name</th>
                <th>Node Id</th>
                <th>Data</th>
                <th>Type</th>
                <th>Time</th>
              </tr>
            </thead>
            <tbody>
   <%
    int count=0;
    String interests=null;
    int nodeId=0;
    int data=0;
    String type=null;
    String time=null;
 //   String rs=null;
    ResultSet rs=(ResultSet)request.getAttribute("result");
    if(rs!=null){
    System.out.println("get rs!");
    while(rs.next()){
    interests=rs.getString(1);
    nodeId=rs.getInt(2);
    data=rs.getInt(3);
    type=rs.getString(4);
    time=rs.getString(5);
    count++;
                    
                    %>
                    
              <tr>
                <td><%=count %></td>
                <td><%=interests%></td>
                <td><%=nodeId %></td>
                <td><%=data%></td>
                <td><%=type%></td>
                <td><%=time%></td>
              </tr>
              <%
              }
              }
              %>
            </tbody>
          </table>
        </div>

</body>
</html>