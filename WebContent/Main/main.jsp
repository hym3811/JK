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
<img id="logo" src = "images/title.png" <%=idx>=9 ? (idx==12||idx==13||idx==14 ? "" : "hidden") : "" %>>
<div class="id" <%=idx>=9 ? (idx==12||idx==13||idx==14 ? "" : "hidden") : "" %>>
<p style="color:orange;font-weight:bold;"><%=id %></p>
</div>
<div class="content">
<%
	if(idx<9||idx==13){
		%>
		<div class="wating" style="height:850px;border-right:2px dashed black;" <%=idx==9 ? "hidden" : "" %>>
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
				<input id="speaking" type="text" id="speaking" name="speaking">
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
		<%
	}else if(idx==9){
		%>
		<div class="game">
		<%@ include file = "../Game/game_start.jsp" %>
		</div>
		<%
	}else if(idx==10){
		%>
		<div class="game">
		<%@ include file = "../Game/choice_position.jsp" %>
		</div>
		<%
	}else if(idx==11){
		%>
		<div class="game">
		<%@ include file = "../Game/game_step_1.jsp" %>
		</div>
		<%
	}else if(idx==12){
		%>
		<div class="game">
		<%@ include file = "../Game/game_step_2.jsp" %>
		</div>
		<%
	}else if(idx==14){
		%>
		<div class="game">
		<%@ include file = "../Game/replay.jsp" %>
		</div>
		<%
	}
%>
	
	<div class="view">
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
		case 13:
			%>
				<%@ include file = "replay_list.jsp" %>
			<%
			break;
		}
		%>
	</div>
</div>
<%
	if(idx<8||idx==12||idx==13){
		%>
			<div class="nav" >
				<input id="btn" style="margin-top:5%!important;" type="button" value="대 기 실" onclick="<%=idx==8 ? "alert('비활성화')" : "location.href='main.jsp?idx=1'" %>">
				<input id="btn" type="button" value="계 정 관 리" onclick="location.href='main.jsp?idx=2'">
				<input id="btn" type="button" value="게 시 판" onclick="location.href='main.jsp?idx=3'">
				<input id="btn" type="button" value="리 플 레 이" onclick="location.href='main.jsp?idx=13'">
				<input id="btn" type="button" value="친 구 관 리" onclick="location.href='main.jsp?idx=4'">
				<input id="btn" type="button" value="종   료" onclick="location.href='../Index/index.jsp'">
			</div>
		<%
	}else if(idx==8){
		%>
			<div class="nav" style="background-color:white;font-size:3em;">
				<h1>광고</h1>
			</div>
		<%
	}else if(idx>=9&&idx<=11){
		%>
			<div class="chat">
				<%@ include file = "../Game/game_chat.jsp" %>
			</div>
		<%
	}else if(idx==14){
		%>
			<div class="nav">
				<%@ include file = "../Game/replay_control.jsp" %>
			</div>
		<%
	}
%>
</div>
</body>
</html>