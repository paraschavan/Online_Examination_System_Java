<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tailwind.min.css">
</head>
<body class="bg-gray-900">
<%
User id=(User)session.getAttribute("id");
%>
<header class="text-gray-500 bg-gray-800 body-font">
  <div class="container mx-auto flex flex-wrap flex-col lg:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="w-16 h-16 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 60 70">
        <path d="m34 16v-3a11 11 0 0 0 -22 0v3a3 3 0 0 0 0 6v1a11.014 11.014 0 0 0 6 9.79v3.47l-8.28 2.59a10.964 10.964 0 0 0 -7.72 10.5v11.65a1 1 0 0 0 1 1h27v-2h-19v-11h-2v11h-5v-10.65a8.959 8.959 0 0 1 6.32-8.59l5.28-1.65-.59 4.77a.983.983 0 0 0 .39.92 1.029 1.029 0 0 0 .6.2 1.046 1.046 0 0 0 .39-.08l6.61-2.83 6.61 2.83a1.046 1.046 0 0 0 .39.08 1.029 1.029 0 0 0 .6-.2.983.983 0 0 0 .39-.92l-.59-4.77 2.3.72.6-1.91-5.3-1.66v-3.47a11.014 11.014 0 0 0 6-9.79v-1a3 3 0 0 0 0-6zm-22 4a1 1 0 0 1 0-2zm5.21 22.39.49-3.94 1.02-.32 2.53 2.53zm2.79-5.8v-3.02a10.68 10.68 0 0 0 6 0v3.02l-3 3zm8.3 1.86.49 3.94-4.04-1.73 2.53-2.53zm3.7-15.45a9 9 0 0 1 -18 0v-4.58c.99-.94 4.42-4.06 7.42-5.19a7.706 7.706 0 0 0 3.13 3.66 1 1 0 0 0 1.34-.44 3.144 3.144 0 0 1 1.52-1.36 8.058 8.058 0 0 0 4.59 3.64zm0-6.39a5.591 5.591 0 0 1 -3.05-2.93 1.014 1.014 0 0 0 -.95-.68 4.268 4.268 0 0 0 -3.25 1.61 8.027 8.027 0 0 1 -1.8-2.93 1.014 1.014 0 0 0 -1.19-.65c-2.77.69-5.88 3.08-7.76 4.7v-2.73a9 9 0 0 1 18 0zm2 3.39v-2a1 1 0 0 1 0 2z"/><path d="m17 19h2v2h-2z"/><path d="m27 19h2v2h-2z"/><path d="m27 25h-2a2 2 0 0 1 -4 0h-2a4 4 0 0 0 8 0z"/><path d="m61.937 56.649-2.937-7.831v-12.818a3 3 0 0 0 -3-3v2a1 1 0 0 1 1 1v12h-20v-12a1 1 0 0 1 1-1v-2a3 3 0 0 0 -3 3v12.818l-2.937 7.831a1 1 0 0 0 -.063.351v3a2 2 0 0 0 2 2h26a2 2 0 0 0 2-2v-3a1 1 0 0 0 -.063-.351zm-4.63-6.649 2.25 6h-6.837l-.772-2.316a1 1 0 0 0 -.948-.684h-8a1 1 0 0 0 -.948.684l-.772 2.316h-6.837l2.25-6zm-6.694 6h-7.226l.334-1h6.558zm-16.613 4v-2h26v2z"/><path d="m46 40h2v2h-2z"/><path d="m50 40h2v2h-2z"/><path d="m42 40h2v2h-2z"/><path d="m38.758 30.97 1.667.417c.071.2.15.387.237.575l-.884 1.473a1 1 0 0 0 .151 1.222l1.414 1.414a1 1 0 0 0 1.221.15l1.474-.884q.282.132.574.238l.418 1.668a1 1 0 0 0 .97.757h2a1 1 0 0 0 .97-.757l.418-1.668q.292-.107.574-.238l1.474.884a1 1 0 0 0 1.221-.15l1.414-1.414a1 1 0 0 0 .151-1.222l-.884-1.473c.087-.188.166-.379.237-.575l1.667-.417a1 1 0 0 0 .758-.97v-2a1 1 0 0 0 -.758-.97l-1.667-.417c-.071-.2-.15-.387-.237-.575l.884-1.473a1 1 0 0 0 -.151-1.222l-1.414-1.414a1 1 0 0 0 -1.221-.15l-1.474.884q-.282-.132-.574-.238l-.418-1.668a1 1 0 0 0 -.97-.757h-2a1 1 0 0 0 -.97.757l-.418 1.668q-.292.106-.574.238l-1.474-.884a1 1 0 0 0 -1.221.15l-1.414 1.414a1 1 0 0 0 -.151 1.222l.884 1.473c-.087.188-.166.379-.237.575l-1.667.417a1 1 0 0 0 -.758.97v2a1 1 0 0 0 .758.97zm1.242-2.189 1.452-.364a1 1 0 0 0 .724-.71 4.983 4.983 0 0 1 .5-1.2 1 1 0 0 0 -.008-1.016l-.77-1.283.31-.309 1.283.769a1 1 0 0 0 1.016.008 5 5 0 0 1 1.2-.5 1 1 0 0 0 .711-.723l.362-1.453h.44l.363 1.453a1 1 0 0 0 .711.723 5 5 0 0 1 1.2.5 1 1 0 0 0 1.016-.008l1.29-.768.31.309-.77 1.283a1 1 0 0 0 -.008 1.016 4.983 4.983 0 0 1 .5 1.2 1 1 0 0 0 .724.71l1.444.363v.438l-1.452.364a1 1 0 0 0 -.724.71 4.983 4.983 0 0 1 -.5 1.2 1 1 0 0 0 .008 1.016l.77 1.283-.31.309-1.283-.769a1 1 0 0 0 -1.016-.008 5 5 0 0 1 -1.2.5 1 1 0 0 0 -.711.723l-.362 1.453h-.44l-.363-1.453a1 1 0 0 0 -.711-.723 5 5 0 0 1 -1.2-.5 1 1 0 0 0 -1.016.008l-1.283.769-.307-.301.77-1.283a1 1 0 0 0 .008-1.016 4.983 4.983 0 0 1 -.5-1.2 1 1 0 0 0 -.724-.71l-1.454-.372z"/><path d="m47 33a4 4 0 1 0 -4-4 4 4 0 0 0 4 4zm0-6a2 2 0 1 1 -2 2 2 2 0 0 1 2-2z"/></g></svg>
      <span class="ml-3 text-white text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl"><%=id.getName()%></span>
      <span class="ml-5 text-xl"> <p class=" text-4xl xl:text-5xl lg:text-5xl md:text-5xl sm:text-5xl text-gray-600 sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-900 sm:py-2 sm:mt-0 mt-4">Teacher Panel</p></span>
    </a>
    <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
          </nav>
   <form action="UserServlet" method="post">
   <input type="hidden" name="action" value="logout">
       <button class="inline-flex items-center bg-gray-700 border-0 py-1 px-3 focus:outline-none bg-red-700 hover:bg-red-600 rounded  text-4xl xl:text-4xl lg:text-4xl md:text-4xl sm:text-5xl mt-4 md:mt-0 text-white">Log Out
   <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 ml-3" viewBox="0 -4 30 29">
        <path d="M10 9.408l2.963 2.592-2.963 2.592v-1.592h-8v-2h8v-1.592zm-2-4.408v4h-8v6h8v4l8-7-8-7zm6-3c-1.787 0-3.46.474-4.911 1.295l.228.2 1.396 1.221c1.004-.456 2.114-.716 3.287-.716 4.411 0 8 3.589 8 8s-3.589 8-8 8c-1.173 0-2.283-.26-3.288-.715l-1.396 1.221-.228.2c1.452.82 3.125 1.294 4.912 1.294 5.522 0 10-4.477 10-10s-4.478-10-10-10z"></path>
      </svg>
    </button>
   </form>
      
  </div>
