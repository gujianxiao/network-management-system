<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"></meta>
    <meta charset="utf-8"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content=""></meta>
    <meta name="author" content=""></meta>
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico"></link>

    <title>Theme Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="model_files/bootstrap.css" rel="stylesheet"></link>
    <!-- Bootstrap theme -->
    <link href="model_files/bootstrap-theme.css" rel="stylesheet"></link>

    <!-- Custom styles for this template -->
    <link href="model_files/theme.css" rel="stylesheet"></link>

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="model_files/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="http://api.map.baidu.com/api?v=1.5&ak=x8F38EeqBjcY3lWamhSQkfOW" type="text/javascript"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:100%}  
</style> 
<jsp:useBean id="datacontrol" scope="page" class="bean.databean" />
<script type="text/javascript">

		$(function(){
		
			$("#button").click(function(){
				$.ajax({
				
					type:"POST",
					url:"http://cb-qth6:8080/ndn_web_system_prototype/servlet/communication",
					data:{
					
						idInfo:$("#pointId").val(),
						type:$("#type").val(),
						},
					dataType:"html",
                	success:function(returnData){
                    	alert("come back receievedata:"+returnData);
                }
				
				});
				
				
			
			
			
			});		
		
		});


</script>

<%
    ResultSet rs = null;
    Connection conn = null;
    int[] nodeId=new int[10];
    String[] location=new String[10];
    String[] lng=new String[10];
    String[] lat=new String[10];
    String[] exist=new String[10];
    int ca=0;
    int count=0;
    String sql="select * from nodeinfo"; 
    try{  
    conn=datacontrol.getConn();
    
    rs=datacontrol.executeSQL(sql);
    while(rs.next()){
    nodeId[count]=rs.getInt(1);
    location[count]=rs.getString(2);
    lng[count]=rs.getString(3);
    lat[count]=rs.getString(4);
    exist[count]=rs.getString(5);  
    count++;
     }
     }
     catch(SQLException e){
     e.printStackTrace();
     }
     rs.close();
     conn.close();    
%>
</head>

<body>
<form class="form-inline" method="post" action="http://cb-qth6:8080/ndn_web_system_prototype/servlet/communication">
  <div class="form-group">
    <label for="exampleInputName2">Ask</label>
    <input type="text" class="form-control" id="pointId" name="idInfo" placeholder="">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail2">
    for</label>
    <select class="form-control" id="type" name="interestType">
  <option>temp</option>
  <option>humidity</option>
  <option>light</option>
</select>
  </div>
  <input type="button" class="btn btn-default" id="button" value="Send Interests"/>
</form>
<div id="container"></div> 
<script type="text/javascript">
var map = new BMap.Map("container");          // 创建地图实例  
var point = new BMap.Point(116.362524, 39.967184);  // 创建点坐标
map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.MapTypeControl()); 
map.enableScrollWheelZoom(true);         //开启鼠标滚轮缩放 
map.centerAndZoom(point, 18);                 // 初始化地图，设置中心点坐标和地图级别 
var ct='<%=count%>';
var pointid=new Array();
var pointlng=new Array();
var pointlat=new Array();
var pointlocation=new Array();
<%
for(ca=0;ca<count;ca++){%>
    pointid[<%=ca%>]='<%=nodeId[ca]%>';
    pointlng[<%=ca%>]='<%=lng[ca]%>';
    pointlat[<%=ca%>]='<%=lat[ca]%>';
    pointlocation[<%=ca%>]='<%=location[ca]%>';
 <%   
}
%>

	var opts = {
				width : 100,     // 信息窗口宽度
				height: 80,     // 信息窗口高度
				title : "nodeInfo" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var j=0;j<ct;j++){
		var marker = new BMap.Marker(new BMap.Point(pointlng[j],pointlat[j]));  // 创建标注
		marker.setAnimation(BMAP_ANIMATION_BOUNCE);
		var content ="id="+pointid[j]+","+"location="+pointlocation[j]+",exist:true";
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			getInfo(content,e);}
		);
	}
	function getInfo(content,e){
		$("#pointId").attr("value",content);
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}

</script>  
 

</body>
</html>
