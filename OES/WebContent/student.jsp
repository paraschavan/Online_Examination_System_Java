<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.ExamDAO,oes.Question,oes.timer"%>
         <%@ page import="java.util.List" %>
    <% 	ExamDAO ed=(ExamDAO)session.getAttribute("ExamDAO"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="form.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="text.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="icon" href="img/logo.png" type="image/icon type">
<script src="refresh.js"></script>
<script>     
	let time=<%=(ed.timeLeft())%>;
            $(document).ready(function(){
            	window.setInterval(function(){
				doRefresh();
            	}, 1000);
           });
           function doRefresh(){
        	 	if(time<=0){
                	window.location.replace('index.html');
                	clearInterval();
                }
        	 	else{
        	 		time--;
        	 	}
           }
</script>
<script type="text/javascript">
function getObj(i,sans){
	var x = document.getElementById(i);
        x.value = sans; 	
}
</script>
<script>
function clicked(e)
{
    if(!confirm())e.preventDefault();
}
</script>
<title>Insert title here</title>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li><t><%="Name: "+((User)session.getAttribute("id")).getName()%></t></li>   
    <li><t><%="ID: "+((User)session.getAttribute("id")).getUname()%></t></li> 
    <ei><%
         out.println("<div class=\"inline\" style='float: right;'>");
	out.println("<a class=\"button-error button-xlarge\" href=\"Exam?action=result&resultAction=show\" onclick=\"return confirm('Are you sure you want to log out?')\">Log-Out</a>");
	out.println("</div>");%> </ei>
                           <ei>&#8193 &#8193 &#8193 &#8193 &#8193 &#8193</ei> 
         
      <ei style="transform: scale(0.5);"><%@include file="timer.jsp" %></ei>
        
</ul>
</div>    
 <%
   out.println("<div class=\"scrollmenu\">");
   int qn=(int)session.getAttribute("qn");
   System.out.println(qn+"		qn");
   int tmarks=0;
   String button;
   List < Question > questions = (List<Question>)session.getAttribute("questions");
   for(int i=0;i<questions.size();i++){   
	   out.println("<div class=\"inline\">");
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	   out.println("<input type=\"hidden\" name=\"qn\" value=\""+i+"\">");
	   out.println("<input type=\"hidden\" name=\"action\" value=\"button\">");
	   
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
   System.out.println(tmarks);
   System.out.println("Time		"+ed.timeLeft());
   out.println("</div>");
   %>

   <%
	   String ra="",rb="",rc="",rd="";
	   Question question=(Question)session.getAttribute("question");
	   %>
	   

	   
	     <div style="height:17vh;overflow:auto;">
		<div id="container"><p><%= ed.br(questions.get(qn).getQ())%></p></div>
		</div>	
		<br>
		 <div style="height:60vh;overflow:auto;">
		<div id="container">

	   <%
	   if(questions.get(qn).getQt().equals("MCQ")){
		    out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
			out.println("<input type=\"hidden\" name=\"action\" value=\"answer\">");
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(qn).getId()+"\">");	
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
			out.println("<br><div class=\"switch-field "+sa+"\">");
			out.println("<input type=\"radio\" id=\"radio-three\" name=\"sans\" value=\"A\" "+ra+">");
			out.println("<label id=\"l1\" for=\"radio-three\"><h4><span>"+ed.br(questions.get(qn).getA())+"</span></h4></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field "+sb+"\">");
			out.println("<input type=\"radio\" id=\"radio-four\" name=\"sans\" value=\"B\" "+rb+">");
			out.println("<label for=\"radio-four\"><h4><span>"+ed.br(questions.get(qn).getB())+"</span></h4></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field "+sc+"\">");
			out.println("<input type=\"radio\" id=\"radio-five\" name=\"sans\" value=\"C\" "+rc+">");
			out.println("<label for=\"radio-five\"><h4><span>"+ed.br(questions.get(qn).getC())+"</span></h4></label>");
			out.println("</div>");

			out.println("<div class=\"switch-field "+sd+"\">");
			out.println("<input type=\"radio\" id=\"radio-six\" name=\"sans\" value=\"D\" "+rd+">");
			out.println("<label for=\"radio-six\"><h4><span>"+ed.br(questions.get(qn).getD())+"</span></h4></label>");
			out.println("</div>");
		

	   }
	   else{
		   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		   out.println("<input type=\"hidden\" name=\"action\" value=\"answer\">");
			out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(qn).getId()+"\">");	
			out.println(" <div class=\"exam-textarea\">");
			out.println("<script>getObj(\"qaq\");</script>");
			out.println("<textarea name=\"sans\" id=\"qaq\"  maxlength=\"10000\" style=\"font-size: 200%;\">"+questions.get(qn).getSans()+"</textarea>");
			out.println("</div>");
			
	   }

%>
   </div>
   </div>
     
   <%	    out.println("<button type=\"submit\" class=\"save\">Save</button>");
	out.println("</form>"); %>
	</body>
</html>