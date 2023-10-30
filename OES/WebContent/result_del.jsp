<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>   
    <%@ page import="java.util.List" %>
       <%@ page import="oes.Result" %>
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
if(session.getAttribute("result")==null){
	
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
		String result=(String)session.getAttribute("resultAction");
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
		if(result.equals("show")){
			out.println("<li class='active'><a>Result</a></li>");
			out.println("<li><a href=\""+jsp+"\">LogOut</a></li>");
		}
		else{
			out.println("<li class='active'><a>Result</a></li>");
			out.println("<li><a href=\""+jsp+"\">Home</a></li>");
		}	
   %>
    
</ul>
</div>
  <div style="height:90%;overflow:auto;">
<table>
 <tr>
<%
if(result.equals("show")){
	out.println("<th>ID</th>");
	out.println("<th>Name</th>");
	out.println("<th>Scheme</th>");
	out.println("<th>Marks</th>");	
}
else{
	out.println("<th>Select</th>");
	out.println("<th>ID</th>");
	out.println("<th>Name</th>");
	out.println("<th>Scheme</th>");
	out.println("<th>Marks</th>");
	out.println("<th>Action</th>");
}
	
  %>   
  </tr>
   
  <%
  	    List <Result> list =(List)session.getAttribute("result");
  	for(Result l: list){
  		if(result.equals("show")){
  			out.println("<tr>");
  			out.println("<td>"+l.getUname()+"</td>");
  			out.println("<td>"+l.getName()+"</td>");
  			out.println("<td>"+l.getScheme()+"</td>");
  			out.println("<td>"+l.getMarks()+"</td>");
  	  		out.println("</tr>");
  		}
  		else{
  			out.println("<tr>");
  			
  			out.println("<td><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"showPaper\">");
  			out.println("<input type=\"hidden\" name=\"sid\" value=\"" +l.getSid()+ "\">");
  			out.println("<input type=\"hidden\" name=\"name\" value=\"" +l.getName()+ "\">");
  			out.println("<input type=\"hidden\" name=\"uname\" value=\"" +l.getUname()+ "\">");
  			out.println("<button class=\"button-warning  \">Select</button>");

  			out.println("</form></td>");
  			
  			out.println("<td>"+l.getUname()+"</td>");
  			out.println("<td>"+l.getName()+"</td>");
  			out.println("<td>"+l.getScheme()+"</td>");
  			out.println("<td>"+l.getMarks()+"</td>");
  			  			
  			out.println("<td><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"deletePaper\">");
  			out.println("<input type=\"hidden\" name=\"paperName\" value=\"" +l.getPaperName() + "\">");
  			out.println("<input type=\"hidden\" name=\"sid\" value=\"" +l.getSid() + "\">");
  			out.println("<button class=\"button-error  inline\" onclick=\"return confirm('Are you sure?')\">Delete</button>");
  			
  			out.println("</form></td>");
  		
  		out.println("</tr>");
  		}
  	}
  %>
  
</table>
</div>
</body>
</html>