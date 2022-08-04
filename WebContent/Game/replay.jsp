<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String match_number = null;
	if(request.getParameter("match_number")!=null){
		match_number = request.getParameter("match_number");
	}else if((String)session.getAttribute("match_number")!=null){
		match_number = (String)session.getAttribute("match_number");
	}
	session.setAttribute("match_number", match_number);
	int turn_count=0;
	if(request.getParameter("turn_count")!=null){
		turn_count = Integer.parseInt(request.getParameter("turn_count"));
	}
	session.setAttribute("turn_count", turn_count);
	
	String[][] field_png2 = new String[11][10];
	
	String[][] horse3 = new String[2][16];
	int[][] horse_x2 = new int[2][16];
	int[][] horse_y2 = new int[2][16];
	String[][] horse_png2 = new String[2][16];
	String last = null;
	
	int max_turn = 0;
	
	try{
		sql = "select *from jangki_field order by no";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int p_x = 1;
		int p_y = 10;
		while(rs.next()){
			field_png2[p_y][p_x] = rs.getString(4);
			p_x++;
			if(p_x>=10){
				p_y--;
				p_x=1;
			}
		}
		
		sql = "select max(no) from jangki_game_"+match_number;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			max_turn = rs.getInt(1)-1;
			if(turn_count==max_turn){
				turn_count +=1;
			}
			if(turn_count<=0){
				turn_count = 0;
			}
			if(turn_count>max_turn){
				session.setAttribute("turn_count", max_turn);
			}
			if(turn_count<=0){
				session.setAttribute("turn_count", 0);
			}
		}session.setAttribute("max_turn", max_turn);
		
		sql = "select a.name,a.team,a.horse,b.x,b.y,a.png from jangki_horse a join jangki_start_"+match_number+" b on a.team=b.team and a.horse=b.horse";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int team = 0;
			if(rs.getString(2)!=null){
				team = rs.getInt(2);
			}
			int horse2 = 0;
			if(rs.getString(3)!=null){
				horse2 = rs.getInt(3);
			}
			horse3[team][horse2] = rs.getInt(4)+","+rs.getInt(5);
			horse_x2[team][horse2] = rs.getInt(4);
			horse_y2[team][horse2] = rs.getInt(5);
			horse_png2[team][horse2] = rs.getString(6);
		}
		
		sql = "select * from jangki_game_"+match_number;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(turn_count!=0){
			while(rs.next()){
				if(rs.getInt(1)==turn_count+2){
					break;
				}
				horse_x2[rs.getInt(2)][rs.getInt(3)] = rs.getInt(4);
				horse_y2[rs.getInt(2)][rs.getInt(3)] = rs.getInt(5);
				horse3[rs.getInt(2)][rs.getInt(3)] = rs.getInt(4)+","+rs.getInt(5);
				if(turn_count!=0){
					last = Integer.toString(rs.getInt(2))+Integer.toString(rs.getInt(3));
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<form name="form" method="post">
	<div style="width:100%;height:850px;position:relative;">
		<%
		for(int i=10;i>0;i--){
			for(int j=1;j<10;j++){
				%>
				<img id="field" src="../Game/Field/<%=field_png2[i][j]%>" style="height:85px!important;">
				<%
			}
			%>
			<br>
			<%
		}
	%>
	<%
		for(int i=0;i<2;i++){
			for(int j=0;j<16;j++){
				if(horse_x2[i][j]!=0&&horse_y2[i][j]!=0){
				%>
				<img 
					id="<%=i%><%=j%>" class="horse" src="../Game/Horse/<%=horse_png2[i][j] %>"
					<%
						if((Integer.toString(i)+Integer.toString(j)).equals(last)){
							%>style="border-radius:30px;border:5px dashed red;width:8%!important;position:absolute;left:calc((<%=horse_x2[i][j] %> * 11.11%) - 9.5%);bottom:calc((<%=horse_y2[i][j] %> * 85px) - 85px);"<%
						}else{
							%>style="width:8%!important;position:absolute;left:calc((<%=horse_x2[i][j] %> * 11.11%) - 9.5%);bottom:calc((<%=horse_y2[i][j] %> * 85px) - 85px);"<%
						}
					%>
					>
				<%
				}
			}
		}
	%>
	</div>
</form>
</body>
</html>