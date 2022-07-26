<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<form name="form2" method="post">
	<%
		String read_no = null;
		if(request.getParameter("border_no")!=null){
			read_no = request.getParameter("border_no");
		}else if((String)session.getAttribute("border_no")!=null){
			read_no = (String)session.getAttribute("border_no");
		}
		session.setAttribute("border_no", read_no);
		String read_category = null;
		String read_title = null;
		String replay = null;
		String read_Writer = null;
		String read_Body = null;
		String write_Date = null;
		String write_Time = null;
		try{
			sql = "select b.category_value, title, replay, id, body, time from jangki_border a join jangki_border_category b on a.category=b.no where a.no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, read_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				read_category = rs.getString(1);
				read_title = rs.getString(2);
				replay = rs.getString(3);
				if(replay==null){
					replay="리플레이 없음";
				}
				read_Writer = rs.getString(4);
				read_Body = rs.getString(5);
				write_Date = rs.getString(6).substring(5,10);
				write_Time = rs.getString(6).substring(11,19);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		int try_no = 0;
		if(request.getParameter("try_no")!=null){
			try_no = Integer.parseInt(request.getParameter("try_no"));
		}
		int try_step = 0;
		if(request.getParameter("try_step")!=null){
			try_step = Integer.parseInt(request.getParameter("try_step"));
		}
	%>
	<h3 id="title">글 읽기</h3>
	<div class="read_body" style="width:100%;">
				<input type="button" value="목록" onclick="history.back()" style="margin-left:50px;color:white;background-color:#D86142;border-radius:5px;width:50px;height:25px;">
			<%
				if(read_Writer.equals(id)){
					%>
					<input type="button" value="수정" onclick="update_border()" style="margin-left:calc(100% - 200px);color:white;background-color:#D86142;border-radius:5px;width:50px;height:25px;">
					<%
				}
			%>
	<table style="width:95%;margin:0 auto;margin-top:2%;background-color:white;border-collapse:collapse;border-radius:30px;">
		<tr style="height:25px;border-bottom:1px dotted black;">
			<th style="border-right:1px dashed black;">글번호</th>
			<td style="padding-left:1%;"><%=read_no %></td>
			<th style="border-right:1px dashed black;">분류</th>
			<td style="padding-left:1%;"><%=read_category %></td>
		</tr>
		<tr style="height:25px;border-bottom:1px dotted black;">
			<th style="border-right:1px dashed black;">작성자</th>
			<td style="padding-left:1%;"><%=read_Writer %></td>
			<th style="border-right:1px dashed black;">리플레이</th>
			<td style="padding-left:1%;"><%=replay %></td>
		</tr>
		<tr style="height:25px;border-bottom:1px dotted black;">
			<th style="border-right:1px dashed black;">제목</th>
			<td colspan=3 style="padding-left:1%;"><%=read_title %></td>
		</tr>
		<tr style="height:25px;border-bottom:1px dotted black;">
			<th style="border-right:1px dashed black;">작성일</th>
			<td style="padding-left:1%;"><%=write_Date %></td>
			<th style="border-right:1px dashed black;">작성시간</th>
			<td style="padding-left:1%;"><%=write_Time %></td>
		</tr>
		<tr style="height:25px;border-bottom:1px dotted black;">
			<th colspan=4>본문</th>
		</tr>
		<tr>
			<td colspan=4>
			<pre style="padding-left:5%;max-width:600px;height:300px;overflow-y:auto;"><%=read_Body %></pre>
			</td>
		</tr>
	</table>
	</div>
		<h4 style="margin-top:2%;margin-left:3%;">댓글</h4>
	<div class="read_ripple"
	<%
		if(try_step==0){
			%>style="height:150px;overflow-y:auto;width:95%;margin:0 auto;"<%
		}else{
			%>style="height:275px;overflow-y:auto;width:95%;margin:0 auto;"<%
		}
	%>
	>
		<table style="margin:0 auto;width:100%;border-collapse:collapse;background-color:white;border-radius:5px;">
		<tr>
			<td style="height:10px;">
		</tr>
			<%
				String border_no = read_no;
				System.out.println("border_no: "+border_no);
				int ripple_no = 0;
				String ripple_id = null;
				String ripple = null;
				int ripple_step = 0;
				String ripple_date = null;
				String ripple_time = null;
				try{
					sql = "select *from jangki_ripple where border_no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, border_no);
					rs = pstmt.executeQuery();
					while(rs.next()){
						ripple_no = rs.getInt(2);
						ripple_id = rs.getString(3);
						ripple = rs.getString(4);
						ripple_step = rs.getInt(5);
						ripple_date = rs.getString(6).substring(5,10);
						ripple_time = rs.getString(6).substring(11,16);
						%>
						<tr>
							<%
								if(ripple_step==0){
									%>
									<td rowspan=2 style="width:2%;padding-left:10px;">●</td>
									<%
								}else{
							%>
							<td id="step" rowspan=2 style="width:2%;padding-left:calc( 10px * <%=ripple_step%> );">└></td>
							<%
								}
							%>
							<td style="width:15%;"><%=ripple_id %></td>
							<td colspan=2 rowspan=2 style="max-height:40px;overflow-y:auto;"><pre><%=ripple %></pre></td>
							<td style="width:14%;"><a href="main.jsp?try_no=<%=ripple_no%>&try_step=<%=ripple_step+1%>&idx=6#ripple_area">댓글달기</a></td>
						</tr>
						<tr style="border-bottom:1px dashed black;">
								<% boolean check = false;
									if(id.equals(ripple_id)){
										check=true;
									}
								%>
							<td>
								<a <%=check==true ? "" : "hidden" %> href="delete_ripple.jsp?ripple_no=<%=ripple_no%>">삭제</a>
							</td>
							<td style="text-align:right;"><%=ripple_date %> <%=ripple_time %></td>
						</tr>
						<%
							if(try_no==ripple_no&&ripple_step+1==try_step){
								%>
						<tr>
							<td style="height:10px;"></td>
						</tr>
						<tr>
							<td colspan=2>
								<h4>댓글쓰기</h4>
							</td>
							<td><input type="text" name="try_step" value="<%=try_step%>" hidden></td>
							<td><input type="text" name="try_no" value="<%=try_no %>" hidden></td>
						</tr>
						<tr style="border-bottom:1px dashed black;">
							<td colspan=4>
								<textarea name="ripple_area" style="width:100%;" rows="6" cols="50"></textarea>
							</td>
							<td style="text-align:center;">
								<input type="button" style="width:90%;height:35px;" value="작성완료" onclick="add_ripple()">
							</td>
						</tr>
								<%
							}
						%>
						<%
					}
					if(ripple_no==0){
						%>
						<tr>
							<td colspan=4>
								<h5>등록된 댓글이 없습니다.</h5>
							</td>
						</tr>
						<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</div>
		<div>
			<table style="width:95%;margin:0 auto;background-color:white;border-top:1px solid black;">
			<%
				if(try_step==0){
					try_no=ripple_no+1;
					%>
					<tr>
						<td style="height:10px;"></td>
					</tr>
					<tr>
						<td colspan=2>
							<h4>댓글쓰기</h4>
						</td>
						<td><input type="text" name="try_step" value="<%=try_step%>" hidden></td>
						<td><input type="text" name="try_no" value="<%=try_no %>" hidden></td>
					</tr>
					<tr>
						<td colspan=4 style="width:86%;">
							<textarea name="ripple_area" style="width:100%;" rows="6" cols="50"></textarea>
						</td>
						<td style="text-align:center;">
							<input type="button" style="width:90%;height:45px;" value="작성완료" onclick="add_ripple()">
						</td>
					</tr>
					<%
				}
			%>
			</table>
		</div>
</form>
</body>
<script>
function add_ripple(){
	var doc2 = document.form2;
	if(doc2.ripple_area.value==""){
		alert("댓글 입력 필요");
		doc2.ripple_area.focus();
	}else{
		doc2.action = "add_ripple.jsp";
		doc2.submit();
	}
}
function update_border(){
	location.href="main.jsp?idx=7";
}
</script>
</html>