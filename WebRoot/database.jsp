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

    <title>database</title>

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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body style="margin:0px; padding:0px;">
  
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
    String funcNum=request.getParameter("funcNum");
    System.out.println("funcNum is "+funcNum);
    int num=Integer.parseInt(funcNum);
    switch(num){
    case 1:sql="select * from recievedata";
    break;
    case 2:sql="select * from sendinterest";
    break;
    }
    conn=datacontrol.getConn();
    rs=datacontrol.executeSQL(sql);
    if(num==1){
    %>
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
              %>
            </tbody>
          </table>
        </div>
        
                    <%
     rs.close();
     conn.close(); 
     }
 %>
 
 
 <% 
 if(num==2){
    %>
      <div class="col-md-6">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>Interests Name</th>
                <th>Node Id</th>
                <th>Type</th>
                <th>Time</th>
              </tr>
            </thead>
            <tbody>
    <%
    while(rs.next()){
    interests=rs.getString(1);
    nodeId=rs.getInt(2);
    type=rs.getString(3);
    time=rs.getString(4);
    count++;
                    
                    %>
                    
              <tr>
                <td><%=count %></td>
                <td><%=interests%></td>
                <td><%=nodeId %></td>
                <td><%=type%></td>
                <td><%=time%></td>
              </tr>
              <%
              }
              %>
            </tbody>
          </table>
        </div>
        
                    <%
     rs.close();
     conn.close(); 
     }
 %>
  <p>

     </p>
  </body>
</html>
