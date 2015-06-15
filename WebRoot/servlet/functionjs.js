function showmap(){
	
	$("#showwindow").attr("src","map.html");
	}


function login(){
	
}

function showdatabase(){
	$("#showwindow").attr("src","database.jsp?funcNum=1");
	}
function showsenddata(){
	$("#showwindow").attr("src","database.jsp?funcNum=2");
	}
function deletedata(){
	$("#showwindow").attr("src","datadelete.jsp");
	}
function searchdatabase(){
	$("#showwindow").attr("src","datasearch.jsp");
	}
function sortsenddata(){
	$("#showwindow").attr("src","datasort.jsp");
	}
function showsysteminfo(){
	$("#showwindow").attr("src","systemInfo.html");
	}

function deleterecord(name){
    if(confirm("Are you sure to delete this record?")){
        location.href="http://cb-qth6:8080/ndn_web_system_prototype/servlet/datacontrol?name="+name+"&action=del";
     }
}
function orderBy(By){
	if(confirm("Are you sure to order by this option?")){
        location.href="http://cb-qth6:8080/ndn_web_system_prototype/servlet/datacontrol?orderBy="+By+"&action=order";
	}
     
}