</header>
<%
User u=(User)session.getAttribute("datareturn");
%>
<section class="text-gray-500 body-font py-6 ">
  <div class="container px-5  mx-auto lg:flex-row">
    
    <div class="flex flex-wrap -m-4 text-center justify-center">
      <div class="p-4">
        <div class="border-2 border-gray-200 px-4 py-3 rounded-lg text-3xl text-3xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-4xl">
          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 70 60">
           <path d="m62 29h-24a1 1 0 0 0 -1 1v3.61a12.09 12.09 0 0 0 -6-1.61h-3v-2a10 10 0 0 0 3.83-6h.17a4 4 0 0 0 3-6.62v-3.38a13 13 0 0 0 -26 0v3.38a4 4 0 0 0 3 6.62h.2a10 10 0 0 0 3.8 6v2h-3a12 12 0 0 0 -12 12v18a1 1 0 0 0 1 1h33v-2h-8.15l-2.85-16.84 1.21-2.42 2.3 1.15a1 1 0 0 0 .49.11 1 1 0 0 0 .95-.68l2.76-8.32a10 10 0 0 1 5.29 2v26a1 1 0 0 0 1 1h24a1 1 0 0 0 1-1v-32a1 1 0 0 0 -1-1zm-30-7v-4a2 2 0 0 1 0 4zm-22-2a2 2 0 0 1 2-2v4a2 2 0 0 1 -2-2zm2-4a4.09 4.09 0 0 0 -1 .14v-2.14a11 11 0 0 1 22 0v2.14a4.09 4.09 0 0 0 -1-.14 1 1 0 0 0 -1-1 5 5 0 0 1 -4-2l-1.2-1.6a1 1 0 0 0 -1.6 0l-1.2 1.6a5 5 0 0 1 -4 2h-6a1 1 0 0 0 -1 1zm2 6v-5h5a7 7 0 0 0 5.6-2.8l.4-.53.4.53a7.06 7.06 0 0 0 4.6 2.73v5.07a8 8 0 0 1 -16 0zm8 10a9.92 9.92 0 0 0 4-.84v1.48l-4 4.8-4-4.8v-1.48a9.92 9.92 0 0 0 4 .84zm-5.42 8.59-2.19-6.59h2.14l3.89 4.67zm-13.58 3.41a10 10 0 0 1 9.29-10l2.76 8.28a1 1 0 0 0 .95.72 1 1 0 0 0 .45-.11l2.3-1.15 1.25 2.42-2.85 16.84h-8.15v-14h-2v14h-4zm16.18 17 2.67-16h.3l2.67 16zm3.2-18h-.76l-1.08-2.15 1.46-.73 1.46.73zm5-2.41-3.84-1.92 3.93-4.67h2.14zm17.62-9.59h10v2h-10zm16 30h-22v-30h4v3a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-3h4z"/><path d="m46 37h-4a1 1 0 0 0 -1 1v4a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-4a1 1 0 0 0 -1-1zm-1 4h-2v-2h2z"/><path d="m46 45h-4a1 1 0 0 0 -1 1v4a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-4a1 1 0 0 0 -1-1zm-1 4h-2v-2h2z"/><path d="m46 53h-4a1 1 0 0 0 -1 1v4a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-4a1 1 0 0 0 -1-1zm-1 4h-2v-2h2z"/><path d="m49 37h10v2h-10z"/><path d="m49 41h10v2h-10z"/><path d="m49 45h10v2h-10z"/><path d="m49 49h10v2h-10z"/><path d="m49 53h10v2h-10z"/><path d="m49 57h10v2h-10z"/></g></svg>
          <h2 class="title-font font-medium text-white"><%out.print(Integer.parseInt(u.getUname())-1);%></h2>
          <p class="leading-relaxed ">Teacher</p>
        </div>
      </div>
      <div class="p-4">
        <div class="border-2 border-gray-200 px-4 py-3 rounded-lg text-3xl text-3xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-4xl">
          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="10" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 -50 500 600">
  			<g>
	<g>
		<path d="M466.75,242.763V86.25c0-2.346-0.643-4.493-1.6-6.469c0.577-1.599,1.6-3.01,1.6-4.781c0-6.694-4.438-12.583-10.884-14.429
			l-210-60c-2.695-0.762-5.537-0.762-8.232,0l-210,60C21.188,62.417,16.75,68.306,16.75,75c0,6.694,4.438,12.583,10.884,14.429
			l79.116,22.604v17.752c0,17.065,9.478,32.754,24.141,39.961c67.236,33.047,154.453,33.032,221.719,0.015
			c14.663-7.207,24.141-22.896,24.141-39.976v-17.752l60-17.142v147.872c-17.422,6.213-30,22.707-30,42.237v30
			c0,8.291,6.709,15,15,15h60c8.291,0,15-6.709,15-15v-30C496.75,265.47,484.172,248.977,466.75,242.763z"/>
	</g>
