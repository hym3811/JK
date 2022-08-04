<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#main_btn{
	width:100%;
	height:100px;
	font-size:3em;
	font-weight:bold;
	background-color:mediumpurple;
	color:white;
}
#main_btn:hover{
	cursor:pointer;
	color:black;
	background-color:white;
	transition:1s;
}
</style>
</head>
<body>
<form name="form" method="post">
	<div style="width:100%;height:850px;border:1px dashed blue;position:relative;">
		<div style="width:100%;height:850px;border:1px dashed red;overflow-y:hidden;">
			<%
				if(request.getParameter("win").equals("1")){
					%>
					<img src="../Game/End/초승리.png" style="width:100%;">
					<%
				}else{
					%>
					<img src="../Game/End/한승리.png" style="width:100%;">
					<%
				}
			%>
		</div>
		<div style="width:300px;height:100px;position:absolute;left:calc(50% - 150px);top:600px;">
			<input id="main_btn" type="button" value="메인으로" onclick="location.href='../Main/main.jsp?idx=1'">
		</div>
	</div>
</form>
</body>
</html>