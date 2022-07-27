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
	}catch(Exception e){
		e.printStackTrace();
	}
	Integer turn=0;
	if(request.getParameter("chk")!=null){
		turn=1;
	}else{
		turn=(Integer)session.getAttribute("turn");
	}
	session.setAttribute("turn", turn);
	if(ax[0]==0||bx[0]==0){
		if(ax[0]==0){
			session.setAttribute("victory", "한나라");
		}else if(bx[0]==0){
			session.setAttribute("victory", "초나라");
		}
%>
<script>
location.href="End.jsp";
</script>
<%
	}
%>
<div class="field">
<!-- 초나라 -->
<input type="button" id="a1" style="background-image:url(Horse/초왕.png);left:calc(<%=ax[0]-1 %> * 113.7px + 20px);top:calc(<%=10-ay[0]%> * 72px + 1px);" <%=ax[0]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a01'">
<input type="button" id="a2" style="background-image:url(Horse/초차.png);left:calc(<%=ax[1]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[1]%> * 72px + 5px);" <%=ax[1]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a02'">
<input type="button" id="a2" style="background-image:url(Horse/초차.png);left:calc(<%=ax[2]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[2]%> * 72px + 5px);" <%=ax[2]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a03'">
<input type="button" id="a2" style="background-image:url(Horse/초포.png);left:calc(<%=ax[3]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[3]%> * 72px + 5px);" <%=ax[3]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a04'">
<input type="button" id="a2" style="background-image:url(Horse/초포.png);left:calc(<%=ax[4]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[4]%> * 72px + 5px);" <%=ax[4]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a05'">
<input type="button" id="a2" style="background-image:url(Horse/초마.png);left:calc(<%=ax[5]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[5]%> * 72px + 5px);" <%=ax[5]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a06'">
<input type="button" id="a2" style="background-image:url(Horse/초마.png);left:calc(<%=ax[6]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[6]%> * 72px + 5px);" <%=ax[6]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a07'">
<input type="button" id="a2" style="background-image:url(Horse/초상.png);left:calc(<%=ax[7]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[7]%> * 72px + 5px);" <%=ax[7]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a08'">
<input type="button" id="a2" style="background-image:url(Horse/초상.png);left:calc(<%=ax[8]-1 %> * 113.7px + 30px);top:calc(<%=10-ay[8]%> * 72px + 5px);" <%=ax[8]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a09'">
<input type="button" id="a3" style="background-image:url(Horse/초사.png);left:calc(<%=ax[9]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[9]%> * 72px + 15px);" <%=ax[9]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a10'">
<input type="button" id="a3" style="background-image:url(Horse/초사.png);left:calc(<%=ax[10]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[10]%> * 72px + 15px);" <%=ax[10]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a11'">
<input type="button" id="a3" style="background-image:url(Horse/초졸.png);left:calc(<%=ax[11]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[11]%> * 72px + 15px);" <%=ax[11]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a12'">
<input type="button" id="a3" style="background-image:url(Horse/초졸.png);left:calc(<%=ax[12]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[12]%> * 72px + 15px);" <%=ax[12]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a13'">
<input type="button" id="a3" style="background-image:url(Horse/초졸.png);left:calc(<%=ax[13]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[13]%> * 72px + 15px);" <%=ax[13]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a14'">
<input type="button" id="a3" style="background-image:url(Horse/초졸.png);left:calc(<%=ax[14]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[14]%> * 72px + 15px);" <%=ax[14]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a15'">
<input type="button" id="a3" style="background-image:url(Horse/초졸.png);left:calc(<%=ax[15]-1 %> * 113.7px + 37px);top:calc(<%=10-ay[15]%> * 72px + 15px);" <%=ax[15]==0 ? "hidden" : "" %> <%=turn==1 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=a16'">
<!-- 한나라 -->
<input type="button" id="b1" style="background-image:url(Horse/한왕.png);left:calc(<%=bx[0]-1 %> * 113.7px + 20px);top:calc(<%=10-by[0]%> * 72px + 1px);" <%=bx[0]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b01'">
<input type="button" id="b2" style="background-image:url(Horse/한차.png);left:calc(<%=bx[1]-1 %> * 113.7px + 30px);top:calc(<%=10-by[1]%> * 72px + 5px);" <%=bx[1]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b02'">
<input type="button" id="b2" style="background-image:url(Horse/한차.png);left:calc(<%=bx[2]-1 %> * 113.7px + 30px);top:calc(<%=10-by[2]%> * 72px + 5px);" <%=bx[2]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b03'">
<input type="button" id="b2" style="background-image:url(Horse/한포.png);left:calc(<%=bx[3]-1 %> * 113.7px + 30px);top:calc(<%=10-by[3]%> * 72px + 5px);" <%=bx[3]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b04'">
<input type="button" id="b2" style="background-image:url(Horse/한포.png);left:calc(<%=bx[4]-1 %> * 113.7px + 30px);top:calc(<%=10-by[4]%> * 72px + 5px);" <%=bx[4]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b05'">
<input type="button" id="b2" style="background-image:url(Horse/한마.png);left:calc(<%=bx[5]-1 %> * 113.7px + 30px);top:calc(<%=10-by[5]%> * 72px + 5px);" <%=bx[5]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b06'">
<input type="button" id="b2" style="background-image:url(Horse/한마.png);left:calc(<%=bx[6]-1 %> * 113.7px + 30px);top:calc(<%=10-by[6]%> * 72px + 5px);" <%=bx[6]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b07'">
<input type="button" id="b2" style="background-image:url(Horse/한상.png);left:calc(<%=bx[7]-1 %> * 113.7px + 30px);top:calc(<%=10-by[7]%> * 72px + 5px);" <%=bx[7]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b08'">
<input type="button" id="b2" style="background-image:url(Horse/한상.png);left:calc(<%=bx[8]-1 %> * 113.7px + 30px);top:calc(<%=10-by[8]%> * 72px + 5px);" <%=bx[8]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b09'">
<input type="button" id="b3" style="background-image:url(Horse/한사.png);left:calc(<%=bx[9]-1 %> * 113.7px + 37px);top:calc(<%=10-by[9]%> * 72px + 15px);" <%=bx[9]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b10'">
<input type="button" id="b3" style="background-image:url(Horse/한사.png);left:calc(<%=bx[10]-1 %> * 113.7px + 37px);top:calc(<%=10-by[10]%> * 72px + 15px);" <%=bx[10]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b11'">
<input type="button" id="b3" style="background-image:url(Horse/한병.png);left:calc(<%=bx[11]-1 %> * 113.7px + 37px);top:calc(<%=10-by[11]%> * 72px + 15px);" <%=bx[11]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b12'">
<input type="button" id="b3" style="background-image:url(Horse/한병.png);left:calc(<%=bx[12]-1 %> * 113.7px + 37px);top:calc(<%=10-by[12]%> * 72px + 15px);" <%=bx[12]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b13'">
<input type="button" id="b3" style="background-image:url(Horse/한병.png);left:calc(<%=bx[13]-1 %> * 113.7px + 37px);top:calc(<%=10-by[13]%> * 72px + 15px);" <%=bx[13]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b14'">
<input type="button" id="b3" style="background-image:url(Horse/한병.png);left:calc(<%=bx[14]-1 %> * 113.7px + 37px);top:calc(<%=10-by[14]%> * 72px + 15px);" <%=bx[14]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b15'">
<input type="button" id="b3" style="background-image:url(Horse/한병.png);left:calc(<%=bx[15]-1 %> * 113.7px + 37px);top:calc(<%=10-by[15]%> * 72px + 15px);" <%=bx[15]==0 ? "hidden" : "" %> <%=turn==2 ? "" : "disabled" %> onclick="location.href='Game2.jsp?horse=b16'">
<input id="btn2" type="button" name="" style="background-image:url(Field/좌상.png)" onclick=alert("[1,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/상가로.png)" onclick=alert("[2,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/상가로.png)" onclick=alert("[3,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/한궁좌상.png)" onclick=alert("[4,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/한궁상.png)" onclick=alert("[5,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/한궁우상.png)" onclick=alert("[6,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/상가로.png)" onclick=alert("[7,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/상가로.png)" onclick=alert("[8,10]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우상.png)" onclick=alert("[9,10]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/궁성.png)" onclick=alert("[5,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,9]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,9]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/한궁좌하.png)" onclick=alert("[4,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/한궁우하.png)" onclick=alert("[6,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,8]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,8]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,7]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,7]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,6]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,6]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,5]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,5]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,4]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,4]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/초궁좌상.png)" onclick=alert("[4,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[5,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/초궁우상.png)" onclick=alert("[6,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,3]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,3]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌세로.png)" onclick=alert("[1,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[2,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[3,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[4,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/궁성.png)" onclick=alert("[5,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[6,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[7,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/교차.png)" onclick=alert("[8,2]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우세로.png)" onclick=alert("[9,2]") disabled>
<br>
<input id="btn2" type="button" name="" style="background-image:url(Field/좌하.png)" onclick=alert("[1,1]") disabled>
<input id="btn2" type="button" name="" style="padding:0;background-image:url(Field/하가로.png)" onclick=alert("[2,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/하가로.png)" onclick=alert("[3,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/초궁좌하.png)" onclick=alert("[4,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/하가로.png)" onclick=alert("[5,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/초궁우하.png)" onclick=alert("[6,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/하가로.png)" onclick=alert("[7,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/하가로.png)" onclick=alert("[8,1]") disabled>
<input id="btn2" type="button" name="" style="background-image:url(Field/우하.png)" onclick=alert("[9,1]") disabled>
</div>
</body>
</html>