</g>
<g>
	<g>
		<path d="M364.322,198.685C326.617,217.215,283.712,227,240.25,227c-43.462,0-86.382-9.8-124.102-28.33
			c-3.684-1.811-6.735-4.495-10.009-6.887c3.204,53.99,32.252,99.803,73.304,123.274c0,0,21.057,9.949,27.636,11.818l0.026-0.049
			c10.655,3.038,21.625,5.175,33.144,5.175c10.547,0,25.57-2.105,40.582-7.648c6.915-2.462,20.176-9.265,20.176-9.265
			c41.077-23.463,70.145-69.29,73.353-123.299C371.077,194.185,368.017,196.87,364.322,198.685z"/>
	</g>
</g>
<g>
	<g>
		<path d="M240.25,362c-12.092,0-23.729-1.866-35.068-4.603L240.25,410l34.871-52.553C263.841,360.152,252.273,362,240.25,362z"/>
	</g>
</g>
<g>
	<g>
		<path d="M326.595,335.096c-0.266,0.179-0.564,0.302-0.829,0.48L313.15,354.5c0,0.698-57.513,86.718-57.9,87.299V512h195
			c8.291,0,15-6.709,15-15C465.25,415.086,404.961,347.846,326.595,335.096z M360.25,452h-30c-8.291,0-15-6.709-15-15
			c0-8.291,6.709-15,15-15h30c8.291,0,15,6.709,15,15C375.25,445.291,368.541,452,360.25,452z"/>
	</g>
