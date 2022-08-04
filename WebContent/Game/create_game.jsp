<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String cho = request.getParameter("cho");
	String han = request.getParameter("han");
	try{
		sql = "insert into jangki_game_info values( ?, ?, ?, '', '', 1 , systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("room_number"));
		pstmt.setString(2, cho);
		pstmt.setString(3, han);
		pstmt.executeUpdate();
		
		sql = "create table jangki_game_"+(String)session.getAttribute("room_number")+" (no number(3), team number(1), horse number(2), x number(2), y number(2))";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values(1,0,0,5,2)";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		%>
		<script>
		location.href = "../Main/main.jsp?idx=10";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>