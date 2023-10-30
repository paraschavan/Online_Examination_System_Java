<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.UserDAO,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="table.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="button.css">
<title>Insert title here</title>
</head>
<body>
  <div style="height:auto;overflow:auto;">
<table>
 <tr>
<%
	out.println("<th>ID</th>");
	out.println("<th>Name</th>");
	out.println("<th>Year</th>");
   	out.println("<th>Action</th>");   
%>
  </tr>
  <%
  		UserDAO ud=new UserDAO();
  	    List <User> users =ud.selectAllUsers((String)session.getAttribute("year"));
  	for(User u: users){
  			out.println("<tr>");
  			out.println("<td>"+u.getUname()+"</td>");
  			out.println("<td>"+u.getName()+"</td>");
  			out.println("<td>"+u.getYear()+"</td>");

  			
  			out.println("<td><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"remove_student\">");
  			out.println("<input type=\"hidden\" name=\"year\" value=\"" + u.getYear() + "\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			out.println("<button class=\"button-error pure-button \">Remove</button>");

  			out.println("</form>");
  			
  		out.println("</tr>");
  	}
  %>
  
</table>
</div>
</body>
</html>