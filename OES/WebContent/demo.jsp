<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.List" %>
    <%@ page import="oes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="table.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="text.css">
<title>Insert title here</title>
<script type="text/javascript">
function adjust_textarea(h) {
    h.style.height = "20px";
    h.style.height = (h.scrollHeight)+"px";
}
</script>
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
  <div style="height:20%;overflow:auto;">
<div id="container"><p>Big Questions is a debate format supported by a grant from the John Templeton Foundation. High school and middle school students will grapple with complex worldview questions as they debate both sides of the 2019-2020 resolution,Big Questions is a debate format supported by a grant from the John Templeton Foundation. High school and middle school students will grapple with complex worldview questions as they debate both sides of theBig Questions is a debate format supported by a grant from the John Templeton Foundation. High school and middle school students will grapple with complex worldview questions as they debate both sides of the 2019-2020 resolution,Big Questions is a debate format supported by a grant from the John Templeton Foundation. High school and midBig Questions is a debate format supported by a grant from the John Templeton Foundation. High school and middle school students will grapple with complex worldview questions as they debate both sides of the 2019-2020 resolution,Big Questions is a debate format supported by a grant from the John Templeton Foundation. High school and middle school students will grapple with complex worldview questions as they debate both sides of the 2019-2020 resolution,dle school students will grapple with complex worldview questions as they debate both sides of the 2019-2020 resolution, 2019-2020 resolution,</p></div>
</div>
<br>
  <div style="height:75%;overflow:auto;">
<div id="container">
<%
		out.println("<br>");
		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-three\" name=\"ans\" value=\"A\" >");
		out.println("<label for=\"radio-three\"><h4><span data-shadow-text=\"A\">A</span></h4></label>");
		out.println("</div>");
		
		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-four\" name=\"ans\" value=\"B\" >");
		out.println("<label for=\"radio-four\"><h4><span data-shadow-text=\"B\">B</span></h4></label>");
		out.println("</div>");

		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-five\" name=\"ans\" value=\"C\" >");
		out.println("<label for=\"radio-five\"><h4><span data-shadow-text=\"C\">C</span></h4></label>");
		out.println("</div>");

		out.println("<div class=\"switch-field\">");
		out.println("<input type=\"radio\" id=\"radio-six\" name=\"ans\" value=\"D\" >");
		out.println("<label for=\"radio-six\"><h4><span data-shadow-text=\"D\">D</span></h4></label>");
		out.println("</div>");
				
				
	
%>
</div>
</div>
</html>