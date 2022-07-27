<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form2" method="post">
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<%
	String room_number = (String)session.getAttribute("room_number");
	String room_title2 = null;
	String p1 = null;
	String p2 = null;
	int[] ready = new int[2];
	int[] win = new int[2];
	int[] lose = new int[2];
	String[] profile = new String[2];
	String[] word = new String[2];
	try{
		sql = "select * from jangki_gameroom where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, room_number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			room_title2 = rs.getString(2);
			p1 = rs.getString(3);
			p2 = rs.getString(4);
			ready[0] = rs.getInt(5);
			ready[1] = rs.getInt(6);
		}
		if(p1==null){
			%>
			<script>
			alert("방장이 나갔습니다.");
			location.href="main.jsp?idx=1";
			</script>
			<%
		}
		if(p2==null){
			p2="";
		}
		System.out.println("room_no: "+room_number);
		System.out.println("room_title: "+room_title2);
		System.out.println("P1: "+p1);
		System.out.println("P2: "+p2);
		System.out.println("id: "+(String)session.getAttribute("id"));
		System.out.println("ready: "+ready[0]+" / "+ready[1]);
		
		sql = "select win,lose from jangki_record where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p1);
		rs = pstmt.executeQuery();
		if(rs.next()){
			win[0]=rs.getInt(1);
			lose[0]=rs.getInt(2);
		}
		pstmt.setString(1, p2);
		rs = pstmt.executeQuery();
		if(rs.next()){
			win[1]=rs.getInt(1);
			lose[1]=rs.getInt(2);
		}
		
		sql = "select profile,word from jangki_account where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p1);
		rs = pstmt.executeQuery();
		if(rs.next()){
			profile[0] = rs.getString(1);
			word[0] = rs.getString(2);
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p2);
		rs = pstmt.executeQuery();
		if(rs.next()){
			profile[1] = rs.getString(1);
			word[1] = rs.getString(2);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<input type = "text" name = "room_number" value="<%=room_number %>" hidden>
<input type = "text" name = "p1" value="<%=p1 %>" hidden>
<input type = "text" name = "p2" value="<%=p2 %>" hidden>
<input type = "text" name = "ready1" value="<%=ready[0] %>" hidden>
<input type = "text" name = "ready2" value="<%=ready[1] %>" hidden>
<div style="width:100%;height:850px;border:2px dashed blue;">
	<div style="height:50px;line-height:300%;">
		<h3 style="padding-left:3%;"><%=room_number %>번 방 / <%=room_title2 %></h3>
	</div>
	<div style="width:100%;max-height:150px;border:1px dotted red;">
		<table border=1 style="width:100%;height:100%;">
			<tr>
				<td style="width:30%;text-align:center;">
					<div id="player" style="background:white;height:100%;">
						<span style="width:20%;font-size:2em;color:blue;font-weight:bold;"><%=p1 %></span>
						
						<div style="margin-top:20px;">
							<span>전적 : <%=win[0] %>승 <%=lose[0] %>패</span>
						</div>
						<div style="margin-top:20px;">
							<p><%=word[0] %></p>
						</div>
					</div>
				</td>
				<td style="width:20%;background: linear-gradient(0deg, yellow, lightgreen);">
					<img style="width:100%;" src = "images/Profile/<%=profile[0]%>.png">
				</td>
				<td style="width:30%;text-align:center;">
				<%
					if(p2!=""){
						%>
					<div id="player" style="background:white;height:100%;">
						<span style="width:20%;font-size:2em;color:blue;font-weight:bold;"><%=p2 %></span>
						<div style="margin-top:20px;">
							<span>전적 : <%=win[1] %>승 <%=lose[1] %>패</span>
						</div>
						<div style="margin-top:20px;">
							<p><%=word[1] %></p>
						</div>
					</div>
						<%
					}
				%>
				</td>
				<td style="width:20%;background: linear-gradient(0deg, yellow, lightgreen);">
				<%
					if(p2!=""){
						%>
					<img style="width:100%;" src = "images/Profile/<%=profile[1]%>.png">
						<%
					}
				%>
				</td>
			</tr>
		</table>
	</div>
	<div class="ready">
	<%
		if(p1.equals((String)session.getAttribute("id"))&&ready[0]==1&&ready[1]==1){
			%>
			<input type = "button" value="<%if(ready[0]==1){%>Ready Done<%}else{%>Ready<%} %>" style="width:50%;height:30px;" onclick="location.href='ready.jsp?p=1&ready1=<%=ready[0] %>'" <%=p1.equals((String)session.getAttribute("id")) ? "" : "disabled" %>><input type = "button" value="Start" style="width:50%;height:30px;" onclick="location.href='../game/Start.jsp'">
			<%
		}else{
			%>
			<input type = "button" value="Ready" style="width:50%;height:30px;" onclick="location.href='ready.jsp?p=1&ready1=<%=ready[0] %>'" <%=p1.equals((String)session.getAttribute("id")) ? "" : "disabled" %>><input type = "button" value="Ready" style="width:50%;height:30px;" onclick="location.href='ready.jsp?p=2&ready2=<%=ready[1] %>'" <%=p2.equals((String)session.getAttribute("id")) ? "" : "disabled" %>>
			<%
		}
	%>
	</div>
	<div style="height:40px;border:1px dashed red;">
		<h3 style="text-align:center;line-height:250%;">게임 채팅</h3>
	</div>
	<div style="height:530px;border:1px dashed green;">
		<table style="width:100%;">
			<%
				String chat_teller = null;
				String chat_tell = null;
				String chat_time = null;
				try{
					sql = "select * from jangki_gamechat where no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, room_number);
					rs = pstmt.executeQuery();
					while(rs.next()){
						chat_teller = rs.getString(2);
						chat_tell = rs.getString(3);
						chat_time = rs.getString(4);
						%>
						<tr>
							<td style="width:20%;"><%=chat_teller %></td>
							<td style="width:80%;"><%=chat_tell %></td>
						</tr>
						<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</div>
	<div style="height:50px;border:1px dashed black;">
		<input type = "button" value = "나가기" onclick="out()" style="height:40px;width:70px;">
		<input type = "text" id = "gamechat" name = "gamechat" style="width:calc(100% - 160px);height:30px;">
		<input type = "button" value = "전송" onclick="chatingame()" style="height:40px;width:70px;">
	</div>
</div>
</form>
</body>
<script>
function out(){
	var doc2 = document.form2;
	doc2.action = "out.jsp";
	doc2.submit();
}
function chatingame(){
	var doc2 = document.form2;
	if(doc2.gamechat.value==""){
		alert("채팅내용 입력 필요");
		doc2.gamechat.focus();
	}else{
		doc2.action = "add_gamechat.jsp";
		doc2.submit();
	}
}
</script>
</html>