</g>
<g>
	<g>
		<path d="M154.461,335.402c-0.244-0.163-0.516-0.276-0.76-0.441C75.418,347.798,15.25,415.137,15.25,497c0,8.291,6.709,15,15,15
			h195v-70.201C157.271,339.655,171.143,360.508,154.461,335.402z"/>
	</g>
	</g>
          </svg>
          <h2 class="title-font font-medium text-white"><%=u.getPass()%></h2>
          <p class="leading-relaxed">1<sup>st</sup> Year</p>
        </div>
      </div>
      <div class="p-4">
        <div class="border-2 border-gray-200 px-4 py-3 rounded-lg text-3xl text-3xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-4xl">
          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="10" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 -50 500 600">
  			<g>
	<g>
		<path d="M466.75,242.763V86.25c0-2.346-0.643-4.493-1.6-6.469c0.577-1.599,1.6-3.01,1.6-4.781c0-6.694-4.438-12.583-10.884-14.429
			l-210-60c-2.695-0.762-5.537-0.762-8.232,0l-210,60C21.188,62.417,16.75,68.306,16.75,75c0,6.694,4.438,12.583,10.884,14.429
			l79.116,22.604v17.752c0,17.065,9.478,32.754,24.141,39.961c67.236,33.047,154.453,33.032,221.719,0.015
			c14.663-7.207,24.141-22.896,24.141-39.976v-17.752l60-17.142v147.872c-17.422,6.213-30,22.707-30,42.237v30
			c0,8.291,6.709,15,15,15h60c8.291,0,15-6.709,15-15v-30C496.75,265.47,484.172,248.977,466.75,242.763z"/>
	</g>
</g>
<g>
	<g>
		<path d="M364.322,198.685C326.617,217.215,283.712,227,240.25,227c-43.462,0-86.382-9.8-124.102-28.33
			c-3.684-1.811-6.735-4.495-10.009-6.887c3.204,53.99,32.252,99.803,73.304,123.274c0,0,21.057,9.949,27.636,11.818l0.026-0.049
			c10.655,3.038,21.625,5.175,33.144,5.175c10.547,0,25.57-2.105,40.582-7.648c6.915-2.462,20.176-9.265,20.176-9.265
			c41.077-23.463,70.145-69.29,73.353-123.299C371.077,194.185,368.017,196.87,364.322,198.685z"/>
	</g>
