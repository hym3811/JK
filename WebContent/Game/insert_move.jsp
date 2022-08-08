<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp"%>
<%
	String team = request.getParameter("team");
	String horse = request.getParameter("horse");
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	Integer kill = null;
	if(request.getParameter("kill")!=null){
		kill = Integer.parseInt(request.getParameter("kill"));
	}
	int turn = Integer.parseInt(request.getParameter("turn"));
	
	try{
		sql = "select max(no) from jangki_game_"+(String)session.getAttribute("room_number");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			int no = rs.getInt(1)+1;
			
			switch(turn){
			case 1:
				sql = "update jangki_game_info set turn=2 where no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String)session.getAttribute("room_number"));
				pstmt.executeUpdate();
				
				if(kill!=null){
					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, "1");
					pstmt.setInt(3, kill);
					pstmt.setInt(4, 0);
					pstmt.setInt(5, 0);
					pstmt.executeUpdate();

					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, team);
					pstmt.setString(3, horse);
					pstmt.setString(4, x);
					pstmt.setString(5, y);
					pstmt.executeUpdate();
					
					if(kill==0){
						sql = "delete from jangki_gameroom where no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, (String)session.getAttribute("room_number"));
						pstmt.executeUpdate();
						
						sql = "select cho,han from jangki_game_info where no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, (String)session.getAttribute("room_number"));
						rs = pstmt.executeQuery();
						String cho = null;
						String han = null;
						if(rs.next()){
							cho = rs.getString(1);
							han = rs.getString(2);
							
							System.out.println(cho);
							System.out.println(han);
							
							sql = "insert into jangki_replay values( ? , ? , ? , systimestamp)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, (String)session.getAttribute("room_number"));
							pstmt.setString(2, cho);
							pstmt.setString(3, han);
							pstmt.executeUpdate();
							
							sql = "update jangki_record set win=win+1 where id=?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, cho);
							pstmt.executeUpdate();
							
							sql = "update jangki_record set lose=lose+1 where id=?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, han);
							pstmt.executeUpdate();
						}
						%>
						<script>
						location.href="../Main/main.jsp?idx=12&&win=1";
						</script>
						<%
					}
				}else{

					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, team);
					pstmt.setString(3, horse);
					pstmt.setString(4, x);
					pstmt.setString(5, y);
					pstmt.executeUpdate();
					
				}
				
				break;
			case 2:
				sql = "update jangki_game_info set turn=1 where no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String)session.getAttribute("room_number"));
				pstmt.executeUpdate();
				
				if(kill!=null){
					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, "0");
					pstmt.setInt(3, kill);
					pstmt.setInt(4, 0);
					pstmt.setInt(5, 0);
					pstmt.executeUpdate();

					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, team);
					pstmt.setString(3, horse);
					pstmt.setString(4, x);
					pstmt.setString(5, y);
					pstmt.executeUpdate();
					
					if(kill==0){
						sql = "delete from jangki_gameroom where no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, (String)session.getAttribute("room_number"));
						pstmt.executeUpdate();

						sql = "select cho,han from jangki_game_info where no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, (String)session.getAttribute("room_number"));
						rs = pstmt.executeQuery();
						String cho = null;
						String han = null;
						if(rs.next()){
							cho = rs.getString(1);
							han = rs.getString(2);
							
							sql = "insert into jangki_replay values( ? , ? , ? , systimestamp)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, (String)session.getAttribute("room_number"));
							pstmt.setString(2, cho);
							pstmt.setString(3, han);
							pstmt.executeUpdate();

							sql = "update jangki_record set win=win+1 where id=?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, han);
							pstmt.executeUpdate();
							
							sql = "update jangki_record set lose=lose+1 where id=?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, cho);
							pstmt.executeUpdate();
						}
						%>
						<script>
						location.href="../Main/main.jsp?idx=12&&win=2";
						</script>
						<%
					}
				}else{

					sql = "insert into jangki_game_"+(String)session.getAttribute("room_number")+" values( ? , ? , ? , ? , ? )";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, team);
					pstmt.setString(3, horse);
					pstmt.setString(4, x);
					pstmt.setString(5, y);
					pstmt.executeUpdate();
					
				}
				
				break;
			}
		}
		
		%>
		<script>
		location.href="../Main/main.jsp";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>