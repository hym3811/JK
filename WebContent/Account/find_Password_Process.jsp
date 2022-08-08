<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	try{
		sql = "select id,name,password from jangki_account where phone=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(id.equals(rs.getString(1))==false){
				%>
				<script>
				alert("정보 불일치");
				history.back();
				</script>
				<%
			}else if(name.equals(rs.getString(2))==false){
				%>
				<script>
				alert("정보 불일치");
				history.back();
				</script>
				<%
			}else{
				%>
				<script>
				alert("비밀번호: <%=rs.getString(3)%>");
				location.href="../Index/index.jsp";
				</script>
				<%
			}
		}else{
			%>
			<script>
			alert("정보 불일치");
			history.back();
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>