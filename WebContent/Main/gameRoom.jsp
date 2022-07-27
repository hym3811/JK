<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<body>
<h3 id="title">대기실</h3>
<div class="gameRoom" style="margin-top:20px;width:100%;height:670px;overflow-y:auto;border:1px dashed red;">
	<table style="border-collapse:collapse;width:100%;">
		<tr>
			<%
				int room_count=0;
				int room_no = 0;
				int p_count = 0;
				String room_no_str = null;
				String room_title = null;
				String room_time = null;
				try{
					sql = "select * from jangki_gameroom order by time desc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						room_count++;
						p_count=0;
						room_no = rs.getInt(1);
						if(room_no<10){
							room_no_str = "00"+Integer.toString(room_no);
						}else if(room_no<100){
							room_no_str = "0"+Integer.toString(room_no);
						}
						room_title = rs.getString(2);
						if(rs.getString(3)!=null){
							p_count++;
						}
						if(rs.getString(4)!=null){
							p_count++;
						}
						room_time = rs.getString(7).substring(11,16);
						%>
						<td style="width:48%;padding:1% 1%;">
							<div style="padding:2%;background:#73A597;border:3px dashed purple;border-radius:10px;" class="room" <%if(p_count==2){%>onclick="alert('인원이 가득 찼습니다.')"<%}else{%>onclick="location.href='attend.jsp?room_number=<%=room_no%>'"<%}%>>
								<div>
									<span style="color:yellow;font-weight:900;font-size:1.3em;">Game No. <%=room_no_str %></span>
									<span style="color:blue;font-weight:bold;">&nbsp&nbsp&nbsp&nbsp방장: <%=rs.getString(3) %></span>
									<br><br>
									<span style="color:white;font-weight:bold;"><%=room_title %></span>
									<br><br>
									<p 
									<%
										if(p_count==2){
											%>
											style="color:gray;text-align:right;"
											<%
										}else{
											%>
											style="color:red;font-weight:bold;font-size:1.2em;text-align:right;"
											<%
										}
									%>
									><%=p_count %> / 2</p>
								</div>
							</div>
						</td>
						<%
						if(room_count%2==0){
			%>
			</tr>
			<tr>
			
			<%
						}
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
			</tr>
	</table>
</div>
<div style="height:100px;width:100%;">
	<input type = "button" value = "방만들기" onclick = "createroom()" style="width:100%;height:100%;">
</div>
</body>
<script>
function createroom(){
	location.href = "create_room.jsp";
}
</script>
</html>