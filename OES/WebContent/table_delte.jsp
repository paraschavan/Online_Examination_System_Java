<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,java.util.List"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/table.css">

<link rel="stylesheet" type="text/css" href="./css/button.css">
<script>
function clicked(e)
{
    if(!confirm('Are you sure?'))e.preventDefault();
}
</script>
</head>
<body>
<%
System.out.println("in table.jsp");
System.out.println("b id null");
if(session.getAttribute("id")==null){
	System.out.println("in id null");
	 request.getRequestDispatcher("index.html").forward(request, response);			
}
System.out.println("b user null");
if(session.getAttribute("users")==null){
	
	System.out.println("in user null");
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
		
		if(((String)session.getAttribute("table")).equals("staff")){
			out.println("<li class='active'><a href='table.jsp'>Table</a></li>");
			out.println("<li><a href=\""+jsp+"\">Home</a></li>");
		}
		else{
			String w1="",w2="",w3="";
			out.println("<li><a href=\""+jsp+"\">Home</a></li>");
			if(((String)session.getAttribute("st")).equals("y1")){
				w1="class=\"active\"";
			}
			else if(((String)session.getAttribute("st")).equals("y2")){
				w2="class=\"active\"";
			}
			else if(((String)session.getAttribute("st")).equals("y3")){
				w3="class=\"active\"";
			}
			out.println("<li "+w1+"><a href=\"UserServlet?action=edit_user_table&table=student&st=y1\">1<sup>st</sup> Year</a></li>");
			
			out.println("<li "+w2+"><a href=\"UserServlet?action=edit_user_table&table=student&st=y2\">2<sup>nd</sup> Year</a></li>");
			
			out.println("<li "+w3+"><a href=\"UserServlet?action=edit_user_table&table=student&st=y3\">3<sup>rd</sup> Year</a></li>");
			
		}
		
   %>
    
</ul>
</div>
<%

		out.println("<div>");
		out.println("<form action=\"UserServlet\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");
		if(session.getAttribute("table").equals("staff")){
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");
			out.println("<input type=\"hidden\" name=\"table\" value=\"staff\">");
			out.println("<button type=\"submit\" class=\"button-secondary pure-button button-xlarge \">Add New Teacher</button>");
		}
		else if(session.getAttribute("table").equals("student")){
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");
			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
			out.println("<button type=\"submit\" class=\"button-secondary pure-button button-xlarge \">Add New Student</button>");
		}
		out.println("</form>");
		out.println("</div>");
	 
%>
  <div style="height:90%;overflow:auto;">
<table>
 <tr>
<%
if(session.getAttribute("table").equals("staff")){
	out.println("<th>ID</th>");
	out.println("<th>Name</th>");
	out.println("<th>Account Level</th>");
}
else{
	out.println("<th>ID</th>");
	out.println("<th>Name</th>");
	out.println("<th>Account Level</th>");
	out.println("<th>Scheme</th>");
	out.println("<th>Year</th>");
}

    	out.println("<th>Action</th>");
   
    %>
  </tr>
   
  <%
  	    List <User> users =(List)session.getAttribute("users");
  	for(User u: users){
  		if(session.getAttribute("table").equals("staff")){
  			out.println("<tr>");
  			out.println("<td>"+u.getUname()+"</td>");
  			out.println("<td>"+u.getName()+"</td>");
  			out.println("<td>"+u.getLvl()+"</td>");
  		}
  		else{
  			out.println("<tr>");
  	  		out.println("<td>"+u.getUname()+"</td>");
  	  		out.println("<td>"+u.getName()+"</td>");
  	  		out.println("<td>"+u.getLvl()+"</td>");
  	  		out.println("<td>"+u.getScheme()+"</td>");
  			out.println("<td>"+u.getYear()+"</td>");
  			
  		}
  			
  			out.println("<td><form method=\"post\" action=\"UserServlet\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_page\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			if(((String)session.getAttribute("table")).equals("student")){
  				out.println("<input type=\"hidden\" name=\"table\" value=\"" + (String)session.getAttribute("st") + "\">");
  			}
  			out.println("<button class=\"button-success pure-button \">Update</button>");

  			out.println("</form>");
  			
  			out.println("<form method=\"post\" action=\"UserServlet\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"delete\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			out.println("<button class=\"button-error pure-button inline\" onclick=\"return confirm('Are you sure?')\">Delete</button>");
  			
  			out.println("</form></td>");
  		
  		out.println("</tr>");
  	}
  %>
  
</table>
</div>
</body>
</html>