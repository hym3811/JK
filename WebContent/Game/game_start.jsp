<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<body>
<%
	Random ran = new Random();
	int p1_camp = 0;
	int p2_camp = 0;
	
	if(request.getParameter("dice")!=null){
		p1_camp = ran.nextInt(2)+1;
		switch(p1_camp){
		case 1:
			p2_camp=2;
			break;
		case 2:
			p2_camp=1;
			break;
		}
	}
	System.out.println("p1: "+p1_camp);
	System.out.println("p2: "+p2_camp);
	System.out.println("=============");
%>
<h1>선잡이</h1>
<input type = "button" value = "선잡기 버튼" onclick = "location.href='main.jsp?dice=1'" <%=p1_camp==0 ? "" : "hidden" %>>
<%
	String[] first_id = new String[2];
	String[] first_profile = new String[2];
		try{
			sql = "select p1 from jangki_gameroom where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)session.getAttribute("room_number"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				first_id[0]=rs.getString(1);
				
				sql = "select profile from jangki_account where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, first_id[0]);
				rs = pstmt.executeQuery();
				if(rs.next()){
					first_profile[0] = rs.getString(1);
				}
			}
			
			sql = "select p2 from jangki_gameroom where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String)session.getAttribute("room_number"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				first_id[1]=rs.getString(1);
				
				sql = "select profile from jangki_account where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, first_id[1]);
				rs = pstmt.executeQuery();
				if(rs.next()){
					first_profile[1] = rs.getString(1);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
%>
<div>
	<div>
		<h1><%=first_id[0] %></h1>
		<span>
			<img src = "../Main/images/Profile/<%=first_profile[0] %>">
		</span>
		<span>
			<img <% if(p1_camp==1){%>src = "Horse/초왕.png"<%}else{%>src = "Horse/한왕.png"<%} %>>
		</span>
	</div>
	<div>
		<h1><%=first_id[1] %></h1>
	</div>
</div>
<input type = "button" value = "선잡기 반복 버튼" onclick = "location.href='main.jsp?dice=1'" <%=p1_camp!=0 ? "" : "hidden" %>>
</body>
</html>