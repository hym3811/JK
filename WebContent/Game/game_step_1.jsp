<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <%@ include file = "../DBConn.jsp" %> --%>
<body>
<%
	System.out.println((String)session.getAttribute("room_number"));
	String[][] field_png = new String[11][10];
	
	String[][] horse = new String[2][16];
	int[][] horse_x = new int[2][16];
	int[][] horse_y = new int[2][16];
	String[][] horse_png = new String[2][16];
	
	String camp=request.getParameter("camp");
	String pick=request.getParameter("pick");
	
	ArrayList<String> possible = new ArrayList<String>();
	
	int turn = 1;
	int step = 1;
	if(request.getParameter("step")!=null){
		step = Integer.parseInt(request.getParameter("step"));
	}
	try{
		sql = "select *from jangki_field order by no";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int p_x = 1;
		int p_y = 10;
		while(rs.next()){
			field_png[p_y][p_x] = rs.getString(4);
			p_x++;
			if(p_x>=10){
				p_y--;
				p_x=1;
			}
		}
		
		sql = "select turn from jangki_game_info where no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("room_number"));
		rs = pstmt.executeQuery();
		if(rs.next()){
			turn = rs.getInt(1);
		}
		System.out.println("turn: "+turn);
		
		sql = "select a.name,a.team,a.horse,b.x,b.y,a.png from jangki_horse a join jangki_start_"+(String)session.getAttribute("room_number")+" b on a.team=b.team and a.horse=b.horse";
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
			horse[team][horse2] = rs.getInt(4)+","+rs.getInt(5);
			horse_x[team][horse2] = rs.getInt(4);
			horse_y[team][horse2] = rs.getInt(5);
			horse_png[team][horse2] = rs.getString(6);
		}
		
		sql = "select * from jangki_game_"+(String)session.getAttribute("room_number");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			horse_x[rs.getInt(2)][rs.getInt(3)] = rs.getInt(4);
			horse_y[rs.getInt(2)][rs.getInt(3)] = rs.getInt(5);
			horse[rs.getInt(2)][rs.getInt(3)] = rs.getInt(4)+","+rs.getInt(5);
		}
		//System.out.println(Arrays.toString(horse_x[0]));
		//System.out.println(Arrays.toString(horse_y[0]));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//이동 가능 장소 탐색
		ArrayList<String> cho_p = new ArrayList<String>();
		ArrayList<String> han_p = new ArrayList<String>();
	if(camp!=null&&pick!=null){
		
		System.out.println("기물: "+camp+","+pick);
		
		int f_camp = Integer.parseInt(camp);
		int f_pick = Integer.parseInt(pick);
		
		int code_x = horse_x[Integer.parseInt(camp)][Integer.parseInt(pick)];
		int code_y = horse_y[Integer.parseInt(camp)][Integer.parseInt(pick)];
		
		System.out.println("현재좌표: "+code_x+","+code_y);
		
		for(int i=0;i<16;i++){
			cho_p.add(horse[0][i]);
		}
		for(int i=0;i<16;i++){
			han_p.add(horse[1][i]);
		}
		
		if(f_pick==0){//왕
			switch(f_camp){
			case 0:
				if(code_x==5&&code_y==2){
					for(int i=1;i<4;i++){
						for(int j=4;j<7;j++){
							if(cho_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				else if(code_x==4&&code_y==1){
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(cho_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				else if(code_x==6&&code_y==1){
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(cho_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
				}
				else if(code_x==4&&code_y==3){
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(cho_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
				}
				else if(code_x==6&&code_y==3){
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(cho_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				else{
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						if((code_x-1)>3&&(code_x-1)<7&&(code_y)>0&&(code_y)<4){
							possible.add((code_x-1)+","+code_y);
						}
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y-1)>0&&(code_y-1)<4){
							possible.add(code_x+","+(code_y-1));
						}
					}
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						if((code_x+1)>3&&(code_x+1)<7&&(code_y)>0&&(code_y)<4){
							possible.add((code_x+1)+","+code_y);
						}
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y+1)>0&&(code_y+1)<4){
							possible.add(code_x+","+(code_y+1));
						}
					}
				}
				break;
			case 1:
				if(code_x==5&&code_y==9){
					for(int i=8;i<11;i++){
						for(int j=4;j<7;j++){
							if(han_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				else if(code_x==4&&code_y==8){
					if(han_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(han_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				else if(code_x==6&&code_y==8){
					if(han_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(han_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
				}
				else if(code_x==4&&code_y==10){
					if(han_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(han_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
				}
				else if(code_x==6&&code_y==10){
					if(han_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(han_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				else{
					if(han_p.contains((code_x-1)+","+code_y)==false){
						if((code_x-1)>3&&(code_x-1)<7&&(code_y)>7&&(code_y)<11){
							possible.add((code_x-1)+","+code_y);
						}
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y-1)>7&&(code_y-1)<11){
							possible.add(code_x+","+(code_y-1));
						}
					}
					if(han_p.contains((code_x+1)+","+code_y)==false){
						if((code_x+1)>3&&(code_x+1)<7&&(code_y)>7&&(code_y)<11){
							possible.add((code_x+1)+","+code_y);
						}
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y+1)>7&&(code_y+1)<11){
							possible.add(code_x+","+(code_y+1));
						}
					}
				}
				break;
			}
		}else if(f_pick==1||f_pick==2){//차
			switch(f_camp){
			case 0:
				
				if(code_x==5&&code_y==2){
					for(int i=1;i<4;i++){
						for(int j=4;j<7;j++){
							if(cho_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				if(code_x==5&&code_y==9){
					for(int i=8;i<11;i++){
						for(int j=4;j<7;j++){
							if(cho_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				
				if(code_x==4){
					switch(code_y){
					case 1:
						if(cho_p.contains("5,2")==false){
							if(han_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(cho_p.contains("6,3")==false){
									if(han_p.contains("6,3")){
										possible.add("6,3");
									}else{
										possible.add("6,3");
									}
								}
							}
						}
						break;
					case 3:
						if(cho_p.contains("5,2")==false){
							if(han_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(cho_p.contains("6,1")==false){
									if(han_p.contains("6,1")){
										possible.add("6,1");
									}else{
										possible.add("6,1");
									}
								}
							}
						}
						break;
					case 8:
						if(cho_p.contains("5,9")==false){
							if(han_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(cho_p.contains("6,10")==false){
									if(han_p.contains("6,10")){
										possible.add("6,10");
									}else{
										possible.add("6,10");
									}
								}
							}
						}
						break;
					case 10:
						if(cho_p.contains("5,9")==false){
							if(han_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(cho_p.contains("6,8")==false){
									if(han_p.contains("6,8")){
										possible.add("6,8");
									}else{
										possible.add("6,8");
									}
								}
							}
						}
						break;
					}
				}else if(code_x==6){
					switch(code_y){
					case 1:
						if(cho_p.contains("5,2")==false){
							if(han_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(cho_p.contains("4,3")==false){
									if(han_p.contains("4,3")){
										possible.add("4,3");
									}else{
										possible.add("4,3");
									}
								}
							}
						}
						break;
					case 3:
						if(cho_p.contains("5,2")==false){
							if(han_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(cho_p.contains("4,1")==false){
									if(han_p.contains("4,1")){
										possible.add("4,1");
									}else{
										possible.add("4,1");
									}
								}
							}
						}
						break;
					case 8:
						if(cho_p.contains("5,9")==false){
							if(han_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(cho_p.contains("4,10")==false){
									if(han_p.contains("4,10")){
										possible.add("4,10");
									}else{
										possible.add("4,10");
									}
								}
							}
						}
						break;
					case 10:
						if(cho_p.contains("5,9")==false){
							if(han_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(cho_p.contains("4,8")==false){
									if(han_p.contains("4,8")){
										possible.add("4,8");
									}else{
										possible.add("4,8");
									}
								}
							}
						}
						break;
					}
				}
				
				
				for(int i=code_y+1;i<11;i++){
					if(cho_p.contains(code_x+","+i)){
						break;
					}else if(han_p.contains(code_x+","+i)){
						possible.add(code_x+","+i);
						break;
					}else if(cho_p.contains(code_x+","+i)==false){
						possible.add(code_x+","+i);
					}
				}
				for(int i=code_y-1;i>0;i--){
					if(cho_p.contains(code_x+","+i)){
						break;
					}else if(han_p.contains(code_x+","+i)){
						possible.add(code_x+","+i);
						break;
					}else if(cho_p.contains(code_x+","+i)==false){
						possible.add(code_x+","+i);
					}
				}
				for(int i=code_x+1;i<10;i++){
					if(cho_p.contains(i+","+code_y)){
						break;
					}else if(han_p.contains(i+","+code_y)){
						possible.add(i+","+code_y);
						break;
					}else if(cho_p.contains(i+","+code_y)==false){
						possible.add(i+","+code_y);
					}
				}
				for(int i=code_x-1;i>0;i--){
					if(cho_p.contains(i+","+code_y)){
						break;
					}else if(han_p.contains(i+","+code_y)){
						possible.add(i+","+code_y);
						break;
					}else if(cho_p.contains(i+","+code_y)==false){
						possible.add(i+","+code_y);
					}
				}
				break;
			case 1:
				//

				if(code_x==5&&code_y==2){
					for(int i=1;i<4;i++){
						for(int j=4;j<7;j++){
							if(han_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				if(code_x==5&&code_y==9){
					for(int i=8;i<11;i++){
						for(int j=4;j<7;j++){
							if(han_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				
				if(code_x==4){
					switch(code_y){
					case 1:
						if(han_p.contains("5,2")==false){
							if(cho_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(han_p.contains("6,3")==false){
									if(cho_p.contains("6,3")){
										possible.add("6,3");
									}else{
										possible.add("6,3");
									}
								}
							}
						}
						break;
					case 3:
						if(han_p.contains("5,2")==false){
							if(cho_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(han_p.contains("6,1")==false){
									if(cho_p.contains("6,1")){
										possible.add("6,1");
									}else{
										possible.add("6,1");
									}
								}
							}
						}
						break;
					case 8:
						if(han_p.contains("5,9")==false){
							if(cho_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(han_p.contains("6,10")==false){
									if(cho_p.contains("6,10")){
										possible.add("6,10");
									}else{
										possible.add("6,10");
									}
								}
							}
						}
						break;
					case 10:
						if(han_p.contains("5,9")==false){
							if(cho_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(han_p.contains("6,8")==false){
									if(cho_p.contains("6,8")){
										possible.add("6,8");
									}else{
										possible.add("6,8");
									}
								}
							}
						}
						break;
					}
				}else if(code_x==6){
					switch(code_y){
					case 1:
						if(han_p.contains("5,2")==false){
							if(cho_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(han_p.contains("4,3")==false){
									if(cho_p.contains("4,3")){
										possible.add("4,3");
									}else{
										possible.add("4,3");
									}
								}
							}
						}
						break;
					case 3:
						if(han_p.contains("5,2")==false){
							if(cho_p.contains("5,2")){
								possible.add("5,2");
							}else{
								possible.add("5,2");
								if(han_p.contains("4,1")==false){
									if(cho_p.contains("4,1")){
										possible.add("4,1");
									}else{
										possible.add("4,1");
									}
								}
							}
						}
						break;
					case 8:
						if(han_p.contains("5,9")==false){
							if(cho_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(han_p.contains("4,10")==false){
									if(cho_p.contains("4,10")){
										possible.add("4,10");
									}else{
										possible.add("4,10");
									}
								}
							}
						}
						break;
					case 10:
						if(han_p.contains("5,9")==false){
							if(cho_p.contains("5,9")){
								possible.add("5,9");
							}else{
								possible.add("5,9");
								if(han_p.contains("4,8")==false){
									if(cho_p.contains("4,8")){
										possible.add("4,8");
									}else{
										possible.add("4,8");
									}
								}
							}
						}
						break;
					}
				}
				//
				for(int i=code_y+1;i<11;i++){
					if(han_p.contains(code_x+","+i)){
						break;
					}else if(cho_p.contains(code_x+","+i)){
						possible.add(code_x+","+i);
						break;
					}else if(han_p.contains(code_x+","+i)==false){
						possible.add(code_x+","+i);
					}
				}
				for(int i=code_y-1;i>0;i--){
					if(han_p.contains(code_x+","+i)){
						break;
					}else if(cho_p.contains(code_x+","+i)){
						possible.add(code_x+","+i);
						break;
					}else if(han_p.contains(code_x+","+i)==false){
						possible.add(code_x+","+i);
					}
				}
				for(int i=code_x+1;i<10;i++){
					if(han_p.contains(i+","+code_y)){
						break;
					}else if(cho_p.contains(i+","+code_y)){
						possible.add(i+","+code_y);
						break;
					}else if(han_p.contains(i+","+code_y)==false){
						possible.add(i+","+code_y);
					}
				}
				for(int i=code_x-1;i>0;i--){
					if(han_p.contains(i+","+code_y)){
						break;
					}else if(cho_p.contains(i+","+code_y)){
						possible.add(i+","+code_y);
						break;
					}else if(han_p.contains(i+","+code_y)==false){
						possible.add(i+","+code_y);
					}
				}
				break;
			}
		}else if(f_pick==3||f_pick==4){//포
			switch(f_camp){
			case 0://초포
				for(int i=code_x-1;i>0;i--){
					if(cho_p.contains((i+","+code_y))||han_p.contains((i+","+code_y))){
						if(cho_p.indexOf((i+","+code_y))!=3&&cho_p.indexOf((i+","+code_y))!=4&&han_p.indexOf((i+","+code_y))!=3&&han_p.indexOf((i+","+code_y))!=4){
							for(int j=i-1;j>0;j--){
								if(cho_p.contains((j+","+code_y))){
									break;
								}else if(han_p.contains((j+","+code_y))){
									if(han_p.indexOf((code_x+","+j))!=3&&han_p.indexOf((code_x+","+j))!=4){
										possible.add((j+","+code_y));
									}
									break;
								}else{
									possible.add((j+","+code_y));
								}
							}
						}
						break;
					}
				}
				for(int i=code_x+1;i<10;i++){
					if(cho_p.contains((i+","+code_y))||han_p.contains((i+","+code_y))){
						if(cho_p.indexOf((i+","+code_y))!=3&&cho_p.indexOf((i+","+code_y))!=4&&han_p.indexOf((i+","+code_y))!=3&&han_p.indexOf((i+","+code_y))!=4){
							for(int j=i+1;j<10;j++){
								if(cho_p.contains((j+","+code_y))){
									break;
								}else if(han_p.contains((j+","+code_y))){
									if(han_p.indexOf((code_x+","+j))!=3&&han_p.indexOf((code_x+","+j))!=4){
										possible.add((j+","+code_y));
									}
									break;
								}else{
									possible.add((j+","+code_y));
								}
							}
						}
						break;
					}
				}
				for(int i=code_y-1;i>0;i--){
					if(cho_p.contains((code_x+","+i))||han_p.contains((code_x+","+i))){
						if(cho_p.indexOf((code_x+","+i))!=3&&cho_p.indexOf((code_x+","+i))!=4&&han_p.indexOf((code_x+","+i))!=3&&han_p.indexOf((code_x+","+i))!=4){
							for(int j=i-1;j>0;j--){
								if(cho_p.contains((code_x+","+j))){
									break;
								}else if(han_p.contains((code_x+","+j))){
									if(han_p.indexOf((code_x+","+j))!=3&&han_p.indexOf((code_x+","+j))!=4){
										possible.add((code_x+","+j));
									}
									break;
								}else{
									possible.add((code_x+","+j));
								}
							}
						}
						break;
					}
				}
				for(int i=code_y+1;i<11;i++){
					if(cho_p.contains((code_x+","+i))||han_p.contains((code_x+","+i))){
						if(cho_p.indexOf((code_x+","+i))!=3&&cho_p.indexOf((code_x+","+i))!=4&&han_p.indexOf((code_x+","+i))!=3&&han_p.indexOf((code_x+","+i))!=4){
							for(int j=i+1;j<11;j++){
								if(cho_p.contains((code_x+","+j))){
									break;
								}else if(han_p.contains((code_x+","+j))){
									if(han_p.indexOf((code_x+","+j))!=3&&han_p.indexOf((code_x+","+j))!=4){
										possible.add((code_x+","+j));
									}
									break;
								}else{
									possible.add((code_x+","+j));
								}
							}
						}
						break;
					}
				}
				//초궁성 대각선
				if((code_x==4&&code_y==1)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(cho_p.contains("6,3")==false){
								possible.add("6,3");
							}
						}
					}
				}
				if((code_x==6&&code_y==1)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(cho_p.contains("4,3")==false){
								possible.add("4,3");
							}
						}
					}
				}
				if((code_x==4&&code_y==3)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(cho_p.contains("6,1")==false){
								possible.add("6,1");
							}
						}
					}
				}
				if((code_x==6&&code_y==3)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(cho_p.contains("4,1")==false){
								possible.add("4,1");
							}
						}
					}
				}
				//한궁성 대각선
				if((code_x==4&&code_y==8)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(cho_p.contains("6,10")==false){
								possible.add("6,10");
							}
						}
					}
				}
				if((code_x==6&&code_y==8)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(cho_p.contains("4,10")==false){
								possible.add("4,10");
							}
						}
					}
				}
				if((code_x==4&&code_y==10)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(cho_p.contains("6,8")==false){
								possible.add("6,8");
							}
						}
					}
				}
				if((code_x==6&&code_y==10)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(cho_p.contains("4,8")==false){
								possible.add("4,8");
							}
						}
					}
				}
				break;
			case 1://한포
				for(int i=code_x-1;i>0;i--){
					if(cho_p.contains((i+","+code_y))||han_p.contains((i+","+code_y))){
						if(cho_p.indexOf((i+","+code_y))!=3&&cho_p.indexOf((i+","+code_y))!=4&&han_p.indexOf((i+","+code_y))!=3&&han_p.indexOf((i+","+code_y))!=4){
							for(int j=i-1;j>0;j--){
								if(han_p.contains((j+","+code_y))){
									break;
								}else if(cho_p.contains((j+","+code_y))){
									if(cho_p.indexOf((j+","+code_y))!=3&&cho_p.indexOf((j+","+code_y))!=4){
										possible.add((j+","+code_y));
									}
									break;
								}else{
									possible.add((j+","+code_y));
								}
							}
						}
						break;
					}
				}
				for(int i=code_x+1;i<10;i++){
					if(cho_p.contains((i+","+code_y))||han_p.contains((i+","+code_y))){
						if(cho_p.indexOf((i+","+code_y))!=3&&cho_p.indexOf((i+","+code_y))!=4&&han_p.indexOf((i+","+code_y))!=3&&han_p.indexOf((i+","+code_y))!=4){
							for(int j=i+1;j<10;j++){
								if(han_p.contains((j+","+code_y))){
									break;
								}else if(cho_p.contains((j+","+code_y))){
									if(cho_p.indexOf((j+","+code_y))!=3&&cho_p.indexOf((j+","+code_y))!=4){
										possible.add((j+","+code_y));
									}
									break;
								}else{
									possible.add((j+","+code_y));
								}
							}
						}
						break;
					}
				}
				for(int i=code_y-1;i>0;i--){
					if(cho_p.contains((code_x+","+i))||han_p.contains((code_x+","+i))){
						if(cho_p.indexOf((code_x+","+i))!=3&&cho_p.indexOf((code_x+","+i))!=4&&han_p.indexOf((code_x+","+i))!=3&&han_p.indexOf((code_x+","+i))!=4){
							for(int j=i-1;j>0;j--){
								if(han_p.contains((code_x+","+j))){
									break;
								}else if(cho_p.contains((code_x+","+j))){
									if(cho_p.indexOf((code_x+","+j))!=3&&cho_p.indexOf((code_x+","+j))!=4){
										possible.add((code_x+","+j));
									}
									break;
								}else{
									possible.add((code_x+","+j));
								}
							}
						}
						break;
					}
				}
				for(int i=code_y+1;i<11;i++){
					if(cho_p.contains((code_x+","+i))||han_p.contains((code_x+","+i))){
						if(cho_p.indexOf((code_x+","+i))!=3&&cho_p.indexOf((code_x+","+i))!=4&&han_p.indexOf((code_x+","+i))!=3&&han_p.indexOf((code_x+","+i))!=4){
							for(int j=i+1;j<11;j++){
								if(han_p.contains((code_x+","+j))){
									break;
								}else if(cho_p.contains((code_x+","+j))){
									if(cho_p.indexOf((code_x+","+j))!=3&&cho_p.indexOf((code_x+","+j))!=4){
										possible.add((code_x+","+j));
									}
									break;
								}else{
									possible.add((code_x+","+j));
								}
							}
						}
						break;
					}
				}
				//초궁성 대각선
				if((code_x==4&&code_y==1)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(han_p.contains("6,3")==false){
								possible.add("6,3");
							}
						}
					}
				}
				if((code_x==6&&code_y==1)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(han_p.contains("4,3")==false){
								possible.add("4,3");
							}
						}
					}
				}
				if((code_x==4&&code_y==3)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(han_p.contains("6,1")==false){
								possible.add("6,1");
							}
						}
					}
				}
				if((code_x==6&&code_y==3)){
					if(cho_p.contains(("5,2"))||han_p.contains("5,2")){
						if(cho_p.indexOf("5,2")!=3&&cho_p.indexOf("5,2")!=4&&han_p.indexOf("5,2")!=3&&han_p.indexOf("5,2")!=3){
							if(han_p.contains("4,1")==false){
								possible.add("4,1");
							}
						}
					}
				}
				//한궁성 대각선
				if((code_x==4&&code_y==8)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(han_p.contains("6,10")==false){
								possible.add("6,10");
							}
						}
					}
				}
				if((code_x==6&&code_y==8)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(han_p.contains("4,10")==false){
								possible.add("4,10");
							}
						}
					}
				}
				if((code_x==4&&code_y==10)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(han_p.contains("6,8")==false){
								possible.add("6,8");
							}
						}
					}
				}
				if((code_x==6&&code_y==10)){
					if(cho_p.contains(("5,9"))||han_p.contains("5,9")){
						if(cho_p.indexOf("5,9")!=3&&cho_p.indexOf("5,9")!=4&&han_p.indexOf("5,9")!=3&&han_p.indexOf("5,9")!=3){
							if(han_p.contains("4,8")==false){
								possible.add("4,8");
							}
						}
					}
				}
				break;
			}
		}else if(f_pick==5||f_pick==6){//마
			switch(f_camp){
			case 0:
				if((cho_p.contains((code_x-1)+","+(code_y))==false)&&(han_p.contains((code_x-1)+","+(code_y))==false)){
					if((cho_p.contains((code_x-2)+","+(code_y-1))==false)){
						possible.add((code_x-2)+","+(code_y-1));
					}
					if((cho_p.contains((code_x-2)+","+(code_y+1))==false)){
						possible.add((code_x-2)+","+(code_y+1));
					}
				}
				if((cho_p.contains((code_x+1)+","+(code_y))==false)&&(han_p.contains((code_x+1)+","+(code_y))==false)){
					if((cho_p.contains((code_x+2)+","+(code_y-1))==false)){
						possible.add((code_x+2)+","+(code_y-1));
					}
					if((cho_p.contains((code_x+2)+","+(code_y+1))==false)){
						possible.add((code_x+2)+","+(code_y+1));
					}
				}
				if((cho_p.contains((code_x)+","+(code_y+1))==false)&&(han_p.contains((code_x)+","+(code_y+1))==false)){
					if((cho_p.contains((code_x-1)+","+(code_y+2))==false)){
						possible.add((code_x-1)+","+(code_y+2));
					}
					if((cho_p.contains((code_x+1)+","+(code_y+2))==false)){
						possible.add((code_x+1)+","+(code_y+2));
					}
				}
				if((cho_p.contains((code_x)+","+(code_y-1))==false)&&(han_p.contains((code_x)+","+(code_y-1))==false)){
					if((cho_p.contains((code_x-1)+","+(code_y-2))==false)){
						possible.add((code_x-1)+","+(code_y-2));
					}
					if((cho_p.contains((code_x+1)+","+(code_y-2))==false)){
						possible.add((code_x+1)+","+(code_y-2));
					}
				}
				break;
			case 1:
				if((cho_p.contains((code_x-1)+","+(code_y))==false)&&(han_p.contains((code_x-1)+","+(code_y))==false)){
					if((han_p.contains((code_x-2)+","+(code_y-1))==false)){
						possible.add((code_x-2)+","+(code_y-1));
					}
					if((han_p.contains((code_x-2)+","+(code_y+1))==false)){
						possible.add((code_x-2)+","+(code_y+1));
					}
				}
				if((cho_p.contains((code_x+1)+","+(code_y))==false)&&(han_p.contains((code_x+1)+","+(code_y))==false)){
					if((han_p.contains((code_x+2)+","+(code_y-1))==false)){
						possible.add((code_x+2)+","+(code_y-1));
					}
					if((han_p.contains((code_x+2)+","+(code_y+1))==false)){
						possible.add((code_x+2)+","+(code_y+1));
					}
				}
				if((cho_p.contains((code_x)+","+(code_y+1))==false)&&(han_p.contains((code_x)+","+(code_y+1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y+2))==false)){
						possible.add((code_x-1)+","+(code_y+2));
					}
					if((han_p.contains((code_x+1)+","+(code_y+2))==false)){
						possible.add((code_x+1)+","+(code_y+2));
					}
				}
				if((cho_p.contains((code_x)+","+(code_y-1))==false)&&(han_p.contains((code_x)+","+(code_y-1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y-2))==false)){
						possible.add((code_x-1)+","+(code_y-2));
					}
					if((han_p.contains((code_x+1)+","+(code_y-2))==false)){
						possible.add((code_x+1)+","+(code_y-2));
					}
				}
				break;
			}
		}else if(f_pick==7||f_pick==8){//상
			switch(f_camp){
			case 0:
				if((cho_p.contains((code_x)+","+(code_y-1))==false)&&(han_p.contains((code_x)+","+(code_y-1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y-2))==false)&&(cho_p.contains((code_x-1)+","+(code_y-2))==false)){
						if(cho_p.contains((code_x-2)+","+(code_y-3))==false){
							possible.add((code_x-2)+","+(code_y-3));
						}
					}
					if((han_p.contains((code_x+1)+","+(code_y-2))==false)&&(cho_p.contains((code_x+1)+","+(code_y-2))==false)){
						if(cho_p.contains((code_x+2)+","+(code_y-3))==false){
							possible.add((code_x+2)+","+(code_y-3));
						}
					}
				}
				if((cho_p.contains((code_x)+","+(code_y+1))==false)&&(han_p.contains((code_x)+","+(code_y+1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y+2))==false)&&(cho_p.contains((code_x-1)+","+(code_y+2))==false)){
						if(cho_p.contains((code_x-2)+","+(code_y+3))==false){
							possible.add((code_x-2)+","+(code_y+3));
						}
					}
					if((han_p.contains((code_x+1)+","+(code_y+2))==false)&&(cho_p.contains((code_x+1)+","+(code_y+2))==false)){
						if(cho_p.contains((code_x+2)+","+(code_y+3))==false){
							possible.add((code_x+2)+","+(code_y+3));
						}
					}
				}
				if((cho_p.contains((code_x+1)+","+(code_y))==false)&&(han_p.contains((code_x+1)+","+(code_y))==false)){
					if((han_p.contains((code_x+2)+","+(code_y+1))==false)&&(cho_p.contains((code_x+2)+","+(code_y+1))==false)){
						if(cho_p.contains((code_x+3)+","+(code_y+2))==false){
							possible.add((code_x+3)+","+(code_y+2));
						}
					}
					if((han_p.contains((code_x+2)+","+(code_y-1))==false)&&(cho_p.contains((code_x+2)+","+(code_y-1))==false)){
						if(cho_p.contains((code_x+3)+","+(code_y-2))==false){
							possible.add((code_x+3)+","+(code_y-2));
						}
					}
				}
				if((cho_p.contains((code_x-1)+","+(code_y))==false)&&(han_p.contains((code_x-1)+","+(code_y))==false)){
					if((han_p.contains((code_x-2)+","+(code_y+1))==false)&&(cho_p.contains((code_x-2)+","+(code_y+1))==false)){
						if(cho_p.contains((code_x-3)+","+(code_y+2))==false){
							possible.add((code_x-3)+","+(code_y+2));
						}
					}
					if((han_p.contains((code_x-2)+","+(code_y-1))==false)&&(cho_p.contains((code_x-2)+","+(code_y-1))==false)){
						if(cho_p.contains((code_x-3)+","+(code_y-2))==false){
							possible.add((code_x-3)+","+(code_y-2));
						}
					}
				}
				break;
			case 1:
				if((cho_p.contains((code_x)+","+(code_y-1))==false)&&(han_p.contains((code_x)+","+(code_y-1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y-2))==false)&&(cho_p.contains((code_x-1)+","+(code_y-2))==false)){
						if(han_p.contains((code_x-2)+","+(code_y-3))==false){
							possible.add((code_x-2)+","+(code_y-3));
						}
					}
					if((han_p.contains((code_x+1)+","+(code_y-2))==false)&&(cho_p.contains((code_x+1)+","+(code_y-2))==false)){
						if(han_p.contains((code_x+2)+","+(code_y-3))==false){
							possible.add((code_x+2)+","+(code_y-3));
						}
					}
				}
				if((cho_p.contains((code_x)+","+(code_y+1))==false)&&(han_p.contains((code_x)+","+(code_y+1))==false)){
					if((han_p.contains((code_x-1)+","+(code_y+2))==false)&&(cho_p.contains((code_x-1)+","+(code_y+2))==false)){
						if(han_p.contains((code_x-2)+","+(code_y+3))==false){
							possible.add((code_x-2)+","+(code_y+3));
						}
					}
					if((han_p.contains((code_x+1)+","+(code_y+2))==false)&&(cho_p.contains((code_x+1)+","+(code_y+2))==false)){
						if(han_p.contains((code_x+2)+","+(code_y+3))==false){
							possible.add((code_x+2)+","+(code_y+3));
						}
					}
				}
				if((cho_p.contains((code_x+1)+","+(code_y))==false)&&(han_p.contains((code_x+1)+","+(code_y))==false)){
					if((han_p.contains((code_x+2)+","+(code_y+1))==false)&&(cho_p.contains((code_x+2)+","+(code_y+1))==false)){
						if(han_p.contains((code_x+3)+","+(code_y+2))==false){
							possible.add((code_x+3)+","+(code_y+2));
						}
					}
					if((han_p.contains((code_x+2)+","+(code_y-1))==false)&&(cho_p.contains((code_x+2)+","+(code_y-1))==false)){
						if(han_p.contains((code_x+3)+","+(code_y-2))==false){
							possible.add((code_x+3)+","+(code_y-2));
						}
					}
				}
				if((cho_p.contains((code_x-1)+","+(code_y))==false)&&(han_p.contains((code_x-1)+","+(code_y))==false)){
					if((han_p.contains((code_x-2)+","+(code_y+1))==false)&&(cho_p.contains((code_x-2)+","+(code_y+1))==false)){
						if(han_p.contains((code_x-3)+","+(code_y+2))==false){
							possible.add((code_x-3)+","+(code_y+2));
						}
					}
					if((han_p.contains((code_x-2)+","+(code_y-1))==false)&&(cho_p.contains((code_x-2)+","+(code_y-1))==false)){
						if(han_p.contains((code_x-3)+","+(code_y-2))==false){
							possible.add((code_x-3)+","+(code_y-2));
						}
					}
				}
				break;
			}
		}else if(f_pick==9||f_pick==10){//사
			switch(f_camp){
			case 0:
				if(code_x==5&&code_y==2){
					for(int i=1;i<4;i++){
						for(int j=4;j<7;j++){
							if(cho_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				else if(code_x==4&&code_y==1){
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(cho_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				else if(code_x==6&&code_y==1){
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(cho_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
				}
				else if(code_x==4&&code_y==3){
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(cho_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
				}
				else if(code_x==6&&code_y==3){
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(cho_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				else{
					if(cho_p.contains((code_x-1)+","+code_y)==false){
						if((code_x-1)>3&&(code_x-1)<7&&(code_y)>0&&(code_y)<4){
							possible.add((code_x-1)+","+code_y);
						}
					}
					if(cho_p.contains(code_x+","+(code_y-1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y-1)>0&&(code_y-1)<4){
							possible.add(code_x+","+(code_y-1));
						}
					}
					if(cho_p.contains((code_x+1)+","+code_y)==false){
						if((code_x+1)>3&&(code_x+1)<7&&(code_y)>0&&(code_y)<4){
							possible.add((code_x+1)+","+code_y);
						}
					}
					if(cho_p.contains(code_x+","+(code_y+1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y+1)>0&&(code_y+1)<4){
							possible.add(code_x+","+(code_y+1));
						}
					}
				}
				break;
			case 1:
				if(code_x==5&&code_y==9){
					for(int i=8;i<11;i++){
						for(int j=4;j<7;j++){
							if(han_p.contains(j+","+i)==false){
								possible.add(j+","+i);
							}
						}
					}
				}
				else if(code_x==4&&code_y==8){
					if(han_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(han_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				else if(code_x==6&&code_y==8){
					if(han_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						possible.add(code_x+","+(code_y+1));
					}
					if(han_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
				}
				else if(code_x==4&&code_y==10){
					if(han_p.contains((code_x+1)+","+code_y)==false){
						possible.add((code_x+1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(han_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
				}
				else if(code_x==6&&code_y==10){
					if(han_p.contains((code_x-1)+","+code_y)==false){
						possible.add((code_x-1)+","+code_y);
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						possible.add(code_x+","+(code_y-1));
					}
					if(han_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				else{
					if(han_p.contains((code_x-1)+","+code_y)==false){
						if((code_x-1)>3&&(code_x-1)<7&&(code_y)>7&&(code_y)<11){
							possible.add((code_x-1)+","+code_y);
						}
					}
					if(han_p.contains(code_x+","+(code_y-1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y-1)>7&&(code_y-1)<11){
							possible.add(code_x+","+(code_y-1));
						}
					}
					if(han_p.contains((code_x+1)+","+code_y)==false){
						if((code_x+1)>3&&(code_x+1)<7&&(code_y)>7&&(code_y)<11){
							possible.add((code_x+1)+","+code_y);
						}
					}
					if(han_p.contains(code_x+","+(code_y+1))==false){
						if((code_x)>3&&(code_x)<7&&(code_y+1)>7&&(code_y+1)<11){
							possible.add(code_x+","+(code_y+1));
						}
					}
				}
				break;
			}
		}else if(f_pick>=11&&f_pick<=15){//졸or병
			switch(f_camp){
			case 0:
				if(code_x==4&&code_y==8){
					if(cho_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				if(code_x==6&&code_y==8){
					if(cho_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
				}
				if(code_x==5&&code_y==9){
					if(cho_p.contains((code_x-1)+","+(code_y+1))==false){
						possible.add((code_x-1)+","+(code_y+1));
					}
					if(cho_p.contains((code_x+1)+","+(code_y+1))==false){
						possible.add((code_x+1)+","+(code_y+1));
					}
				}
				if(cho_p.contains((code_x-1)+","+(code_y))==false){
					possible.add((code_x-1)+","+(code_y));
				}
				if(cho_p.contains((code_x+1)+","+(code_y))==false){
					possible.add((code_x+1)+","+(code_y));
				}
				if(cho_p.contains((code_x)+","+(code_y+1))==false){
					possible.add((code_x)+","+(code_y+1));
				}
				break;
			case 1:
				if(code_x==4&&code_y==3){
					if(han_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
				}
				if(code_x==6&&code_y==3){
					if(han_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				if(code_x==5&&code_y==9){
					if(han_p.contains((code_x+1)+","+(code_y-1))==false){
						possible.add((code_x+1)+","+(code_y-1));
					}
					if(han_p.contains((code_x-1)+","+(code_y-1))==false){
						possible.add((code_x-1)+","+(code_y-1));
					}
				}
				if(han_p.contains((code_x-1)+","+(code_y))==false){
					possible.add((code_x-1)+","+(code_y));
				}
				if(han_p.contains((code_x+1)+","+(code_y))==false){
					possible.add((code_x+1)+","+(code_y));
				}
				if(han_p.contains((code_x)+","+(code_y-1))==false){
					possible.add((code_x)+","+(code_y-1));
				}
				break;
			}
		}
		System.out.println(possible);
	}
	
%>
<form class="form" method="post">
	<div style="width:100%;height:850px;border:1px dashed blue;position:relative;">
	<%
		for(int i=10;i>0;i--){
			for(int j=1;j<10;j++){
				%>
				<img 
				<%
					if(possible.contains(j+","+i)){
						%>id="field-" <%
								switch(turn){
								case 1:
									if(han_p.contains(j+","+i)){
										%>onclick="location.href='../Game/insert_move.jsp?team=<%=camp%>&horse=<%=pick%>&x=<%=j%>&y=<%=i%>&turn=<%=turn%>&kill=<%=han_p.indexOf(j+","+i)%>'"<%
									}else{
										%>onclick="location.href='../Game/insert_move.jsp?team=<%=camp%>&horse=<%=pick%>&x=<%=j%>&y=<%=i%>&turn=<%=turn%>'"<%
									}
									break;
								case 2:
									if(cho_p.contains(j+","+i)){
										%>onclick="location.href='../Game/insert_move.jsp?team=<%=camp%>&horse=<%=pick%>&x=<%=j%>&y=<%=i%>&turn=<%=turn%>&kill=<%=cho_p.indexOf(j+","+i)%>'"<%
									}else{
										%>onclick="location.href='../Game/insert_move.jsp?team=<%=camp%>&horse=<%=pick%>&x=<%=j%>&y=<%=i%>&turn=<%=turn%>'"<%
									}
									break;
								}
					}else{
						%>id="field"<%
					}

					
				%>
				src="../Game/Field/<%=field_png[i][j]%>" style="height:85px!important;">
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
				%>
				<img 
					id="<%=i%><%=j%>" src="../Game/Horse/<%=horse_png[i][j] %>" alt="<%=horse_png[i][j] %>"
					<%
						if(horse_x[i][j]!=0&&horse_y[i][j]!=0){
							if(camp!=null&&pick!=null){
								if(Integer.parseInt(camp)==i&&Integer.parseInt(pick)==j){
									%>style="border:5px dashed orange;border-radius:100%;;width:8%!important;position:absolute;left:calc((<%=horse_x[i][j] %> * 11.11%) - 9.5%);bottom:calc((<%=horse_y[i][j] %> * 85px) - 85px);"<%
								}else{
									%>style="width:8%!important;position:absolute;left:calc((<%=horse_x[i][j] %> * 11.11%) - 9.5%);bottom:calc((<%=horse_y[i][j] %> * 85px) - 85px);"<%
								}
							}else{
								%>style="width:8%!important;position:absolute;left:calc((<%=horse_x[i][j] %> * 11.11%) - 9.5%);bottom:calc((<%=horse_y[i][j] %> * 85px) - 85px);"<%
							}
							switch(turn){
							case 1:
								switch(i){
								case 0:
									%> class="horse" onclick="location.href='main.jsp?step=2&camp=<%=i%>&pick=<%=j%>'"<%
									break;
								}
								break;
							case 2:
								switch(i){
								case 1:
									%> class="horse" onclick="location.href='main.jsp?step=2&camp=<%=i%>&pick=<%=j%>'"<%
									break;
								}
								break;
							}
						}
					%>
				>
				<%
			}
		}
	%>
	</div>
</form>
</body>
</html>