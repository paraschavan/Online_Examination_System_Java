<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.Paper"%>
     <%@ page import="java.util.List" %>
       <%@ page import="oes.User" %>
       <%@ page import="oes.Question,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="text.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="table.css">
<link rel="icon" href="img/logo.png" type="image/icon type">
<script type="text/javascript">
//auto expand textarea
function adjust_textarea(h) {
    h.style.height = "20px";
    h.style.height = (h.scrollHeight)+"px";
}
function getObj(i){
	var x = document.getElementById(i);
	adjust_textarea(x);
}
</script>
</head>
<body>
	 <div style="height:65vh%;overflow:auto;">
		<div id="container">
  <div class="form-style-8">
  <%
    out.println(" <div class=\"exam-textarea\">");
	out.println("<textarea name=\"sans\" id=\"qaq\"  maxlength=\"10000\" style=\"font-size: 200%;\"></textarea>");
	out.println("</div>");
  %>
  </div>  </div>  </div>
</body>
</html>