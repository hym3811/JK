<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String id = (String)session.getAttribute("id");
	String room_number = request.getParameter("room_number");
	try{
		sql = "update jangki_gameroom set p2=? where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, room_number);
		pstmt.executeUpdate();
		session.setAttribute("room_number", room_number);
		%>
		<script>
		alert("이동");
		location.href="main.jsp?idx=8";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>