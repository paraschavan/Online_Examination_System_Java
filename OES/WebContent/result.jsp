<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,java.util.List,oes.Result"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
</head>
<body class="bg-gray-900">
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap p-1 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -40 450 650">
   <g><path d="m386.927 142.541c3.689-1.882 5.155-6.399 3.272-10.089l-36.451-71.453c-1.302-2.547-4.023-4.217-7.017-4.079-2.714.121-5.152 1.738-6.344 4.079l-36.45 71.453c-1.883 3.69-.417 8.207 3.272 10.089 3.69 1.881 8.207.417 10.089-3.273l11.253-22.06h37.033l11.253 22.06c1.884 3.693 6.404 5.154 10.09 3.273zm-50.724-40.332 10.865-21.298 10.865 21.298z"/><path d="m367.466 60.924h6.863v6.863c0 4.142 3.357 7.5 7.5 7.5s7.5-3.358 7.5-7.5v-6.863h6.862c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-6.862v-6.863c0-4.142-3.357-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v6.863h-6.863c-4.143 0-7.5 3.358-7.5 7.5s3.358 7.5 7.5 7.5z"/><path d="m178.151 175.477c-8.429-8.43-22.073-8.433-30.504-.001l-7.761 7.76-.05-.05c-8.43-8.43-22.073-8.432-30.504 0-8.429 8.427-8.434 22.073-.001 30.504l15.303 15.303c8.43 8.43 22.074 8.431 30.505 0l23.012-23.012c8.409-8.411 8.409-22.095 0-30.504zm-10.608 19.897-23.012 23.012c-2.566 2.568-6.724 2.568-9.29 0l-15.304-15.303c-2.567-2.568-2.568-6.721.001-9.291 2.562-2.563 6.716-2.573 9.29 0l5.354 5.354c2.929 2.929 7.678 2.929 10.606 0l13.064-13.063c2.565-2.566 6.724-2.568 9.29 0 2.563 2.561 2.563 6.729.001 9.291z"/><path d="m178.151 249.831c-8.429-8.43-22.073-8.433-30.504 0l-7.761 7.76-.05-.05c-8.429-8.429-22.074-8.432-30.504 0-8.429 8.427-8.434 22.073-.001 30.504l15.303 15.303c8.43 8.43 22.073 8.43 30.505 0l23.012-23.012c8.409-8.412 8.409-22.095 0-30.505zm-10.608 19.897-23.012 23.012c-2.566 2.567-6.724 2.568-9.29 0l-15.304-15.303c-2.567-2.568-2.568-6.721.001-9.291 2.561-2.562 6.716-2.573 9.29 0l5.354 5.354c2.929 2.929 7.678 2.929 10.606 0l13.064-13.063c2.565-2.566 6.724-2.568 9.29 0 2.563 2.562 2.563 6.73.001 9.291z"/><path d="m178.151 324.186c-8.429-8.43-22.073-8.433-30.504-.001l-7.761 7.76-.05-.05c-8.43-8.43-22.073-8.432-30.504 0-8.429 8.427-8.434 22.073-.001 30.504l15.303 15.303c8.43 8.43 22.074 8.431 30.505 0l23.012-23.012c8.409-8.411 8.409-22.094 0-30.504zm-10.608 19.897-23.012 23.012c-2.566 2.568-6.724 2.568-9.29 0l-15.304-15.303c-2.567-2.568-2.568-6.721.001-9.291 2.562-2.563 6.716-2.573 9.29 0l5.354 5.354c2.929 2.929 7.678 2.929 10.606 0l13.064-13.063c2.565-2.566 6.724-2.568 9.29 0 2.563 2.562 2.563 6.729.001 9.291z"/><path d="m347.875 271.135c0-9.289-7.558-16.847-16.847-16.847h-113.212c-9.289 0-16.847 7.558-16.847 16.847v10.907c0 9.289 7.558 16.847 16.847 16.847h113.213c9.289 0 16.847-7.558 16.847-16.847v-10.907zm-15 10.907c0 1.018-.828 1.847-1.847 1.847h-113.212c-1.019 0-1.847-.829-1.847-1.847v-10.907c0-1.018.828-1.847 1.847-1.847h113.213c1.019 0 1.847.829 1.847 1.847v10.907z"/><path d="m347.875 345.49c0-9.289-7.558-16.847-16.847-16.847h-113.212c-9.289 0-16.847 7.558-16.847 16.847v10.907c0 9.289 7.558 16.847 16.847 16.847h113.213c9.289 0 16.847-7.558 16.847-16.847v-10.907zm-15 10.906c0 1.018-.828 1.847-1.847 1.847h-113.212c-1.019 0-1.847-.829-1.847-1.847v-10.906c0-1.018.828-1.847 1.847-1.847h113.213c1.019 0 1.847.829 1.847 1.847v10.906z"/><path d="m147.647 398.54-7.761 7.759-.05-.05c-8.43-8.43-22.073-8.432-30.504 0-8.429 8.427-8.434 22.073-.001 30.504l15.303 15.303c8.43 8.43 22.074 8.431 30.505 0l23.012-23.012c8.409-8.41 8.409-22.094 0-30.503-8.429-8.43-22.074-8.434-30.504-.001zm19.896 19.898-23.012 23.012c-2.566 2.568-6.724 2.568-9.29 0l-15.304-15.303c-2.567-2.568-2.568-6.721.001-9.291 2.562-2.563 6.716-2.573 9.29 0l5.354 5.354c2.927 2.927 7.678 2.929 10.606 0l13.064-13.063c2.565-2.566 6.724-2.568 9.29 0 2.563 2.561 2.563 6.729.001 9.291z"/><path d="m331.029 432.598h-39.949c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h39.949c9.289 0 16.847-7.558 16.847-16.847v-10.907c0-9.289-7.558-16.847-16.847-16.847h-113.213c-9.289 0-16.847 7.558-16.847 16.847v10.907c0 9.289 7.558 16.847 16.847 16.847h38.264c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-38.264c-1.019 0-1.847-.829-1.847-1.847v-10.907c0-1.018.828-1.847 1.847-1.847h113.213c1.019 0 1.847.829 1.847 1.847v10.907c-.001 1.019-.829 1.847-1.847 1.847z"/><path d="m378.251 301.335c4.143 0 7.5-3.358 7.5-7.5v-112.688c35.64-13.189 61.114-47.518 61.114-87.687 0-51.534-41.927-93.46-93.461-93.46-29.457 0-55.77 13.703-72.913 35.064h-142.672c-1.895 0-3.85.743-5.304 2.197l-65.181 65.181c-1.45 1.449-2.196 3.392-2.196 5.303v382.062c0 12.239 9.957 22.197 22.196 22.197h276.22c12.239 0 22.197-9.958 22.197-22.197v-160.972c0-4.142-3.357-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v160.972c0 3.968-3.229 7.197-7.197 7.197h-276.22c-3.968 0-7.196-3.229-7.196-7.197v-374.562h42.984c12.239 0 22.196-9.957 22.196-22.196v-42.985h125.293c-6.448 12.243-10.05 25.736-10.59 39.766-1.516 40.154 22.487 75.518 57.94 90.103h-100.145c-9.289 0-16.847 7.558-16.847 16.847v10.907c0 9.289 7.558 16.847 16.847 16.847h113.213c9.289 0 16.847-7.558 16.847-16.847v-10.907c0-3.881-1.333-7.45-3.546-10.301 2.987.289 6.014.442 9.075.442 5.837 0 11.753-.566 17.347-1.619v108.534c-.001 4.142 3.357 7.499 7.499 7.499zm-247.932-208.286c0 3.968-3.229 7.196-7.196 7.196h-32.378l39.574-39.574zm202.556 114.638c0 1.018-.828 1.847-1.847 1.847h-113.212c-1.019 0-1.847-.829-1.847-1.847v-10.907c0-1.018.828-1.847 1.847-1.847h113.213c1.019 0 1.847.829 1.847 1.847v10.907zm20.53-35.766c-43.263 0-78.46-35.197-78.46-78.46 0-43.193 35.133-78.46 78.46-78.46 43.264 0 78.461 35.197 78.461 78.46 0 43.222-35.165 78.46-78.461 78.46z"/></g>
      <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Result</span>
    </a>
    <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
          </nav>
          <%