</g>
<g>
	<g>
		<path d="M240.25,362c-12.092,0-23.729-1.866-35.068-4.603L240.25,410l34.871-52.553C263.841,360.152,252.273,362,240.25,362z"/>
	</g>
</g>
<g>
	<g>
		<path d="M326.595,335.096c-0.266,0.179-0.564,0.302-0.829,0.48L313.15,354.5c0,0.698-57.513,86.718-57.9,87.299V512h195
			c8.291,0,15-6.709,15-15C465.25,415.086,404.961,347.846,326.595,335.096z M360.25,452h-30c-8.291,0-15-6.709-15-15
			c0-8.291,6.709-15,15-15h30c8.291,0,15,6.709,15,15C375.25,445.291,368.541,452,360.25,452z"/>
	</g>
</g>
<g>
	<g>
		<path d="M154.461,335.402c-0.244-0.163-0.516-0.276-0.76-0.441C75.418,347.798,15.25,415.137,15.25,497c0,8.291,6.709,15,15,15
			h195v-70.201C157.271,339.655,171.143,360.508,154.461,335.402z"/>
	</g>
	</g>
          </svg>
          <h2 class="title-font font-medium text-white"><%=u.getLvl()%></h2>
          <p class="leading-relaxed">2<sup>nd</sup> Year</p>
        </div>
      </div>
      <div class="p-4">
        <div class="border-2 border-gray-200 px-4 py-3 rounded-lg text-3xl text-3xl xl:text-3xl lg:text-3xl md:text-3xl sm:text-4xl">
          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="10" class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 -50 500 600">
  			<g>
	<g>
		<path d="M466.75,242.763V86.25c0-2.346-0.643-4.493-1.6-6.469c0.577-1.599,1.6-3.01,1.6-4.781c0-6.694-4.438-12.583-10.884-14.429
			l-210-60c-2.695-0.762-5.537-0.762-8.232,0l-210,60C21.188,62.417,16.75,68.306,16.75,75c0,6.694,4.438,12.583,10.884,14.429
			l79.116,22.604v17.752c0,17.065,9.478,32.754,24.141,39.961c67.236,33.047,154.453,33.032,221.719,0.015
			c14.663-7.207,24.141-22.896,24.141-39.976v-17.752l60-17.142v147.872c-17.422,6.213-30,22.707-30,42.237v30
			c0,8.291,6.709,15,15,15h60c8.291,0,15-6.709,15-15v-30C496.75,265.47,484.172,248.977,466.75,242.763z"/>
	</g>
</g>
<g>
	<g>
		<path d="M364.322,198.685C326.617,217.215,283.712,227,240.25,227c-43.462,0-86.382-9.8-124.102-28.33
			c-3.684-1.811-6.735-4.495-10.009-6.887c3.204,53.99,32.252,99.803,73.304,123.274c0,0,21.057,9.949,27.636,11.818l0.026-0.049
			c10.655,3.038,21.625,5.175,33.144,5.175c10.547,0,25.57-2.105,40.582-7.648c6.915-2.462,20.176-9.265,20.176-9.265
			c41.077-23.463,70.145-69.29,73.353-123.299C371.077,194.185,368.017,196.87,364.322,198.685z"/>
	</g>
</g>
<g>
	<g>
		<path d="M240.25,362c-12.092,0-23.729-1.866-35.068-4.603L240.25,410l34.871-52.553C263.841,360.152,252.273,362,240.25,362z"/>
	</g>
</g>
<g>
	<g>
		<path d="M326.595,335.096c-0.266,0.179-0.564,0.302-0.829,0.48L313.15,354.5c0,0.698-57.513,86.718-57.9,87.299V512h195
			c8.291,0,15-6.709,15-15C465.25,415.086,404.961,347.846,326.595,335.096z M360.25,452h-30c-8.291,0-15-6.709-15-15
			c0-8.291,6.709-15,15-15h30c8.291,0,15,6.709,15,15C375.25,445.291,368.541,452,360.25,452z"/>
	</g>
