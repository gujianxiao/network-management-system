package bean;
import java.sql.*;
import java.util.ArrayList;
import java.sql.Date;

import bean.databean;

public class recieveDatabean {
	private String interests;
	private int nodeId;
	private String type;
	private Date  time;
	private String data;
	public String getDataType() {
		return type;
	}
	public Date  getTime() {
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
	public void setTime(Date time) {
		this.time = time;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int recieveDealing(String recieveinfo,String infoType) throws SQLException{
		databean insertIntoDatabase= new databean();
		//deal with the recieveinfo to get the useful data;
		Connection con=insertIntoDatabase.getConn();
		int r=0;
		if(infoType.equalsIgnoreCase("data")){
		int recievedata=Integer.parseInt(recieveinfo);
		 java.sql.Date time = new java.sql.Date(System.currentTimeMillis());
		String insertsql="insert into recievedata(interests,  nodeId,data,type,time)values('"+interests+"','"+nodeId+"','"+recievedata+"','"+type+"','"+time+"')";
	    return  r=insertIntoDatabase.executeUpdateSQL(insertsql);
		}
		//if the datatype is topo
		if(infoType=="topo"){
			int sum = 0;//sink sum
			int root = 0;//topotree root

			ArrayList<int[]> id=new ArrayList<int[]>();
		    String sqd="delete from topoInfo"; 
		    insertIntoDatabase.executeUpdateSQL(sqd);
			String[] topoinfo=recieveinfo.split("/n");
			for(int i=0;i<topoinfo.length;i++){
				if(i==0){
					 sum=Integer.valueOf(topoinfo[i].substring(2));
				}
				else if(i==1){
					root=Integer.valueOf(topoinfo[i].substring(0,1));
				}
				else{
					int  a[]=new int[2];//son sink and father sink
					a[0] =Integer.valueOf(topoinfo[i].substring(0, 1));
					a[1]=Integer.valueOf(topoinfo[i].substring(2));
					id.add(a);
				}
				
			}
			// write into database table nodeinfo
		   for(int i=0;i<id.size();i++)
		   {
			String insertsql="insert into topoInfo(nodeId, father,root,sum)values("+id.get(i)[0]+","+id.get(i)[1]+","+root+","+sum+")";
			r=insertIntoDatabase.executeUpdateSQL(insertsql);
			   }
             return r;
			
		   }
		
		
		
		if(infoType=="location"){
			String lng="116.36";
			String lat="39.96";
			int id=0;
			boolean exist=true;
		    String sqd="delete from nodeinfo"; 
		    insertIntoDatabase.executeUpdateSQL(sqd);
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

		}
		
		return r;
	}
}