String result=(String)session.getAttribute("resultAction");

if(result.equals("show")){
	out.println("<form action='UserServlet' method='post'>");
	out.println("<input type='hidden' name='action' value='logout'>");
	out.println("<button class='inline-flex items-center bg-gray-700 border-0 py-1 px-3 focus:outline-none bg-red-700 hover:bg-red-600 rounded  text-4xl xl:text-4xl lg:text-4xl md:text-4xl sm:text-5xl mt-4 md:mt-0 text-white'>Log Out");
	out.println("<svg fill='none' stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' class='w-10 h-10 ml-3' viewBox='0 -4 30 29'>");
	out.println("<path d='M10 9.408l2.963 2.592-2.963 2.592v-1.592h-8v-2h8v-1.592zm-2-4.408v4h-8v6h8v4l8-7-8-7zm6-3c-1.787 0-3.46.474-4.911 1.295l.228.2 1.396 1.221c1.004-.456 2.114-.716 3.287-.716 4.411 0 8 3.589 8 8s-3.589 8-8 8c-1.173 0-2.283-.26-3.288-.715l-1.396 1.221-.228.2c1.452.82 3.125 1.294 4.912 1.294 5.522 0 10-4.477 10-10s-4.478-10-10-10z'></path>");
	out.println("</svg>");
	out.println("</button>");
	out.println("</form>");
}
else{
	out.println("<form action='UserServlet' method='POST'>");
	out.println("<input type='hidden' name='action' value='home'>");
	out.println("<button class='inline-flex items-center bg-gray-700 border-0 py-1 px-3 focus:outline-none bg-red-700 hover:bg-red-600 rounded xl:text-4xl lg:text-4xl md:text-4xl sm:text-5xl mt-4 md:mt-0 text-white'>Home");
	out.println(" <svg style='fill: white;' stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' class='w-10 h-10 ml-3' viewBox='0 -40 600 600'>");
	out.println("		<path d='M481.765,220.422L276.474,15.123c-16.967-16.918-44.557-16.942-61.559,0.023L9.626,220.422c-12.835,12.833-12.835,33.65,0,46.483c12.843,12.842,33.646,12.842,46.487,0l27.828-27.832v214.872c0,19.343,15.682,35.024,35.027,35.024h74.826v-97.62c0-7.584,6.146-13.741,13.743-13.741h76.352c7.59,0,13.739,6.157,13.739,13.741v97.621h74.813c19.346,0,35.027-15.681,35.027-35.024V239.091l27.812,27.815c6.425,6.421,14.833,9.63,23.243,9.63c8.408,0,16.819-3.209,23.242-9.63C494.609,254.072,494.609,233.256,481.765,220.422z'/>");
	out.println(" </svg>");
	out.println("</button>");
	out.println("</form>");
	
}	
%>    
  </div>
