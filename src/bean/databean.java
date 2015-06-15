package bean;
import java.sql.*;
public class databean {
	//������ݿ��Java Bean�ļ���databean.java

	public databean() {
	}
	//declare variable
	private Connection conn = null;
	ResultSet rs = null;
	private String server = "localhost";
	private String port = "3306";
	private String db = "ndn web system";
	private String user = "root";
	private String pass = "361991";
	private String drivername="com.mysql.jdbc.Driver";
	private String URL="jdbc:mysql://"+server+":"+port+"/"+db+"?user="+user+"&password="+pass;

	public Connection getConn(){//get database connection
	try{
	Class.forName(drivername).newInstance();
	conn = DriverManager.getConnection(URL);
	}
	catch(Exception e){
	e.printStackTrace();
	}
	return this.conn ;
	}

	public void setServer(String str) {//set server name
	server=str;
	}

	public void setPort(String str) {//set server port
	port = str;
	}

	public void setDB(String str) {//set db name
	db = str;
	}

	public void setUser(String str) {//set user name
	user = str;
	}

	public void setPass(String str) {//set user name
	pass = str;
	}

	public ResultSet executeSQL(String str) {
	try{
	Statement stmt = conn.createStatement();
	rs = stmt.executeQuery(str);
	}
	
	catch(Exception e){
	e.printStackTrace();
	}
	
	
	return this.rs;
	}
	
	public int executeUpdateSQL(String str) {
	int r=0;
	try{
	Statement stmt = conn.createStatement();
    r = stmt.executeUpdate(str);
	}
	catch(Exception e){
	e.printStackTrace();
	}
	return r;
	}
	
	
	
	}
