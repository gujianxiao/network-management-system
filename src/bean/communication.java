package bean;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true)

public class communication extends HttpServlet {
//    private ExecutorService executorService =
//            Executors.newFixedThreadPool(10);
    ResultSet rs = null;
    Connection conn = null;
    String sql=null;
    databean datacontrol=new databean();

	/**
	 * Constructor of the object.
	 */
	public communication() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("sendLocation")){
	     sendInterestsbean sendLocation=sendInterestsbean.getOnlyInstance();
         String initiateinfo = sendLocation.start();
     System.out.println(initiateinfo);
        sendLocation.setPrefixId("ndndc add ndn:/ udp ");
        sendLocation.setGatewayId("10.103.243.131");
      //add a new road to ndnx
       String connectinfo=sendLocation.connect();
       System.out.println(connectinfo);
      //send Interest
       sendLocation.setPrefix("ndnpeek -c -w 10 ");
       String recieveData=sendLocation.sendLocation();       
//	    response.getWriter().println(recieveData);     
		    //read data from database
		    String sql="select * from nodeinfo"; 
		    conn=datacontrol.getConn();	    
		    rs=datacontrol.executeSQL(sql);
    if(rs!=null){
    System.out.println("get rs!");
    request.setAttribute("result",rs);
	request.getRequestDispatcher("../newmap.jsp").forward(request, response);	
 }
    else{
    	System.out.println("read data from database failed!");
    } 

		}
		
		    if(action.equalsIgnoreCase("sendTopo")){
	
	        sendInterestsbean toposend=sendInterestsbean.getOnlyInstance();
	        String initiateinfo = toposend.start();
	        System.out.println(initiateinfo);
	         toposend.setPrefixId("ndndc add ndn:/ udp ");
	         toposend.setGatewayId("10.103.243.131");
	         //add a new road to ndnx
	        String connectinfo=toposend.connect();
	        System.out.println(connectinfo);
	        toposend.setPrefix("ndnpeek -c -w 10 ");
	        String recieveData=toposend.senTopo();   
	        response.getWriter().println(recieveData);
	            System.out.println(recieveData);
	     }
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//
//		if(action.equalIgnoreCase("sendInterest")){
		sendInterestsbean sendInterests=sendInterestsbean.getOnlyInstance();
		//connect to database 
		conn=datacontrol.getConn();	 
		//getParameter from jsp
		String idInfo=request.getParameter("idInfo");
		String type=request.getParameter("type");
        int id=Integer.parseInt(idInfo.substring(3,4));
		sql="select * from nodeinfo where nodeId = "+id;
		rs=datacontrol.executeSQL(sql); 
        try {
			while(rs.next()){
				//package interest;
				sendInterests.setLng(rs.getString(3));
			    sendInterests.setLat(rs.getString(4));
			    sendInterests.setDataType(type);	
			    sendInterests.setNodeId(id);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //begin to send Interest
        String initiateinfo = sendInterests.start();
        System.out.println(initiateinfo);
        sendInterests.setPrefixId("ndndc add ndn:/ udp ");
        sendInterests.setGatewayId("10.103.243.131");
        //add a new road to ndnx
        String connectinfo=sendInterests.connect();
        System.out.println(connectinfo);
        //send Interest
        sendInterests.setPrefix("ndnpeek -c -w 10 ");
        String recieveData=sendInterests.sendInterest();       
	    response.getWriter().println(recieveData);    



			}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
