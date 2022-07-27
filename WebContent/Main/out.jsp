<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String room_number = request.getParameter("room_number");
	String p1 = request.getParameter("p1");
	String p2 = request.getParameter("p2");
	String id = (String)session.getAttribute("id");
	try{
		if(p1.equals(id)){
			sql = "delete from jangki_gameroom where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_number);
			pstmt.executeUpdate();
		}else if(p2.equals(id)){
			sql = "update jangki_gameroom set p2='',ready2=0 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, room_number);
			pstmt.executeUpdate();
		}
		
		%>
		<script>
		location.href = "main.jsp?idx=1";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>