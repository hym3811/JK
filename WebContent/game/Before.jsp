<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	Integer a=(Integer)session.getAttribute("a");
	Integer b=(Integer)session.getAttribute("b");
	String as=null;
	String bs=null;
	
	
	switch(a){
	case 1:
		as="양귀마(상마마상)";
		break;
	case 2:
		as="좌귀마(상마상마)";
		break;
	case 3:
		as="원앙마(마상상마)";
		break;
	case 4:
		as="우귀마(마상마상)";
		break;
	}
	switch(b){
	case 1:
		bs="양귀마(상마마상)";
		break;
	case 2:
		bs="좌귀마(상마상마)";
		break;
	case 3:
		bs="원앙마(마상상마)";
		break;
	case 4:
		bs="우귀마(마상마상)";
		break;
	}
	
	Integer a6_x=0;Integer a7_x=0;Integer a8_x=0;Integer a9_x=0;
	Integer b6_x=0;Integer b7_x=0;Integer b8_x=0;Integer b9_x=0;
	
	try{
		sql="select table_name from user_tables where table_name='CHO_GAME'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="drop table cho_game";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		sql="create table cho_game as select * from cho_start";
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		sql="select table_name from user_tables where table_name='HAN_GAME'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="drop table han_game";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		sql="create table han_game as select * from han_start";
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		switch(a){
		case 1:
			sql="update cho_game set x=3,y=1 where horse='a06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=7,y=1 where horse='a07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=2,y=1 where horse='a08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=8,y=1 where horse='a09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 2:
			sql="update cho_game set x=3,y=1 where horse='a06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=8,y=1 where horse='a07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=2,y=1 where horse='a08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=7,y=1 where horse='a09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 3:
			sql="update cho_game set x=2,y=1 where horse='a06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=8,y=1 where horse='a07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=3,y=1 where horse='a08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=7,y=1 where horse='a09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 4:
			sql="update cho_game set x=2,y=1 where horse='a06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=7,y=1 where horse='a07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=3,y=1 where horse='a08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update cho_game set x=8,y=1 where horse='a09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		}
		
		switch(b){
		case 1:
			sql="update han_game set x=3,y=10 where horse='b06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=7,y=10 where horse='b07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=2,y=10 where horse='b08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=8,y=10 where horse='b09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 2:
			sql="update han_game set x=3,y=10 where horse='b06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=8,y=10 where horse='b07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=2,y=10 where horse='b08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=7,y=10 where horse='b09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 3:
			sql="update han_game set x=2,y=10 where horse='b06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=8,y=10 where horse='b07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=3,y=10 where horse='b08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=7,y=10 where horse='b09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 4:
			sql="update han_game set x=2,y=10 where horse='b06'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=7,y=10 where horse='b07'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=3,y=10 where horse='b08'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="update han_game set x=8,y=10 where horse='b09'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	session.invalidate();
%>
<script>
alert("楚(초): <%=as%>\n漢(한): <%=bs%>\n\n게임을 시작합니다.");
location.href="Game.jsp?chk='시작'";
</script>
<%
%>