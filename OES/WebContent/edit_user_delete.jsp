<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/form.css">

<link rel="stylesheet" type="text/css" href="./css/styles.css">

</head>
<body>
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
		
			out.println("<li class='active'><a href=\""+jsp+"\">Home</a></li>");
		
   %>
    
</ul>
</div>
<div class="form-style-8">
<%
if((session.getAttribute("action").equals("add_user_page"))){
	if(session.getAttribute("table").equals("staff")){
		out.println("<h2>Add New Teacher</h2>");
	}
	else if(session.getAttribute("table").equals("student")){
		out.println("<h2>Add New Student</h2>");
	}
	out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
	out.println("<input type=\"hidden\" name=\"action\" value=\"add_user\">");
	out.println("<input type=\"text\" name=\"name\" placeholder=\"Enter Full Name\" required=\"required\">");
	out.println("<input type=\"text\" name=\"uname\" placeholder=\"User ID\" required=\"required\">");
	out.println("<input type=\"password\" name=\"pass\" placeholder=\"Enter Password\" required=\"required\">");
	if(((String)session.getAttribute("table")).equals("student")){
		out.println("<input type=\"text\" name=\"scheme\"  max-length=\"1\" pattern=\"[ABCDEFGHIJKLMNOPQRSTUVWXYZ]\" placeholder=\"Enter Scheme (Example: I)\"I\"\" required=\"required\">");
		out.println("<div class=\"inline\">");
		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-three\" name=\"table\" value=\"y1\" checked>");
		out.println("<label for=\"radio-three\">1<sup>st</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-four\" name=\"table\" value=\"y2\" >");
		out.println("<label for=\"radio-four\">2<sup>nd</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-five\" name=\"table\" value=\"y3\" >");
		out.println("<label for=\"radio-five\">3<sup>rd</sup> Year</label>");
		out.println("</div>");
		out.println("</div>");
	}
	out.println("<input type=\"submit\" value=\"Create\">");
	out.println("</form>");
}
else if((session.getAttribute("action").equals("edit_user_table"))){
	if(session.getAttribute("table").equals("staff")){
		out.println("<h2>Edit Teacher</h2>");
		out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_update\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+((User)(session.getAttribute("user"))).getId() + "\">");
		out.println("<input type=\"text\" name=\"name\" placeholder=\"Enter Full Name: "+((String)((User)(session.getAttribute("user"))).getName()) + "\" required=\"required\">");
		out.println("<input type=\"text\" name=\"uname\" placeholder=\"User ID: "+((User)(session.getAttribute("user"))).getUname() + "\" required=\"required\"/>");
		out.println("<input type=\"password\" name=\"pass\" placeholder=\"Enter New Password\" required=\"required\"/>");
	}
	else if(session.getAttribute("table").equals("student")){
		out.println("<h2>Edit Student</h2>");
		out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_update\">");
		out.println("<input type=\"hidden\" name=\"st\" value=\""+session.getAttribute("st")+"\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+((User)(session.getAttribute("user"))).getId() + "\">");
		out.println("<input type=\"text\" name=\"name\" placeholder=\"Enter Full Name: "+((String)((User)(session.getAttribute("user"))).getName()) + "\" required=\"required\">");
		out.println("<input type=\"text\" name=\"uname\" placeholder=\"User ID: "+((String)((User)(session.getAttribute("user"))).getUname()) + "\" required=\"required\"/>");
		out.println("<input type=\"text\" name=\"scheme\"  max-length=\"1\" pattern=\"[ABCDEFGHIJKLMNOPQRSTUVWXYZ]\" placeholder=\"Enter Scheme: "+((User)(session.getAttribute("user"))).getScheme() + "\" required=\"required\">");
		out.println("<input type=\"password\" name=\"pass\" placeholder=\"Enter New Password\" required=\"required\"/>");
		
	}
	
	out.println("<input type=\"submit\" value=\"Update\">");
	out.println("</form>");
}
%>  
</div>
</body>
</html>