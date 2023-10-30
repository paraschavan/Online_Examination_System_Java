<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.Paper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
<link rel="stylesheet" href="./css/butttfon.css">
<style>
.radio input{
position: absolute !important;
    clip: rect(0, 0, 0, 0);
    border: 0;
    overflow: hidden;
}
.radio label {
    background-color: #ff9191;
    color: rgba(0, 0, 0, 0.6);
    line-height: 1;
    text-align: center;
    border: 1px solid rgba(0, 0, 0, 0.2);
    display: inline;
}
.radio label:hover {
    cursor: pointer;    
}
.radio input:checked + label {
    background-color: #a5dc86;
    box-shadow: none;
}
</style>
</head>
<body class="bg-gray-900">
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap p-1 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -40 500 650">
     <g><circle cx="166" cy="226" r="10"/><circle cx="166" cy="286" r="10"/><circle cx="166" cy="346" r="10"/><circle cx="166" cy="406" r="10"/><path d="m226 236h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 296h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 356h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 416h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m406 90h-81.266c-3.626-14.035-14.698-25.108-28.734-28.734v-21.266c0-22.056-17.944-40-40-40s-40 17.944-40 40v21.266c-14.035 3.626-25.108 14.699-28.734 28.734h-81.266c-5.522 0-10 4.478-10 10v402c0 5.522 4.478 10 10 10h105c5.522 0 10-4.478 10-10s-4.478-10-10-10h-95v-382h70v20c0 5.522 4.478 10 10 10h120c5.522 0 10-4.478 10-10v-20h70v382h-95c-5.522 0-10 4.478-10 10s4.478 10 10 10h105c5.522 0 10-4.478 10-10v-402c0-5.522-4.477-10-10-10zm-170-50c0-11.028 8.972-20 20-20s20 8.972 20 20v20h-40zm70 80h-100v-20c0-11.028 8.972-20 20-20h60c11.028 0 20 8.972 20 20z"/><circle cx="256" cy="502" r="10"/></g>
      <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Create Paper</span>
    </a>
    <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
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
out.println("<h2 class='text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-3xl text-center text-white bg-gray-700 m-2'>Create New Paper</h2>");
if((session.getAttribute("action").equals("add_paper_page"))){
	out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-6'>");
	out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
	out.println("<input type=\"hidden\" name=\"action\" value=\"add_paper\">");
	out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"sub\" placeholder=\"Enter Subject Name\" required=\"required\"></div>");
	out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"subCode\" placeholder=\"Enter Subject Code\" required=\"required\"></div>");
	out.println("<div class=\"radio p-2 mt-6 w-full\">");
	out.println("<input type=\"radio\" id=\"radio-three\" name=\"year\" value=\"1st Year\" required=\"required\">");
	out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-three\">1<sup>st</sup> Year</label>");
	out.println("<input type=\"radio\" id=\"radio-four\" name=\"year\" value=\"2nd Year\" required=\"required\">");
	out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-four\">2<sup>nd</sup> Year</label>");
	out.println("<input type=\"radio\" id=\"radio-five\" name=\"year\"name=\"year\" value=\"3rd Year\" required=\"required\">");
	out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-five\">3<sup>rd</sup> Year</label>");
	out.println("</div>");
out.println("<input type=\"submit\" class=\"mt-6 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded w-full text-xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl\" value=\"Create\">");
out.println("</div></div></form>");
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
</body>
</html>