<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="bean.sendInterestsbean" %>

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

    <!-- Bootstrap core CSS -->
    <link href="model_files/bootstrap.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="model_files/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="model_files/theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="model_files/ie-emulation-modes-warning.js"></script>
  <head>
    <base href="<%=basePath%>">
    
    <title>topo  page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->



  </head>

  <script type="text/javascript">
  $("#toposhow").load( "http://cb-qth6:8080/ndn_web_system_prototype/servlet/communication?action=sendTopo" , false); 
  </script>
  
  <body>
  <div id="toposhow" class="container-fluid" style="padding-left: auto; padding-right: 0px; margin-right: auto; padding-top: 0px; margin-left: auto; margin-top: 0px; padding-bottom: auto" >
     <img data-holder-rendered="true" src="pic/topo.png" class="img-responsive" alt="Responsive image">
  </div>
  </body>
</html>
