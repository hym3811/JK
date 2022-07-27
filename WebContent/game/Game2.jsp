<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../DBConn.jsp" %>
<%
	String horse=request.getParameter("horse");
	String name=null;
	Integer[] ax=new Integer[16];Integer[] ay=new Integer[16];
	Integer[] bx=new Integer[16];Integer[] by=new Integer[16];
	Integer i=0;Integer j=0;
	try{
		sql="select * from cho_game";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			ax[i]=rs.getInt(2);
			ay[i]=rs.getInt(3);
			i++;
		}
		
		sql="select * from han_game";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			bx[j]=rs.getInt(2);
			by[j]=rs.getInt(3);
			j++;
		}
		
		sql="select name from jk_horse where horse=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, horse);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	Integer turn=(Integer)session.getAttribute("turn");
	session.setAttribute("turn", turn);
	session.setAttribute("horse", horse);
%>
<div class="field">
<!-- 초나라 -->
<input type="button" id="a1" <%=ax[0]==0 ? "hidden" : "" %> style="background-image:url(Horse/초왕.png);left:calc(<%=ax[0]-1 %> * 113.7px + 20px);top:calc(<%=10-ay[0]%> * 72px + 1px);" <%="a01".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}"">
<input type="button" id="a2" <%=ax[1]==0 ? "hidden" : "" %> style="background-image:url(Horse/초차.png);left:calc(<%=ax[1]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[1]%> * 72px + 5px);" <%="a02".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[2]==0 ? "hidden" : "" %> style="background-image:url(Horse/초차.png);left:calc(<%=ax[2]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[2]%> * 72px + 5px);" <%="a03".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[3]==0 ? "hidden" : "" %> style="background-image:url(Horse/초포.png);left:calc(<%=ax[3]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[3]%> * 72px + 5px);" <%="a04".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[4]==0 ? "hidden" : "" %> style="background-image:url(Horse/초포.png);left:calc(<%=ax[4]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[4]%> * 72px + 5px);" <%="a05".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[5]==0 ? "hidden" : "" %> style="background-image:url(Horse/초마.png);left:calc(<%=ax[5]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[5]%> * 72px + 5px);" <%="a06".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[6]==0 ? "hidden" : "" %> style="background-image:url(Horse/초마.png);left:calc(<%=ax[6]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[6]%> * 72px + 5px);" <%="a07".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[7]==0 ? "hidden" : "" %> style="background-image:url(Horse/초상.png);left:calc(<%=ax[7]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[7]%> * 72px + 5px);" <%="a08".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a2" <%=ax[8]==0 ? "hidden" : "" %> style="background-image:url(Horse/초상.png);left:calc(<%=ax[8]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[8]%> * 72px + 5px);" <%="a09".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[9]==0 ? "hidden" : "" %> style="background-image:url(Horse/초사.png);left:calc(<%=ax[9]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[9]%> * 72px + 15px);" <%="a10".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[10]==0 ? "hidden" : "" %> style="background-image:url(Horse/초사.png);left:calc(<%=ax[10]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[10]%> * 72px + 15px);" <%="a11".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[11]==0 ? "hidden" : "" %> style="background-image:url(Horse/초졸.png);left:calc(<%=ax[11]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[11]%> * 72px + 15px);" <%="a12".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[12]==0 ? "hidden" : "" %> style="background-image:url(Horse/초졸.png);left:calc(<%=ax[12]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[12]%> * 72px + 15px);" <%="a13".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[13]==0 ? "hidden" : "" %> style="background-image:url(Horse/초졸.png);left:calc(<%=ax[13]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[13]%> * 72px + 15px);" <%="a14".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[14]==0 ? "hidden" : "" %> style="background-image:url(Horse/초졸.png);left:calc(<%=ax[14]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[14]%> * 72px + 15px);" <%="a15".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="a3" <%=ax[15]==0 ? "hidden" : "" %> style="background-image:url(Horse/초졸.png);left:calc(<%=ax[15]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[15]%> * 72px + 15px);" <%="a16".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<!-- 한나라 -->
<input type="button" id="b1" <%=bx[0]==0 ? "hidden" : "" %> style="background-image:url(Horse/한왕.png);left:calc(<%=bx[0]-1 %> * 113.7px + 20px);top:calc(<%=10-by[0]%> * 72px + 1px);" <%="b01".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[1]==0 ? "hidden" : "" %> style="background-image:url(Horse/한차.png);left:calc(<%=bx[1]-1 %> * 113.7px + 30px);top:calc(<%=10-by[1]%> * 72px + 5px);" <%="b02".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[2]==0 ? "hidden" : "" %> style="background-image:url(Horse/한차.png);left:calc(<%=bx[2]-1 %> * 113.7px + 30px);top:calc(<%=10-by[2]%> * 72px + 5px);" <%="b03".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[3]==0 ? "hidden" : "" %> style="background-image:url(Horse/한포.png);left:calc(<%=bx[3]-1 %> * 113.7px + 30px);top:calc(<%=10-by[3]%> * 72px + 5px);" <%="b04".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[4]==0 ? "hidden" : "" %> style="background-image:url(Horse/한포.png);left:calc(<%=bx[4]-1 %> * 113.7px + 30px);top:calc(<%=10-by[4]%> * 72px + 5px);" <%="b05".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[5]==0 ? "hidden" : "" %> style="background-image:url(Horse/한마.png);left:calc(<%=bx[5]-1 %> * 113.7px + 30px);top:calc(<%=10-by[5]%> * 72px + 5px);" <%="b06".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[6]==0 ? "hidden" : "" %> style="background-image:url(Horse/한마.png);left:calc(<%=bx[6]-1 %> * 113.7px + 30px);top:calc(<%=10-by[6]%> * 72px + 5px);" <%="b07".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[7]==0 ? "hidden" : "" %> style="background-image:url(Horse/한상.png);left:calc(<%=bx[7]-1 %> * 113.7px + 30px);top:calc(<%=10-by[7]%> * 72px + 5px);" <%="b08".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b2" <%=bx[8]==0 ? "hidden" : "" %> style="background-image:url(Horse/한상.png);left:calc(<%=bx[8]-1 %> * 113.7px + 30px);top:calc(<%=10-by[8]%> * 72px + 5px);" <%="b09".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[9]==0 ? "hidden" : "" %> style="background-image:url(Horse/한사.png);left:calc(<%=bx[9]-1 %> * 113.7px + 37px);top:calc(<%=10-by[9]%> * 72px + 15px);" <%="b10".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[10]==0 ? "hidden" : "" %> style="background-image:url(Horse/한사.png);left:calc(<%=bx[10]-1 %> * 113.7px + 37px);top:calc(<%=10-by[10]%> * 72px + 15px);" <%="b11".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[11]==0 ? "hidden" : "" %> style="background-image:url(Horse/한병.png);left:calc(<%=bx[11]-1 %> * 113.7px + 37px);top:calc(<%=10-by[11]%> * 72px + 15px);" <%="b12".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[12]==0 ? "hidden" : "" %> style="background-image:url(Horse/한병.png);left:calc(<%=bx[12]-1 %> * 113.7px + 37px);top:calc(<%=10-by[12]%> * 72px + 15px);" <%="b13".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[13]==0 ? "hidden" : "" %> style="background-image:url(Horse/한병.png);left:calc(<%=bx[13]-1 %> * 113.7px + 37px);top:calc(<%=10-by[13]%> * 72px + 15px);" <%="b14".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[14]==0 ? "hidden" : "" %> style="background-image:url(Horse/한병.png);left:calc(<%=bx[14]-1 %> * 113.7px + 37px);top:calc(<%=10-by[14]%> * 72px + 15px);" <%="b15".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input type="button" id="b3" <%=bx[15]==0 ? "hidden" : "" %> style="background-image:url(Horse/한병.png);left:calc(<%=bx[15]-1 %> * 113.7px + 37px);top:calc(<%=10-by[15]%> * 72px + 15px);" <%="b16".equals(horse) ? "" : "disabled" %> onclick="if(!confirm('다른 말을 움직이겠습니까?')){return false}else{location.href='Game.jsp'}">
<input id="btn" type="button" name="" style="background-image:url(Field/좌상.png)" onclick="if(!confirm('<%=name %>\n[1,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/상가로.png)" onclick="if(!confirm('<%=name %>\n[2,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/상가로.png)" onclick="if(!confirm('<%=name %>\n[3,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/한궁좌상.png)" onclick="if(!confirm('<%=name %>\n[4,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/한궁상.png)" onclick="if(!confirm('<%=name %>\n[5,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/한궁우상.png)" onclick="if(!confirm('<%=name %>\n[6,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/상가로.png)" onclick="if(!confirm('<%=name %>\n[7,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/상가로.png)" onclick="if(!confirm('<%=name %>\n[8,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,10'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우상.png)" onclick="if(!confirm('<%=name %>\n[9,10] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,10'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/궁성.png)" onclick="if(!confirm('<%=name %>\n[5,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,9'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,9] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,9'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/한궁좌하.png)" onclick="if(!confirm('<%=name %>\n[4,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/한궁우하.png)" onclick="if(!confirm('<%=name %>\n[6,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,8'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,8] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,8'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,7'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,7] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,7'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,6'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,6] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,6'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,5'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,5] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,5'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,4'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,4] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,4'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/초궁좌상.png)" onclick="if(!confirm('<%=name %>\n[4,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[5,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/초궁우상.png)" onclick="if(!confirm('<%=name %>\n[6,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,3'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,3] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,3'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick="if(!confirm('<%=name %>\n[1,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[2,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[3,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[4,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/궁성.png)" onclick="if(!confirm('<%=name %>\n[5,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[6,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[7,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/교차.png)" onclick="if(!confirm('<%=name %>\n[8,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,2'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우세로.png)" onclick="if(!confirm('<%=name %>\n[9,2] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,2'}" >
<br>
<input id="btn" type="button" name="" style="background-image:url(Field/좌하.png)" onclick="if(!confirm('<%=name %>\n[1,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=1,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/하가로.png)" onclick="if(!confirm('<%=name %>\n[2,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=2,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/하가로.png)" onclick="if(!confirm('<%=name %>\n[3,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=3,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/초궁좌하.png)" onclick="if(!confirm('<%=name %>\n[4,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=4,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/하가로.png)" onclick="if(!confirm('<%=name %>\n[5,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=5,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/초궁우하.png)" onclick="if(!confirm('<%=name %>\n[6,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=6,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/하가로.png)" onclick="if(!confirm('<%=name %>\n[7,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=7,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/하가로.png)" onclick="if(!confirm('<%=name %>\n[8,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=8,1'}" >
<input id="btn" type="button" name="" style="background-image:url(Field/우하.png)" onclick="if(!confirm('<%=name %>\n[9,1] 으로 이동하시겠습니까?')){return false}else{location.href='Game3.jsp?position=9,1'}" >
</div>
</body>
</html>