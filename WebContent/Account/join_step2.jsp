<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 step 2</title>
<link rel = "stylesheet" href = "account.css">
</head>
<body>
	<h3 id="title">가입확인</h3>
	<form name="form" method="post">
	<div class="content">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone"></td>
			</tr>
		</table>
	</div>
	<div class="btn">
		<input id="btn" type="button" value="이전" onclick="back()">
		<input id="btn" type="button" value="다음" onclick="next()">
	</div>
	</form>
</body>
<script>
function back(){
	history.back();
}
function next(){
	var doc = document.form;
	if(doc.name.value==""){
		alert("이름 입력 필요");
		doc.name.focus();
	}else if(doc.name.value.length>4||doc.name.value.length<2){
		alert("이름은 한글2자 ~ 한글4자입니다.");
		doc.name.focus();
	}else if(doc.birth.value==""){
		alert("생년월일 입력 필요");
		doc.birth.focus();
	}else if(doc.birth.value.length!=8||isNaN(doc.birth.value)){
		alert("생년월일은 숫자8자리입니다.");
		doc.birth.focus();
	}else if(doc.phone.value==""){
		alert("연락처 입력 필요");
		doc.phone.focus();
	}else if(doc.phone.value.length!=11||isNaN(doc.phone.value)){
		alert("연락처는 숫자11자리입니다.");
		doc.phone.focus();
	}else{
		doc.action="step2_Process.jsp";
		doc.submit();
	}
}
</script>
</html>