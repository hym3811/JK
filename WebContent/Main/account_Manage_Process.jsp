<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String id = (String)session.getAttribute("id");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String profile = request.getParameter("profile");
	String word = request.getParameter("word");
	String phone = request.getParameter("phone");
	String password = request.getParameter("password");
	try{
		if(password==""){
			sql = "update jangki_account set name=?, birth=?, profile=?, word=?, phone=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, profile);
			pstmt.setString(4, word);
			pstmt.setString(5, phone);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		}else{
			sql = "update jangki_account set password=?, name=?, birth=?, profile=?, word=?, phone=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, birth);
			pstmt.setString(4, profile);
			pstmt.setString(5, word);
			pstmt.setString(6, phone);
			pstmt.setString(7, id);
			pstmt.executeUpdate();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
alert("정보 변경 완료");
location.href = "main.jsp?idx=2";
</script>