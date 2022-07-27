<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	String friend = request.getParameter("friend");
	String idx = request.getParameter("idx");
	System.out.println(id);
	System.out.println(friend);
	try{
		sql = "select list from jangki_friend where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String list = rs.getString(1).replace(friend+" ", "");
			
			sql = "update jangki_friend set list=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, list);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			sql = "select list from jangki_friend where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, friend);
			rs=pstmt.executeQuery();
			if(rs.next()){
				list = rs.getString(1).replace(id+" ", "");
				
				sql = "update jangki_friend set list=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, list);
				pstmt.setString(2, friend);
				pstmt.executeUpdate();
				%>
				<script>
				location.href="main.jsp?idx=<%=idx%>";
				</script>
				<%
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>