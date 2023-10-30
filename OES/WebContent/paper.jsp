<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.Question,oes.Paper,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
<link rel="stylesheet" href="./css/butttfon.css">
<style>
/* width */
::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: black; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #b30000; 
}
</style>
</head>
<body class="bg-gray-900">
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap p-1 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -40 500 650">
     <g><circle cx="166" cy="226" r="10"/><circle cx="166" cy="286" r="10"/><circle cx="166" cy="346" r="10"/><circle cx="166" cy="406" r="10"/><path d="m226 236h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 296h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 356h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 416h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m406 90h-81.266c-3.626-14.035-14.698-25.108-28.734-28.734v-21.266c0-22.056-17.944-40-40-40s-40 17.944-40 40v21.266c-14.035 3.626-25.108 14.699-28.734 28.734h-81.266c-5.522 0-10 4.478-10 10v402c0 5.522 4.478 10 10 10h105c5.522 0 10-4.478 10-10s-4.478-10-10-10h-95v-382h70v20c0 5.522 4.478 10 10 10h120c5.522 0 10-4.478 10-10v-20h70v382h-95c-5.522 0-10 4.478-10 10s4.478 10 10 10h105c5.522 0 10-4.478 10-10v-402c0-5.522-4.477-10-10-10zm-170-50c0-11.028 8.972-20 20-20s20 8.972 20 20v20h-40zm70 80h-100v-20c0-11.028 8.972-20 20-20h60c11.028 0 20 8.972 20 20z"/><circle cx="256" cy="502" r="10"/></g>
      <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Edit Paper</span>
    </a>
      <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
    <%
    if(session.getAttribute("qt").equals("MCQ")){
    	out.println("<form action=\"Exam\" method=\"post\">");
    	out.println("<input type=\"hidden\" name=\"action\" value=\"paper\">");
    	out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
		out.println("<button  class=\"px-5 m-3 text-white outline-none transition duration-500 ease-in-out bg-red-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-4xl rounded-full border-b-4 border-red-700 hover:border-red-700\">MCQ</button>");
		out.println("</form>");
		out.println("<form action=\"Exam\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"paper\">");
		out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
		out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full\">Q&A</button>");
		out.println("</form>");
    }
    else{
    	out.println("<form action=\"Exam\" method=\"post\">");
    	out.println("<input type=\"hidden\" name=\"action\" value=\"paper\">");
    	out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
		out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full\">MCQ</button>");
		out.println("</form>");
		out.println("<form action=\"Exam\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"paper\">");
		out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
		out.println("<button class=\"px-5 m-3 text-white outline-none transition duration-500 ease-in-out bg-red-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-4xl rounded-full border-b-4 border-red-700 hover:border-red-700\">Q&A</button>");
		out.println("</form>");	
    }
    %>
    </nav>
       <form action="UserServlet" method="POST">
    <input type="hidden" name="action" value="home">
    <button class="inline-flex items-center bg-gray-700 border-0 py-1 px-3 focus:outline-none bg-red-700 hover:bg-red-600 rounded xl:text-4xl lg:text-4xl md:text-4xl sm:text-5xl mt-4 md:mt-0 text-white">Home
      <svg style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 ml-3" viewBox="0 -40 600 600">
		<path d="M481.765,220.422L276.474,15.123c-16.967-16.918-44.557-16.942-61.559,0.023L9.626,220.422
			c-12.835,12.833-12.835,33.65,0,46.483c12.843,12.842,33.646,12.842,46.487,0l27.828-27.832v214.872
			c0,19.343,15.682,35.024,35.027,35.024h74.826v-97.62c0-7.584,6.146-13.741,13.743-13.741h76.352
			c7.59,0,13.739,6.157,13.739,13.741v97.621h74.813c19.346,0,35.027-15.681,35.027-35.024V239.091l27.812,27.815
			c6.425,6.421,14.833,9.63,23.243,9.63c8.408,0,16.819-3.209,23.242-9.63C494.609,254.072,494.609,233.256,481.765,220.422z"/>
      </svg>
    </button>
    </form>
  </div>
