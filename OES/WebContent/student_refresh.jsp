<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.UserDAO,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
</head>
<body>
 <div class="lg:w-1/1 w-full mx-auto overflow-auto">
<table class="table-auto w-full text-left whitespace-no-wrap">
 <thead>
<tr>
<%
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl text-2xl\">ID</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Name</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Year</th>");
   	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tr rounded-br text-2xl\">Action</th>");   
%>
</tr></thead>
  <%
  		UserDAO ud=new UserDAO();
  	    List <User> users =ud.selectAllUsers((String)session.getAttribute("year"));
  	    for(int i =0; i<1;i++){
  	for(User u: users){
  			out.println("<tr>");
  			out.println("<td class=\">border-t-2 border-b-2 border-red-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getUname()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-red-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getName()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-red-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getYear()+"</td>");

  			
  			out.println("<td class=\">border-t-2 border-b-2 border-red-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\"><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"remove_student\">");
  			out.println("<input type=\"hidden\" name=\"year\" value=\"" + u.getYear() + "\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			out.println("<button class=\"w-full m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-4 border border-red-500 hover:border-transparent rounded text-xl\" onclick=\"return confirm('Are you sure?')\">Remove</button>");

  			out.println("</form>");
  			
  		out.println("</tr>");
  	}}
  %>
  
</table>
</div>
</body>
</html>