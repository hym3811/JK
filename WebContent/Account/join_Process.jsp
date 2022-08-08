<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String name = (String)session.getAttribute("name");
	String birth = (String)session.getAttribute("birth");
	String phone = (String)session.getAttribute("phone");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	try{
		sql = "select * from jangki_account where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			%>
			<script>
				alert("아이디가 중복됩니다.");
				history.back();
			</script>
			<%
		}else{
		
			sql="insert into jangki_account values(?,?,?,?, '', '', ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, phone);
			pstmt.executeUpdate();
			
			sql="insert into jangki_record values(?,0,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql="insert into jangki_friend values(?,'','')";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			%>
			<script>
			alert("회원가입 성공");
			location.href="../Index/index.jsp";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>