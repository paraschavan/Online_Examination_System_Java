<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<html>
    <head>
<script src="refresh.js"></script>
<script>
    $(document).ready(function(){
		 $("#div_refresh").load("Exam_Refresh.jsp");
        setInterval(function() {
            $("#div_refresh").load("Exam_Refresh.jsp");
        }, 1000);
    });
</script>
    </head>
    <body> <div id="div_refresh"></div>
    </body>
</html>