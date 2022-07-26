<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	try{
		sql = "select password from jangki_account where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(password.equals(rs.getString(1))){
				session.setAttribute("id", id);
				%>
				<script>
				alert("로그인 성공");
				location.href="../Main/main.jsp";
				</script>
				<%
			}else{
				%>
				<script>
				alert("비밀번호 불일치");
				history.back();
				</script>
				<%
			}
		}else{
			%>
			<script>
			alert("아이디 없음");
			history.back();
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>