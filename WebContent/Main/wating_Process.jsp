<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = (String) session.getAttribute("id");
	int idx = (int) session.getAttribute("idx");
	String speaking = request.getParameter("speaking");
	try{
		sql = "select max(no) from jangki_wating";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="insert into jangki_wating values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rs.getInt(1)+1);
			pstmt.setString(2, id);
			pstmt.setString(3, speaking);
			pstmt.executeUpdate();
			%>
			<script>
			location.href="main.jsp?idx=<%=idx%>";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>