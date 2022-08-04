<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	try{
		sql = "delete from jangki_border where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("border_no"));
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
location.href="main.jsp?idx=3";
</script>