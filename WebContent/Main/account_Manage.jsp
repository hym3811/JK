<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<body>
<h3 id="title">계정 관리</h3>
<form name="form2" method="post">
<%
	int profile_click = 0;
	if(request.getParameter("click")!=null){
		profile_click = Integer.parseInt(request.getParameter("click"));
	}
	String password = null;
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String Profile = request.getParameter("profile");
	String Word = request.getParameter("word");
	String phone = request.getParameter("phone");
	int Win = 0;
	int Lose = 0;
	try{
		sql = "select * from jangki_account where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("id"));
		rs = pstmt.executeQuery();
		if(rs.next()){
			password = rs.getString(2);
			
			if(name==null)
				name = rs.getString(3);
			if(birth==null)
				birth = rs.getString(4).substring(0,10).replace("-","");
			if(Profile==null)
				Profile = rs.getString(5);
			if(Word==null)
				Word = rs.getString(6);
			if(phone==null)
				phone = rs.getString(7);
		}
		sql = "select * from jangki_record where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("id"));
		rs = pstmt.executeQuery();
		if(rs.next()){
			Win = rs.getInt(2);
			Lose = rs.getInt(3);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<input type = "password" name = "realpw" value="<%=password %>" hidden>
<input type = "text" name = "profile" value="<%=Profile %>" hidden>
<div style="height:720px;position:relative;margin-top:3%;background:linear-gradient(0deg, yellow, lightgreen);border-radius:50px;">
	<div style="width:100%;height:600px;position:absolute;">
		<img id="profile_img" src = "images/Profile/<%=Profile %>" style = "width:30%;" onclick="profile_change()">
	</div>
	<div style="position:absolute;left:35%;top:1%;">
		<h1 style="color:red;font-size:2.5em;"><%=(String)session.getAttribute("id") %></h1>
	</div>
	<div style="position:absolute;left:65%;top:2.5%;">
		<label style="font-size:1.3em;font-weight:bold;">이름 : </label><input style="width:120px;font-size:2em;font-weight:bold;" type="text" name="name" value="<%=name%>">
	</div>
	<div style="position:absolute;left:35%;top:11%;">
		<h2><label style="color:blue;font-size:1.3em;"><%=Win %></label> 승 <label style="color:red;font-size:1.3em;"><%=Lose %></label> 패</h2>
	</div>
	<div style="position:absolute;left:35%;top:20%;">
		<label style="font-size:1.3em;font-weight:bold;">인사말 : </label><input type = "text" name = "word" value = "<%=Word %>" style="width:300px;height:30px;font-size:1.1em;">
	</div>
	<div style="position:absolute;left:15%;top:33%;width:100%;">
		<p style="font-size:1.3em;font-weight:bold;">연락처: </p><input type = "text" name = "phone" value = "<%=phone %>" style="width:510px;height:30px;font-size:1.1em;">
	</div>
	<div style="position:absolute;left:15%;top:44%;">
		<p style="font-size:1.3em;font-weight:bold;">생년월일: </p><input type = "text" name = "birth" value = "<%=birth %>" style="width:510px;height:30px;font-size:1.1em;">
	</div>	
	<div style="position:absolute;left:15%;top:55%;">
		<p style="font-size:1.3em;font-weight:bold;">변경 비밀번호: </p><input type = "password" name = "password" style="width:510px;height:30px;font-size:1.1em;">
	</div>
	<div style="position:absolute;left:15%;top:66%;">
		<p style="font-size:1.3em;font-weight:bold;">변경 비밀번호 확인: </p><input type = "password" name = "password_repeat" style="width:510px;height:30px;font-size:1.1em;">
	</div>
	
	<!-- 프로필 선택 -->
	<span style="display:<%=profile_click==1 ? "block" : "none" %>;position:absolute;left:20%;top:12%;width:20px;height:20px;border-top:10px solid red;border-left:10px solid red;z-index:999;"></span>
	<span style="display:<%=profile_click==1 ? "block" : "none" %>;position:absolute;left:20%;top:12%;width:60%;height:300px;border:1px solid black;background-color:mediumpurple;overflow-y:auto;">
		<%
			String[] change_profile = null;
			String str="";
			int profile_cnt = 0;
			try{
				sql = "select count(no) from jangki_profile";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					profile_cnt = rs.getInt(1);
					change_profile = new String[profile_cnt];
				}
				sql = "select name from jangki_profile order by no";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int prof_cnt = 0;
				while(rs.next()){
					change_profile[prof_cnt]=rs.getString(1);
					str+=rs.getString(1)+"__";
					prof_cnt++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			for(int i=0;i<profile_cnt;i++){
				%>
				<img id="profile_img" src = "images/Profile/<%=change_profile[i] %>" style="width:31%;" onclick="change_profile(<%=i%>)">
				<%
				if(i>0&&(i+1)%3==0){
					%><br><%
				}
			}
		%>
		<input type="text" name="str" value="<%=str%>" hidden>
	</span>
	<div style="position:absolute;left:5%;top:90%;width:90%;">
	<label style="font-size:1.3em;font-weight:bold;">현재 비밀번호: </label>
	<input type = "password" name = "passwordchk" style="font-size:1.1em;width:65%;height:30px;">
	<span id="changebtn" onclick="change()" style="border-radius:10px;position:absolute;background:linear-gradient(0deg, lightgreen, lightblue);font-size:1.3em;font-weight:bold;width:10%;height:32px;left:90%;top:0%;text-align:center;">변경</span>
	</div>
</div>
</form>
</body>
<script>
function change(){
	var doc2 = document.form2;
	if(doc2.passwordchk.value==""){
		alert("현재 비밀번호 입력 필요");
		doc2.passwordchk.focus();
	}else if(doc2.passwordchk.value!=doc2.realpw.value){
		alert("현재 비밀번호 일치하지 않음");
		doc2.passwordchk.focus();
	}else if(isNaN(doc2.phone.value)){
		alert("연락처 숫자만 입력가능");
		doc2.phone.focus();
	}else if(doc2.phone.value.length!=11){
		alert("연락처는 숫자 11자리");
		doc2.phone.focus();
	}else if(isNaN(doc2.birth.value)){
		alert("생년월일 숫자만 입력가능");
		doc2.birth.focus();
	}else if(doc2.birth.value.length!=8){
		alert("생년월일은 숫자 8자리");
		doc2.birth.focus();
	}else if(doc2.password.value!=doc2.password_repeat.value){
		alert("비밀번호 확인 불일치");
		if(doc2.password.value==""){
			doc2.password.focus();
		}else{
			doc2.password_repeat.focus();
		}
	}else if(doc2.passwordchk.value==""){
		alert("현재 비밀번호 입력 필요");
		doc2.passwordchk.focus();
	}else{
		doc2.action = "account_Manage_Process.jsp";
		doc2.submit();
	}
}

function change_profile(number){
	var doc2 = document.form2;

	var i = number;
	var profile = doc2.str.value.split("__");
	
	var name = doc2.name.value;
	var word = doc2.word.value;
	var phone = doc2.phone.value;
	var birth = doc2.birth.value;
	
	location.href = "main.jsp?idx=2&name="+name+"&word="+word+"&phone="+phone+"&birth="+birth+"&profile="+profile[i];
}

function profile_change(){
	var doc2 = document.form2;
	var click = <%=profile_click%>;
	if(click==0){
		click=1;
	}else{
		click=0;
	}
	var name = doc2.name.value;
	var word = doc2.word.value;
	var phone = doc2.phone.value;
	var birth = doc2.birth.value;
	
	location.href = "main.jsp?idx=2&name="+name+"&word="+word+"&phone="+phone+"&birth="+birth+"&profile=<%=Profile%>"+"&click="+click;
}
</script>
</html>