<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	String friend = request.getParameter("friend");
	String idx = request.getParameter("idx");
	try{
		sql="select wish from jangki_friend where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String wish = rs.getString(1).replace(friend+" ", "");
			
			sql = "update jangki_friend set wish=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, wish);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			%>
			<script>
			alert("친구 요청 거절 완료");
			location.href="main.jsp?idx=<%=idx%>";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>