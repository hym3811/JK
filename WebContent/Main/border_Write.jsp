<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form2" method="post">
	<h3 id="title">글쓰기</h3>
	<table style="margin:0 auto;width:90%;border-collapse:collapse;margin-top:5%;">
		<tr>
			<td colspan=2 style="padding-left:5%;">
				<input id="border_read_btn" type="button" value="목록" onclick="history.back()">
			</td>
			<td colspan=2 style="text-align:right;padding-right:5%;">
				<input id="border_read_btn" style="width:60px!important;" type="button" value="작성완료" onclick="add_border()">
			</td>
		</tr>
		<tr>
			<td style="height:10px;"></td>
		</tr>
		<tr style="border-top:1px solid black;border-bottom:1px dashed black;">
			<th style="height:25px;">제목</th>
			<td colspan=3><input style="width:95%;height:20px;border-bottom:1px solid black;" type="text" name="title"></td>
		</tr>
		<tr style="border-bottom:1px dashed black;">
			<th>분류</th>
			<td>
				<select style="border:none;" name="category">
					<option value="">분류 선택</option>
					<%
						String category_no1 = null;
						String category_value1 = null;
						ArrayList<String> border_write_replay_number = new ArrayList<String>();
						ArrayList<String> border_write_replay_end = new ArrayList<String>();
						try{
							sql = "select * from jangki_border_category";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while(rs.next()){
								category_no1 = rs.getString(1);
								category_value1 = rs.getString(2);
								%>
								<option value="<%=category_no1 %>"><%=category_value1 %></option>
								<%
							}
							sql = "select * from jangki_replay where cho=? or han=? order by end desc";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, (String)session.getAttribute("id"));
							pstmt.setString(2, (String)session.getAttribute("id"));
							rs = pstmt.executeQuery();
							while(rs.next()){
								border_write_replay_number.add(rs.getString(1));
								border_write_replay_end.add(rs.getString(4).substring(0,19));
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
				</select>
			</td>
			<th>리플레이</th>
			<td>
				<select style="border:none;" name="replay">
					<option value="">리플레이 선택</option>
					<%
						for(int i=0;i<border_write_replay_number.size();i++){
							%><option value="<%=border_write_replay_number.get(i)%>"><%=border_write_replay_number.get(i) %> / <%=border_write_replay_end.get(i) %></option><%
						}
					%>
				</select>
			</td>
		</tr>
		<tr style="border-bottom:1px dashed black;">
			<th colspan=4>본문</th>
		</tr>
		<tr>
			<td colspan=4>
				<textarea style="font-size:1.1em;margin:1% 0;border-radius:5px;width:100%;height:600px;" name="body" rows="26" cols="50"></textarea>
			</td>
		</tr>
	</table>
</form>
</body>
<script>
function add_border(){
	var doc2 = document.form2;
	if(doc2.title.value==""){
		alert("제목 입력 필요");
		doc2.title.focus();
	}else if(doc2.category.value==""){
		alert("분류 선택 필요");
		doc2.category.focus();
	}else if(doc2.body.value==""){
		alert("본문 입력 필요");
		doc2.body.focus();
	}else{
		doc2.action = "border_Write_Process.jsp";
		doc2.submit();
	}
}
</script>
</html>