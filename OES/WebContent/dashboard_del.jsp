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
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="text.css">
<title>Insert title here</title>
<script src="refresh.js"></script>
<script>
    $(document).ready(function(){
		 $("#div_list").load("student_refresh.jsp");
        setInterval(function() {
            $("#div_list").load("student_refresh.jsp");
        }, 1000);
    });
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
   <li><t><%="Subject Code: "+((Paper)session.getAttribute("paper")).getSubcode()%></t></li>   
    <li><t><%="Subject: "+((Paper)session.getAttribute("paper")).getSub()%></t></li> 
       <li><t><%="Year: "+((Paper)session.getAttribute("paper")).getYear()%></t></li> 
</ul>
</div>

  <div class="form-style-8">
  <%
    out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	out.println("<h2>Exam Time In Minutes</h2>");
	out.println("<input type=\"hidden\" name=\"action\" value=\"start\">");
	
	out.println("<input type=\"number\" name=\"time\" id=\"time\" min=\"10\" step=\"10\" required=\"required\" style=\"width:100%;color:white;background-color:#4D4D4D;\">");
	
	out.println("<input type=\"submit\" value=\"Start Exam\">");
	out.println("<label for='time' style='font-size: 100%;text-align: center;'>If The Student Is Not In The List Please Tell Them To Login Or Refresh The Login Page</label>");
	out.println("</form>");

  %>
  
	</div>
	   <div id="div_list"></div>
	
</html>