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
<form name = "form" method="post">
<%
	Random ran = new Random();
	int p1_camp = 0;
	int p2_camp = 0;
	
	if(request.getParameter("dice")!=null){
		p1_camp = ran.nextInt(2)+1;
		switch(p1_camp){
		case 1:
			p2_camp=2;
			break;
		case 2:
			p2_camp=1;
			break;
		}
	}
	System.out.println((String)session.getAttribute("room_number"));
%>
<h1>진영 선택</h1>
<%
	String[] first_id = new String[2];
	String[] first_profile = new String[2];
		try{
			sql = "select p1 from jangki_gameroom where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)session.getAttribute("room_number"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				first_id[0]=rs.getString(1);
				
				sql = "select profile from jangki_account where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, first_id[0]);
				rs = pstmt.executeQuery();
				if(rs.next()){
					first_profile[0] = rs.getString(1);
				}
			}
			
			sql = "select p2 from jangki_gameroom where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)session.getAttribute("room_number"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				first_id[1]=rs.getString(1);
				
				sql = "select profile from jangki_account where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, first_id[1]);
				rs = pstmt.executeQuery();
				if(rs.next()){
					first_profile[1] = rs.getString(1);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
%>
<input type="text" name="cho" <%if(p1_camp==1){%>value="<%=first_id[0]%>"<%}else{%>value="<%=first_id[1]%>"<%} %> hidden>
<input type="text" name="han" <%if(p1_camp==2){%>value="<%=first_id[0]%>"<%}else{%>value="<%=first_id[1]%>"<%} %> hidden>
<div>
	<div style="position:absolute;top:15%;left:15%;">
		<h1>Player 1 <label <%if(p1_camp==1){%>style="color:blue;"<%}else if(p1_camp==2){%>style="color:red;"<%} %>> <%=first_id[0] %></label></h1>
		<span>
			<img src = "../Main/images/Profile/<%=first_profile[0] %>">
		</span>
		<span>
			<img <%=p1_camp==0 ? "hidden" : "" %> <% if(p1_camp==1){%>src = "../Game/Horse/초왕.png"<%}else{%>src = "../Game/Horse/한왕.png"<%} %>>
		</span>
	</div>
	<div style="position:absolute;top:30%;left:46%;">
		<h1 style="font-size:5em;color:purple;">VS</h1>
	</div>
	<div style="position:absolute;top:15%;left:60%;">
		<h1>Player 2 <label <%if(p2_camp==1){%>style="color:blue;"<%}else if(p2_camp==2){%>style="color:red;"<%} %>> <%=first_id[1] %></label></h1>
		<span>
			<img src = "../Main/images/Profile/<%=first_profile[1] %>">
		</span>
		<span>
			<img <%=p2_camp==0 ? "hidden" : "" %> <% if(p1_camp==1){%>src = "../Game/Horse/한왕.png"<%}else{%>src = "../Game/Horse/초왕.png"<%} %>>
		</span>
	</div>
</div>
<input style="position:absolute;width:10%;height:50px;font-size:2em;font-weight:bold;left:45%;top:50%;z-index:999;" type = "button" value = "진영선택 버튼" onclick = "location.href='main.jsp?dice=1'" <%=p1_camp==0 ? "" : "hidden" %>>
<input style="position:absolute;width:10%;height:50px;font-size:2em;font-weight:bold;left:45%;top:50%;z-index:999;" type = "button" value = "게임시작" onclick = "start()" <%=((String)session.getAttribute("id")).equals(first_id[0]) ? (p1_camp!=0 ? "" : "hidden") : "" %>>
<%-- <input type = "button" value = "진영선택 반복" onclick = "location.href='main.jsp?dice=1'" <%=p1_camp!=0 ? "" : "hidden" %>> --%>
</form>
</body>
<script>
function start(){
	doc = document.form;
	doc.action = "../Game/create_game.jsp";
	doc.submit();
}
</script>
</html>