</header> 
<table class="table-auto w-full text-left whitespace-no-wrap">
 <thead><tr>
 <%
 
if(result.equals("show")){
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl text-2xl\">ID</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Name</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Scheme</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tr rounded-br text-2xl\">Marks</th>");	
}
else{
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tl rounded-bl text-2xl\">Select</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">ID</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Name</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Scheme</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 text-2xl\">Marks</th>");
	out.println("<th class=\"px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-200 rounded-tr rounded-br text-2xl\">Action</th>");
}
  %>   
 </tr></thead>
 <%
  	    List <Result> list =(List)session.getAttribute("result");
  	for(Result l: list){
  		if(result.equals("show")){
  			out.println("<tr>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getUname()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getName()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getScheme()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getMarks()+"</td>");
  	  		out.println("</tr>");
  		}
  		else{
  			out.println("<tr>");
  			
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\"><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"showPaper\">");
  			out.println("<input type=\"hidden\" name=\"sid\" value=\"" +l.getSid()+ "\">");
  			out.println("<input type=\"hidden\" name=\"name\" value=\"" +l.getName()+ "\">");
  			out.println("<input type=\"hidden\" name=\"uname\" value=\"" +l.getUname()+ "\">");
  			out.println("<button class=\"w-full m-px bg-transparent hover:bg-green-500 text-green-700 font-semibold hover:text-white py-2 px-4 border border-green-500 hover:border-transparent rounded text-xl\">Select</button>");

  			out.println("</form></td>");
  			
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getUname()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getName()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getScheme()+"</td>");
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\">"+l.getMarks()+"</td>");
  			  			
  			out.println("<td class=\">border-t-2 border-b-2 border-gray-200 px-4 py-3 text-white text-xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-3xl\"><form method=\"post\" action=\"Exam\">");
  			out.println("<input type=\"hidden\" name=\"action\" value=\"deletePaper\">");
  			out.println("<input type=\"hidden\" name=\"paperName\" value=\"" +l.getPaperName() + "\">");
  			out.println("<input type=\"hidden\" name=\"sid\" value=\"" +l.getSid() + "\">");
  			out.println("<button class=\"w-full m-px bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-4 border border-red-500 hover:border-transparent rounded text-xl\" onclick=\"return confirm('Are you sure?')\">Delete</button>");
  			
  			out.println("</form></td>");
  		
  		out.println("</tr>");
  		}
  	}
  %>
</body>
</html>