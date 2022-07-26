<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String phone = request.getParameter("phone");
	int idx = (int) session.getAttribute("idx");
	String password = request.getParameter("password");
	try{
		sql="select * from jangki_account where phone=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update jangki_account set password=? where phone=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, phone);
			pstmt.executeUpdate();
			%>
			<script>
			alert("계정정보 변경 완료");
			location.href="main.jsp?idx=<%=idx%>";
			</script>
			<%
		}else{
			%>
			<script>
			alert("잘못된 연락처 정보 입력");
			history.back();
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>