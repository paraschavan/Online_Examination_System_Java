<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User,oes.Paper,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
<script src="./js/refresh.js"></script>
<script>
    $(document).ready(function(){
		 $("#div_list").load("student_refresh.jsp");
        setInterval(function() {
            $("#div_list").load("student_refresh.jsp");
        }, 1000);
    });
</script>
</head>
<body class="bg-gray-900">
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap p-1 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg"style="fill: white;" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 -80 450 650">
     <g><circle cx="166" cy="226" r="10"/><circle cx="166" cy="286" r="10"/><circle cx="166" cy="346" r="10"/><circle cx="166" cy="406" r="10"/>
     <g>
	<g>
		<path d="M347.658,0h-288c-30.911,0.04-55.96,25.089-56,56v287.336c0.04,30.911,25.089,55.96,56,56h88v-16h-88
			c-22.08-0.026-39.974-17.92-40-40V208h51.376c4.741-0.347,8.304-4.471,7.957-9.213c-0.067-0.914-0.279-1.812-0.629-2.659
			c-7.11-16.18,0.242-35.06,16.422-42.17c16.18-7.11,35.06,0.242,42.17,16.422c3.605,8.204,3.605,17.544,0,25.748
			c-1.976,4.134-0.226,9.087,3.908,11.063c1.069,0.511,2.236,0.787,3.42,0.81h51.376v48c-2.643-0.45-5.319-0.672-8-0.664
			c-26.51-0.009-48.007,21.474-48.017,47.983c-0.007,19.099,11.31,36.384,28.817,44.017l6.4-14.656
			c-16.206-7.05-23.629-25.902-16.58-42.108c5.086-11.693,16.629-19.25,29.38-19.236c4.409-0.001,8.769,0.92,12.8,2.704
			c4.049,1.767,8.765-0.083,10.532-4.132c0.44-1.008,0.667-2.096,0.668-3.196V208h40.68c-0.455,2.642-0.683,5.319-0.68,8
			c0.048,22.794,16.077,42.43,38.4,47.04l3.2-15.672c-14.882-3.079-25.567-16.171-25.6-31.368c-0.001-4.409,0.92-8.769,2.704-12.8
			c1.767-4.049-0.083-8.765-4.132-10.532c-1.008-0.44-2.096-0.667-3.196-0.668h-51.376v-40.68c2.642,0.455,5.319,0.683,8,0.68
			c26.51,0,48-21.49,48-48s-21.49-48-48-48c-2.681-0.003-5.358,0.225-8,0.68V16h136c22.08,0.026,39.974,17.92,40,40v136h-51.376
			c-4.418,0.002-7.998,3.586-7.996,8.004c0.001,1.1,0.228,2.188,0.668,3.196c1.784,4.031,2.705,8.391,2.704,12.8h16
			c0.003-2.681-0.225-5.358-0.68-8h48.68c4.418,0,8-3.582,8-8V56C403.618,25.089,378.569,0.04,347.658,0z M219.658,72
			c17.673,0,32,14.327,32,32s-14.327,32-32,32c-4.409,0.001-8.769-0.92-12.8-2.704c-4.049-1.767-8.765,0.083-10.532,4.132
			c-0.44,1.008-0.667,2.096-0.668,3.196v50.712h-40.624c0.401-2.425,0.609-4.878,0.624-7.336c0-0.144,0-0.272,0-0.416
			s0-0.168,0-0.248c0-26.51-21.49-48-48-48c-26.51,0-48,21.49-48,48c0,0.08,0,0.168,0,0.248s0,0.272,0,0.416
			c0.015,2.458,0.223,4.911,0.624,7.336H19.658V56c0.026-22.08,17.92-39.974,40-40h136v51.376c0.002,4.418,3.586,7.998,8.004,7.996
			c1.1-0.001,2.188-0.228,3.196-0.668C210.889,72.92,215.249,71.999,219.658,72z"/>
	</g>
