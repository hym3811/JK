<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<%
	System.out.println("체크");
	String room_number = (String)session.getAttribute("room_number");
	String room_title2 = null;
	String p1 = null;
	String p2 = null;
	try{
		sql = "select * from jangki_gameroom where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, room_number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			room_title2 = rs.getString(2);
			p1 = rs.getString(3);
			p2 = rs.getString(4);
		}
		System.out.println("room_no: "+room_number);
		System.out.println("room_title: "+room_title2);
		System.out.println("P1: "+p1);
		System.out.println("P2: "+p2);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<div style="width:100%;height:100%;border:2px dashed blue;">
	<div style="width:100%;height:20%;border:1px dotted red;">
		<table>
			<tr>
				<td>
					
				</td>
				<td>
					
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>