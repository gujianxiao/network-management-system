package bean;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;

public class sendInterestsbean {
	private static sendInterestsbean init=new sendInterestsbean();
	private String prefixId;
	private String gatewayId;
	private String prefix;
	private String lng;
	private String lat;
	private String dataType;
	private int nodeId;
	private String time;
	private boolean startflag=true;
	private boolean connectflag=true;
	
	private sendInterestsbean(){
		
	}
	//onlyInstance
	public static sendInterestsbean getOnlyInstance(){
		return init;
		
	}
	
	public int getNodeId() {
		return nodeId;
	}

	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}


	
	public String getPrefixId() {
		return prefixId;
	}
	public void setPrefixId(String prefixId) {
		this.prefixId = prefixId;
	}
	public String getGatewayId() {
		return gatewayId;
	}
	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@SuppressWarnings("deprecation")
	//call the terminal to run the command
	public String runCommand(String[] command)
	{
		String initiateinfo=null;
        try {
        Process p=Runtime.getRuntime().exec(command);
//    	String[] command2={"/bin/sh", "-c","ndndstart"};
//    	Process p=Runtime.getRuntime().exec(command2);
        Thread t=new Thread(new InputStreamRunnable(p.getErrorStream(),"ErrorStream"));  
      
        t.start();
        BufferedInputStream bis = new BufferedInputStream(p.getInputStream());
        InputStreamReader sReader = new InputStreamReader(bis,"UTF-8"); 
        BufferedReader bReader = new BufferedReader(sReader);  
        
        StringBuilder sb=new StringBuilder();  
        String line;  

        while((line=bReader.readLine())!=null)  
        {  
            sb.append(line);  
            sb.append("/n");  
        }  

        bReader.close();  
        t.stop();
        p.destroy();   

        initiateinfo=sb.toString();
        }
        catch(IOException e){
        	e.printStackTrace();
        } 

    return initiateinfo;
	}
	
	
	@SuppressWarnings("deprecation")
	public String start()
	{		
		String initiateinfo=null;
		if(startflag)
		{
        String[] command = {"/bin/sh", "-c","ndndstart"};
        try {
        	Runtime.getRuntime().exec(command);
        	String[] command2={"/bin/sh", "-c","ndndstatus"};
        	Process p=Runtime.getRuntime().exec(command2);
	        Thread t=new Thread(new InputStreamRunnable(p.getErrorStream(),"ErrorStream"));  
            t.start();
	        BufferedInputStream bis = new BufferedInputStream(p.getInputStream());
	        InputStreamReader sReader = new InputStreamReader(bis,"UTF-8"); 
            BufferedReader bReader = new BufferedReader(sReader);  
            
            StringBuilder sb=new StringBuilder();  
            String line;  

            while((line=bReader.readLine())!=null)  
            {  
                sb.append(line);  
                sb.append("/n");  
            }  

            bReader.close();  
            t.stop();
            p.destroy();   
            initiateinfo=sb.toString();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        startflag=false;
		}
        return initiateinfo;
	}
	
	public void stop()
	{		
        String[] command = {"/bin/sh", "-c","ndndstop"};
        String stopInfo=null;
		stopInfo=runCommand(command);
	}
	
	public String connect()
	{	
		 String com="echo \"361991\" | sudo -S ";
		 com+=prefixId;
		 com+=gatewayId;
		String[] command={"/bin/sh","-c",com};
        String connectInfo=null;     
        if(connectflag){
		connectInfo=runCommand(command);
		connectflag=false;
		}
        return connectInfo;
	}
	
	public String sendInterest()
	{
		recieveDatabean dealData=new recieveDatabean();
		String dataInfo=null;
		String recieveData="20";
		String Interest=prefix;
		Interest+="ndn:/wsn/ins";
		//左下右上
		Interest+="/";
        Interest+=lng.substring(6, 10);
		Interest+="/";
    	Interest+=lat.substring(5, 9);
		Interest+="/";
        Interest+=lng.substring(6, 10);
		Interest+="/";
    	Interest+=lat.substring(5, 9);
		Interest+="/";
    	Interest+=dataType;
		//time
		String[] command={"/bin/sh","-c",Interest};

		dataInfo=runCommand(command);
        System.out.println(dataInfo);
       try {
    	   dealData.setInterests(Interest);
    	   dealData.setNodeId(nodeId);
    	   dealData.setType(dataType);
		boolean finish= dealData.recieveDealing(dataInfo, "data");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
        //deal with the data;
		//Thread.sleep(3000);
		return recieveData;
		
	}
	public String sendLocation()
	{
		recieveDatabean dealData=new recieveDatabean();
		String dataInfo=null;
		String recieveData="20";
		String Interest=prefix;
		Interest+="ndn:/wsn/location";
		//左下右上
//	    Interest+=lng;
//		Interest+="/";
//		Interest+=lat;
//		Interest+="/";
//		Interest+=dataType;
		//time
		String[] command={"/bin/sh","-c",Interest};

		dataInfo=runCommand(command);
        System.out.println(dataInfo);
       try {
    	   dealData.setInterests(Interest);
    	   dealData.setNodeId(nodeId);
    	   dealData.setType(dataType);
		boolean finish= dealData.recieveDealing(dataInfo, "location");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
        //deal with the data;
		//Thread.sleep(3000);
		return recieveData;
		
	}
}


