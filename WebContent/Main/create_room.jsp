<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	int no = 0;
	try{
		sql = "select max(no) from jangki_gameroom";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			no = rs.getInt(1)+1;
		}
		sql = "insert into jangki_gameroom values( ?, '어서오세요. 잘부탁드립니다.', ?, '', 0, 0, systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
		session.setAttribute("room_number", Integer.toString(no));
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
location.href="main.jsp?idx=8"
</script>