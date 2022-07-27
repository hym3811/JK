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
<%
	Integer p1=0;
	Integer p2=0;
	if(request.getParameter("p1")!=null)
		p1=Integer.parseInt(request.getParameter("p1"));
	if(request.getParameter("p2")!=null)
		p2=Integer.parseInt(request.getParameter("p2"));
	
	Integer chk1=0;
	Integer chk2=0;
	if(request.getParameter("chk1")!=null)
		chk1=Integer.parseInt(request.getParameter("chk1"));
	if(request.getParameter("chk2")!=null)
		chk2=Integer.parseInt(request.getParameter("chk2"));
	
	session.setAttribute("a", p1);
	session.setAttribute("b", p2);
%>
<div class="choice">
<table style="margin:0 auto;margin-top:10%;width:55%;">
	<tr style="text-align:center;">
	<%
		if(chk1==0){
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:blue;border:3px solid blue;border-radius:20px;">楚</p></th>
	<%
		}else{
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:blue;border:3px solid blue;border-radius:20px;background-color:lightgray;">楚</p></th>
	<%
		}
	%>
	<%
		if(chk2==0){
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:red;border:3px solid red;border-radius:20px;">漢</p></th>
	<%
		}else{
	%>
		<th colspan=2 style="width:50%;"><p style="margin:0 auto;width:30%;font-size:3.5em;color:red;border:3px solid red;border-radius:20px;background-color:lightgray;">漢</p></th>
	<%
		}
	%>
	</tr>
	<tr style="height:30px;">
		<td colspan=2 style="text-align:center;width:50%;">
		<%
			if(chk1==1){
		%>
			<p style="margin:0 auto;font-weight:bold;font-size:1.5em;color:blue;" <%=chk1==1 ? "" : "hidden" %>>Ready!!!</p>
		<%
			}
		%>
		</td>
		<td colspan=2 style="text-align:center;width:50%;">
		<%
			if(chk2==1){
		%>
			<p style="margin:0 auto;font-weight:bold;font-size:1.5em;color:red;" <%=chk2==1 ? "" : "hidden" %>>Ready!!!</p>
		<%
			}
		%>
		</td>
	</tr>
</table>
<table style="margin:0 auto;margin-top:2%;">
	<tr>
		<td><input id="position" type="button" style="background-image:url('Position/양귀마(초).png');" onclick="location.href='Start.jsp?p1=1&p2=<%=p2%>&chk1=1&chk2=<%=chk2%>'" <%=chk1==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/좌귀마(초).png');" onclick="location.href='Start.jsp?p1=2&p2=<%=p2%>&chk1=1&chk2=<%=chk2%>'" <%=chk1==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/양귀마(한).png');" onclick="location.href='Start.jsp?p1=<%=p1 %>&p2=1&chk1=<%=chk1%>&chk2=1'" <%=chk2==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/양귀마(한).png');" onclick="location.href='Start.jsp?p1=<%=p1 %>&p2=2&chk1=<%=chk1%>&chk2=1'" <%=chk2==1 ? "disabled" : "" %>></td>
	</tr>
	<tr>
		<th>양귀마(상마마상)</th>
		<th>좌귀마(상마상마)</th>
		<th>양귀마(상마마상)</th>
		<th>좌귀마(상마상마)</th>
	</tr>
	<tr>
		<td><input id="position" type="button" style="background-image:url('Position/원앙마(초).png');" onclick="location.href='Start.jsp?p1=3&p2=<%=p2%>&chk1=1&chk2=<%=chk2%>'" <%=chk1==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/우귀마(초).png');" onclick="location.href='Start.jsp?p1=4&p2=<%=p2%>&chk1=1&chk2=<%=chk2%>'" <%=chk1==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/원앙마(한).png');" onclick="location.href='Start.jsp?p1=<%=p1 %>&p2=3&chk1=<%=chk1%>&chk2=1'" <%=chk2==1 ? "disabled" : "" %>></td>
		<td><input id="position" type="button" style="background-image:url('Position/우귀마(한).png');" onclick="location.href='Start.jsp?p1=<%=p1 %>&p2=4&chk1=<%=chk1%>&chk2=1'" <%=chk2==1 ? "disabled" : "" %>></td>
	</tr>
	<tr>
		<th>원앙마(마상상마)</th>
		<th>우귀마(마상마상)</th>
		<th>원앙마(마상상마)</th>
		<th>우귀마(마상마상)</th>
	</tr>
</table>
<table style="margin:0 auto;margin-top:2%;">
	<tr>
		<td colspan=4 style="text-align:center;">
			<input type=button style="border-radius:20px;width:240px;height:70px;background-color:brown;color:white;font-size:2.3em;" value="게임시작" onclick="location.href='Before.jsp'" <%=chk1==1&&chk2==1 ? "" : "disabled" %>>
		</td>
	</tr>
</table>
</div>
</body>
</html>