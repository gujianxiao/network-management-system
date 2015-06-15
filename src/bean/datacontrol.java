package bean;
import java.sql.*;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class datacontrol extends HttpServlet {
	
	
    ResultSet rs = null;
    Connection conn = null;
    String sql=null;
    databean datacontrol=new databean();

	/**
	 * Constructor of the object.
	 */
	public datacontrol() {
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
		conn=datacontrol.getConn();	
		
//		System.out.println("the delete name is:"+name+"");
		String actionName=request.getParameter("action");
		if(actionName.equalsIgnoreCase("del")){
			String name=request.getParameter("name");
			sql="delete from recievedata where interests='"+name+"'";
			int r=datacontrol.executeUpdateSQL(sql);
			System.out.println("the delete is success!"+r+"hang!");
			     try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			response.sendRedirect("http://cb-qth6:8080/ndn_web_system_prototype/datadelete.jsp");
		}
		else if(actionName.equalsIgnoreCase("order")){
			String orderBy=request.getParameter("orderBy");
			System.out.println(" found your orderway!"+orderBy+"");
			sql="select * from recievedata order by "+orderBy;
			rs=datacontrol.executeSQL(sql); 
		request.setAttribute("result",rs);
		request.getRequestDispatcher("datasort.jsp").forward(request, response);		
	     try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		}
		else {
			System.out.println("not found your actionName!"+actionName+"");
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
		conn=datacontrol.getConn();	
		String table=request.getParameter("searchTable");
         String column=request.getParameter("searchOption");
 		if(column!=null){
			String content=request.getParameter("searchContent");
			sql="select * from "+table+ " where "+column+"="+content;
			rs=datacontrol.executeSQL(sql);
			request.setAttribute("table",table);
			request.setAttribute("result",rs);
			request.getRequestDispatcher("../datasearch.jsp").forward(request, response);		
		     try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		  }
 		
	     else{
	    	 System.out.println("not found column!");
	    	 }
         

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