</header>
<%
int tmarks=0;
List < Question > questions = (List<Question>)session.getAttribute("questions");
out.println("<div class=\"overflow-x-auto flex\" style=\"scrollbar-color:black grey;\">");
for(int i=0;i<questions.size();i++){
	out.println("<div class=\"inline-flex\">");
	
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	   out.println("<input type=\"hidden\" name=\"idn\" value=\""+questions.get(i).getId()+"\">");
	   out.println("<input type=\"hidden\" name=\"action\" value=\"edit_q\">");
	   
	   if(((Integer.parseInt(session.getAttribute("selectedQ").toString()))==questions.get(i).getId())){
		   out.println("<button class=\"m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white px-1 border border-green-500 hover:border-transparent rounded text-base\">Q:"+(i+1)+"</button>");
	   }
	   else{
		   out.println("<button class=\"m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white px-1 border border-red-500 hover:border-transparent rounded text-base\">Q:"+(i+1)+"</button>");  
	   }
	   out.println("</form></div>");
	   tmarks+=questions.get(i).getM();
}
out.println("</div>");
out.println("<h2 class='text-4xl xl:text-4xl lg:text-3xl md:text-4xl sm:text-2xl text-center text-white bg-gray-700 m-2'>Total Marks: "+tmarks+"</h2>");
if(session.getAttribute("paper_action").equals("paper")){
	if(session.getAttribute("qt")=="MCQ"){
		out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-1'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		//out.println("<h2>Add MCQ Question &nbsp; Total Marks: "+tmarks+"</h2>");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_q\">");	
		out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
		out.println("<textarea name=\"q\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\"></textarea>");
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"A\" required=\"required\">");
		out.println("<textarea name=\"a\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option A\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea></div>");
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"B\" required=\"required\">");
		out.println("<textarea name=\"b\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option B\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea></div>");
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"C\" required=\"required\">");
		out.println("<textarea name=\"c\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option C\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea></div>");	
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"D\" required=\"required\">");
		out.println("<textarea name=\"d\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option D\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"255\"></textarea></div>");
		
		
		out.println("<label for='marks' class='text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl text-gray-500'>&nbsp;Marks&nbsp;</label>");

		out.println("<input class='text-xl' type=\"number\" name=\"m\" id=\"marks\" min=\"1\"  required=\"required\">");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"submit\" class='m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-5 border border-green-500 hover:border-transparent rounded text-xl' value=\"Add Question\">");
		out.println("</div>");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"reset\" class='m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-5 border border-red-500 hover:border-transparent rounded text-xl' value=\"Clear\">");		
		out.println("</div>");
		
		out.println("</div></div></form>");

	}

	else{
		out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-1'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_q\">");		
		out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
		out.println("<textarea name=\"q\" class=\"mb-5 w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\"></textarea>");
		out.println("<input type=\"hidden\" name=\"a\" value=\"-\">");
		out.println("<input type=\"hidden\" name=\"b\" value=\"-\">");
		out.println("<input type=\"hidden\" name=\"c\" value=\"-\">");
		out.println("<input type=\"hidden\" name=\"d\" value=\"-\">");
		out.println("<input type=\"hidden\" name=\"ch\" value=\"\">");
		
		out.println("<label for='marks' class='text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl text-gray-500'>&nbsp;Marks&nbsp;</label>");

		out.println("<input class='text-xl' type=\"number\" name=\"m\" id=\"marks\" min=\"1\"  required=\"required\">");
	
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"submit\" class='m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-5 border border-green-500 hover:border-transparent rounded text-xl' value=\"Add Question\">");
		out.println("</div>");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"reset\" class='m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-5 border border-red-500 hover:border-transparent rounded text-xl' value=\"Clear\">");		
		out.println("</div>");
   
		out.println("</div></div></form>");
	}
}
else{
   String ra="",rb="",rc="",rd="";
   Question question=(Question)session.getAttribute("question");
   if(question.getQt().equals("MCQ")){
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
		out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-1'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		out.println("<input type=\"hidden\" name=\"action\" value=\"update_q\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+question.getId()+"\">");	
		out.println("<input type=\"hidden\" name=\"qt\" value=\"MCQ\">");
		out.println("<textarea name=\"q\" class=\"mb-5 w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" id=\"mqq\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\">"+question.getQ()+"</textarea>");
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
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"A\" required=\"required\" "+ra+">");
		out.println("<textarea name=\"a\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option A\" required=\"required\" maxlength=\"255\">"+question.getA()+"</textarea></div>");
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"B\" required=\"required\" "+rb+">");
		out.println("<textarea name=\"b\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option B\" required=\"required\" maxlength=\"255\">"+question.getB()+"</textarea></div>");
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"C\" required=\"required\" "+rc+">");
		out.println("<textarea name=\"c\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option C\" required=\"required\" maxlength=\"255\">"+question.getC()+"</textarea></div>");	
		
		out.println("<div class='p-2 w-1/2'><input type=\"radio\" name=\"ch\" value=\"D\" required=\"required\" "+rd+">");
		out.println("<textarea name=\"d\" class=\"w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Option D\" required=\"required\" maxlength=\"255\">"+question.getD()+"</textarea></div>");
		
		out.println("<label for='marks' class='text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl text-gray-500'>&nbsp;Marks&nbsp;</label>");
		out.println("<input class='text-xl' type=\"number\" name=\"m\" id=\"marks\" min=\"1\" value="+question.getM()+" required=\"required\">");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"submit\" class='m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-5 border border-green-500 hover:border-transparent rounded text-xl' value=\"Update Question\">");
		out.println("</div>");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<a class='m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-5 border border-red-500 hover:border-transparent rounded text-xl' href=\"Exam?action=delete_q&idn="+question.getId()+"\">Delete</a>");
		out.println("</div>");


		   
		out.println("</div></div></form>");
		
		

   }
   else{
	   out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	   out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-1'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+question.getId()+"\">");	
		out.println("<input type=\"hidden\" name=\"action\" value=\"update_q\">");		
		out.println("<input type=\"hidden\" name=\"qt\" value=\"Q&A\">");
		out.println("<textarea name=\"q\" class=\"mb-5 w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl px-4 py-2 resize-none block\" placeholder=\"Enter Question Here\" onkeyup=\"adjust_textarea(this)\" required=\"required\" maxlength=\"512\">"+question.getQ()+"</textarea>");
		
		out.println("<label for='marks' class='text-xl xl:text-4xl lg:text-3xl md:text-3xl sm:text-xl text-gray-500'>&nbsp;Marks&nbsp;</label>");
		out.println("<input class='text-xl' type=\"number\" name=\"m\" id=\"marks\" min=\"1\" value="+question.getM()+" required=\"required\">");
		
		out.println("<input type=\"hidden\" name=\"a\" value=\" \">");
		out.println("<input type=\"hidden\" name=\"b\" value=\" \">");
		out.println("<input type=\"hidden\" name=\"c\" value=\" \">");
		out.println("<input type=\"hidden\" name=\"d\" value=\" \">");
		out.println("<input type=\"hidden\" name=\"ch\" value=\" \">");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<input type=\"submit\" class='m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-5 border border-green-500 hover:border-transparent rounded text-xl' value=\"Update Question\">");
		out.println("</div>");
		
		out.println(" <div class='flex flex-wrap justify-center flex-grow'>");
		out.println("<a class='m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-5 border border-red-500 hover:border-transparent rounded text-xl' href=\"Exam?action=delete_q&idn="+question.getId()+"\">Delete</a>");
		out.println("</div>");

		
		   
		out.println("</div></div></form>");
   }
}

%>  
</body>
</html>