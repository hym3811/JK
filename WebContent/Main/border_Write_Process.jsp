<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String id = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String replay = request.getParameter("replay");
	System.out.println("replay: "+replay);
	String body = request.getParameter("body");
	int no = 1;
	try{
		sql = "select max(no) from jangki_border";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			no = rs.getInt(1)+1;
			
			sql = "insert into jangki_border values(?,?,?,?,?,?,systimestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, category);
			pstmt.setString(3, title);
			pstmt.setString(4, replay);
			pstmt.setString(5, id);
			pstmt.setString(6, body);
			pstmt.executeUpdate();
			%>
			<script>
			alert("작성완료");
			location.href="main.jsp?idx=3";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>