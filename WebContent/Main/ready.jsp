<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String room_number = (String)session.getAttribute("room_number");
	int p = Integer.parseInt(request.getParameter("p"));
	System.out.println("p: "+p);
	System.out.println(request.getParameter("ready1"));
	int ready = 0;
	switch(p){
	case 1:
		if(Integer.parseInt(request.getParameter("ready1"))==0){
			ready = 1;
		}else{
			ready = 0;
		}
		break;
	case 2:
		if(Integer.parseInt(request.getParameter("ready2"))==0){
			ready = 1;
		}else{
			ready = 0;
		}
		break;
	}
	System.out.println(ready);
	try{
		switch(p){
		case 1:
			sql = "update jangki_gameroom set ready1=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ready);
			pstmt.setString(2, room_number);
			pstmt.executeUpdate();
			break;
		case 2:
			sql = "update jangki_gameroom set ready2=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ready);
			pstmt.setString(2, room_number);
			pstmt.executeUpdate();
			break;
		}
		
		%>
		<script>
		location.href="main.jsp?idx=8";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>