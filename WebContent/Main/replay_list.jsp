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
	ArrayList<Integer> personal_replay_no = new ArrayList<Integer>();
	ArrayList<String> personal_replay_cho = new ArrayList<String>();
	ArrayList<String> personal_replay_han = new ArrayList<String>();
	ArrayList<String> personal_replay_date = new ArrayList<String>();
	
	session.setAttribute("history_idx", session.getAttribute("idx"));
	
	try{
		sql = "select * from jangki_replay where cho=? or han=? order by end desc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("id"));
		pstmt.setString(2, (String)session.getAttribute("id"));
		rs = pstmt.executeQuery();
		while(rs.next()){
			personal_replay_no.add(rs.getInt(1));
			personal_replay_cho.add(rs.getString(2));
			personal_replay_han.add(rs.getString(3));
			personal_replay_date.add(rs.getString(4).substring(0,19));
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<form name="form2" method="post">
	<h3 id="title">리플레이 목록</h3>
	<div style="height:770px;position:relative;margin-top:3%;border:1px dashed purple;overflow-y:auto;">
		<table style="width:100%;text-align:center;">
			<tr>
				<th style="width:18%;height:30px;">매치 번호</th>
				<th style="width:18%;">초나라</th>
				<th style="width:18%;">한나라</th>
				<th>대국시기</th>
			</tr>
			<%
				for(int i=0;i<personal_replay_no.size();i++){
					%>
					<tr
						<%
							if(i%2==0){
								%>
								style="background-color:orange;font-weight:bold;color:white;"
								<%
							}else{
								%>
								style="background-color:mediumpurple;font-weight:bold;color:white;"
								<%
							}
						%>
					>
						<td><%=personal_replay_no.get(i) %></td>
						<td><%=personal_replay_cho.get(i) %></td>
						<td><%=personal_replay_han.get(i) %></td>
						<td><%=personal_replay_date.get(i) %></td>
						<td style="width:100px;"><input id="move_replay" type="button" value="리플레이 이동" style="width:100px;height:30px;" onclick="location.href='main.jsp?idx=14&match_number=<%=personal_replay_no.get(i)%>'"></td>
					</tr>
					<%
				}
			%>
		</table>
	</div>
</form>
</body>
</html>