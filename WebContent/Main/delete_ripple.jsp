<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String ripple_no = request.getParameter("ripple_no");
	String border_no = (String)session.getAttribute("border_no");
	System.out.println("border_no: "+border_no);
	System.out.println("ripple_no: "+ripple_no);
	try{
		sql = "delete from jangki_ripple where border_no=? and ripple_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, border_no);
		pstmt.setString(2, ripple_no);
		pstmt.executeUpdate();
		
		sql = "update jangki_ripple set ripple_no=ripple_no-1 where border_no=? and ripple_no>?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, border_no);
		pstmt.setString(2, ripple_no);
		pstmt.executeUpdate();
		
		%>
		<script>
		location.href="main.jsp";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>