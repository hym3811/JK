<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<header>
<h1>계정 관리</h1>
</header>
<section>
	<form name="form" method="post">
		<h3 id="title">아이디 찾기</h3>
		<div>
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
		<input id="btn" type="button" value="찾기" onclick="next()">
	</div>
	</form>
</section>
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
	}else if(doc.birth.value==""){
		alert("생년월일 입력 필요");
		doc.birth.focus();
	}else if(doc.phone.value==""){
		alert("연락처 입력 필요");
		doc.phone.focus();
	}else{
		doc.action="find_ID_Process.jsp";
		doc.submit();
	}
}
</script>
</html>