</g>
<g>
	<g>
		<path d="M154.461,335.402c-0.244-0.163-0.516-0.276-0.76-0.441C75.418,347.798,15.25,415.137,15.25,497c0,8.291,6.709,15,15,15
			h195v-70.201C157.271,339.655,171.143,360.508,154.461,335.402z"/>
	</g>
	</g>
          </svg>
          <h2 class="title-font font-medium text-white"><%=u.getName()%></h2>
          <p class="leading-relaxed">3<sup>rd</sup> Year</p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="text-gray-400 bg-gray-900 px-5 py-2 body-font">
  <div class="container px-5 py-14 mx-auto flex flex-wrap justify-center ">
    <div class="flex flex-wrap justify-center">
      <div class="p-4 xl:w-1/2 lg:w-1/2 md:w-full sm:w-full w-full">
        <div class="flex-grow border-2 rounded-lg border-gray-800 p-8 sm:flex-row flex-col">
          <div class="w-16 h-16 sm:mr-8 sm:mb-0 mb-4 inline-flex items-center justify-center rounded-full bg-teal-800 text-indigo-400 flex-shrink-0">
            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 512 512" style="fill: white;" xml:space="preserve">
<g>
	<g>
		<path d="M294.758,97.713c-7.525,19.518-10.152,26.331-16.102,41.76l21.249-21.427l19.899-20.066
			C316.467,97.63,316.584,97.713,294.758,97.713z"/>
	</g>
</g>
<g>
	<g>
		<path d="M313.704,244.266l-41.82-17.991l-65.745,66.296l-0.124,0.126v194.905c0,13.476,10.923,24.399,24.399,24.399
			c13.476,0,24.399-10.923,24.399-24.399V292.572h10.536v195.029c0,13.476,10.923,24.399,24.399,24.399
			c13.476,0,24.399-10.923,24.399-24.399C314.146,470.938,313.704,244.266,313.704,244.266z"/>
	</g>
</g>
<g>
	<g>
		<circle cx="260.072" cy="42.141" r="42.141"/>
	</g>
</g>
<g>
	<g>
		<path d="M273.904,130.797l-8.266-15.035l7.334-13.34c1.093-1.988-0.348-4.43-2.619-4.43H250.2c-2.269,0-3.714,2.438-2.619,4.43
			l7.35,13.368l-8.282,15.063c-0.962,1.747-1.275,3.779-0.886,5.736l4.148,21.081c4.561-2.55,9.68-4.035,14.949-4.282l8.09-8.157
			l1.819-8.587C275.19,134.654,274.883,132.579,273.904,130.797z"/>
	</g>
</g>
<g>
	<g>
		<path d="M253.067,218.181c-6.586-2.834-11.803-7.515-15.322-13.175l-40.311,40.769c0.052-10.332,0.443-88.365,0.502-99.98
			c0.012-2.226,1.822-4.02,4.045-4.014s4.023,1.811,4.023,4.035v66.919l26.653-26.875c0.153-4.044,1.031-8.129,2.726-12.068
			c2.922-6.793,7.812-12.131,13.712-15.65c-4.526-11.737-18.822-48.816-23.299-60.428H205.39c-26.398,0-47.985,21.477-48.117,47.876
			c-0.028,5.496-0.676,134.766-0.711,141.522l-4.563,4.614c-4.373,4.423-4.333,11.554,0.09,15.927
			c2.928,2.895,7.259,4.03,11.381,2.701c3.552,3.113,8.187,5.024,13.283,5.049c0.036,0,0.069,0,0.104,0
			c10.961,0,20.274-8.899,20.33-20.231l0.087-17.2l58.13-58.789L253.067,218.181z"/>
	</g>
</g>
<g>
	<g>
		<path d="M349.704,107.793c-4.423-4.373-11.555-4.333-15.927,0.09l-49.57,50.133l22.224,9.559l43.363-43.855
			C354.167,119.297,354.127,112.166,349.704,107.793z"/>
	</g>
</g>
<g>
	<g>
		<path d="M362.88,145.59c-0.018-3.417-0.401-6.748-1.101-9.964c-37.529,37.844-30.568,31.036-39.262,38.87l-0.162,0.147
			l-0.071,14.4l-47.831-20.577c-10.316-4.44-22.275,0.328-26.713,10.643s0.328,22.275,10.643,26.713l76.503,32.911
			c6.368,2.74,13.625,2.026,19.298-1.751c5.724-3.808,9.135-10.251,9.068-17.126L362.88,145.59z"/>
	</g>
