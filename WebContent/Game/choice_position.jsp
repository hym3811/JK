<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="post">
<%
	String[] choice_position_player = new String[2];
	int choice_p1=0;
	if(request.getParameter("p1")!=null){
		choice_p1 = Integer.parseInt(request.getParameter("p1"));
	}
	int choice_p2=0;
	if(request.getParameter("p2")!=null){
		choice_p2 = Integer.parseInt(request.getParameter("p2"));
	}
	System.out.println((String)session.getAttribute("room_number"));
	try{
		sql = "select cho, han from jangki_game_info where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("room_number"));
		rs = pstmt.executeQuery();
		if(rs.next()){
			choice_position_player[0] = rs.getString(1);
			choice_position_player[1] = rs.getString(2);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Integer chk1=0;
	Integer chk2=0;
	if(request.getParameter("chk1")!=null)
		chk1=Integer.parseInt(request.getParameter("chk1"));
	if(request.getParameter("chk2")!=null)
		chk2=Integer.parseInt(request.getParameter("chk2"));
%>
<input type="text" name="p1" value="<%=choice_p1 %>" hidden>
<input type="text" name="p2" value="<%=choice_p2 %>" hidden>
<div class="choice">
<table style="margin:0 auto;margin-top:10%;width:55%;">
	<tr>
		<th colspan=2 style="width:50%;font-size:3em;color:blue;"><%=choice_position_player[0] %></th>
		<th colspan=2 style="width:50%;font-size:3em;color:red;"><%=choice_position_player[1] %></th>
	</tr>
	<tr style="text-align:center;">
	<%
		if(chk1==0){
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:blue;border:3px solid blue;border-radius:20px;">楚</p></th>
	<%
		}else{
	%>
		<th colspan=2 style="width:50%;"><p <%if(((String)session.getAttribute("id")).equals(choice_position_player[0])){%>id="choice_cancel" onclick="location.href='../Main/main.jsp?chk1=0&chk2=<%=chk2 %>&p1=0&p2=<%=choice_p2 %>'"<%} %> style="margin:0 auto;width:30%;font-size:3.5em;color:blue;border:3px solid blue;border-radius:20px;background-color:lightgray;">楚</p></th>
	<%
		}
	%>
	<%
		if(chk2==0){
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:red;border:3px solid red;border-radius:20px;">漢</p></th>
	<%
		}else{
	%>
		<th colspan=2 style="width:50%;"><p <%if(((String)session.getAttribute("id")).equals(choice_position_player[1])){%>id="choice_cancel" onclick="location.href='../Main/main.jsp?chk2=0&chk1=<%=chk1 %>&p2=0&p1=<%=choice_p1 %>'"<%} %> style="margin:0 auto;width:30%;font-size:3.5em;color:red;border:3px solid red;border-radius:20px;background-color:lightgray;">漢</p></th>
	<%
		}
	%>
	</tr>
	<tr style="height:30px;">
		<td colspan=2 style="text-align:center;width:50%;">
		<%
			if(chk1==1){
		%>
			<p style="margin:0 auto;font-weight:bold;font-size:1.5em;color:blue;" <%=chk1==1 ? "" : "hidden" %>>Ready!!!</p>
		<%
			}
		%>
		</td>
		<td colspan=2 style="text-align:center;width:50%;">
		<%
			if(chk2==1){
		%>
			<p style="margin:0 auto;font-weight:bold;font-size:1.5em;color:red;" <%=chk2==1 ? "" : "hidden" %>>Ready!!!</p>
		<%
			}
		%>
		</td>
	</tr>
</table>
<table style="margin:0 auto;margin-top:2%;">
	<tr>
		<td <%if(choice_p1==1){%>style="border:2px dashed blue;"<%} %>><img onclick="location.href='../Main/main.jsp?chk1=1&chk2=<%=chk2 %>&p1=1&p2=<%=choice_p2 %>'" id="position" src = "../Game/Position/양귀마(초).png"></td>
		<td <%if(choice_p1==2){%>style="border:2px dashed blue;"<%} %>><img onclick="location.href='../Main/main.jsp?chk1=1&chk2=<%=chk2 %>&p1=2&p2=<%=choice_p2 %>'" id="position" src = "../Game/Position/좌귀마(초).png"></td>
		<td <%if(choice_p2==1){%>style="border:2px dashed red;"<%} %>><img onclick="location.href='../Main/main.jsp?chk2=1&chk1=<%=chk1 %>&p2=1&p1=<%=choice_p1 %>'" id="position" src = "../Game/Position/양귀마(한).png"></td>
		<td <%if(choice_p2==2){%>style="border:2px dashed red;"<%} %>><img onclick="location.href='../Main/main.jsp?chk2=1&chk1=<%=chk1 %>&p2=2&p1=<%=choice_p1 %>'" id="position" src = "../Game/Position/좌귀마(한).png"></td>
	</tr>
	<tr>
		<th>양귀마(상마마상)</th>
		<th>좌귀마(상마상마)</th>
		<th>양귀마(상마마상)</th>
		<th>좌귀마(상마상마)</th>
	</tr>
	<tr>
		<td <%if(choice_p1==3){%>style="border:2px dashed blue;"<%} %>><img onclick="location.href='../Main/main.jsp?chk1=1&chk2=<%=chk2 %>&p1=3&p2=<%=choice_p2 %>'" id="position" src = "../Game/Position/원앙마(초).png"></td>
		<td <%if(choice_p1==4){%>style="border:2px dashed blue;"<%} %>><img onclick="location.href='../Main/main.jsp?chk1=1&chk2=<%=chk2 %>&p1=4&p2=<%=choice_p2 %>'" id="position" src = "../Game/Position/우귀마(초).png"></td>
		<td <%if(choice_p2==3){%>style="border:2px dashed red;"<%} %>><img onclick="location.href='../Main/main.jsp?chk2=1&chk1=<%=chk1 %>&p2=3&p1=<%=choice_p1 %>'" id="position" src = "../Game/Position/원앙마(한).png"></td>
		<td <%if(choice_p2==4){%>style="border:2px dashed red;"<%} %>><img onclick="location.href='../Main/main.jsp?chk2=1&chk1=<%=chk1 %>&p2=4&p1=<%=choice_p1 %>'" id="position" src = "../Game/Position/우귀마(한).png"></td>
	</tr>
	<tr>
		<th>원앙마(마상상마)</th>
		<th>우귀마(마상마상)</th>
		<th>원앙마(마상상마)</th>
		<th>우귀마(마상마상)</th>
	</tr>
</table>
<table style="margin:0 auto;margin-top:2%;">
	<tr>
		<td colspan=4 style="text-align:center;">
			<input id="start_button" type=button style="border-radius:20px;width:240px;height:70px;background-color:brown;color:white;font-size:2.3em;" value="게임시작" onclick="start_game()" <%=chk1==1&&chk2==1 ? "" : "disabled" %>>
		</td>
	</tr>
</table>
</div>
</form>
</body>
<script>
function start_game(){
	var doc = document.form;
	doc.action = "../Game/arrangement_game.jsp";
	doc.submit();
}
</script>
</html>