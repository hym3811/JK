<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	String find = request.getParameter("find");
	System.out.println(id);
	System.out.println(find);
	try{
		
			sql = "select wish from jangki_friend where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, find);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String wish;
				if(rs.getString(1)==null){
					wish = id+" ";
				}else{
					wish = rs.getString(1)+id+" ";
				}
				
				sql = "update jangki_friend set wish=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, wish);
				pstmt.setString(2, find);
				pstmt.executeUpdate();
				%>
				<script>
				alert("친구 요청 완료");
				history.back();
				</script>
				<%
			}else{
				%>
				<script>
				alert("없는 아이디입니다.");
				history.back();
				</script>
				<%
			}
	}catch(Exception e){
		e.printStackTrace();
	}
%>