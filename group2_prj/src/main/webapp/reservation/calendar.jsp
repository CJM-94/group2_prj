<%@page import="kr.co.sist.vo.ScheduleShowVO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.co.sist.dao.ScheduleDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=" DB값 가져와서 Calendar 만들기 "%>
    
<!-- DB값 조회 -->
 <% 
 request.setCharacterEncoding("UTF-8");
 String showId = request.getParameter("showId");
 ScheduleDAO schDAO = ScheduleDAO.getInstance();
 //공연코드
  List<ScheduleShowVO> list = schDAO.selectSchedule(); 
  for(int i=0; i < list.size(); i++){
	
		System.out.println(list.get(i).toString()); 


  }
 %>
 
 
 <!--  
 
 
달력에서 년,월,일이 나오니까 
1. 년,월을 입력 받는 method를 작성하고 
2. 받은 년,월 을 사용해서 1일부터 마지막 날까지 조회합니다. 
3. 조회한 결과는 Map을 써도 좋고, 이차원 배열을 사용해도 좋습니다. 
  단 조회 결과는 VO에 저장되어있어야 합니다. 
Map<String,List<Vo> 이렇던가 
VO[][] voArr=new Vo[31][];으로 합니다. 

배열로 하는게 편할꺼에요. 

4. 일자별로 조회된 공연 정보를  생성해서 배열에 넣고

5. 배열을 반환합니다. 

6.jsp에서 결과를 받아 날짜를 돌릴때 방의 값을 가져와서 값이 있다면 뿌려줍니다. 

 
 
 -->
 
 <%

 
 
 
 
 %>
 
 
 
 <%
 //JSP 날짜 구하기
 
	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null) { // 넘어온 파라미터가 있으면
		year = Integer.parseInt(sy);
	}
	if(sm!=null) {
		month = Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>
 
 
 
 <!DOCTYPE HTML>

<html>
	<head>
		<title>전체일정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="/static/commons/img/favicon_180.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/static/commons/img/favicon_32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets\css\reset.css">
		<link rel="stylesheet" href="assets\css\subheader.css">
		<link rel="stylesheet" href="assets\css\headerFooter.css">
		<link rel="stylesheet" href="assets\css\login.css">

		<link rel="stylesheet" href="assets\css\calendar.css">

	 <!-- <link rel="stylesheet" type="text/css" href="/static/portal/css/sub_new.css">
   <link rel="stylesheet" type="text/css" href="/static/portal/css/style.css">
   <link rel="stylesheet" type="text/css" href="/static/portal/css/layout_new.css"> -->
		<!-- 부트스트랩 -->
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<style>
					section#header{
  /* background-image:  url("../../images/subvisual-200001.jpg"); */
 	 background: url("images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed;
 	/*  z-index: 9999;  */
  
	}
		#nav{
		
			margin-right:180px;
		}
	</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			
			<!-- Logo -->
				
			<!-- Nav -->
				<nav id="nav">
					<!-- left -->
					<ul id="header_left">
						<li class="current">
							<a href="page1.html">공연정보</a>
							<ul>
								<li><a href="page1.html">공연일정</a></li>
								<!-- <li><a href="calendar.html">일정조회</a></li> -->
								<!-- <li><a href="#">예매</a></li> -->
								<li><a href="page2.html">공연정보상세보기</a></li>
								<li><a href="page7.html">좌석배치도</a></li>
							</ul>
						</li>
						<li>
							<a href="">예매정보</a>
							<ul>
								<li><a href="subpage-ticketmethod.html">티켓구입방법</a></li>
								<li><a href="subpage-ticketreceive.html">티켓수령방법</a></li>
								<li><a href="subpage-ticketcancel.html">예매취소,변경안내</a></li>
								<li><a href="subpage-ticketprovision .html">예매약관</a></li>					
							</ul>
						</li>
						<li>
							<a href="page9.html">고객센터</a>
							<ul>
								<li><a href="page9.html">FAQ</a></li>
								<li><a href="subpage-manner.html">관람예절</a></li>				
							</ul>
						</li>
						<li><a href="subpage-way.html">오시는 길</a></li>
						
						
					</ul>

					<ul id="header_center">
						<h1 id="logo">
							<a href="index.html">
							우신문화회관
							</a>
							</h1>	
						
					</ul>

					<!--right  -->
					<ul id="header_right">
						<li class="current"><a href="login.html">LOGIN</a></li>
						<li><a href="ticket.html">티켓</a></li>
						<li class="calender">
							<a href="calendar.html">
								<span class="material-symbols-outlined md_20">
									calendar_month
									</span>
						 </a>
						</li>
						<li class="search_icon"><a href="#">
							<span class="material-symbols-outlined md_20">
								search
								</span>
						</a></li>
					</ul>
				</nav>


						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">전체일정</strong>
						</h2>
					</div>
					</section>
				</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

						<script>
							$(window).resize(function(){
								if ( $(window).width() > 1024 ){
									$("#depth_w .rel").hover(function(){
										$(this).closest("#depth_w").addClass("on")
										$(this).find(".depth").show();
									},function(){
										$(this).closest("#depth_w").removeClass("on")
										$(this).find(".depth").hide();
									})
									$("#depth_w .rel > a").focus(function(){
										$(this).closest("#depth_w").addClass("on")
										$(this).next(".depth").show();
									})
									$("#depth_w .depth > li:last-child a").focusout(function(){
										$(this).closest("#depth_w").removeClass("on")
										$("#depth_w .depth").stop(true,true).slideUp(150);
									})
								}else {
									$("#depth_w .rel").click(function(){
										$(this).closest("#depth_w").toggleClass("on")
										$(this).find(".depth").toggle();
									})
								}
							}).resize();
						</script>
					
						<div id="cont">
							<div id="sub_page">
								<div class="inner"></div>
					
								<script>
									var loc = $("#depth_w > div > ul > li").length - 1;
									$("#depth_w .dep1").addClass("li"+loc);
					
									var len = $(".tabs-st1 li").length;
									$(".tabs-st1").addClass("li"+len);
								</script>
					
								<div class="sub_page">
									<!-- 컨텐츠 내용 -->
									<div class="performanceCalendar inner">
										
					
										<p class="table-bottom-deco color-reddish-purple mobile-txt">※해당일을 클릭하면 하단에 공연/전시 목록이 표시됩니다.</p>
					
										<div class="performanceCalendar__item">
											<div class="performanceCalendar__info">
											<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">
												<button type="button" class="prev">이전달</button></a>
												<select id="calendarYear">
													<option ><%=year%>년</option>
													<option ><%=year+1%>년</option>
													<option ><%=year+2%>년</option>
												</select>
												<select id="calendarMonth">
													<option value="1"><%=month%></option>
													<option value="2"><%=month+1%></option>
													<option value="3"><%=month+2%></option>
										
												</select>
												<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">
												<button type="button" class="next">다음달</button></a>
											</div>
											<!-- ✨ -->
											<table class="performanceCalendar__table">
												<thead>
													<tr>
														<th>일</th>
														<th>월</th>
														<th>화</th>
														<th>수</th>
														<th>목</th>
														<th>금</th>
														<th>토</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														</tr>
														
			<%
			
			
			
			%>
														
														
	<%
			// 1일 앞 달
			Calendar preCal = (Calendar)cal.clone();
			preCal.add(Calendar.DATE, -(week-1));
			int preDate = preCal.get(Calendar.DATE);
			
			out.print("<tr>");
			// 1일 앞 부분
			for(int i=1; i<week; i++) {
				//out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(preDate++)+"</td>");
			}
			
			// 1일부터 말일까지 출력
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			String cls;
			for(int i=1; i<=lastDay; i++) {
				cls = year==ty && month==tm && i==td ? "today":"";
				
				out.print("<td class='"+cls+"'>"+i+"</td>");
				if(lastDay != i && (++week)%7 == 1) {
					out.print("</tr><tr>");
				}
			}
			
			// 마지막 주 마지막 일자 다음 처리
			int n = 1;
			for(int i = (week-1)%7; i<6; i++) {
				// out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(n++)+"</td>");
			}
			out.print("</tr>");
