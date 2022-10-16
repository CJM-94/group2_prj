<%@page import="project.dao.ScheduleDAO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=" Calendar 만들기 "%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
	       <!--제이쿼리-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
        
      
        
        

        </script>
     <%
     String showId = request.getParameter("showId");
     ScheduleDAO sDAO = ScheduleDAO.getInstance();
     List<ScheduleShowVO> list = sDAO.selectSchedule(showId);
     
     
     for(int i=0; i < list.size(); i++){
    		
    		System.out.println(list.get(i).toString()); 
    		
    	}
     
     %>   
        
        
        
    <% 
  //jsp 달력 출력 문
 int year;
 int month;
 Calendar today=Calendar.getInstance();
 Calendar cal = new GregorianCalendar();
 year = (request.getParameter("year")==null) ?  today.get(Calendar.YEAR) :      Integer.parseInt(request.getParameter("year").trim()) ;
 month = (request.getParameter("month")==null) ?   today.get(Calendar.MONTH)+1:      Integer.parseInt(request.getParameter("month").trim()) ;
 if (month <= 0){
  month = 12;
   year  = ( year - 1 );
 } else if (month >= 13) {
 
   month = 1;
   year = ( year + 1 );
 }
 cal.set(Calendar.YEAR,year);
 cal.set(Calendar.MONTH,(month-1));
 cal.set(Calendar.DATE,1);
        
  
        %>
	
	
	
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
											<a href="calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)-1)%>">
												<button type="button" class="prev">이전달</button>
												</a>
												<select id="calendarYear">
													<option value="2022"><%=cal.get(Calendar.YEAR)%></option>
											
												</select>
												<select id="calendarMonth">
													<option value="1">1월</option>
													<option value="2">2월</option>
													<option value="3">3월</option>
													<option value="4">4월</option>
													<option value="5">5월</option>
													<option value="6">6월</option>
													<option value="7">7월</option>
													<option value="8">8월</option>
													<option value="9">9월</option>
													<option value="10">10월</option>
													<option value="11">11월</option>
													<option value="12">12월</option>
												</select>
												    <a href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)+1)%>'>
												<button type="button" class="next">다음달</button>
												</a>
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
												<%  
 						cal.set(year, month-1, 1);
 							int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
														%>
													<tr>
													<%
 												for (int i=1;i<dayOfWeek;i++) {
															%>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
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
																<!-- <li class="s"></li> -->
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

																<!-- </li>
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

																</li>
																<li class="ch">
																	<a href="">EOS 콰르텟 제 2회 정기연주회</a>
																	<div class="itemLayer_wap">
																		<div class="itemLayer_img"></div>
																		<div class="itemLayer_cont"></div>
																	</div>
																</li>
															</ul>
														</td> -->
														<td></td>
														<form name="dataFrm" id="dataFrm" action=""></form>
														<input type="hidden" id="searchYear" value="2022">
														<input type="hidden" id="searchMonth" value="8">
														<input type="hidden" id="searchSMonth" value="9">

													</tr>
												</tbody>
												<script></script>
											</table>
											<!-- ✨ -->
										</div>
					
										<ul class="performanceCalendar__list"></ul>
									</div>
					
									<input type="hidden" id="searchCatePlaceData" value="1001,1002,1008,1006"/>
					
								</div>
							</div>
					
						</div><!-- #cont -->

			

	

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