</g>
<g>
	<g>
		<path d="M466.546,343.856l-67.256-46.312l-25.832-69.016c-1.541-4.141-6.147-6.248-10.288-4.707
			c-0.148,0.055-0.295,0.115-0.44,0.179l-52,23c-3.898,1.721-5.762,6.196-4.24,10.176c0.864,2.24,1.672,3.936,2.528,5.696
			s1.648,3.408,2.616,6.008c6.21,16.593-2.151,35.087-18.712,41.384c-16.553,6.191-34.991-2.208-41.183-18.762
			c-1.553-4.152-2.226-8.581-1.977-13.006c0.232-4.412-3.157-8.177-7.569-8.409c-1.106-0.058-2.211,0.114-3.247,0.505
			l-55.584,20.936c-4.127,1.555-6.217,6.157-4.672,10.288l19.952,53.304c-2.645,0.482-5.242,1.199-7.76,2.144
			c-24.895,9.277-37.555,36.979-28.278,61.874c9.277,24.895,36.979,37.555,61.874,28.278c2.563-0.955,5.04-2.127,7.404-3.504
			l14.304,38.208c1.55,4.138,6.16,6.235,10.298,4.685c0.005-0.002,0.009-0.004,0.014-0.005l79.264-29.864
			c4.979,10.702,14.141,18.883,25.336,22.624l5.056-15.2c-6.594-2.222-12.074-6.905-15.296-13.072l24.12-9.08
			c7.923,22.285,29.029,37.159,52.68,37.128v-16c-22.035-0.135-39.865-17.965-40-40c0-2.122-0.844-4.156-2.344-5.656l-27.856-27.856
			c-4.13-4.166-4.596-10.724-1.096-15.432c2.038-2.751,5.184-4.465,8.6-4.688c3.421-0.288,6.79,0.972,9.184,3.432l55.856,55.856
			l11.312-11.312l-16.528-16.528c4.072-12.177,3.821-25.386-0.712-37.4l-14.992-40.04L457.426,357
			c6.408,4.498,10.226,11.835,10.232,19.664V480h16V376.664C483.647,363.591,477.26,351.346,466.546,343.856z M409.09,369.36
			c2.21,5.874,3.01,12.184,2.336,18.424l-25.968-25.96c-10.719-10.993-28.319-11.214-39.312-0.496
			c-10.993,10.719-11.214,28.319-0.496,39.312c0.163,0.167,0.328,0.333,0.496,0.496l25.304,25.304l-113.056,42.584l-15.248-40.744
			c-0.949-2.532-3.113-4.412-5.752-5c-0.57-0.126-1.152-0.191-1.736-0.192c-2.093-0.002-4.103,0.817-5.6,2.28
			c-12.846,12.137-33.1,11.562-45.237-1.285c-12.137-12.846-11.562-33.1,1.285-45.237c3.022-2.855,6.57-5.093,10.448-6.591
			c2.547-0.944,5.207-1.546,7.912-1.792c1.664-0.204,3.342-0.26,5.016-0.168c4.412,0.231,8.177-3.158,8.408-7.57
			c0.058-1.097-0.111-2.194-0.496-3.222l-20.896-55.792l38.096-14.344c5,26.034,30.158,43.085,56.192,38.086
			c2.66-0.511,5.272-1.246,7.808-2.198c24.807-9.412,37.346-37.099,28.056-61.952c-0.736-1.968-1.4-3.528-2.04-4.92l36.8-16.296
			L409.09,369.36z"/>
	</g>
</g>
      <span class="ml-3 text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Dashboard</span>
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

 <div class="bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md flex" role="alert">
      <div class="flex-grow ">
  <p class="font-bold xl:text-2xl lg:text-2xl md:text-2xl sm:text-3xl text-center">Subject</p>
  <p class="xl:text-xl lg:text-xl md:text-xl sm:text-2xl text-center"><%=((Paper)session.getAttribute("paper")).getSub()%></p>
  </div>
  <div class="flex-grow">
  <p class="font-bold xl:text-2xl lg:text-2xl md:text-2xl sm:text-3xl text-center">Subject Code</p>
  <p class="xl:text-xl lg:text-xl md:text-xl sm:text-2xl text-center"><%=((Paper)session.getAttribute("paper")).getSubcode()%></p>
  </div>
   <div class="flex-grow">
  <p class="font-bold xl:text-2xl lg:text-2xl md:text-2xl sm:text-3xl text-center">Year</p>
  <p class="xl:text-xl lg:text-xl md:text-xl sm:text-2xl text-center"><%=((Paper)session.getAttribute("paper")).getYear()%></p>
  </div>
    <div class="py-1"><svg class="fill-current h-6 w-6 text-red-500 mr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z"/></svg></div>
      <div class="font-bold xl:text-2xl lg:text-2xl md:text-2xl sm:text-3xl">If The Students Are Not In The List Please Tell Them To Login Or Refresh The Login Page
      <%
    out.println("<form action=\"Exam\" autocomplete=\"off\" method=\"post\">");
	out.println("<input type=\"hidden\" name=\"action\" value=\"start\">");
	out.println("<div class='flex inline'>");
	out.println("<label for='time'>Time&nbsp;</label>");
	out.println("<input type=\"number\" name=\"time\" id=\"time\" min=\"10\" step=\"10\" required=\"required\" style=\"color:white;background-color:#4D4D4D;\">");
	out.println("<input type=\"submit\" class=\"inline bg-gray-700 hover:bg-gray-800 text-white font-bold w-full border-b-4 border-teal-700 hover:border-teal-500 rounded\" value=\"Start Exam\">");
	out.println("</div>");
	out.println("</form>");

  %>
  
      </div>
      
</div>
<div id="div_list"></div>
</body>
</html>