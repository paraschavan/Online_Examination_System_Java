<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.ExamDAO,oes.Question"%>
         <%@ page import="java.util.List" %>
    <% 	ExamDAO ed=(ExamDAO)session.getAttribute("ExamDAO");
       int qn=(int)session.getAttribute("qn");
       List < Question > questions = (List<Question>)session.getAttribute("questions");

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="text.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="timer.css">
<link rel="stylesheet" type="text/css" href="ajax.css">
<link rel="icon" href="img/logo.png" type="image/icon type">
<title>Insert title here</title>
<script>
function clicked(e)
{
    if(!confirm())e.preventDefault();
}
</script>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li><t><%="Name: "+session.getAttribute("name")%></t></li>   
    <li><t><%="ID: "+session.getAttribute("uname")%></t></li> 
    <li><t><%="Marks :"%></t></li> 
	<li><%
      out.println("<div class='form-style-8m'>");
       out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		String ro="";
		if(questions.get(qn).getQt().equals("MCQ")){
			ro="readonly";
		}
		out.println("<li><input type=\"number\" name=\"m\" id=\"marks\" min=\"0\" max=\""+questions.get(qn).getM()+"\" value=\""+questions.get(qn).getSm()+"\" required=\"required\" "+ro+"></li>");
		out.println("</div><input type=\"hidden\" name=\"action\" value=\"marks\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(qn).getId()+"\">");
		out.println("<li>");
		out.println("<button type=\"submit\" class=\"inline button-success button-in\">&#8193Save&#8193</button>");
		out.println("</li>");
		out.println("</form>");
       
    out.println("</form>");
	%></li>
    <ei><%
         out.println("<div class=\"inline\">");
	out.println("<a class=\"button-error button-xlarge\" href=\"Exam?action=result&resultAction=edit\" onclick=\"return confirm('Are you sure you want to Exit?')\">&nbspExit&nbsp</a>");
	out.println("</div>");%></ei>
	
</ul>
</div>    
 <%
   out.println("<div class=\"scrollmenu\">");
   System.out.println(qn+"		qn");
   int tmarks=0;
   String button;
   for(int i=0;i<questions.size();i++){   
	   out.println("<div class=\"inline\">");
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	   out.println("<input type=\"hidden\" name=\"qn\" value=\""+i+"\">");
	   out.println("<input type=\"hidden\" name=\"action\" value=\"sbutton\">");
	   
	   if((i)==qn){
		   button="button-exam-w";
	   }
	   else if(questions.get(i).getSans().equals("")){		   
		   button="button-exam-r";
	   }
	   else{
		   button="button-exam-g";
	   }
	  
		   out.println("<button class=\""+button+" button-pg\">Q: "+(i+1)+"</button>");

	   
	   out.println("</form>");
	   out.println("</div>");
	   tmarks+=questions.get(i).getM();
   }	

   out.println("</div>");
   %>

   <%
	   String ra="",rb="",rc="",rd="";
  	   String ma="",mb="",mc="",md="";
	   Question question=(Question)session.getAttribute("question");
	   %>
	   

	   
	     <div style="height:18vh;overflow:auto;">
		<div id="container"><p><%= ed.br(questions.get(qn).getQ())%></p></div>
		</div>	
		<br>
		 <div style="height:67vh;overflow:auto;">
		<div id="container">

	   <%
	   if(questions.get(qn).getQt().equals("MCQ")){
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(qn).getId()+"\">");
			if(questions.get(qn).getSans().equals(questions.get(qn).getAns())){
				System.out.println("R");
				switch(questions.get(qn).getSans()){
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
			}
			else if(questions.get(qn).getSans().equals("")){
				switch(questions.get(qn).getAns()){
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
				for(int c=0;c<4;c++){
					switch(c){
					case 0:
						if((questions.get(qn).getAns()).contains("A")){
							rb="checked";
							rc="checked";
							rd="checked";
							mb="m";
							mc="m";
							md="m";
						}
					break;
					case 1:
						if((questions.get(qn).getAns()).contains("B")){
							ra="checked";
							rc="checked";
							rd="checked";
							ma="m";
							mc="m";
							md="m";
						}
					break;
					case 2:
						if((questions.get(qn).getAns()).contains("C")){
							rb="checked";
							ra="checked";
							rd="checked";
							mb="m";
							ma="m";
							md="m";
						}
					break;
					case 3:
						if((questions.get(qn).getAns()).contains("D")){
							rb="checked";
							rc="checked";
							ra="checked";
							mb="m";
							mc="m";
							ma="m";
						}
					break;
					}
				}
			}
			else{
				System.out.println("W");
				switch(questions.get(qn).getAns()){
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
				
				switch(questions.get(qn).getSans()){
				case"A":
					ra="checked";
					ma="m";
					break;
				case"B":
					rb="checked";
					mb="m";
					break;
				case"C":
					rc="checked";
					mc="m";
					break;
				case"D":
					rd="checked";
					md="m";
					break;
				default:
					
					break;
				}
			}
			
			String sa="",sb="",sc="",sd="";
			if((questions.get(qn).getA()).length()>80){
				sa="scrollmenu";
			}
			if((questions.get(qn).getB()).length()>80){
				sb="scrollmenu";
			}
			if((questions.get(qn).getC()).length()>80){
				sc="scrollmenu";
			}
			if((questions.get(qn).getD()).length()>80){
				sd="scrollmenu";
			}
			out.println("<br><div class=\"switch-field"+ma+" "+sa+"\">");
			out.println("<input type=\"radio\" id=\"radio-three\" name=\"a\" value=\"A\" "+ra+">");
			out.println("<label for=\"radio-three\"><h3><span>"+ed.br(questions.get(qn).getA())+"</span></h3></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field"+mb+" "+sb+"\">");
				out.println("<input type=\"radio\" id=\"radio-four\" name=\"b\" value=\"B\" "+rb+">");
			out.println("<label for=\"radio-four\"><h3><span>"+ed.br(questions.get(qn).getB())+"</span></h3></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field"+mc+" "+sc+"\">");
				out.println("<input type=\"radio\" id=\"radio-five\" name=\"c\" value=\"C\" "+rc+">");
			out.println("<label for=\"radio-five\"><h3><span>"+ed.br(questions.get(qn).getC())+"</span></h3></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field"+md+" "+sd+"\">");
				out.println("<input type=\"radio\" id=\"radio-six\" name=\"d\" value=\"D\" "+rd+">");
			out.println("<label for=\"radio-six\"><h3><span>"+ed.br(questions.get(qn).getD())+"</span></h3></label>");
			out.println("</div>");
		

	   }
	   else{
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(qn).getId()+"\">");	
			out.println(" <div class=\"exam-textaream\">");
			out.println("<textarea name=\"sans\" style=\"font-size: 200%;\" readonly>"+questions.get(qn).getSans()+"</textarea>");
			out.println("</div>");
	   }

%>
   </div>
   </div>
      
 	</body>
</html>