package oes;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
public class UserDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/oes";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vdf@oes";
    private String INSERT_USERS_SQL;
    private String SELECT_USER_BY_ID;
    private String SELECT_ALL_USERS;
    private String DELETE_USERS_SQL;
    private String UPDATE_USERS_SQL;
    private String PSWD;
    private String student=null;
    private String tableName="";
    public void student(String table){
    	INSERT_USERS_SQL = "INSERT INTO " + table + "  (uname,pass,lvl,name,scheme,year) VALUES " +" (?,?,?,?,?,?);";
    	SELECT_USER_BY_ID = "select id,uname,pass,lvl,name,scheme,year from "+table+" where id =?;";
    	SELECT_ALL_USERS = "select * from "+table+";";
    	DELETE_USERS_SQL = "delete from "+table+" where id =?;";
    	UPDATE_USERS_SQL = "update "+table+" set uname =?,pass =?, lvl =?, name=?, scheme=? where id =?;";
    	PSWD="SELECT * FROM "+table+" WHERE uname =? AND pass=? ;";
    	student="Yes";
    	tableName=table;
    } 
    public void table(String table){
    	INSERT_USERS_SQL = "INSERT INTO " + table + "  (uname, pass, lvl,name) VALUES " +" (?,?,?,?);";
    	SELECT_USER_BY_ID = "select id,uname,pass,lvl,name from "+table+" where id =?;";
    	SELECT_ALL_USERS = "select * from "+table+";";
    	DELETE_USERS_SQL = "delete from "+table+" where id =?;";
    	UPDATE_USERS_SQL = "update "+table+" set uname =?,pass =?, lvl =?, name=? where id =?;";
    	PSWD="SELECT * FROM "+table+" WHERE uname =? AND pass=? ;";
    	tableName=table;
    }
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
    
    public void data() throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("select * from "+tableName+";")) {
        	 ResultSet rs = statement.executeQuery();
        	 int num=0;
        	 while(rs.next()){
        		 num++;
        	 }
        	 PreparedStatement statementdata = connection.prepareStatement("update data set num =? where tableName =?;");
        	 statementdata.setString(1, Integer.toString(num));
        	 statementdata.setString(2, tableName);
        	 statementdata.executeUpdate();
             statementdata.close();
             statement.close();
         
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public User datareturn() throws SQLException {
        // try-with-resource statement will auto close the connection.
    	 User u;
    	 String s1="",s2="",s3="",s4="";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("select * from data;")) {
        	 ResultSet rs = statement.executeQuery();
        	 
        	 while(rs.next()){
        		 switch(rs.getInt("id")){
        			 case 1:
        				 s1=rs.getString("num");
        			 break;
        			 case 2:
        				 s2=rs.getString("num");
            		 break;
        			 case 3:
        				 s3=rs.getString("num");
            		 break;
        			 case 4:
        				 s4=rs.getString("num");
            		 break;
        		 }
        	 }
        	 statement.close();
        	
        	 
        } catch (SQLException e) {
            printSQLException(e);
        }
        u=new User(s1,s2,s3,s4);
        return u;
    }
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_USERS_SQL)) {
            int i=0;
        	statement.setString(i+=1, user.getUname());
            statement.setString(i+=1, user.getPass());
            statement.setString(i+=1, user.getLvl());
            statement.setString(i+=1, user.getName());
            if(student=="Yes"){
             statement.setString(i+=1, user.getScheme());
           	 statement.setString(i+=1, user.getYear()); 	 
           }
            statement.executeUpdate();
            if(user.getLvl().equals("T")){
            	
            	PreparedStatement preparedStatement = connection.prepareStatement(PSWD);
            	preparedStatement.setString(1,user.getUname());
            	preparedStatement.setString(2,user.getPass());
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()) {
                    preparedStatement = connection.prepareStatement("CREATE TABLE t"+rs.getInt("id")+" ( id int unsigned NOT NULL auto_increment, subject varchar(255) NOT NULL, subjectCode varchar(255) NOT NULL, year varchar(8) NOT NULL, tableName varchar(255) NOT NULL, PRIMARY KEY (id));");
                    preparedStatement.executeUpdate();
                    preparedStatement.close();
                }
            }
            statement.close();
            data();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
    	System.out.println(SELECT_USER_BY_ID);
        User user = null;
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String uname = rs.getString("uname");
                String pass = rs.getString("pass");
                String lvl = rs.getString("lvl");
                String name = rs.getString("name");
                if(lvl.equals("S")){
                	System.out.println("su in");
                	String scheme = rs.getString("scheme");
                	String year = rs.getString("year");	
                	user = new User(id, uname, pass, lvl, name, scheme, year);
                }
                else{
                	System.out.println("su in e");
                user = new User(id, uname, pass, lvl, name); 
                }
            }
            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List < User > selectAllUsers() {
    	System.out.println(SELECT_ALL_USERS);
        List < User > users = new ArrayList < > ();
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	if(rs.getString("lvl").equals("A")){
            		continue;
            	}
                int id = rs.getInt("id");
                String uname = rs.getString("uname");
                String pass = rs.getString("pass");
                String lvl = rs.getString("lvl");
                String name = rs.getString("name");
                if(lvl.equals("S")){
                	String scheme = rs.getString("scheme");
                	String year = rs.getString("year");	
                	new User(id, uname, pass, lvl, name, scheme, year).show();
                	users.add(new User(id, uname, pass, lvl, name, scheme, year));
               }
                else{
                users.add(new User(id, uname, pass, lvl, name));
                }
                
            }
            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public List < User > selectAllUsers(String year) {
    	student(year);
    	String online=null,paperName=null;
    	ExamDAO ed=new ExamDAO();
        List < User > users = new ArrayList < > ();
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            ResultSet rs = preparedStatement.executeQuery();
            PreparedStatement Statement = connection.prepareStatement("select online,paperName from "+year+"p where id =1;");
  	        ResultSet rss = Statement.executeQuery();
  	            if (rss.next()) {
  		             online = rss.getString("online");
  		             paperName = rss.getString("paperName");
  	            }
            while (rs.next()) {
                int id = rs.getInt("id");
                String uname = rs.getString("uname");
                String pass = rs.getString("pass");
                String lvl = rs.getString("lvl");
                String name = rs.getString("name");
                String scheme = rs.getString("scheme");
                String years = rs.getString("year");
                if(ed.find(id, online)){
                	if(tableExist(paperName+"s"+id)!=true){
                      	users.add(new User(id, uname, pass, lvl, name, scheme, years));
                	}
                }
               }
            Statement.close();
            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }
    
    public void deleteUser(int id) throws SQLException {
        //boolean rowDeleted;
    	System.out.println(DELETE_USERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {

        	 if(student!="Yes"){
        	PreparedStatement preparedStatement = connection.prepareStatement("select tableName from t"+id+" ;");
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
		                String tableName = rs.getString("tableName");
		               PreparedStatement statementd = connection.prepareStatement("drop table "+tableName+";");
		               
		               PreparedStatement lpreparedStatement = connection.prepareStatement("select studentPaper from l"+tableName+";");
	 	  	            ResultSet lrs = lpreparedStatement.executeQuery();
	 	  	         while (lrs.next()) {
	 	  	        	String studentTable = lrs.getString("studentPaper");
	 	  	        	PreparedStatement lstatementd = connection.prepareStatement("drop table "+studentTable +";");
	 	  	        	lstatementd.executeUpdate();
		 	  	        lstatementd.close();
	 	  	         }
	 	  	        lpreparedStatement.close();
	 	  	        
	 	  	         PreparedStatement Lstatementd = connection.prepareStatement("drop table l"+tableName +";");	         
	 	  	         Lstatementd.executeUpdate();
	 	  	         Lstatementd.close();
		        	   statementd.executeUpdate();
			            statementd.close();

	            }
            preparedStatement.close();
        	 }
            statement.setInt(1, id);
            System.out.println(statement);
           /* rowDeleted = */statement.executeUpdate() /*> 0*/;
           if(student!="Yes"){
        	   PreparedStatement statementd = connection.prepareStatement("drop table t"+id+";");
        	   statementd.executeUpdate();
           }
            statement.close();
        }
        data();
        //return rowDeleted;
    }

    public void updateUser(User user) throws SQLException {
        //boolean rowUpdated;
    	System.out.println(UPDATE_USERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            int i=0;
            
        	statement.setString(i+=1, user.getUname());
            statement.setString(i+=1, user.getPass());
            statement.setString(i+=1, user.getLvl());
            statement.setString(i+=1, user.getName());
            System.out.println(" w8 yes update scheme");
            if(student=="Yes"){
            	System.out.println("yes update scheme");
           	     statement.setString(i+=1, user.getScheme());
            }
            statement.setInt(i+=1, user.getId());
            /*rowUpdated = */statement.executeUpdate()/* > 0*/;
            statement.close();
        }
        //return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
    	System.out.println("sql error");
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    public boolean loginUser(User user){
    	System.out.println(PSWD);
        boolean access=false;
    	try {
        	Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(PSWD);
        	preparedStatement.setString(1,user.getUname());
        	preparedStatement.setString(2,user.getPass());
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                user.setId((rs.getInt("id")));
                user.setUname(rs.getString("uname"));
                user.setLvl(rs.getString("lvl"));
                user.setName(rs.getString("name")); 
                if(student=="Yes"){
                	user.setScheme(rs.getString("scheme"));
                	user.setYear(rs.getString("year"));
                }
                access=true;
            }
            else{
            	access=false;
            	
            }
            preparedStatement.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
    	return access;
    }
    public  boolean tableExist(String tableName) throws SQLException {
	 	Connection conn=getConnection();
	    boolean tExists = false;
	    try (ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null)) {
	        while (rs.next()) { 
	            String tName = rs.getString("TABLE_NAME");
	            if (tName != null && tName.equals(tableName)) {
	                tExists = true;
	                break;
	            }
	        }
	    }
	    return tExists;
	}
}
