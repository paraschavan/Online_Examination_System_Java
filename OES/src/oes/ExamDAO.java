package oes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/oes";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vdf@oes";
	private String paperName=null,sid=null;
	
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
	 
	 public boolean insertSub(Paper paper) throws SQLException {
		 	boolean c=false;
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("INSERT INTO "+paper.getTt()+"  (subject, subjectCode, year,tableName) VALUES " +" (?,?,?,?);")) {
	        	statement.setString(1, paper.getSub());
	            statement.setString(2, paper.getSubcode());
	            statement.setString(3, paper.getYear());
	            statement.setString(4, paper.getTableName());
	            String table= paper.getTableName();
	            if(tableExist(table.toLowerCase())){
	            	c = false;
	            	System.out.println("Table already exist");
	            }
	            else{
	            statement.executeUpdate();
	            PreparedStatement Statement =connection.prepareStatement("CREATE TABLE "+paper.getTableName()+" ( id int unsigned NOT NULL auto_increment, qt varchar(3) NOT NULL, q varchar(512) NOT NULL, a varchar(255) NOT NULL, b varchar(255) NOT NULL,  c varchar(255) NOT NULL, d varchar(255) NOT NULL, ans varchar(1) NOT NULL, m int(100) NOT NULL, PRIMARY KEY (id));");
	            Statement.executeUpdate();
	            PreparedStatement lstatement =connection.prepareStatement("CREATE TABLE l"+paper.getTableName()+" ( id int unsigned NOT NULL auto_increment, studentID varchar(255) NOT NULL, studentUname varchar(255) NOT NULL, studentName varchar(255) NOT NULL, studentPaper varchar(255) NOT NULL, year varchar(8) NOT NULL, scheme varchar(8) NOT NULL, marks varchar(10), time int(10), PRIMARY KEY (id));");
	            lstatement.executeUpdate();
	            statement.close();
	            Statement.close();
	            c = true;
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return c;
	    }
	 
	 public void insertQ(Question Q,String tableName) throws SQLException {
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("INSERT INTO "+tableName+"  (qt,q,a,b,c,d,ans,m) VALUES " +" (?,?,?,?,?,?,?,?);")) {
	        	statement.setString(1, Q.getQt());
	            statement.setString(2, Q.getQ());
	            statement.setString(3, Q.getA());
	            statement.setString(4, Q.getB());
	            statement.setString(5, Q.getC());
	            statement.setString(6, Q.getD());
	            statement.setString(7, Q.getAns());
	            statement.setInt(8, Q.getM());	      
	            statement.executeUpdate();
	            statement.close();
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public void setPaperName(String paperName){
		 this.paperName=paperName;
	 }
	 public String getPaperName(){
		 return this.paperName;
	 }
	 public void setSid(String sid){
		 this.sid=sid;
	 }
	 public String getSid(){
		 return this.sid;
	 }
	 public boolean inTable(int id,String year) throws SQLException {
		 boolean con=false;
	        //boolean rowDeleted;
		  	switch(year){
		  	case"1st Year":
		  		year="y1p";
		  		break;
		  	case"2nd Year":
		  		year="y2p";
		  		break;
		  	case"3rd Year":
		  		year="y3p";
		  		break;
		  	}
	        try (Connection connection = getConnection();) {
 
	        	 PreparedStatement preparedStatement = connection.prepareStatement("select online from "+year+" where id =1;");
	  	         ResultSet rs = preparedStatement.executeQuery();
	  	            while (rs.next()) {
	  		             String online = rs.getString("online");
	  		            	 if(find(id, online)==true){
	 	  		            	con=true;
	  		             }
	  	             
	  			  	          
	  	            }
		            preparedStatement.close();
	        	
		       
	        }
	        return con;
	    }
	 public boolean show(String year,int id) throws SQLException{
		 boolean send=false;
		 switch(year){
		  	case"1st Year":
		  		year="y1";
		  		break;
		  	case"2nd Year":
		  		year="y2";
		  		break;
		  	case"3rd Year":
		  		year="y3";
		  		break;
		  	}
		 try (Connection connection = getConnection();) {
			 PreparedStatement oStatement = connection.prepareStatement("select paperName from "+year+"p ;");
   	         ResultSet rss = oStatement.executeQuery();
   	            if (rss.next()) {
   		             paperName = rss.getString("paperName");
   		             setPaperName(paperName);
		             setSid(paperName+"s"+id);
   		             if(tableExist(getSid().toLowerCase())){
   		            	 send=true;
   		             }
   	            }
   	         oStatement.close();
		 }
		 return send;
	 }
	 public int timeLeft() throws SQLException{
		 int time=0;
		 try (Connection connection = getConnection();) {
		 PreparedStatement oStatement = connection.prepareStatement("select time from l"+paperName+" where studentPaper='"+sid+"';");
	         ResultSet rss = oStatement.executeQuery();
	            if (rss.next()) {
	            	time=rss.getInt("time");
	            }
	         oStatement.close();
	     }catch (SQLException e) {
	            printSQLException(e);
	        }
		 return time;
	 }
	 public int time_() throws SQLException{
		 int time=0;
		 try (Connection connection = getConnection();) {
		 PreparedStatement oStatement = connection.prepareStatement("select time from l"+paperName+" where studentPaper='"+sid+"';");
	         ResultSet rss = oStatement.executeQuery();
	            if (rss.next()) {
	            	time=rss.getInt("time");
	            }
	            PreparedStatement statement = connection.prepareStatement("update  l"+paperName+" set time ="+(--time)+" where studentPaper='"+sid+"';");
	            statement.executeUpdate();
	            statement.close();
	         oStatement.close();
	     
	     }catch (SQLException e) {
	            printSQLException(e);
	        }
		 
		 return time--;
	 }
	 public void insertStudentTable(Paper paper,int time) throws SQLException {
	        try (Connection connection = getConnection();) {
	        	
	        	 String num="",online="",year="";
	        	 switch(paper.getYear()){
	 		  	case"1st Year":
	 		  		year="y1";
	 		  		break;
	 		  	case"2nd Year":
	 		  		year="y2";
	 		  		break;
	 		  	case"3rd Year":
	 		  		year="y3";
	 		  		break;
	 		  	}
	        	 System.out.println(year);
	        	 PreparedStatement oStatement = connection.prepareStatement("select online from "+year+"p ;");
	   	         ResultSet rss = oStatement.executeQuery();
	   	            if (rss.next()) {
	   		             online = rss.getString("online");
	   	            }
	   	         oStatement.close();
	    		 for(int i=0;i<online.length();i++){
	    			if(online.charAt(i)==','){
	    				 if(tableExist(paper.getTableName().toLowerCase()+"s"+num)==false){
	    					PreparedStatement Statement =connection.prepareStatement("CREATE TABLE "+paper.getTableName()+"s"+num+" ( id int unsigned NOT NULL auto_increment, qt varchar(3) NOT NULL, q varchar(512) NOT NULL, a varchar(255) NOT NULL, b varchar(255) NOT NULL,  c varchar(255) NOT NULL, d varchar(255) NOT NULL, ans varchar(1) NOT NULL, m int(10) NOT NULL, sans varchar(14000), sm int(10) NOT NULL, PRIMARY KEY (id));");
	 	    	            Statement.executeUpdate();
	 	    	            Statement.close();
	 	    	            
	 	    	           PreparedStatement preparedStatement = connection.prepareStatement("select id,qt,q,a,b,c,d,ans,m from "+paper.getTableName()+";");
	 	    		            ResultSet rs = preparedStatement.executeQuery();
	 	    		            while (rs.next()) {
	 	    			               
	 	    			               PreparedStatement statement = connection.prepareStatement("INSERT INTO "+paper.getTableName()+"s"+num+"  (qt,q,a,b,c,d,ans,m,sans,sm) VALUES " +" (?,?,?,?,?,?,?,?,?,?);");
	 	    			  	        	statement.setString(1, rs.getString("qt"));
	 	    			  	            statement.setString(2, rs.getString("q"));
	 	    			  	            statement.setString(3, rs.getString("a"));
	 	    			  	            statement.setString(4, rs.getString("b"));
	 	    			  	            statement.setString(5, rs.getString("c"));
	 	    			  	            statement.setString(6, rs.getString("d"));
	 	    			  	            statement.setString(7, rs.getString("ans"));
	 	    			  	            statement.setInt(8, rs.getInt("m"));
	 	    			  	            statement.setString(9, "");
	 	    			  	            statement.setInt(10, 0);
	 	    			  	            statement.executeUpdate();
	 	    			  	            statement.close();
	 	    			  	            
	    				 }
	 	    		           PreparedStatement spreparedStatement = connection.prepareStatement("select id,uname,name,year,scheme from "+year+" where id ="+num+";");
    			  	            System.out.println("select id,uname,name,year from "+year+" where id ="+num+";");
    			  	            ResultSet srs = spreparedStatement.executeQuery();
    			  	            while (srs.next()) {
    			  	            	PreparedStatement tstatement = connection.prepareStatement("INSERT INTO l"+paper.getTableName()+" (studentID,studentUname,studentName,studentPaper,year,scheme,marks,time) VALUES " +" (?,?,?,?,?,?,?,?);");	 	    			  	                 
    			  	            	 tstatement.setString(1, srs.getString("id"));
    			  	            	 tstatement.setString(2, srs.getString("uname"));
    			  	                 tstatement.setString(3, srs.getString("name"));
    			  	                 tstatement.setString(4, (paper.getTableName()+"s"+num).toLowerCase());
    			  	                 tstatement.setString(5,srs.getString("year"));
    			  	                 tstatement.setString(6,srs.getString("scheme"));
    			  	                 tstatement.setString(7, "");
    			  	                 tstatement.setInt(8, time*60);
    			  	                 tstatement.executeUpdate();
    			  	                 tstatement.close();
    			  	             }
    			  	 
    		            
    			  	    spreparedStatement.close();     
	 	    		            preparedStatement.close();


	    					num="";
	    					
	    			}
	    			}
	    			else{
	    			 num+=online.charAt(i);
	    			}
	    		 
	        	
	        }
	        }catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public void answer(String sans,int id) throws SQLException {
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("update "+sid+" set sans='"+sans+"' where id="+id+";");){	
        	System.out.println(statement+"	sans="+sans+"   id="+id);
	            statement.executeUpdate();
	            statement.close();
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public void result() throws SQLException {
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from "+sid+";")) {
	        	System.out.println(preparedStatement);
	            ResultSet rs = preparedStatement.executeQuery();
	            int marks=0,smarks=0;
	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String qt = rs.getString("qt");
	                String q = rs.getString("q");
	                String a = rs.getString("a");
	                String b = rs.getString("b");
	                String c = rs.getString("c");
	                String d = rs.getString("d");
	                String ans = rs.getString("ans");
	                int m = rs.getInt("m");
	                String sans = rs.getString("sans"); 
	                int sm = rs.getInt("sm");
	                System.out.println(ans+" "+sans);
	                System.out.println(m+" "+sm);
	                if(qt.equals("MCQ")){
	                	if(ans.equals(sans)){
	                		 PreparedStatement statement = connection.prepareStatement("update "+sid+" set sm ="+m+" where id='"+id+"';");
	                		 System.out.println(statement);
	         	            statement.executeUpdate();
	         	            statement.close();
	         	            smarks+=m;
	                	}
	                }
	                marks+=m;                
	            }
	            System.out.println(smarks+"/"+marks);
	            PreparedStatement lstatement = connection.prepareStatement("update l"+paperName+" set marks ='"+smarks+"/"+marks+"', time=0 where studentPaper='"+sid+"';");
	            System.out.println(lstatement);
 	            lstatement.executeUpdate();
 	            lstatement.close();
	            preparedStatement.close();
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public void result(String sid,String paperName) throws SQLException {
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select m,sm from "+sid+";")) {
	        	System.out.println(preparedStatement);
	            ResultSet rs = preparedStatement.executeQuery();
	            int marks=0,smarks=0;
	            while (rs.next()) {
	                int m = rs.getInt("m");
	                int sm = rs.getInt("sm");
	                smarks+=sm;  
	                marks+=m;                
	            }
	            System.out.println(smarks+"/"+marks);
	            PreparedStatement lstatement = connection.prepareStatement("update l"+paperName+" set marks ='"+smarks+"/"+marks+"', time=0 where studentPaper='"+sid+"';");
	            System.out.println(lstatement);
	            lstatement.executeUpdate();
	            lstatement.close();
	            preparedStatement.close();
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public void marks(String sid,String paperName,int m,int id) throws SQLException {
	        try (Connection connection = getConnection();) {            
	                		 PreparedStatement statement = connection.prepareStatement("update "+sid+" set sm ="+m+" where id='"+id+"';");
	                		 System.out.println(statement);
	         	            statement.executeUpdate();
	         	            statement.close();
	         	           System.out.println(sid+"			"+paperName);
	         	            result(sid,paperName);
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	 }
	 public List < Result > list() throws SQLException {
    	 List < Result > list = new ArrayList < > ();
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from l"+paperName+";")) {
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	            	if(rs.getInt("time")==0){
	                int id = rs.getInt("id");
	                String uname = rs.getString("studentUname");
	                String name = rs.getString("studentName");
	                String marks = rs.getString("marks"); 
	                String scheme = rs.getString("scheme");
	                list.add(new Result(id, uname, name, marks, paperName, sid, scheme));
	            	}
	              }
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	        return list;
	 }
	 
	 public List < Result > list(String paperName) throws SQLException {
    	 List < Result > list = new ArrayList < > ();
	        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("select * from l"+paperName+";")) {
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	            	if(rs.getInt("time")==0){
	                int id = rs.getInt("id");
	                String uname = rs.getString("studentUname");
	                String name = rs.getString("studentName");
	                String marks = rs.getString("marks"); 
	                String sid=rs.getString("studentPaper"); 
	                String scheme = rs.getString("scheme");
	                list.add(new Result(id, uname, name, marks, paperName, sid, scheme));
	            	}
	              }
	            }
	         catch (SQLException e) {
	            printSQLException(e);
	        }
	        return list;
	 }
	 
	 public void deletePaper(String paperName,String sid) throws SQLException {
	        //boolean rowDeleted;
		 System.out.println(paperName+"  "+sid);
	        try (Connection connection = getConnection();) {
	        	PreparedStatement lstatementd = connection.prepareStatement("drop table "+sid +";");
	  	        lstatementd.executeUpdate();
 	  	        lstatementd.close();
 	  	     PreparedStatement statement = connection.prepareStatement("delete from l"+paperName+" where studentPaper ='"+sid+"';"); 
	            statement.executeUpdate();    
	        }
	    }
	 
	 public Paper selectPaper(int id,String table) {
	        Paper paper = null;
	        try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("select id,subject,subjectCode,year,tableName from "+table+" where id =?;");) {
	            preparedStatement.setInt(1, id);
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	            		int idN = rs.getInt("id");
		                String sub = rs.getString("subject");
		                String subCode = rs.getString("subjectCode");
		                String year = rs.getString("year");
		                String tableName = rs.getString("tableName");
		               
		                paper=new Paper(idN, table, sub, subCode, year, tableName);
	            }
	            preparedStatement.close();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return paper;
	    }
	 
	 public Question selectQuestion(int id,String table) {
	        Question question = null;
	        try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("select id,qt,q,a,b,c,d,ans,m from "+table+" where id =?;");) {
	            preparedStatement.setInt(1, id);
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	            		int idN = rs.getInt("id");
		                String qt = rs.getString("qt");
		                String q = rs.getString("q");
		                String a = rs.getString("a");
		                String b = rs.getString("b");
		                String c = rs.getString("c");
		                String d = rs.getString("d");
		                String ans = rs.getString("ans");
		                int m=rs.getInt("m");
		               
		                question=new Question(idN, qt, q, a, b, c, d, ans, m);
	            }
	            preparedStatement.close();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return question;
	    }
	 
	 public List < Paper > selectAllPapers(String table) {
	        List < Paper > papers = new ArrayList < > ();
	        try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("select * from "+table+";")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String sub = rs.getString("subject");
	                String subCode = rs.getString("subjectCode");
	                String year = rs.getString("year");
	                String tableName = rs.getString("tableName");
	               
	                papers.add(new Paper(id, table, sub, subCode, year, tableName));
	             
	            }
	            preparedStatement.close();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return papers;
	    }
	 
	 public List < Question > selectAllQuestion(String table) {
	        List < Question > questions = new ArrayList < > ();
	        try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("select * from "+table+";")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String qt = rs.getString("qt");
	                String q = rs.getString("q");
	                String a = rs.getString("a");
	                String b = rs.getString("b");
	                String c = rs.getString("c");
	                String d = rs.getString("d");
	                String ans = rs.getString("ans");
	                int m = rs.getInt("m");
	               
	                questions.add(new Question(id, qt, q, a, b, c, d, ans, m));
	             
	            }
	            preparedStatement.close();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        System.out.println(questions.size());
	        return questions;
	    }
	 
	 public List < Question > examQuestions(String table) {
	        List < Question > questions = new ArrayList < > ();
	        try (Connection connection = getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("select * from "+table+";")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String qt = rs.getString("qt");
	                String q = rs.getString("q");
	                String a = rs.getString("a");
	                String b = rs.getString("b");
	                String c = rs.getString("c");
	                String d = rs.getString("d");
	                String ans = rs.getString("ans");
	                int m = rs.getInt("m");
	                String sans = rs.getString("sans"); 
	                int sm = rs.getInt("sm");
	                questions.add(new Question(id, qt, q, a, b, c, d, ans, m, sans, sm));	             
	            }
	            preparedStatement.close();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return questions;
	    }
	 
	 public void updatePaper(Paper paper) throws SQLException {
	        //boolean rowUpdated;
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("update "+paper.getTt()+" set subject =?,subjectCode =?, year =?, tabelName=?, scheme=? where id =?;");) {

	        	/*statement.setString(1, paper.getUname());
	            statement.setString(1, paper.getPass());
	            statement.setString(1, paper.getLvl());
	            statement.setString(1, paper.getName());
	            statement.setInt(1, paper.getId());*/
	            /*rowUpdated = */statement.executeUpdate()/* > 0*/;
	            statement.close();
	        }
	        //return rowUpdated;
	    }
	 
	 public void updateQuestion(Question Q,String table) throws SQLException {
	        //boolean rowUpdated;
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("update "+table+" set qt=?,q=?,a=?,b=?,c=?,d=?,ans=?,m=? where id =?;");) {

	        	statement.setString(1, Q.getQt());
	            statement.setString(2, Q.getQ());
	            statement.setString(3, Q.getA());
	            statement.setString(4, Q.getB());
	            statement.setString(5, Q.getC());
	            statement.setString(6, Q.getD());
	            statement.setString(7, Q.getAns());
	            statement.setInt(8, Q.getM());	     
	            statement.setInt(9, Q.getId());
	            /*rowUpdated = */statement.executeUpdate()/* > 0*/;
	            statement.close();
	        }
	        //return rowUpdated;
	    }
	 
	  public void deletePage(int id,String table) throws SQLException {
	        //boolean rowDeleted;
	        try (Connection connection = getConnection();) {
	        	    PreparedStatement preparedStatement = connection.prepareStatement("select tableName from "+table+" where id =?;");
	  	            preparedStatement.setInt(1, id);
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

	  	            
		        	  PreparedStatement statement = connection.prepareStatement("delete from "+table+" where id =?;"); 
	            statement.setInt(1, id);
	            statement.executeUpdate();    
	            
	            statement.close();
	        }
	        //return rowDeleted;
	    }
	 
	  public void deleteQuestion(int id,String table) throws SQLException {
	        //boolean rowDeleted;
	        try (Connection connection = getConnection();) {
        
		        PreparedStatement statement = connection.prepareStatement("delete from "+table+" where id =?;"); 
	            statement.setInt(1, id);
	            statement.executeUpdate();    
	            
	            statement.close();
	        }
	        //return rowDeleted;
	    }
	  
	  //exam here
	  public void setPaper(String table,String year) throws SQLException {
	        //boolean rowDeleted;
		  	
	        try (Connection connection = getConnection();) {
      
		        PreparedStatement statement = connection.prepareStatement("update "+year+"p set paperName =?,time =0, online ='' where id =1;"); 
		        statement.setString(1, table);
	            statement.executeUpdate();       
	            statement.close();
	        }
	        //return rowDeleted;
	    }
	  /*public void setTime(String year,int time) throws SQLException{
		  switch(year){
		  	case"1st Year":
		  		year="y1p";
		  		break;
		  	case"2nd Year":
		  		year="y2p";
		  		break;
		  	case"3rd Year":
		  		year="y3p";
		  		break;
		  	}
		  try (Connection connection = getConnection();) {
		  PreparedStatement statement = connection.prepareStatement("update "+year+" set time =? where id =1;"); 
	            statement.setInt(1, time);
	            statement.executeUpdate();       
	            statement.close();
		  }
		  
	  }*/
	  public void attendance(int id,String year,String condition) throws SQLException {
	        //boolean rowDeleted;
		  	switch(year){
		  	case"1st Year":
		  		year="y1p";
		  		break;
		  	case"2nd Year":
		  		year="y2p";
		  		break;
		  	case"3rd Year":
		  		year="y3p";
		  		break;
		  	}
	        try (Connection connection = getConnection();) {
    
	        	 PreparedStatement preparedStatement = connection.prepareStatement("select online from "+year+" where id =1;");
	  	         ResultSet rs = preparedStatement.executeQuery();
	  	            while (rs.next()) {
	  		             String online = rs.getString("online");
	  		             if(condition.equals("A")){
	  		            	 if(find(id, online)==false){
	 	  		            	online+=id+","; 
	  		            	 }
	  		             }
	  		             else{ 
	  		            	 online=remove(id, online);
	  		             }
	 	  		            	PreparedStatement statement = connection.prepareStatement("update "+year+" set online =? where id =1;"); 
	 		  		            statement.setString(1, online);
	 		  		            statement.executeUpdate();       
	 		  		            statement.close();
	 	  		            
	  		             
	  			  	          
	  	            }
		            preparedStatement.close();
	        	
		       
	        }
	        //return rowDeleted;
	    }
	 public boolean find(int id,String online){
		 String num="";
		 boolean condition=false;
		 for(int i=0;i<online.length();i++){
			if(online.charAt(i)==','){
				if(num.equals(Integer.toString(id))){
					condition=true;
					break;
				}
				else{
					num="";
				}	
			}
			else{
			 num+=online.charAt(i);
			}
		 }
		 return condition;
	 }
	 
	 public String remove(int id,String online){
		 String num="";
		 int s=0,e=0;
		 for(int i=0;i<online.length();i++){
			if(online.charAt(i)==','){
				e=i;
				if(num.equals(Integer.toString(id))){
					 num="";
					 for(int j=0;j<online.length();j++){
						if(j>=s&&j<=e){
							continue;
						}
						num+=online.charAt(j);
					 }
					break;
				}
				else{
					num="";
					s=i+1;
				}	
			}
			else{
			 num+=online.charAt(i);
			 
			}
		 }
 
		 return num;
	 }
	 
	 public String br(String question){
			String a="",b="",c="";
			for(int i=0;i<question.length();i++){
				if(((int)question.charAt(i))==10){
					
					for(int k=i+1;k<question.length();k++){
						c+=question.charAt(k);
					}
					a+="<br>";
					b=a+c;
					c="";
				}
				else if(((int)question.charAt(i))==32){
					for(int k=i+1;k<question.length();k++){
						c+=question.charAt(k);
					}
					a+="&nbsp";
					b=a+c;
					c="";
				}
				else{
					a+=question.charAt(i);
				}
			} 
			if(b.equals("")){
				return a;
			}
			else{
				return b;
			}
			
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
	 
}