</svg>
          </div>
          <div class="flex-grow">
            <h2 class="text-white text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-5xl title-font font-medium mb-8">&nbsp;&nbsp;Student&nbsp;&nbsp;</h2>
            <form method="post" action="UserServlet">
			<input type="hidden" name="action" value="add_user_page">
      		<input type="hidden" name="table" value="student"> 
      	    <button class="bg-gray-700 hover:bg-gray-800 text-white font-bold w-full border-b-4 border-teal-700 hover:border-teal-500 rounded text-3xl xl:text-2xl lg:text-xl md:text-5xl sm:text-5xl">Add New Student</button>
      	</form>
      	<br>
      	<form method="post" action="UserServlet">
      		<input type="hidden" name="action" value="edit_user_table">
      		<input type="hidden" name="table" value="student">
      	    <button class="bg-gray-700 hover:bg-gray-800 text-white font-bold w-full border-b-4 border-teal-700 hover:border-teal-500 rounded text-3xl xl:text-2xl lg:text-xl md:text-5xl sm:text-5xl">Edit Student Data</button>
      	</form>
          </div>
        </div>
      </div>
      
        <div class="p-4 xl:w-1/2 lg:w-1/2 md:w-full sm:w-full w-full">
        <div class="flex-grow border-2 rounded-lg border-gray-800 p-8 sm:flex-row flex-col">
          <div class="w-16 h-16 sm:mr-8 sm:mb-0 mb-4 inline-flex items-center justify-center rounded-full bg-teal-800 text-indigo-400 flex-shrink-0">
           <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="-45 -10 587.316 587.316" style="fill: white;" xml:space="preserve">
<path d="m226 236h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 296h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 356h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m226 416h120c5.522 0 10-4.478 10-10s-4.478-10-10-10h-120c-5.522 0-10 4.478-10 10s4.478 10 10 10z"/><path d="m406 90h-81.266c-3.626-14.035-14.698-25.108-28.734-28.734v-21.266c0-22.056-17.944-40-40-40s-40 17.944-40 40v21.266c-14.035 3.626-25.108 14.699-28.734 28.734h-81.266c-5.522 0-10 4.478-10 10v402c0 5.522 4.478 10 10 10h105c5.522 0 10-4.478 10-10s-4.478-10-10-10h-95v-382h70v20c0 5.522 4.478 10 10 10h120c5.522 0 10-4.478 10-10v-20h70v382h-95c-5.522 0-10 4.478-10 10s4.478 10 10 10h105c5.522 0 10-4.478 10-10v-402c0-5.522-4.477-10-10-10zm-170-50c0-11.028 8.972-20 20-20s20 8.972 20 20v20h-40zm70 80h-100v-20c0-11.028 8.972-20 20-20h60c11.028 0 20 8.972 20 20z"/><circle cx="256" cy="502" r="10"/></g>
</svg>
          </div>
         <div class="flex-grow">
            <h2 class="text-white text-5xl xl:text-5xl lg:text-4xl md:text-5xl sm:text-5xl title-font font-medium mb-8">&nbsp;&nbsp;Paper&nbsp;&nbsp;</h2>
            <form method="post" action="Exam">
			<input type="hidden" name="action" value="add_paper_page">
      		<input type="hidden" name="idn" value="${id.getId()}"> 
      	    <button class="bg-gray-700 hover:bg-gray-800 text-white font-bold w-full border-b-4 border-red-700 hover:border-red-500 rounded text-3xl xl:text-2xl lg:text-xl md:text-5xl sm:text-5xl">Create New Paper</button>
      	</form>	
      	<br>
      	<form method="post" action="Exam">
      		<input type="hidden" name="action" value="edit_paper_page">
      		<input type="hidden" name="table" value="student">
      	    <button class="bg-gray-700 hover:bg-gray-800 text-white font-bold w-full border-b-4 border-red-700 hover:border-red-500 rounded text-3xl xl:text-2xl lg:text-xl md:text-5xl sm:text-5xl">Edit Existing Paper</button>
      	</form>
          	</form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>