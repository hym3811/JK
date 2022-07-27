<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String victory=(String)session.getAttribute("victory");
%>
<div>
<table style="margin:0 auto;margin-top:5%;">
	<tr>
		<td>
			<%
				if(victory.contains("초")){
			%>
			<img src="End/초승리.png" style="width:693.3px;height:523.5px;">
			<%
				}else if(victory.contains("한")){
			%>
			<img src="End/한승리.png" style="width:693.3px;height:523.5px;">
			<%
				}
			%>
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="button" value="다시하기" onclick="if(!confirm('다시 하시겠습니까?')){return false}else{location.href='Start.jsp'}" style="width:170px;height:60px;border-radius:20px;background-color:#E38B45;color:white;font-size:2em;font-weight:bold;">
		</td>
	</tr>
</table>
</div>
</body>
</html>