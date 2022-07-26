<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	try{
		sql="select name,birth from jangki_account where phone=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		rs=pstmt.executeQuery();
		if(rs.next()){
				%>
				<script>
				alert("이미 가입된 회원입니다.");
				history.back();
				</script>
				<%
		}else{
			session.setAttribute("name", name);
			session.setAttribute("birth", birth);
			session.setAttribute("phone", phone);
			%>
			<script>
			location.href="join.jsp?step=3";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>