package bean;
import java.sql.*;
import java.util.ArrayList;

import bean.databean;

public class recieveDatabean {
	private String interests;
	private int nodeId;
	private String type;
	private String time;
	private String data;
	public String getDataType() {
		return type;
	}
	public String getTime() {
		return time;
	}
	public String getData() {
		return data;
	}

	public String getInterests() {
		return interests;
	}
	public void setInterests(String interests) {
		this.interests = interests;
	}
	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setData(String data) {
		this.data = data;
	}
	public boolean recieveDealing(String recieveinfo,String infoType) throws SQLException{
		databean insertIntoDatabase= new databean();
		//deal with the recieveinfo to get the useful data;
		Connection con=insertIntoDatabase.getConn();
		ResultSet rs = null;
		if(infoType=="data"){
		int recievedata=Integer.parseInt(recieveinfo);
        String insertsql="insert into recievedata interest nodeId  data time value "+interests+" "+nodeId+" "+recievedata+" "+type+" "+time;
	     rs=insertIntoDatabase.executeSQL(insertsql);
		}
		//if the datatype is topo
		if(infoType=="topo"){
			char sum = 0;//sink sum
			char root = 0;//topotree root
			int  a[]=new int[2];//son sink and father sink
			ArrayList<int[]> id=new ArrayList();
			String[] topoinfo=recieveinfo.split("/n");
			for(int i=0;i<topoinfo.length;i++){
				if(i==0){
					 sum=topoinfo[i].charAt(0);
				}
				else if(i==1){
					root=topoinfo[i].charAt(0);
				}
				else{
					a[0] =topoinfo[i].charAt(0);
					a[1]=topoinfo[i].charAt(2);
					id.add(a);
				}
				
			}
			// write into database table nodeinfo
		   for(int i=0;i<id.size();i++)
		   {
			String insertsql="insert into topoInfo interest nodeId  father root sum "+id.get(i)[0]+" "+id.get(i)[1]+" "+root+" "+sum;
			rs=insertIntoDatabase.executeSQL(insertsql);
			   }
		   }
		if(infoType=="location"){
			String lng="116.36";
			String lat="39.96";
			int id=0;
			int r=0;
			boolean exist=true;
			String[] locationinfo=recieveinfo.split("/n");
			for(int i=0;i<locationinfo.length;i++)
			{
				    lng="116.36";
				    lat="39.96";
					id=Integer.parseInt(locationinfo[i].substring(0,1));
					lng+=locationinfo[i].substring(2, 6);
					lat+=locationinfo[i].substring(7,11);
			String insertsql="insert into nodeinfo(nodeId,lng, lat,exist)values("+id+",'"+lng+"','"+lat+"','"+exist+"')";
		    r=insertIntoDatabase.executeUpdateSQL(insertsql);
			}
			if(r>0){
				return true;
			}
			else{
				return false;
			}
		}
		
		return rs.next();
	}
}
