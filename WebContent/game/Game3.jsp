<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../DBConn.jsp" %>
<%
	Integer turn=(Integer)session.getAttribute("turn");
	String horse=(String)session.getAttribute("horse");
	String position=request.getParameter("position");
	String[] code=new String[2];
	String name=null;
	String kill=null;
	code=position.split(",");
	Integer team=0;
	String turn2=null;
	if(horse.contains("a")){
		team=1;
	}else if(horse.contains("b")){
		team=2;
	}

	switch(turn){
	case 1:
		session.setAttribute("turn", 2);
		turn2="한나라";
		break;
	case 2:
		session.setAttribute("turn", 1);
		turn2="초나라";
	}
	
	try{
		sql="select name from jk_horse where horse=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, horse);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
		}
		
		switch(team){
		case 1:
			sql="select horse from han_game where x=? and y=?";
			break;
		case 2:
			sql="select horse from cho_game where x=? and y=?";
			break;
		}
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, code[0]);
		pstmt.setString(2, code[1]);
		rs=pstmt.executeQuery();
		if(rs.next()){
			kill=rs.getString(1);
			
			switch(team){
			case 1:
				sql="update han_game set x=null,y=null where horse=?";
				break;
			case 2:
				sql="update cho_game set x=null,y=null where horse=?";
				break;
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, kill);
			pstmt.executeUpdate();
		}
		
		switch(team){
		case 1:
			sql="update cho_game set x=?,y=? where horse=?";
			break;
		case 2:
			sql="update han_game set x=?,y=? where horse=?";
			break;
		}
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, code[0]);
		pstmt.setString(2, code[1]);
		pstmt.setString(3, horse);
		pstmt.executeUpdate();
%>
<script>
location.href="Game.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>