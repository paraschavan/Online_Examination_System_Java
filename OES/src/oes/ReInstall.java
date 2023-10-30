package oes;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ReInstall")
public class ReInstall extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RI ri=new RI();
		ri.reinstall();
		 request.getRequestDispatcher("index.html").forward(request, response);	
	}
	class RI{
		String database="oes";
	    private String jdbcURL = "jdbc:mysql://localhost:3306/";
	    private String jdbcUsername = "root";
	    private String jdbcPassword = "vdf@oes";
	    String[] data={"staff","y1","y2","y3"}; 
	    String[] year={"y1","y2","y3"}; 
		 protected Connection getConnection(){
		    	Connection connection=null;
		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		        } catch (SQLException e) {
		            e.printStackTrace();
		        } catch (ClassNotFoundException e) {
		            e.printStackTrace();
		        }
		    	return connection;
		    }
		 public void reinstall(){
			 try (Connection connection = getConnection();) {
				 System.out.println("1");
				 PreparedStatement Statement =connection.prepareStatement("create database if not exists "+database+";");
  	            Statement.executeUpdate();
  	            Statement.close();
  	            
  	          System.out.println("2");
  	          PreparedStatement Statement2 =connection.prepareStatement("drop database "+database+";");
	            Statement2.executeUpdate();
	            Statement2.close();
	            
	            System.out.println("3");
	            PreparedStatement Statement3 =connection.prepareStatement("create database if not exists "+database+";");
  	            Statement3.executeUpdate();
  	            Statement3.close();
  	            
  	          System.out.println("use");
	            PreparedStatement Statementu =connection.prepareStatement("use "+database+";");
	            Statementu.executeUpdate();
	            Statementu.close();
  	            
  	          System.out.println("4");
  	            PreparedStatement Statement4 =connection.prepareStatement("CREATE TABLE staff ( id int unsigned NOT NULL auto_increment, uname varchar(255) NOT NULL,pass varchar(255) NOT NULL,lvl varchar(1) NOT NULL,name varchar(255) NOT NULL, PRIMARY KEY (id));");
  	          System.out.println(Statement4);
  	            Statement4.executeUpdate();
	            Statement4.close();
	            
	            System.out.println("Admin");
  	            PreparedStatement Statementa =connection.prepareStatement("INSERT INTO staff (uname,pass,lvl,name) VALUES " +" ('admin','vdf@oes','A','Admin');");
  	          System.out.println(Statement4);
  	            Statementa.executeUpdate();
	            Statementa.close();
	            
	            System.out.println("5");
	            for(String y:year){
	            	PreparedStatement Statement5 =connection.prepareStatement("CREATE TABLE "+y+" ( id int unsigned NOT NULL auto_increment, uname varchar(255) NOT NULL,pass varchar(255) NOT NULL,lvl varchar(1) NOT NULL,name varchar(255) NOT NULL, scheme varchar(8) NOT NULL, year varchar(8) NOT NULL, PRIMARY KEY (id));");
	            	System.out.println(Statement5);
	            	Statement5.executeUpdate();
		            Statement5.close();
	            }
	            
	            System.out.println("6");
	            for(String y:year){
	            	PreparedStatement Statement6 =connection.prepareStatement("CREATE TABLE "+y+"p ( id int unsigned NOT NULL auto_increment, paperName varchar(255), time int(10), online varchar(16000), PRIMARY KEY (id));");
	            	System.out.println(Statement6);
	            	Statement6.executeUpdate();
		            Statement6.close();
		            
		            PreparedStatement Statement7 =connection.prepareStatement("INSERT INTO "+y+"p (online) VALUES " +" ('');");
	            	System.out.println(Statement7);
	            	Statement7.executeUpdate();
		            Statement7.close();
	            }
	            System.out.println("7");
  	            PreparedStatement Statementd =connection.prepareStatement("CREATE TABLE data ( id int unsigned NOT NULL auto_increment, tableName varchar(255) NOT NULL,num varchar(10) NOT NULL, PRIMARY KEY (id));");
  	            System.out.println(Statementd);
  	            Statementd.executeUpdate();
	            Statementd.close();
	            
	            for(String d:data){
	            	System.out.println("8");
	  	            PreparedStatement Statementi =connection.prepareStatement("INSERT INTO data (tableName,num) VALUES " +" ('"+d+"','0');");
	  	          System.out.println(Statementi);
	  	            Statementi.executeUpdate();
		            Statementi.close();
	            }
	            UserDAO u=new UserDAO();
	            u.table("staff");
	            u.data();
	            System.out.println("7");
			     }catch (SQLException e) {
			        }
	     }
	}
}
