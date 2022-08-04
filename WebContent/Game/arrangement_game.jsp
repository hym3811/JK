<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	int p1 = Integer.parseInt(request.getParameter("p1"));
	int p2 = Integer.parseInt(request.getParameter("p2"));
	try{
		System.out.println((String)session.getAttribute("room_number"));
		sql = "update jangki_game_info set cho_position=?, han_position=? where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, p1);
		pstmt.setInt(2, p2);
		pstmt.setString(3, (String)session.getAttribute("room_number"));
		pstmt.executeUpdate();
		
		sql = "create table jangki_start_"+(String)session.getAttribute("room_number")+" as select * from jangki_start";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		switch(p1){
		case 1:
			//초마1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=1 where team=0 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=1 where team=0 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=1 where team=0 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=1 where team=0 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 2:
			//초마1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=1 where team=0 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=1 where team=0 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=1 where team=0 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=1 where team=0 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 3:
			//초마1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=1 where team=0 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=1 where team=0 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=1 where team=0 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=1 where team=0 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 4:
			//초마1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=1 where team=0 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=1 where team=0 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=1 where team=0 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//초상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=1 where team=0 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		}
		switch(p2){
		case 1://한마1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=10 where team=1 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=10 where team=1 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=10 where team=1 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=10 where team=1 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 2:
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=10 where team=1 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=10 where team=1 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=10 where team=1 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=10 where team=1 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 3:
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=10 where team=1 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=10 where team=1 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=10 where team=1 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=10 where team=1 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		case 4:
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=8,y=10 where team=1 and horse=5";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한마2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=3,y=10 where team=1 and horse=6";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상1
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=7,y=10 where team=1 and horse=7";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			//한상2
			sql = "update jangki_start_"+(String)session.getAttribute("room_number")+" set x=2,y=10 where team=1 and horse=8";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			break;
		}
		%>
		<script>
		location.href="../Main/main.jsp?idx=11";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>