%>		
														
														
														
														
														
														
															
	<!-- 										
														<td>
															<p class="day">1</p>
															<ul class="item">
																<li class="m">
																	<a href="page2.html">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
																<li class="s"></li>
															</ul>
														</td>
														<td>
															<p class="day">2</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">3</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<td>
															<p class="day">4</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">5</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">6</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">7</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">8</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">9</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">10</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<td>
															<p class="day">11</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">12</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">13</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">14</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">15</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">16</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">17</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<td>
															<p class="day">18</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">19</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">20</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">21</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">22</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">23</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">24</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<td>
															<p class="day">25</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">26</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">27</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">28</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">29</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">30</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">31</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<td>
															<p class="day">4</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">5</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">6</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">7</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">8</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td>
															<p class="day">9</p>
															<ul class="item">
																<li class="m">
																	<a href=" ">2022 '적벽'</a>
																	<div class="itemLayer">

																	</div>
-->
																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td>
														<td></td>
														<form name="dataFrm" id="dataFrm" action=""></form>
														<input type="hidden" id="searchYear" value="2022">
														<input type="hidden" id="searchMonth" value="8">
														<input type="hidden" id="searchSMonth" value="9">

													</tr>
												</tbody>
												<script></script>
											</table>
											✨
										</div>
					
										<ul class="performanceCalendar__list"></ul>
									</div>
					
									<input type="hidden" id="searchCatePlaceData" value="1001,1002,1008,1006"/>
					
								</div>
							</div>
					
						</div>#cont

			

	

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

			<!-- Footer -->
				<section id="footer">
					<div class="footer_line"></div>
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">
								<section>
									<header>
										<h2>
											<a href="index.html">
												<img class="footer_logo" src="common\logo_white.png" alt="우신문화회관">
											</a>
										</h2>
										<div class="l">
											<address>
												재단법인 우신문화회관 서울특별시 쌍용구 우신대로 175 (우신로) (우)03172
											  <br/>
											  대표자 : 최정민 유원준 정선홍 하지윤 유설빈 사업자등록번호 : 101-12-12345
												<br/>
												통신판매업신고 : 서울쌍용-0988호
											</address>
											<p class="copyright">
												COPYRIGHT(C) WOOSHIN CENTER FOR THE PERFORMING ARTS. ALL RIGHTS RESERVED</p>
											</p>
										</div>

							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>