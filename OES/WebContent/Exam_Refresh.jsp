<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.io.*,java.text.*,java.util.*,oes.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     
<% 
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
Calendar cal = Calendar.getInstance();
out.println(dateFormat.format(cal.getTime()));
%> 
<%
	User u=((User)session.getAttribute("id"));
	ExamDAO ed=new ExamDAO();
	int id=u.getId();
	String year=u.getYear();
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
		if(ed.show(year, id)){
			request.getRequestDispatcher("index.html").forward(request, response);
		}
		else{
		}
%>
</body>
</html>