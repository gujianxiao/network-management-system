<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>Theme Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="model_files/bootstrap.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="model_files/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="model_files/theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="model_files/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body style="margin:0px; padding:0px;">
<div div class="container">
<form class="form-inline" method="post" action="http://cb-qth6:8080/ndn_web_system_prototype/servlet/datacontrol">
  <div class="form-group">
    <label class="sr-only">option</label>
    <p class="form-control-static" id="searchOption">Search</p>
    <select class="form-control" name="searchOption">
  <option>interests</option>
  <option>nodeId</option>
  <option>data</option>
  <option>type</option>
  <option>time</option>
</select>
  </div>
  <div class="form-group">
    <label for="inputPassword2" class="sr-only">By</label>
    <input type="text" class="form-control" name="searchContent" placeholder="Search Content">
  </div>
  <button type="submit" class="btn btn-default">Confirm</button>
</form>
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

</div>
</body>
</html>