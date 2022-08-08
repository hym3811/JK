<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form2" method="post">
	<div class="replay_control" style="width:100%;height:250px;border:1px dashed red;position:relative;">
		<div id="replay_btn" class="prev" style="position:absolute;left:10%;top:20%;"><label id="replay_btn" style="font-size:4em;" onclick="location.href='../Main/main.jsp?turn_count=<%=(int)session.getAttribute("turn_count")-1%>'">◀</label>이전턴</div>
		<div id="replay_btn" class="next" style="position:absolute;right:10%;top:20%;">다음턴<label id="replay_btn" style="font-size:4em;" onclick="location.href='../Main/main.jsp?turn_count=<%=(int)session.getAttribute("turn_count")+1%>'">▶</label></div>
		<div id="replay_turn" style="position:absolute;width:50%;height:70px;left:25%;top:10%;background-color:white;">
			<input type="text" name="turn_count" style="font-size:2.5em;text-align:center;position:absolute;width:45%;height:65px;left:0;" value="<%=(int)session.getAttribute("turn_count")%>">
			<label style="position:absolute;left:47.5%;font-size:3em;">/</label>
			<div style="position:absolute;width:45%;height:65px;left:55%;font-size:2.5em;text-align:center;line-height:160%;"><%=(int)session.getAttribute("max_turn") %></div>
		</div>
		<div id="replay_action" onclick="replay_move()" style="position:absolute;width:100px;height:50px;border:1px solid black;left:calc(50% - 50px);top:45%;font-size:2em;font-weight:bold;line-height:150%;">이동</div>
		<div id="btn" style="position:absolute!important;line-height:220%;left:5%;top:65%;z-index:9;" onclick="location.href='../Main/main.jsp?idx=<%=session.getAttribute("history_idx")%>'">리플레이 종료</div>
	</div>
	</form>
</body>
<script>
function replay_move(){
	var doc2 = document.form2;
	
	doc2.action = "../Main/main.jsp";
	doc2.submit();
}
</script>
</html>