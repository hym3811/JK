<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<%
	int step = Integer.parseInt(request.getParameter("step"));
%>
<style>
#step<%=step%>{
	background-color:darkgray;
}
#step<%=step%>{
	color:white;
}
#step<%=step%>{
	font-weight:bold;
}
</style>
<link rel = "stylesheet" href = "account.css">
</head>
<body>
<header>
<h1>회원가입</h1>
</header>
<nav>
	<ul>
		<li id="step1">step 1</li>
		<li> <img id="arrow" src = "images/arrow.png"> </li>
		<li id="step2">step 2</li>
		<li> <img id="arrow" src = "images/arrow.png"> </li>
		<li id="step3">step 3</li>
	</ul>
</nav>
	<%
		if(step==1){
			%>
			<%@ include file = "join_step1.jsp" %>
			<%
		}else if(step==2){
			%>
			<%@ include file = "join_step2.jsp" %>
			<%
		}else if(step==3){
			%>
			<%@ include file = "join_step3.jsp" %>
			<%
		}
	%>
</body>
</html>