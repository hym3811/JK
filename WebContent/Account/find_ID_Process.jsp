<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	try{
		sql = "select name,birth,id from janki_account where phone=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(!name.equals(rs.getString(1))){
				%>
				<script>
				alert("입력 정보 불일치");
				history.back();
				</script>
				<%
			}else if(!birth.equals(rs.getString(2).substring(0, 10).replace("-", ""))){
				%>
				<script>
				alert("입력정보 불일치");
				history.back();
				</script>
				<%
			}else{
				%>
				<script>
				alert("아이디: <%=rs.getString(3)%>\n로그인 화면으로 이동합니다.");
				location.href="../Index/index.jsp";
				</script>
				<%
			}
		}else{
			%>
			<script>
			alert("입력정보 불일치");
			history.back();
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>