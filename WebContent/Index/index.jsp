<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel = "stylesheet" href = "index.css">
</head>
<body>
<%
	session.invalidate();
%>
<form name="form" method="post">
	<img id="index_title" src = "images/title.png">
	<fieldset id="index_fieldset">
		<legend></legend>
		<br>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
				<td rowspan="2"><input style="width:80%!important;height:60px!important;" type="button" id="btn" value="로그인" onclick=login()></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td style="color:white;">.</td>
			</tr>
			<tr style="text-align:right;">
				<td colspan="3">
					<a id="aTag" href="../Account/join.jsp?step=1">회원가입</a>
					<a id="aTag" href="../Account/find_ID.jsp">아이디찾기</a>
					<a id="aTag" href="../Account/find_Password.jsp">비밀번호찾기</a>
				</td>
			</tr>
		</table>
	</fieldset>
</form>
</body>
<script>
function login(){
	var doc = document.form;
	
	if(doc.id.value==""){
		alert("아이디 입력하세요.");
		doc.id.focus();
	}else if(doc.id.value.length<4||doc.id.value.length>12){
		alert("아이디는 4자이상 12자 이하입니다.");
		doc.id.focus();
	}else if(doc.password.value==""){
		alert("비밀번호 입력하세요.");
		doc.password.focus();
	}else if(doc.password.value.length<4||doc.password.value.length>12){
		alert("비밀번호는 4자이상 12자 이하입니다.");
		doc.password.focus();
	}else{
		doc.action="login_Process.jsp";
		doc.submit();
	}
}
</script>
</html>