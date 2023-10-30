<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.Paper"%>
     <%@ page import="java.util.List" %>
       <%@ page import="oes.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add paper jsp</title>
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="styles.css">
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
if((session.getAttribute("action").equals("add_paper_page"))){
		out.println("<h2>Add New Paper</h2>");
		out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_paper\">");
		out.println("<input type=\"text\" name=\"sub\" placeholder=\"Enter Subject Name\" required=\"required\">");
		out.println("<input type=\"text\" name=\"subCode\" placeholder=\"Enter Subject Code\" required=\"required\">");
		out.println("<div class=\"inline\">");
		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-three\" name=\"year\" value=\"1st Year\" required=\"required\">");
		out.println("<label for=\"radio-three\">1<sup>st</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-four\" name=\"year\" value=\"2nd Year\" required=\"required\">");
		out.println("<label for=\"radio-four\">2<sup>nd</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-five\" name=\"year\" value=\"3rd Year\" required=\"required\">");
		out.println("<label for=\"radio-five\">3<sup>rd</sup> Year</label>");
		out.println("</div>");
		out.println("</div>");
	out.println("<input type=\"submit\" value=\"Create\">");
	out.println("</form>");
	}
else{
		out.println("<h2>Edit Paper</h2>");
		out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"edit_paper_update\">");
		out.println("<input type=\"text\" name=\"sub\" placeholder=\"Enter Subject Name: "+((String)((Paper)(session.getAttribute("paper"))).getSub()) + "\" required=\"required\">");
		out.println("<input type=\"text\" name=\"subCode\" placeholder=\"Enter Subject Code: "+((Paper)(session.getAttribute("paper"))).getSubcode() + "\" required=\"required\"/>");
		out.println("<div class=\"inline\">");
		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-three\" name=\"year\" value=\"1st Year\" checked>");
		out.println("<label for=\"radio-three\">1<sup>st</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-four\" name=\"year\" value=\"2nd Year\" >");
		out.println("<label for=\"radio-four\">2<sup>nd</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-five\" name=\"year\" value=\"3rd Year\" >");
		out.println("<label for=\"radio-five\">3<sup>rd</sup> Year</label>");
		out.println("</div>");
		out.println("</div>");
		out.println("<input type=\"submit\" value=\"Update\">");
		out.println("</form>");
		
	}

%>  
</div>

</body>
</html>