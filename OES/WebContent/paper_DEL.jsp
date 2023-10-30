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
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
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
	<%
		out.println("<div id='cssmenu'>");
		out.println("<ul>");
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
		
		if(session.getAttribute("paper_action").equals("paper")){
		out.println("<li><a href=\""+jsp+"\">Home</a></li>");
		if(session.getAttribute("qt").equals("MCQ")){
			out.println("<li class='active'><a href=\"Exam?action=paper&qt=MCQ\">MCQ</a></li>");
			out.println("<li><a href=\"Exam?action=paper&qt=Q&A\">Q&A</a></li>");
			out.println("</ul>");
			out.println("</div>");
		}
	
		else{
			out.println("<li><a href=\"Exam?action=paper&qt=MCQ\">MCQ</a></li>");
			out.println("<li class='active'><a href=\"Exam?action=paper&qt=Q&A\">Q&A</a></li>");
			out.println("</ul>");
			out.println("</div>");
		}
	}
		else{
			out.println("<li class='active'><a href=\"Exam?action=paper&qt=MCQ\">Create New Question</a></li>");
			out.println("</ul>");
			out.println("</div>");
		}
   %>   
      <%
      out.println("<br>");
   out.println("<div class=\"scrollmenu\">");
   int tmarks=0;
   List < Question > questions = (List<Question>)session.getAttribute("questions");
   for(int i=0;i<questions.size();i++){   
	   out.println("<div class=\"inline\">");
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	   out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(i).getId()+"\">");
	   out.println("<input type=\"hidden\" name=\"action\" value=\"edit_q\">");
	   out.println("<button class=\"button-success-pg pure-button button-pg\">Q: "+(i+1)+"</button>");
	   out.println("</form>");
	   out.println("</div>");
	   tmarks+=questions.get(i).getM();
   }
   out.println("</div>");
   out.println("");
   %>

  <div class="form-style-8">

   <%
   if(session.getAttribute("paper_action").equals("paper")){
		if(session.getAttribute("qt")=="MCQ"){
			out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
			out.println("<h2>Add MCQ Question &nbsp; Total Marks: "+tmarks+"</h2>");
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_q\">");	
			out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
			out.println("<textarea name=\"q\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\"></textarea>");
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"A\" required=\"required\">");
			out.println("<textarea name=\"a\" placeholder=\"Option A\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea>");
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"B\" required=\"required\">");
			out.println("<textarea name=\"b\" placeholder=\"Option B\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea>");
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"C\" required=\"required\">");
			out.println("<textarea name=\"c\" placeholder=\"Option C\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea>");	
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"D\" required=\"required\">");
			out.println("<textarea name=\"d\" placeholder=\"Option D\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea>");
			
			out.println("<div class=\"inline\">");
			out.println("<label for='marks' style='font-size: 200%;'>Marks&nbsp;</label>");
			out.println("</div>");
			
			out.println("<div class=\"inline\">");
			out.println("<input type=\"number\" name=\"m\" id=\"marks\" min=\"1\"  required=\"required\">");
			out.println("</div>");
			
			out.println("<div class=\"inline\" style='float: right;'>");
			out.println("<input type=\"reset\" value=\"Clear\">");
			out.println("</div>");
			
			out.println("<input type=\"submit\" value=\"Add Question\">");
	
		
			out.println("</form>");

		}
   
		else{
			out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
			out.println("<h2>Add Q&A Question &nbsp; Total Marks: "+tmarks+"</h2>");
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_q\">");		
			out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
			out.println("<textarea name=\"q\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\"></textarea>");
			
			out.println("<div class=\"inline\">");
			out.println("<label for='marks' style='font-size: 200%;'>Marks&nbsp;</label>");
			out.println("</div>");
			
			out.println("<input type=\"hidden\" name=\"a\" value=\"-\">");
			out.println("<input type=\"hidden\" name=\"b\" value=\"-\">");
			out.println("<input type=\"hidden\" name=\"c\" value=\"-\">");
			out.println("<input type=\"hidden\" name=\"d\" value=\"-\">");
			out.println("<input type=\"hidden\" name=\"ch\" value=\"\">");
			
			out.println("<div class=\"inline\">");
			out.println("<input type=\"number\" name=\"m\" id=\"marks\" min=\"1\"  required=\"required\">");
			out.println("</div>");
			
			out.println("<div class=\"inline\" style='float: right;'>");
			out.println("<input type=\"reset\" value=\"Clear\">");
			out.println("</div>");
			
			out.println("<input type=\"submit\" value=\"Add Question\">");
			
	
			   
			out.println("</form>");
		}
   }
   else{
	   String ra="",rb="",rc="",rd="";
	   Question question=(Question)session.getAttribute("question");
	   if(question.getQt().equals("MCQ")){
		   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
			out.println("<h2>Edit MCQ Question</h2>");
			out.println("<input type=\"hidden\" name=\"action\" value=\"update_q\">");
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+question.getId()+"\">");	
			out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
			out.println("<textarea name=\"q\" id=\"mqq\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\">"+question.getQ()+"</textarea>");
			switch(question.getAns()){
			case"A":
				ra="checked";
				break;
			case"B":
				rb="checked";
				break;
			case"C":
				rc="checked";
				break;
			case"D":
				rd="checked";
				break;
			default:
				
				break;
			}
			out.println("<input type=\"radio\" name=\"ch\" value=\"A\" required=\"required\" "+ra+">");
			out.println("<textarea name=\"a\" id=\"mqa\" placeholder=\"Option A\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\">"+question.getA()+"</textarea>");
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"B\" required=\"required\" "+rb+">");
			out.println("<textarea name=\"b\" id=\"mqb\" placeholder=\"Option B\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\">"+question.getB()+"</textarea>");
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"C\" required=\"required\" "+rc+">");
			out.println("<textarea name=\"c\" id=\"mqc\" placeholder=\"Option C\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\">"+question.getC()+"</textarea>");	
			
			out.println("<input type=\"radio\" name=\"ch\" value=\"D\" required=\"required\" "+rd+">");
			out.println("<textarea name=\"d\" id=\"mqd\" placeholder=\"Option D\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\">"+question.getD()+"</textarea>");
			
			out.println("<div class=\"inline\">");
			out.println("<label for='marks' style='font-size: 200%;'>Marks&nbsp;</label>");
			out.println("</div>");
			
			out.println("<div class=\"inline\">");
			out.println("<input type=\"number\" name=\"m\" id=\"marks\" min=\"1\" value="+question.getM()+" required=\"required\">");
			out.println("</div>");
			
			out.println("<div class=\"inline\" style='float: right;'>");
			out.println("<a class=\"button-error button-xlarge\" href=\"Exam?action=delete_q&idn="+question.getId()+"\">Delete</a>");
			out.println("</div>");
			
			out.println("<input type=\"submit\" value=\"Update Question\">");
	
	
			   
			out.println("</form>");
			
			

	   }
	   else{
		   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
			out.println("<h2>Edit Q&A Question</h2>");
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+question.getId()+"\">");	
			out.println("<input type=\"hidden\" name=\"action\" value=\"update_q\">");		
			out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
			out.println("<textarea name=\"q\" id=\"qaq\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\">"+question.getQ()+"</textarea>");
			
			out.println("<script>getObj(\"qaq\");</script>");
			
			out.println("<div class=\"inline\">");
			out.println("<label for='marks' style='font-size: 200%;'>Marks&nbsp;</label>");
			out.println("</div>");
		
			out.println("<div class=\"inline\">");
			out.println("<input type=\"number\" name=\"m\" id=\"marks\" min=\"1\" value="+question.getM()+" required=\"required\">");
			out.println("</div>");
			
			out.println("<input type=\"hidden\" name=\"a\" value=\" \">");
			out.println("<input type=\"hidden\" name=\"b\" value=\" \">");
			out.println("<input type=\"hidden\" name=\"c\" value=\" \">");
			out.println("<input type=\"hidden\" name=\"d\" value=\" \">");
			out.println("<input type=\"hidden\" name=\"ch\" value=\" \">");
			
			out.println("<div class=\"inline\" style='float: right;'>");
			out.println("<a class=\"button-error button-xlarge\" href=\"Exam?action=delete_q&idn="+question.getId()+"\">Delete</a>");
			out.println("</div>");
			
			out.println("<input type=\"submit\" value=\"Update Question\">");
			
			   
			out.println("</form>");
	   }
   }
   
   %>
   
<script> 
getObj("mqq");
getObj("mqa");
getObj("mqb");
getObj("mqc");
getObj("mqd");
</script> 
   
   </div>


</body>
</html>