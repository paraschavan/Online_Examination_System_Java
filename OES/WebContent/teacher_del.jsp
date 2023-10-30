<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="oes.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher</title>
<link rel="stylesheet" type="text/css" href="clayout.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="icon" href="img/logo.png" type="image/icon type">
</head>
<body>
	<div id='cssmenu'>
<ul>
   <li><t><%="Name: "+((User)session.getAttribute("id")).getName()%></t></li>   
    <li><t><%="ID: "+((User)session.getAttribute("id")).getUname()%></t></li> 
       <li><t><%="Account Level: "+((User)session.getAttribute("id")).getLvlF()%></t></li> 
</ul>
</div>
<div><br><br></div>
	<div class="cbody">
	
     <div class="card">
      <div class="card-image-student"></div>
      <div class="card-text">
        <span class="date">Computer</span>
        <h2>Student</h2>
			<form method="post" action="UserServlet">
			<input type="hidden" name="action" value="add_user_page">
      		<input type="hidden" name="table" value="student"> 
      	    <button class="button-success pure-button button-xlarge">Add New Student</button>
      	</form>
      	<form method="post" action="UserServlet">
      		<input type="hidden" name="action" value="edit_user_table">
      		<input type="hidden" name="table" value="student">
      	    <button class="button-error pure-button button-xlarge">Edit Student Data</button>
      	</form>
		</div>
          
    </div> 
    
    <div class="card">
      <div class="card-image-student"></div>
      <div class="card-text">
        <span class="date">Computer</span>
        <h2>Paper</h2>
			<form method="post" action="Exam">
			<input type="hidden" name="action" value="add_paper_page">
      		<input type="hidden" name="idn" value="${id.getId()}"> 
      	    <button class="button-success pure-button button-xlarge">Create New Paper</button>
      	</form>
      	<form method="post" action="Exam">
      		<input type="hidden" name="action" value="edit_paper_page">
      		<input type="hidden" name="table" value="student">
      	    <button class="button-error pure-button button-xlarge">Edit Existing Paper</button>
      	</form>
		</div>
          
    </div> 
    
    </div>
    
</body>
</html>