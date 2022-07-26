<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel = "stylesheet" href = "main.css">
</head>
<% 
	String id = (String)session.getAttribute("id");
	session.setAttribute("id", id);
	int idx = 1;
	if(request.getParameter("idx")!=null){
		idx = Integer.parseInt(request.getParameter("idx"));
	}else if(session.getAttribute("idx")!=null){
		idx = (int)session.getAttribute("idx");
	}
	session.setAttribute("idx", idx);
	
%>
<%@ include file = "../DBConn.jsp" %>
<body>
<div class="main_body">
<img id="back" src = "images/main_background.png" style="height:940px!important;">
<img id="logo" src = "images/title.png">
<div class="id">
<p style="color:orange;font-weight:bold;"><%=id %></p>
</div>
<div class="content">
	<div class="wating" style="height:850px;border-right:2px dashed black;">
	<h3 id="title" style="text-align:center;">공개 채팅</h3>
		<form name="form1" method="post">
		<div class="conv" style="height:740px;overflow-y:auto;">
		<table>
			<%
				String teller = null;
				String speaking = null;
				int number = 0;
				try{
					sql = "select * from jangki_wating";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						number++;
						/* if(number>28){
							break;
						} */
						teller = rs.getString(2);
						speaking = rs.getString(3);
						%>
			<tr>
				<th style="width:20%;text-align:left;padding-left:4%;"><%=teller %></th>
				<td style="width:80%;text-align:left;padding-left:10%;">: <%=speaking %></td>
			</tr>
						<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		</div>
		<input id="speaking" type="text" name="speaking">
		<input id="speaking_btn" type="button" value="전송" onclick=add()>
		</form>
		<script>

		window:onload=function(){
		document.getElementsByClassName('conv')[0].scrollTop = document.getElementsByClassName('conv')[0].scrollHeight;
		document.getElementsByClassName('wispher_text')[0].scrollTop = document.getElementsByClassName('wispher_text')[0].scrollHeight;
		}
		function add(){
			var doc1 = document.form1;
			if(doc1.speaking.value==""){
				alert("채팅 내용 입력 필요");
				doc1.speaking.focus();
			}else{
				doc1.action = "wating_Process.jsp";
				doc1.submit();
			}
		}
		</script>
	</div>
	<div>
		<%
		switch(idx){
		case 1:
			%>
				<%@ include file = "gameRoom.jsp" %>
			<%
			break;
		case 2:
			%>
				<%@ include file = "account_Manage.jsp" %>
			<%
			break;
		case 3:
			%>
				<%@ include file = "border.jsp" %>
			<%
			break;
		case 4:
			%>
				<%@ include file = "friend_Manage.jsp" %>
			<%
			break;
		case 5:
			%>
				<%@ include file = "border_Write.jsp" %>
			<%
			break;
		case 6:
			%>
				<%@ include file = "border_Read.jsp" %>
			<%
			break;
		case 7:
			%>
				<%@ include file = "border_Update.jsp" %>
			<%
			break;
		case 8:
			%>
				<%@ include file = "room.jsp" %>
			<%
			break;
		}
		%>
	</div>
</div>
<div class="nav">
	<input id="btn" style="margin-top:5%!important;" type="button" value="대 기 실" onclick="location.href='main.jsp?idx=1'">
	<input id="btn" type="button" value="계 정 관 리" onclick="location.href='main.jsp?idx=2'">
	<input id="btn" type="button" value="게 시 판" onclick="location.href='main.jsp?idx=3'">
	<input id="btn" type="button" value="친 구 관 리" onclick="location.href='main.jsp?idx=4'">
	<input id="btn" type="button" value="종   료" onclick="location.href='../Index/index.jsp'">
</div>
</div>
</body>
</html>