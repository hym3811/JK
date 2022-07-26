<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 id="title" style="font-size:3em!important;padding-top:10%;text-align:center;">계정 관리</h3>
<form name="form2" method="post">
<table style="margin:0 auto;margin-top:22%;width:80%;">
	<tr>
		<th style="height:80px;width:32%;">변경 비밀번호</th>
		<td><input style="width:90%;height:40px;" type="password" name="password"></td>
	</tr>
	<tr>
		<th style="height:80px;width:32%;">비밀번호 확인</th>
		<td><input style="width:90%;height:40px;" type="password" name="passwordcheck"></td>
	</tr>
	<tr>
		<th style="height:80px;width:32%;">연락처</th>
		<td><input style="width:90%;height:40px;" type="text" name="phone"></td>
	</tr>
</table>
</form>
<input style="margin-left:40%;width:20%;height:40px;border-radius:10px;font-size:1.3em;color:white;background-color:blue;" type="button" value="변경" onclick="change()">
</body>
<script>


function change(){
	var doc2 = document.form2;
	if(doc2.password.value==""){
		alert("변경 비밀번호 입력 필요");
		doc2.password.focus();
	}else if(doc2.passwordcheck.value==""){
		alert("비밀번호 확인 입력 필요");
		doc2.passwordcheck.focus();
	}else if(doc2.password.value!=doc2.passwordcheck.value){
		alert("비밀번호 확인 불일치");
		doc2.passwordcheck.focus();
	}else if(doc2.phone.value==""){
		alert("연락처 입력 필요");
		doc2.phone.focus();
	}else{
		doc2.action = "account_Manage_Process.jsp";
		doc2.submit();
	}
}
</script>
</html>