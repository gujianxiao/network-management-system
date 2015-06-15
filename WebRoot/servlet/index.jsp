<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>Web System</title>

    <!-- Bootstrap core CSS -->
    <link href="signin%20model_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin%20model_files/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="signin%20model_files/ie-emulation-modes-warning.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="servlet/functionjs.js"type="text/javascript">
</script>
<link href="menubar.css" rel="stylesheet" type="text/css" />

<link href="menumodel_files/bootstrap.css" rel="stylesheet">

<link href="show.css" rel="stylesheet" type="text/css" />


</head>

<body >
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Sensor Network Management System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input placeholder="Email" class="form-control" type="text">
            </div>
            <div class="form-group">
              <input placeholder="Password" class="form-control" type="password">
            </div>
            <button type="submit" class="btn btn-success" onclick="javascript:login();">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
</nav>

<div id="view">
  <div class="container-fluid">
        <div class="row">
          <div class="col-md-2">
                <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
                    <li>
                        <a href="http://www.globesen.org">
                            <i class="glyphicon glyphicon-th-large"></i>
                            Main Page		
                        </a>
                    </li>
                    <li>
                        <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-map-marker"></i>
                            SinkManage
                            
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="systemSetting" class="nav nav-list secondmenu collapse" style="height: 0px;">
                            <li><a href="#"onclick="javascript:showmap();"><i class="glyphicon glyphicon-refresh"></i>&nbsp;Refresh</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-send"></i>&nbsp;SendInts</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#configSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-cog"></i>
                            TopoManage	
                                   <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                        </a>
                        <ul style="height: 0px;" id="configSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="#"><i class="glyphicon glyphicon-refresh"></i>&nbsp;Refresh</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-plus"></i>&nbsp;AddNode</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-trash"></i>&nbsp;DeleteNode</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-search"></i>&nbsp;SearchNode</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#disSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-oil"></i>
                            DataManage
							 <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="disSetting" class="nav nav-list secondmenu collapse">
                            <li><a href="#" onclick="javascript:showdatabase();"><i class="glyphicon glyphicon-refresh"></i>&nbsp;RecieveData</a></li>
                            <li><a href="#" onclick="javascript:showsenddata();"><i class="glyphicon glyphicon-refresh"></i>&nbsp;SendInterest</a></li>
                            <li><a href="#" onclick="javascript:deletedata();"><i class="glyphicon glyphicon-trash"></i>&nbsp;Delete</a></li>
                            <li><a href="#" onclick="javascript:searchdatabase();"><i class="glyphicon glyphicon-search"></i>&nbsp;Search</a></li>
                            <li><a href="#" onclick="javascript:sortsenddata();"><i class="glyphicon glyphicon-sort"></i>&nbsp;Sort</a></li>
                        </ul>
                    </li>
                    <li>
                         <a href="#" onclick="javascript:showsysteminfo();">
                            <i class="glyphicon glyphicon-fire"></i>
                            About System
                            <span class="badge pull-right">!</span>
                        </a>
                    </li>

                </ul>
            </div>
            <div class="col-md-10">
                <iframe id="showwindow" src="map.html"> </iframe>
            </div>
        </div>
    </div>
</div>
    <script src="menumodel_files/jquery-1.js"></script>
    <script src="menumodel_files/bootstrap.js"></script>

<div id="info"></div>

</body>
</html>