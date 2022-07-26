<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 step 3</title>
<link rel = "stylesheet" href = "account.css">
</head>
<body>
	<h3 id="title">정보입력</h3>
	<%
		session.setAttribute("name", (String)session.getAttribute("name"));
		session.setAttribute("birth", (String)session.getAttribute("birth"));
		session.setAttribute("phone", (String)session.getAttribute("phone"));
	%>
	<form name="form" method="post">
	<div class="content">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" name="passwordcheck"></td>
			</tr>
		</table>
	</div>
	</form>
	<div class="btn">
		<input id="btn" type="button" value="이전" onclick="back()">
		<input id="btn" type="button" value="다음" onclick="next()">
	</div>
</body>
<script>
function back(){
	history.back();
}
function next(){
	var doc = document.form;
	if(doc.id.value==""){
		alert("아이디 입력 필요");
		doc.id.focus();
	}else if(doc.id.value.length<4||doc.id.value.length>12){
		alert("아이디는 영어,숫자 4자리 ~ 12자리입니다.");
		doc.id.focus();
	}else if(doc.password.value==""){
		alert("비밀번호 입력 필요");
		doc.password.focus();
	}else if(doc.password.value.length<4||doc.password.value.length>12){
		alert("비밀번호 4자리 ~ 12자리입니다.");
		doc.password.focus();
	}else if(doc.passwordcheck.value==""){
		alert("비밀번호 확인 입력 필요");
		doc.passwordcheck.focus();
	}else if(doc.passwordcheck.value.length<4||doc.passwordcheck.value.length>12){
		alert("비밀번호 확인 4자리 ~ 12자리입니다.");
		doc.passwordcheck.focus();
	}else if(doc.password.value!=doc.passwordcheck.value){
		alert("비밀번호 확인 불일치");
		doc.passwordcheck.focus();
	}else{
		doc.action = "join_Process.jsp";
		doc.submit();
	}
}
</script>
</html>