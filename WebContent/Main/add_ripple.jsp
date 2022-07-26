<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = (String)session.getAttribute("id");
	int idx = (int)session.getAttribute("idx");
	String border_no = (String)session.getAttribute("border_no");
	String ripple = request.getParameter("ripple_area");
	String try_no = request.getParameter("try_no");
	String try_step = request.getParameter("try_step");
	/* System.out.println("id: "+id);
	System.out.println("idx: "+idx);
	System.out.println("border_no: "+border_no);
	System.out.println("try_no: "+try_no);
	System.out.println("try_step: "+try_step);
	System.out.println("ripple: "+ripple); */
	try{
		if(try_step.equals("0")){ //본문에 대한 댓글
			sql = "insert into jangki_ripple values(?,?,?,?,?,systimestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, border_no);
			pstmt.setString(2, try_no);
			pstmt.setString(3, id);
			pstmt.setString(4, ripple);
			pstmt.setString(5, try_step);
			pstmt.executeUpdate();
		}else{
			int find_no = 0;
			sql = "select min(ripple_no) from jangki_ripple where border_no=? and ripple_no>? and step<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, border_no);
			pstmt.setString(2, try_no);
			pstmt.setInt(3, Integer.parseInt(try_step)-1);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1)==null){
					System.out.println("체크");
					sql = "select max(ripple_no) from jangki_ripple where border_no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, border_no);
					rs = pstmt.executeQuery();
					if(rs.next()){
						find_no = rs.getInt(1)+1;
						
						sql = "insert into jangki_ripple values(?,?,?,?,?,systimestamp)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, border_no);
						pstmt.setInt(2, find_no);
						pstmt.setString(3, id);
						pstmt.setString(4, ripple);
						pstmt.setString(5, try_step);
						pstmt.executeUpdate();
					}
				}else{
					find_no = rs.getInt(1);
					
					sql = "update jangki_ripple set ripple_no=ripple_no+1 where border_no=? and ripple_no>=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, border_no);
					pstmt.setInt(2, find_no);
					pstmt.executeUpdate();
					
					sql = "insert into jangki_ripple values(?,?,?,?,?,systimestamp)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, border_no);
					pstmt.setInt(2, find_no);
					pstmt.setString(3, id);
					pstmt.setString(4, ripple);
					pstmt.setString(5, try_step);
					pstmt.executeUpdate();
				}
			}
		}
		%>
		<script>
		location.href="main.jsp";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>