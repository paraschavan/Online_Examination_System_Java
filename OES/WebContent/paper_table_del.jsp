<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>   
    <%@ page import="java.util.List" %>
       <%@ page import="oes.Paper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="button.css">
<script>
function clicked(e)
{
    if(!confirm('Are you sure?'))e.preventDefault();
}
</script>
</head>
<body>
<%

if(session.getAttribute("id")==null){
	 request.getRequestDispatcher("index.html").forward(request, response);			
}
if(session.getAttribute("papers")==null){
	
		User u=(User)session.getAttribute("id");
		switch(u.getLvl()){
		case "A":
    		request.getRequestDispatcher("admin.jsp").forward(request, response);
    		
    		break;
		case "T":
			request.getRequestDispatcher("teacher.jsp").forward(request, response);
		case "S":
			request.getRequestDispatcher("student.jsp").forward(request, response);
    		break;
    	default:
   		    request.getRequestDispatcher("index.html").forward(request, response);			
    		break;
		}
	}

%>
<div id='cssmenu'>
<ul>
	<%
		String jsp="";
		if((((User)(session.getAttribute("id"))).getLvl()).equals("A")){
			jsp="admin.jsp";
		}
		else if((((User)(session.getAttribute("id"))).getLvl()).equals("T")){
			jsp="teacher.jsp";
		}
		else if((((User)(session.getAttribute("id"))).getLvl()).equals("S")){
			jsp="student.jsp";
		}
		
			out.println("<li class='active'><a href='paper_table.jsp'>Table</a></li>");
			out.println("<li><a href=\""+jsp+"\">Home</a></li>");
				
   %>
    
</ul>
</div>
<%
		out.println("<div>");
		out.println("<form action=\"Exam\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_paper_page\">");
		out.println("<button type=\"submit\" class=\"button-secondary pure-button button-xlarge \">Add New Paper</button>");
		out.println("</form>");
		out.println("</div>");
	
%>
  <div style="height:90%;overflow:auto;">
<table>
 <tr>
<%
	out.println("<th>Select</th>");
	out.println("<th>Subject</th>");
	out.println("<th>Subject Code</th>");
	out.println("<th>Year</th>");
	out.println("<th>Action</th>");
  %>   
  </tr>
   
  <%
  	    List <Paper> papers =(List)session.getAttribute("papers");
  	for(Paper u: papers){

  			out.println("<tr>");
  			
  			out.println("<td><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"select\">");
  			out.println("<input type=\"hidden\" name=\"tableName\" value=\"" +u.getTableName() + "\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" +u.getId() + "\">");
  			out.println("<input type=\"hidden\" name=\"year\" value=\"" + u.getYear() + "\">");
  			out.println("<button class=\"button-warning  \">Select</button></form>");

  			out.println("<form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"result\">");
  			out.println("<input type=\"hidden\" name=\"listName\" value=\"" +u.getTableName() + "\">");
  			out.println("<input type=\"hidden\" name=\"resultAction\" value=\"edit\">");
  			out.println("<button class=\"button-warning  \">Result</button>");
  			
  			out.println("</form></td>");
  			
  			out.println("<td>"+u.getSub()+"</td>");
  			out.println("<td>"+u.getSubcode()+"</td>");
  			out.println("<td>"+u.getYear()+"</td>");
  			
  			out.println("<td><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"paper\">");
  			out.println("<input type=\"hidden\" name=\"tableName\" value=\"" +u.getTableName() + "\">");
  			
  			out.println("<button class=\"button-success \">Edit</button>");

  			out.println("</form>");
  			
  			out.println("<form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"delete\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			out.println("<button class=\"button-error  inline\" onclick=\"return confirm('Are you sure?')\">Delete</button>");
  			
  			out.println("</form></td>");
  		
  		out.println("</tr>");
  	}
  %>
  
</table>
</div>
</body>
</html>