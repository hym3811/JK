<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String gamechat = request.getParameter("gamechat");
	try{
		sql = "insert into jangki_gamechat values( ?, ?, ?, systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("room_number"));
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.setString(3, gamechat);
		pstmt.executeUpdate();
		%>
		<script>
		location.href="main.jsp?#gamechat";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>