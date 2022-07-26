<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../DBConn.jsp" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	String friend = request.getParameter("friend");
	String idx = request.getParameter("idx");
	System.out.println(id);
	System.out.println(friend);
	try{
		// 1. jangki_friend list에 추가 쌍방
		// 2. jangki_friend wish에서 삭제
		sql="select list from jangki_friend where id=?"; //id값의 list 조회
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String list;
			if(rs.getString(1)==null){
				list = friend+" ";
			}else{
				list = rs.getString(1)+friend+" "; //id값에 넣을 리스트 재조합
			}
			
			sql="update jangki_friend set list=? where id=?"; //id값의 list 수정
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, list);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			sql="select list from jangki_friend where id=?"; //friend값의 list 조회
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, friend);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1)==null){
					list = id+" ";
				}else{
					list = rs.getString(1)+id+" "; //friend값에 넣을 리스트 재조합
				}
				
				sql="update jangki_friend set list=? where id=?"; //friend 값의 list 수정
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, list);
				pstmt.setString(2, friend);
				pstmt.executeUpdate();
				
				sql="select wish from jangki_friend where id=?"; //id값의 wish 조회
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					String wish = rs.getString(1).replace(friend+" ", "");
					
					sql="update jangki_friend set wish=? where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, wish);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					%>
					<script>
					alert("친구 추가 완료");
					location.href="main.jsp?idx=<%=idx%>";
					</script>
					<%
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>