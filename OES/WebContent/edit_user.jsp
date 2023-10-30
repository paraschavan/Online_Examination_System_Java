<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>
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
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -40 450 650">
      <g>
		<path d="M225,0C150.561,0,90,60.561,90,135s60.561,135,135,135s135-60.561,135-135S299.439,0,225,0z"/>
	</g>
</g>
<g>
	<g>
		<path d="M407,302c-23.388,0-45.011,7.689-62.483,20.667C315.766,308.001,284.344,300,255,300h-60
			c-52.009,0-101.006,20.667-137.966,58.195C20.255,395.539,0,444.834,0,497c0,8.284,6.716,15,15,15h392
			c57.897,0,105-47.103,105-105C512,349.103,464.897,302,407,302z M407,482c-41.355,0-75-33.645-75-75
			c0-21.876,9.418-41.591,24.409-55.313c0.052-0.048,0.103-0.098,0.154-0.147C369.893,339.407,387.597,332,407,332
			c41.355,0,75,33.645,75,75C482,448.355,448.355,482,407,482z"/>
	</g>
</g>
<g>
	<g>
		<path d="M437,392h-15v-15c0-8.284-6.716-15-15-15s-15,6.716-15,15v15h-15c-8.284,0-15,6.716-15,15s6.716,15,15,15h15v15
			c0,8.284,6.716,15,15,15s15-6.716,15-15v-15h15c8.284,0,15-6.716,15-15S445.284,392,437,392z"/>
	</g>
      <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">User Panel</span>
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
if((session.getAttribute("action").equals("add_user_page"))){
if(session.getAttribute("table").equals("staff")){
	out.println("<h2 class='text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-3xl text-center text-white bg-gray-700 m-2'>Add New Teacher</h2>");
}
else if(session.getAttribute("table").equals("student")){
	out.println("<h2 class='text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-3xl text-center text-white bg-gray-700 m-2'>Add New Student</h2>");
}
}
%>
<%
if((session.getAttribute("action").equals("add_user_page"))){
	out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
	out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-6'>");
	out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
	out.println("<input type=\"hidden\" name=\"action\" value=\"add_user\">");
	out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"name\" placeholder=\"Enter Full Name\" required=\"required\"></div>");
	out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"uname\" placeholder=\"User ID\" required=\"required\"></div>");
	out.println("<div class='p-2 w-1/2'><input type=\"password\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 px-4 py-2 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl' name=\"pass\" placeholder=\"Enter Password\" required=\"required\"></div>");
	if(((String)session.getAttribute("table")).equals("student")){
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"scheme\"  maxlength=\"1\" pattern=\"[ABCDEFGHIJKLMNOPQRSTUVWXYZ]\" placeholder=\"Enter Scheme (Example: I)\"I\"\" required=\"required\"></div>");
		out.println("<div class=\"radio p-2 mt-6 w-full\">");
		out.println("<input type=\"radio\" id=\"radio-three\" name=\"table\" value=\"y1\" required=\"required\">");
		out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-three\">1<sup>st</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-four\" name=\"table\" value=\"y2\" required=\"required\">");
		out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-four\">2<sup>nd</sup> Year</label>");
		out.println("<input type=\"radio\" id=\"radio-five\" name=\"table\" value=\"y3\" required=\"required\">");
		out.println("<label class='px-5 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-3xl -m-1 transition duration-500 ease-in-out' for=\"radio-five\">3<sup>rd</sup> Year</label>");
		out.println("</div>");
	}
	out.println("<button type=\"submit\" class=\"mt-6 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded w-full text-xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl\">Create</button>");
	out.println("</div></div></form>");
}
else{
	if(session.getAttribute("table").equals("staff")){
		out.println("<h2 class='text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-3xl text-center text-white bg-gray-700 m-2'>Edit Teacher</h2>");
		out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
		out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-6'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_update\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+((User)(session.getAttribute("user"))).getId() + "\">");
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"name\" placeholder=\"Enter Full Name: "+((String)((User)(session.getAttribute("user"))).getName()) + "\" required=\"required\"></div>");
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"uname\" placeholder=\"User ID: "+((User)(session.getAttribute("user"))).getUname() + "\" required=\"required\"/></div>");
		out.println("<div class='p-2 w-1/2'><input type=\"password\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"pass\" placeholder=\"Enter New Password\" required=\"required\"/></div>");
	}
	else if(session.getAttribute("table").equals("student")){
		out.println("<h2 class='text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-3xl text-center text-white bg-gray-700 m-2'>Edit Student</h2>");
		out.println("<form action=\"UserServlet\" autocomplete=\"off\" method=\"post\">");
		out.println("<div class='lg:w-11/12 w-11/12 mx-auto mt-6'>");
		out.println("<div class='flex flex-wrap p-1 border-2 rounded-lg border-gray-800'>");
		out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_update\">");
		out.println("<input type=\"hidden\" name=\"st\" value=\""+session.getAttribute("st")+"\">");
		out.println("<input type=\"hidden\" name=\"idn\" value=\""+((User)(session.getAttribute("user"))).getId() + "\">");
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"name\" placeholder=\"Enter Full Name: "+((String)((User)(session.getAttribute("user"))).getName()) + "\" required=\"required\"></div>");
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"uname\" placeholder=\"User ID: "+((String)((User)(session.getAttribute("user"))).getUname()) + "\" required=\"required\"/></div>");
		out.println("<div class='p-2 w-1/2'><input type=\"text\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"scheme\"  maxlength=\"1\" pattern=\"[ABCDEFGHIJKLMNOPQRSTUVWXYZ]\" placeholder=\"Enter Scheme: "+((User)(session.getAttribute("user"))).getScheme() + "\" required=\"required\"></div>");
		out.println("<div class='p-2 w-1/2'><input type=\"password\" class='w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-xl xl:text-5xl lg:text-4xl md:text-4xl sm:text-2xl px-4 py-2' name=\"pass\" placeholder=\"Enter New Password\" required=\"required\"/></div>");
		
	}
	
	out.println("<button type=\"submit\" class=\"mt-6 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded w-full text-xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl\">Update</button>");
	out.println("</div></div></form>");
}
%>  
</body>
</html>