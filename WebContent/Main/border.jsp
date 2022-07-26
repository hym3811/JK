<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<form name="form2" method="post">
	<h3 id="title">게시판</h3>
	<div class="border_table">
	<table id="border_table" style="width:100%;">
		<tr>
			<th style="width:8%;">번호</th>
			<th style="width:10%;">분류</th>
			<th>제목</th>
			<th style="width:17%;">작성자</th>
			<th style="width:9%;">작성일</th>
			<th style="width:12%;">시간</th>
		</tr>
		<%
			int pgcount = 0;
			int maxcount = 0;
			String ctg = request.getParameter("category");
			String filter = request.getParameter("filter");
			String search = request.getParameter("search");
			if(ctg==null){
				ctg="0";
			}
			if(filter==null){
				filter="0";
			}
			if(search==null){
				search="";
			}
			System.out.println("ctg: "+ctg);
			System.out.println("filter: "+filter);
			System.out.println("search: "+search);
			try{
				if(ctg==null&&filter==null){
					System.out.println("체크1");
					sql = "select count(no) from jangki_border";
					pstmt = conn.prepareStatement(sql);
				}else if(ctg.equals("0")&&filter.equals("0")){
					System.out.println("체크1");
					sql = "select count(no) from jangki_border";
					pstmt = conn.prepareStatement(sql);
				}else if(!ctg.equals("0")&&filter.equals("0")){
					System.out.println("체크2");
					sql = "select count(no) from jangki_border where category=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ctg);
				}else if(ctg.equals("0")&&!filter.equals("0")){
					System.out.println("체크3");
					sql = "select count(no) from jangki_border where "+filter+"=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
				}else if(!ctg.equals("0")&&!filter.equals("0")){
					System.out.println("체크4");
					sql = "select count(no) from jangki_border where category=? and "+filter+"=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ctg);
					pstmt.setString(2, search);
				}
				rs = pstmt.executeQuery();
				if(rs.next()){
					maxcount = rs.getInt(1);
					if(rs.getInt(1)%14>0){
						pgcount = (rs.getInt(1)/14)+1;
					}else{
						pgcount = rs.getInt(1)/14;
					}
				}
				System.out.println("pgcount: "+pgcount);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			int pgnum = 1;
			if(request.getParameter("pgnum")!=null){
				pgnum = Integer.parseInt(request.getParameter("pgnum"));
			}
			if(pgnum<1){
				pgnum=1;
			}else if(pgnum>pgcount){
				pgnum=pgcount;
			}
			System.out.println("pgnum: "+pgnum);
			String no = null;
			String category = null;
			String title = null;
			String writer = null;
			String writedate = null;
			String writetime = null;
			int count = 0;
			try{
				 if(ctg==null&&filter==null){
					System.out.println("체크1");
					sql = "select a.no,b.category_value,title,id,time from jangki_border a join jangki_border_category b on a.category=b.no order by a.no desc";
					pstmt=conn.prepareStatement(sql);
				}else if(ctg.equals("0")&&filter.equals("0")){
					System.out.println("체크1");
					sql = "select a.no,b.category_value,title,id,time from jangki_border a join jangki_border_category b on a.category=b.no order by a.no desc";
					pstmt=conn.prepareStatement(sql);
				}else if(!ctg.equals("0")&&filter.equals("0")){
					System.out.println("체크2");
					sql = "select a.no,b.category_value,title,id,time from jangki_border a join jangki_border_category b on a.category=b.no where category=? order by a.no desc";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, ctg);
				}else if(ctg.equals("0")&&!filter.equals("0")){
					System.out.println("체크3");
					sql = "select a.no,b.category_value,title,id,time from jangki_border a join jangki_border_category b on a.category=b.no where "+filter+"=? order by a.no desc";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, search);
				}else if(!ctg.equals("0")&&!filter.equals("0")){
					System.out.println("체크4");
					sql = "select a.no,b.category_value,title,id,time from jangki_border a join jangki_border_category b on a.category=b.no where category=? and "+filter+"=?order by a.no desc";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, ctg);
					pstmt.setString(2, search);
				}
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					count++;
					if(count<((pgnum-1)*14)+1){
						continue;
					}else if(count>(pgnum*14)){
						break;
					}
					if(count>=((pgnum-1)*14)+1&&count<=(pgnum*14)){
					no = rs.getString(1);
					category = rs.getString(2);
					title = rs.getString(3);
					writer = rs.getString(4);
					writedate = rs.getString(5).substring(5,10);
					writetime = rs.getString(5).substring(11,19);
		%>
		<tr>
			<td><%=no %></td>
			<td><%=category %></td>
			<td><a id="aTag" href="main.jsp?idx=6&border_no=<%=no%>"><%=title %></a></td>
			<td><%=writer %></td>
			<td><%=writedate %></td>
			<td><%=writetime %></td>
		</tr>
		<%
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</table>
	</div>
	<div style="width:100%;">
		<table style="width:100%;text-align:center;">
			<tr>
				<td style="width:12%;border-bottom:2px solid black!important;">
					<input id="border_btn" style="height:25px;width:80%;border-radius:5px;color:white;background-color:purple;" type="button" value="초기화" onclick="location.href='main.jsp?idx=<%=idx%>'">
				</td>
				<td style="width:12%;border-bottom:2px solid black!important;">
					<select name="category" style="width:100%;height:25px;">
						<option value="0">전체</option>
						<%
							String category_no = null;
							String category_value = null;
							try{
								sql = "select * from jangki_border_category";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								while(rs.next()){
									category_no = rs.getString(1);
									category_value = rs.getString(2);
									%>
									<option value="<%=category_no %>" <%=ctg==null ? "" :(ctg.equals(category_no) ? "selected" : "") %>><%=category_value %></option>
									<%
								}
							}catch(Exception e){
								e.printStackTrace();
							}
						%>
					</select>
				</td>
				<td style="width:12%;border-bottom:2px solid black!important;">
					<select name="filter" style="width:100%;height:25px;">
						<option value="0">전체</option>
						<option value="title" <%=filter==null ? "" : (filter.equals("title") ? "selected" : "") %>>제목</option>
						<option value="id" <%=filter==null ? "" : (filter.equals("id") ? "selected" : "") %>>작성자</option>
					</select>
				</td>
				<td colspan=3 style="border-bottom:2px solid black!important;">
					<input style="width:100%;height:25px;" type="text" name="search" value="<%=search==null ? "" : search%>">
				</td>
				<td style="border-bottom:2px solid black!important;">
					<input id="border_btn" style="height:25px;width:80%;border-radius:5px;color:white;background-color:purple;" type="button" value="검색" onclick="sch()">
				</td>
				<td style="width:9%;border-bottom:2px solid black!important;">
					<input id="border_btn" style="height:25px;width:95%;border-radius:5px;color:white;background-color:purple;" type="button" value="글쓰기" onclick="location.href='main.jsp?idx=5'">
				</td>
			</tr>
		</table>
	</div>
	<script>
	function sch(){
		var doc2 = document.form2;
		if(doc2.search.value!=""&&doc2.filter.value=="0"){
			alert("검색 내용이 있을 경우 검색 필터 선택 필요");
			doc2.filter.focus();
		}else if(doc2.filter.value!="0"&&doc2.search.value==""){
			alert("검색 필터 값이 있는 경우 검색 내용 입력 필요");
			doc2.search.focus();
		}else{
			doc2.action = "main.jsp";
			doc2.submit();
		}
	}
	</script>
	<div style="height:40px;" class="pgnum">
	<table style="width:100%;">
		<tr>
			<td style="width:8%;"></td>
			<td style="width:8%;">
				<%
					if(pgcount>10&&pgnum>10){
						%><a id="arrow" href="main.jsp?pgnum=<%=pgnum-10%>&idx=<%=idx%>&category=<%=ctg%>&filter=<%=filter%>&search=<%=search%>">◁◁</a><%
					}
				%>
			</td>
			<td style="width:8%;">
				<%
					if(pgnum>1){
						%><a id="arrow" href="main.jsp?pgnum=<%=pgnum-1%>&idx=<%=idx%>&category=<%=ctg%>&filter=<%=filter%>&search=<%=search%>">◀</a><%
					}
				%>
			</td>
			<td>
				<%
					int range_start = (((pgnum-1)/10)*10)+1;
					int range_end = range_start+9;
					if(range_end>pgcount){
						range_end=pgcount;
					}
					for(int i=range_start;i<=range_end;i++){
						%><a 
						<%
							if(pgnum==i){
								%>id="aaTag"<%
							}else{
								%>id="aTag"<%
							}
						%>
						 href="main.jsp?pgnum=<%=i%>&idx=<%=idx%>&category=<%=ctg%>&filter=<%=filter%>&search=<%=search%>"> <%=i %> </a><%
					}
				%>
			</td>
			<td style="width:8%;">
				<%
					if(pgnum<pgcount){
						%><a id="arrow" href="main.jsp?pgnum=<%=pgnum+1%>&idx=<%=idx%>&category=<%=ctg%>&filter=<%=filter%>&search=<%=search%>">▶</a><%
					}
				%>
			</td>
			<td style="width:8%;">
				<%
					if(pgcount>10&&pgnum<(pgcount/10)*10+1){
						%><a id="arrow" href="main.jsp?pgnum=<%=pgnum+10%>&idx=<%=idx%>&category=<%=ctg%>&filter=<%=filter%>&search=<%=search%>">▷▷</a><%
					}
				%>
			</td>
			<td style="width:8%;"></td>
		</tr>
	</table>
		
	</div>
</form>
</body>
</html>