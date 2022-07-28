<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<%
	String[] chat_profile = new String[2];
	String[] chat_id = new String[2];
	int open_profile_1 = 0;
	if(request.getParameter("open_profile_1")!=null){
		open_profile_1 = Integer.parseInt(request.getParameter("open_profile_1"));
	}
	try{
		sql = "select p1,p2 from jangki_gameroom where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("room_number"));
		rs = pstmt.executeQuery();
		if(rs.next()){
			chat_id[0] = rs.getString(1);
			chat_id[1] = rs.getString(2);
		}
		for(int i=0;i<2;i++){
			sql = "select profile from jangki_account where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chat_id[i]);
			rs = pstmt.executeQuery();
			if(rs.next()){
				chat_profile[i] = rs.getString(1);
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<body style="width:100%;height:100%;">
<form name="form2" method="post">
	<div style="height:50px;width:100%;background-color:lightgray;"><label style="font-weight:bold;">Room </label><label style="font-size:2.2em;font-weight:bold;">No. <%=(String)session.getAttribute("room_number") %></label></div>
	<div class="chat_profile">
		<div style="position:absolute;width:50%;height:250px;" onclick="location.href='main.jsp?idx=9&friend=<%=chat_id[0]%>&open_profile_1=1'">
			<div style="width:100%;height:200px;background-color:gray;">
				<img src = "../Main/images/Profile/<%=chat_profile[0] %>">
			</div>
			<div style="width:100%;height:50px;background-color:red;text-align:center;font-size:1.5em;line-height:180%;color:white;">
				<h3><%=chat_id[0] %></h3>
			</div>
		</div>
		<div style="position:absolute;width:50%;height:250px;left:50%;" onclick="location.href='main.jsp?idx=9&friend=<%=chat_id[1]%>&open_profile_1=1'">
			<div style="width:100%;height:200px;background-color:yellow;">
				<img src = "../Main/images/Profile/<%=chat_profile[1] %>">
			</div>
			<div style="width:100%;height:50px;background-color:blue;text-align:center;font-size:1.5em;line-height:180%;color:white;">
				<h3><%=chat_id[1] %></h3>
			</div>
		</div>
	</div>
	<div style="left:30%;top:20%;position:absolute;width:200px;height:100px;background-color:white;border:5px dashed black;" <%=open_profile_1==0 ? "hidden" : "" %>>
			<div  <%if(request.getParameter("friend")!=null){if(request.getParameter("friend").equals(chat_id[0])){%>style="font-size:1.5em;font-weight:bold;height:50px;width:100%;line-height:180%;text-align:left;text-indent:20px;color:white;background-color:red;"<%}else{%>style="font-size:1.5em;font-weight:bold;height:50px;width:100%;line-height:180%;text-align:left;text-indent:20px;color:white;background-color:blue;"<%}} %>><%=request.getParameter("friend") %></div>
			<div style="font-size:1.5em;font-weight:bold;height:50px;width:100%;border:1px solid blue;background-color:lightblue;line-height:200%;">친구추가</div>
	
	<div class="close" onclick="location.href='main.jsp?idx=9&open_profile_1=0'" style="font-size:1.2em;line-height:250%;position:absolute;top:0;right:0;border:1px solid black;width:60px;height:49px;background-color:gray;font-weight:bold;color:white;">닫기</div>
	</div>
	<div class="surrender" style="height:50px;width:100%;background-color:lightgreen;" onclick="location.href='main.jsp?idx=8'">
		<h1>항복</h1>
	</div>
	<div class="chat_area" style="width:100%;height:450px;border:1px dashed blue;background-color:white;text-align:left;">
		<%
			String chat_teller_1 = null;
			String chat_tell_1 = null;
			try{
				sql = "select * from jangki_gamechat where no=? and time>=(select time from jangki_gameroom where no=?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String)session.getAttribute("room_number"));
				pstmt.setString(2, (String)session.getAttribute("room_number"));
				rs = pstmt.executeQuery();
				while(rs.next()){
					chat_teller_1 = rs.getString(2);
					chat_tell_1 = rs.getString(3);
					%>
					<label style="width:25%;font-weight:bold;margin-left:2%;"><%=chat_teller_1 %></label>: <label style="width:75%;"><%=chat_tell_1 %></label><br>
					<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</div>
	<div class="chat_text" style="width:100%:height:50px;text-align:left;">
		<input type = "text" name="gamechat" style="width:80%;height:45px;font-size:1.2em;">
		<input type="button" value="전송" onclick="add_gamechat()" style="width:calc(20% - 10px);height:45px;">
	</div>
</form>
</body>
<script>
function add_gamechat(){
	var doc2 = document.form2;
	if(doc2.gamechat.value==""){
		alert("채팅내용 입력 필요");
		doc2.gamechat.focus();
	}else{
		doc2.action = "../Main/add_gamechat.jsp";
		doc2.submit();
	}
}
</script>
</html>