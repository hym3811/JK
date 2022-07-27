<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	int count = 0;
	try{
		sql = "select * from jangki_gameroom order by no";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			count++;
			if(count==rs.getInt(1)){
				continue;
			}
			if(count!=rs.getInt(1)){
				break;
			}
		}
		sql = "insert into jangki_gameroom values( ?, '어서오세요. 잘부탁드립니다.', ?, '', 0, 0, systimestamp)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, count);
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
		session.setAttribute("room_number", Integer.toString(count));
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
location.href="main.jsp?idx=8"
</script>