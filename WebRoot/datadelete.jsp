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

    <!-- Bootstrap core CSS -->
    <link href="model_files/bootstrap.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="model_files/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="model_files/theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="model_files/ie-emulation-modes-warning.js"></script>

    
    <title>Delete page</title>
    <script src="functionjs.js"type="text/javascript"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

<body style="margin:0px; padding:0px";>
<%    System.out.println("execute func success!");
%>

  <jsp:useBean id="datacontrol" scope="page" class="bean.databean" />
<%
    int count=0;
    String interests=null;
    int nodeId=0;
    int data=0;
    String type=null;
    String time=null;
    ResultSet rs = null;
    Connection conn = null;
    String sql=null;
	conn=datacontrol.getConn();
	sql="select * from recievedata";
    rs=datacontrol.executeSQL(sql);
    System.out.println("execute sql success!");
%>
<div class="col-md-6">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Interests Name</th>
                <th>Node Id</th>
                <th>Data</th>
                <th>Type</th>
                <th>Time</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
    <%
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
                <td><button type="button" class="btn btn-default" id=<%=count%> onclick="javascript:deleterecord('<%=interests %>')">Delete</button></td>
              </tr>
              <%
              }
              %>
            </tbody>
          </table>        
                    <%
     rs.close();
     conn.close(); 
 %>
        </div>
  </body>
</html>