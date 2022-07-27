<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file="../DBConn.jsp" %> --%>
<h3 id="title">친구 관리</h3>
<form name="form2" method="post">
<input type="text" name="id" value="<%=id %>" hidden="hidden">
<div class="search">
	<input type="text" name="find"><input type="button" value="친구요청" onclick=wish_friend()>
</div>
<script>
function wish_friend(){
	var doc2 = document.form2;
	if(doc2.find.value==""){
		alert("친구 아이디 입력 필요");
		doc2.find.focus();
	}else{
		doc2.action="wish_friend.jsp";
		doc2.submit();
	}
}
</script>
<div class="friend">
<%
	String[] list = null;
	String[] wish = null;
	try{
		sql = "select list,wish from jangki_friend where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(rs.getString(1)!=""&&rs.getString(1)!=null){
				list = rs.getString(1).split(" ");
			}
			if(rs.getString(2)!=""&&rs.getString(2)!=null){
				wish = rs.getString(2).split(" ");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<div class="list">
	<%
	if(list!=null){
		%>
		<table>
		<tr>
			<th colspan=3 style="font-size:1.4em;color:black!important;height:20px!important;">친구 목록</th>
		</tr>
		<tr>
			<th>아이디</th>
			<th>귓속말</th>
			<th>친구삭제</th>
		</tr>
		<%
			for(int i=0;i<list.length;i++){
				%>	
		<tr>
			<td><%=list[i] %></td>
			<td><input id="friend_btn" type="button" value="귓속말" onclick="location.href='main.jsp?id=<%=id%>&target=<%=list[i]%>&idx=<%=idx%>'"></td>
			<td><input id="friend_btn" type="button" value="삭제" onclick="location.href='delete_friend.jsp?id=<%=id%>&friend=<%=list[i]%>&idx=<%=idx%>'"></td>
		</tr>
				<%
			}
		%>
		</table>
		<%
	}else{
		%>
		<p id="none">친구 목록 없음</p>
		<%
	}
	%>
	
		
	</div>
	<div class="wish">
	<%
	if(wish!=null){
		%>
		<table>
		<tr>
			<th colspan=3 style="font-size:1.4em;color:black!important;height:20px!important;">친구 요청</th>
		</tr>
		<tr>
			<th>아이디</th>
			<th>수락</th>
			<th>거부</th>
		</tr>
		<%
			for(int i=0;i<wish.length;i++){
				%>
				<tr>
					<td><%=wish[i] %></td>
					<td><input id="friend_btn" type="button" value="수락" onclick="location.href='accept_friend.jsp?id=<%=id%>&friend=<%=wish[i]%>&idx=<%=idx%>'"></td>
					<td><input id="friend_btn" type="button" value="거부" onclick="location.href='refuse_friend.jsp?id=<%=id%>&friend=<%=wish[i]%>&idx=<%=idx%>'"></td>
				</tr>
				<%
			}
		%>
		</table>
		<%
	}else{
		%>
		<p id="none">친구 요청 없음</p>
		<%
	}
	%>
	</div>
</div>
<div class="wispher">
<div class="wispher_text">
	<%
		String target = "친구선택";
		if(request.getParameter("target")!=null){
			target = request.getParameter("target");
		}else if((String)session.getAttribute("target")!=null){
			target = (String)session.getAttribute("target");
		}
		session.setAttribute("target", target);
		String wispher = null;
		String tell = null;
		String time = null;
		if(!target.equals("친구선택")&&target!=null){
			%>
	<span style="font-size:1.5em;font-weight:bold;margin-top:3%;">(<%=target %>)님과 대화</span><label style="text-align:right;"><input id="Xbtn" type="button" style="height:25px;width:50px;background-color:black;color:white;font-weight:bold;" value="닫기" onclick="location.href='main.jsp?target=친구선택'"></label>
			<%
			try{
				sql = "select * from jangki_wispher where id=? and target=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, target);
				rs=pstmt.executeQuery();
				while(rs.next()){
					tell = rs.getString(3);
					wispher = rs.getString(4);
					time = rs.getString(5).substring(10,19);
				%>
				<table>
				<tr>
					<th><%=tell %></th>
					<td style="width:70%;"><%=wispher %></td>
					<td style="color:green"><%=time %></td>
				</tr>
				</table>
				<%
				}
				if(wispher==null){
					%><br><br><p style="font-size:1.5em;">대화를 시작해주세요.</p><%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(target.equals("친구선택")||target==null){
			%>
			<p style="text-align:center;" id="none">귓속말할 친구를 선택하세요.</p>
			<%
		}
	%>
	</div>
	<%-- <input type="text" style="background-color:#FFD767;opacity:0.8;width:15%;margin-top:1%;border-radius:5px;text-align:center;" id="wisp_text" name="friend" readonly value="<%=target==null ? "친구선택" : target%>"> --%>
	<select name="target" onchange="fx2()">
		<option value="0" <%=target==null||target=="친구선택" ? "selected" : "" %>>친구 선택</option>
		<%
			if(list!=null){
				for(int i=0;i<list.length;i++){
					%>
					<option value="<%=list[i] %>" <%=target.equals(list[i]) ? "selected" : "" %>><%=list[i] %></option>
					<%
				}
			}
		%>
		</select>
	<input style="width:70%;border-radius:5px;" id="wisp_text" type="text" name="wisp">
	<input style="width:50px;height:30px;color:white;font-weight:bold;background-color:green;border-radius:10px;" type="button" value="전송" onclick=fx()>
</div>
</form>
</body>
<script>
function fx(){
	var doc2 = document.form2;
	if(doc2.wisp.value==""){
		alert("귓속말 입력 필요");
		doc2.wisp.focus();
	}else if(doc2.target.value=="친구선택"){
		alert("귓속말 대상 선택 필요");
	}
	else{
		doc2.action="add_wispher.jsp";
		doc2.submit();
	}
}
function fx2(){
	var doc2 = document.form2;
	doc2.action="main.jsp";
	doc2.submit();
}
</script>
</html>