<%@page import="oes.ExamDAO" %>
<html>
<head>
<title>JSP Countdown Timer Script</title>
<link href="timer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src='timer.js'></script>
<body>
<%
ExamDAO td=(ExamDAO)session.getAttribute("ExamDAO");
%>  
<%
String hours = Integer.toString(td.timeLeft()/3600); //change hours
String minutes = Integer.toString((td.timeLeft()%3600)/60);//change minutes
String seconds =  Integer.toString((td.timeLeft()%3600)%60);//change Seconds
String clock = hours+":"+minutes+":"+seconds;
System.out.println(clock);
%>

  <div class="top_con" align='center'>
    <ul class="top_con_ul_pos1" align='center'>
    <li><span id="hrs"><% out.println(hours);%></span></li>
    <li><span id="mts"><% out.println(minutes); %></span></li>
    <li><span id="sec"><% out.println(seconds); %></span></li>
    
    </ul>

</div>
	
<div id='hms' style='display:none;'><% out.println(""+clock+""); %></div>

<script>
 count();
</script>
</body></html>