<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
</head>
<body class="bg-gray-900">
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap p-1 flex-col lg:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -40 500 650">
     <g><circle cx="166" cy="226" r="10"/><circle cx="166" cy="286" r="10"/><circle cx="166" cy="346" r="10"/><circle cx="166" cy="406" r="10"/><path d="m226 236h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 296h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 356h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 416h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m406 90h-81.266c-3.626-14.035-14.698-25.108-28.734-28.734v-21.266c0-22.056-17.944-40-40-40s-40 17.944-40 40v21.266c-14.035 3.626-25.108 14.699-28.734 28.734h-81.266c-5.522 0-10 4.478-10 10v402c0 5.522 4.478 10 10 10h105c5.522 0 10-4.478 10-10s-4.478-10-10-10h-95v-382h70v20c0 5.522 4.478 10 10 10h120c5.522 0 10-4.478 10-10v-20h70v382h-95c-5.522 0-10 4.478-10 10s4.478 10 10 10h105c5.522 0 10-4.478 10-10v-402c0-5.522-4.477-10-10-10zm-170-50c0-11.028 8.972-20 20-20s20 8.972 20 20v20h-40zm70 80h-100v-20c0-11.028 8.972-20 20-20h60c11.028 0 20 8.972 20 20z"/><circle cx="256" cy="502" r="10"/></g></svg>
        <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Table</span>
    </a>
    <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
    <%
    	if(session.getAttribute("table").equals("student")){
    	switch((String)session.getAttribute("st")){
    		case "y1":
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y1\">");
    			out.println("<button  class=\"px-5 m-3 text-white outline-none transition duration-500 ease-in-out bg-red-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-4xl rounded-full border-b-4 border-red-700 hover:border-red-700\">1<sup>st</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y2\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full\">2<sup>nd</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y3\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full\">3<sup>rd</sup> Year</button>");
    			out.println("</form>");
    			break;
    			
    		case "y2":
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y1\">");
    			out.println("<button  class=\"px-5 m-3 text-white outline-none transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-2xl rounded-full\">1<sup>st</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y2\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-red-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full border-b-4 border-red-700 hover:border-red-700\">2<sup>nd</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y3\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-2xl rounded-full\">3<sup>rd</sup> Year</button>");
    			out.println("</form>");
    			break;
   			
    		case "y3":
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y1\">");
    			out.println("<button  class=\"px-5 m-3 text-white outline-none transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-2xl rounded-full\">1<sup>st</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y2\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-blue-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-2xl rounded-full\">2<sup>nd</sup> Year</button>");
    			out.println("</form>&nbsp;&nbsp;");
    			out.println("<form action=\"UserServlet\" method=\"post\">");
    			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_table\">");
    			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
    			out.println("<input type=\"hidden\" name=\"st\" value=\"y3\">");
    			out.println("<button  class=\"px-5 m-3 text-white transition duration-500 ease-in-out bg-red-500 hover:bg-red-500 transform hover:-translate-y-1 hover:scale-110 text-3xl rounded-full border-b-4 border-red-700 hover:border-red-700\">3<sup>rd</sup> Year</button>");
    			out.println("</form>");
    			break;
    	}
    	}
    %>
    	
          </nav>
   
<form action="UserServlet" method="POST">
    <input type="hidden" name="action" value="home">
    <button class="inline-flex items-center bg-gray-700 border-0 py-1 px-3 focus:outline-none bg-red-700 hover:bg-red-600 roundedtext-4xl xl:text-4xl lg:text-4xl md:text-4xl sm:text-5xl mt-4 md:mt-0 text-white rounded">Home
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
<br>
<%
		out.println("<div>");
		out.println("<form action=\"UserServlet\" method=\"post\">");
		out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");
		if(session.getAttribute("table").equals("staff")){
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");//compress]
			out.println("<input type=\"hidden\" name=\"table\" value=\"staff\">");
			out.println("<button type=\"submit\" class=\"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded w-full text-3xl\">Add New Teacher</button>");
		}
		else if(session.getAttribute("table").equals("student")){
			out.println("<input type=\"hidden\" name=\"action\" value=\"add_user_page\">");
			out.println("<input type=\"hidden\" name=\"table\" value=\"student\">");
			out.println("<button type=\"submit\" class=\"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded w-full text-3xl\">Add New Student</button>");
		}
		out.println("</form>");
		out.println("</div>");
		 %>	 
<br>
  <div class="lg:w-1/1 w-full mx-auto overflow-auto">
<table class="table-auto w-full text-left whitespace-no-wrap">
 <thead><tr>
<%
if(session.getAttribute("table").equals("staff")){
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl text-2xl\">ID</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Name</th>");
}
else{
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">ID</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Name</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Scheme</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Year</th>");
}

    	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tr rounded-br text-2xl\">Action</th>");
   
    %>
  </tr>
  </thead>
   
  <%
  	    List <User> users =(List)session.getAttribute("users");
  	for(User u: users){
  		if(session.getAttribute("table").equals("staff")){
  			out.println("<tr>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getUname()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getName()+"</td>");
  		}
  		else{
  			out.println("<tr>");
  	  		out.println("<td class=\">border-t-2 border-b-2 border-red-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getUname()+"</td>");
  	  		out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getName()+"</td>");
  	  		out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getScheme()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+u.getYear()+"</td>");
  			
  		}
  			
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl\"><form method=\"post\" action=\"UserServlet\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"edit_user_page\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			if(((String)session.getAttribute("table")).equals("student")){
  				out.println("<input type=\"hidden\" name=\"table\" value=\"" + (String)session.getAttribute("st") + "\">");
  			}
  			out.println("<button class=\"w-full m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-4 border border-green-500 hover:border-transparent rounded text-xl\">Update</button>");

  			out.println("</form>");
  			
  			out.println("<form method=\"post\" action=\"UserServlet\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"delete\">");
  			out.println("<input type=\"hidden\" name=\"idn\" value=\"" + u.getId() + "\">");
  			out.println("<button class=\"w-full m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-4 border border-red-500 hover:border-transparent rounded text-xl\" onclick=\"return confirm('Are you sure?')\">Delete</button>");
  			
  			out.println("</form></td>");
  		
  		out.println("</tr>");
  	}
  %>
  
</table>
</div>



</body>
</html>