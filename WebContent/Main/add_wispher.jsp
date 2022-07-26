<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	String friend = request.getParameter("target");
	int idx = (int) session.getAttribute("idx");
	session.setAttribute("idx", idx);
	String wisp = request.getParameter("wisp");
	System.out.println(id);
	System.out.println(friend);
	System.out.println(idx);
	System.out.println(wisp);
	
	try{
		sql = "insert into jangki_wispher values(?,?,?,?,systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, friend);
		pstmt.setString(3, id);
		pstmt.setString(4, wisp);
		pstmt.executeUpdate();
		
		sql = "insert into jangki_wispher values(?,?,?,?,systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, friend);
		pstmt.setString(2, id);
		pstmt.setString(3, id);
		pstmt.setString(4, wisp);
		pstmt.executeUpdate();
		%>
		<script>
		location.href="main.jsp?idx=<%=idx%>&target=<%=friend%>";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>