<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String no = (String)session.getAttribute("border_no");
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String replay = request.getParameter("replay");
	String body = request.getParameter("body");
	
	System.out.println("no: "+no);
	System.out.println("title: "+title);
	System.out.println("category: "+category);
	System.out.println("replay: "+replay);
	System.out.println("body: "+body);
	
	try{
		sql = "update jangki_border set title=?,category=?,replay=?,body=? where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, category);
		pstmt.setString(3, replay);
		pstmt.setString(4, body);
		pstmt.setString(5, no);
		pstmt.executeUpdate();
		%>
		<script>
		alert("수정완료");
		location.href="main.jsp?idx=6";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>