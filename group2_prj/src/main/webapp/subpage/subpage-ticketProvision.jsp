<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="scriptlet의 사용"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//검증완료
String memberId= (String)session.getAttribute("memberId");
%>  
<!DOCTYPE HTML>

<html>
	<head>
		<title>예매약관</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/navtab.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/login.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/ticket.css">
		<!-- 10-16 하지윤: 이거 어딨는거야 파일 못 찾음 -->
		<link rel="stylesheet" type="text/css" href="/static/portal/css/layout_new.css">
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<%if(memberId != null){%>
	<style>
	#nav {
	margin-left: 130px;
	}
	</style>
	<%} %>
	
		
		<style>
			#nav{
				margin-right:170px;
			}
		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

		<c:import  url="http://localhost/group2_prj/common/user_subpage_header.jsp" > 
    <c:param name="memberId" value="<%= memberId %>"></c:param> 
    </c:import>

						<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
						<div id="sut-t_wrap">
						<h2 id="sub-t">
							<strong style="opacity:1;font-family: 'Noto Sans KR', sans-serif;font-weight: 700;" class="ani">티켓구입방법</strong>
						</h2>
					</div>
					</section>

						<!--------------------------------------위까지가 헤더----------------------------------------->

				
				</section>

		
			<!-- 로그인 영역 -->
			<div id="depth_w">
				<div class="inner">
					<ul class="clrearfox dot dep1 li2">
						<li class="home">
							<span>
								<span>HOME</span>
							</span>
						</li>
						<li>
							<div class="rel">
								<a href="memberMng.html">
									<span>예매정보</span>
								</a>
								<!-- display:none -->
								<ul class="depth" >
										<li>
											<a href="#">공연정보</a>
										</li>
										<li>
											<a href="#">예매정보</a>
										</li>
										<li>
											<a href="#">고객센터</a>
										</li>
										<li>
											<a href="#">오시는길</a>
										</li>
								</ul>
							</div>
						</li>
						<li>
							<li>
									<div class="rel">
									<a href="#"><span>예매약관</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp" ><span>티켓구입방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketReceive.jsp" ><span>티켓수령방법</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketCancel.jsp" ><span>예매변경·취소안내</span></a></li>
									<li><a href="http://localhost/group2_prj/subpage/subpage-ticketProvision.jsp" ><span>예매약관</span></a></li>
									</ul>
									</div>
							</li>
						
						</li>
					</ul>
				</div>

			</div>
					<!---여기까지는 공통영역-->

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<!--내용 시작-->  
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
										<div class="inner">
											
										</div>
								
										<script>
										var loc = $("#depth_w > div > ul > li").length - 1;
										$("#depth_w .dep1").addClass("li"+loc);
								
										var len = $(".tabs-st1 li").length;
										$(".tabs-st1").addClass("li"+len);
										</script>
								
										<div class="sub_page">
										
								<article class="join_agree info_t inner">
									<h3 class="tit-st4">세종문화티켓 예매 약관</h3>
									<div class="box">
									<div class="memberEtcScr">
								<b>제1조(목적)</b><br>
								본 약관은 세종문화회관(이하 ‘세종’이라 한다)의 세종문화티켓 시스템(이하 ‘세종문화티켓’이라 한다)을 이용하여 공연 또는 전시 티켓을 예매하는 고객에게 필요한 제반 사항들을 규정함으로써 시스템 운영 및 관리의 효율성을 제고하고, 고객 편의를 증대하는 것을 목적으로 합니다.<br><br>
								 
								<b>제2조(약관의 효력)</b><br>
								① 세종은 관계 법령의 범위에서 본 약관을 개정할 수 있으며, 개정사유와 적용일자를 명시하여 현행 약관과 함께 세종의 홈페이지 초기화면이나 팝업화면에 그 적용일자 15일 전부터 적용일자 전일까지 공지합니다.<br>
								② 세종이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후(적용일 포함)에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전 약관조항이 적용됩니다. 다만, 이미 계약을 체결한 고객이 개정약관 조항의 적용을 받기를 원하는 뜻을 제1항의 개정약관 공지기간 내에 세종에 발송하여 세종의 동의를 받는 경우에는 개정약관 조항이 적용됩니다.<br>
								③ 회원은 변경된 약관에 동의하지 않을 경우 회원탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 해지 요청을 하지 않을 경우 약관의 변경사항에 동의한 것으로 간주됩니다.<br><br>
								
								<b>제3조(용어 정의)</b><br>
								본 약관에서 사용하는 용어는 다음과 같습니다.<br>
								1."예매"란 세종이 인정하는 예매 경로를 통하여 제5조에 해당하는 결제수단으로 티켓 금액이 지불 완료된 상태를 의미합니다.<br>
								2."티켓"이란 세종에서 공연 또는 전시를 관람할 수 있는 권한이 기재된 문서를 의미하며, 티켓에 명시된 공연명이나 전시명, 일시, 장소, 지정된 좌석에 한하여 그 효력이 있습니다.<br>
								3. "고객"이란 세종이 운영하는 세종문화티켓에 접속하여 이 약관에 의해 서비스를 제공받는 온라인회원, 비회원 등 세종문화티켓의 이용고객을 의미합니다. <br>
								4. "온라인회원"이란 세종 홈페이지에 가입하여 서비스를 제공받는 회원을 의미합니다.<br>
								5. "비회원"이란 회원으로 가입하지 않고 세종문화티켓을 통해 티켓을 구매한 고객을 의미합니다. <br>
								6. "기획공연"은 세종이 단독으로 기획하거나 외부 단체와 공동으로 기획하는 공연을 말하며, 순수 기획공연, 예술단공연, 공동 주최 기획공연으로 구분됩니다.<br>
								7. "대관공연"은 외부 공연기획사나 개인이 세종 공연장을 대관하여 기획하는 공연을 의미하며, 여기서의 공연의 주최는 세종이 아닌 외부 공연 기획사 또는 개인을 의미합니다.<br>
								8. "동일공연"은 2회 이상 연속되는 공연을 말하며, 공연 회차 별로 프로그램이 동일하지 않을 수 있습니다.<br>
								9. "기획전시"는 세종이 단독으로 기획하거나 외부 단체와 공동으로 기획하는 전시를 말하며, 순수 기획전시와 공동 주최 기획전시로 구분됩니다.<br>
								10."대관전시"는 외부 전시기획사나 개인이 세종 전시장을 대관하여 기획하는 전시를 의미하며, 전시의 주최는 세종이 아닌 외부 전시 기획사나 개인을 의미합니다.<br><br>
								 <!-- 150521 LHJ 개정변경(2.공연장매표소 운영시간)	//-->
								<b>제4조(티켓 예매서비스)</b><br>
								 ① 세종문화티켓은 다음의 각 호와 같은 티켓 예매서비스를 제공합니다. 
								 <br>
								  1. 인터넷∙모바일 예매 서비스 
								 <br>
								  2. 방문 예매 서비스 (세종 내 서비스플라자와 공연장 매표소) 
								 <br>
								  3. 전화 예매 서비스 (세종 콜센터) 
								 <br>
								 ② 인터넷∙모바일 예매 서비스(운영시간 24시간 연중무휴) 고객은 직접 예매 절차에 따라 해당 공연 시작 2시간 전까지 인터넷∙모바일로 예매할 수 있습니다. 
								 <br>
								 ③ 방문 예매 서비스<br>
								 1. 서비스플라자 (운영시간 10:00~20:00 연중무휴, 점심시간 13:00~14:00) 고객은 세종 2층에 위치한 서비스플라자를 직접 방문하여 티켓 예매할 수 있으며, 전화(콜센터)나 인터넷으로 예매한 티켓을 발권할 수 있습니다. 또한 세종문화티켓을 통해 티켓을 예매한 경우에 한하여 티켓 예매에 필요한 변경이나 환불 등 전반적인 업무 처리가 가능합니다.<br>
								 2. 공연장 매표소는 대극장, M씨어터, 체임버홀, S씨어터, 꿈의숲아트센터 등에 위치하고 있으며, 공연 시작 1시간 30분 전부터 인터미션까지 운영합니다. 단, 인터미션이 없는 공연은 공연시작 후 30분까지 운영하고, 고객은 공연장 매표소에서 전화나 인터넷, 모바일로 예매한 당일 공연 티켓을 발권할 수 있으며, 당일 공연의 잔여 좌석이 남아있을 경우 바로 티켓을 구매할 수 있습니다.<br>
								④ 티켓 예매서비스의 경우 기획사와 세종의 위탁판매계약에 의해 진행 되며 일부 대관공연은 주최 측의 사정에 따라 위와 같은 예매서비스가 제공 되지 않을 수 있습니다. 세종은 고객이 예매한 상품이 기술적인 오류 등의 사유로 제공할 수 없을 때에는 지체 없이 그 사유를 고객에게 통지하고 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 
								<br>
								⑤ 세종은 인터넷∙모바일 서비스 이용 중 고객의 부주의로 발생하는 공연 또는 전시 일시, 티켓 할인율 누락, 좌석 수량 및 등급 등의 오적용에 대하여 책임지지 않습니다. <br>
								⑥ 허위구매에 대한 규제<br>
								 1. 세종은 선량한 이용자의 보호를 위하여 다음에 해당하는 고객에 대하여 일정한 기간을 정하여 예매제한 또는 해당 예매 건에 대한 예매취소 조치를 취할 수 있습니다.<br>
								   - 부정한 방법을 통한 예매의 경우(예. 매크로 이용 등 비정상적인 방법을 통한 예매) <br>
								   - 반복적인 다량 구매 후 취소하는 경우(예. 재판매를 위하여 일정기간 동안 다량 구매 후 취소를 반복하는 경우) <br>
								   - 암표매매의 목적으로 구매하거나 암표매매를 이미 한 경우(예. 구매한 티켓을 세종의 판매가 보다 높은 가격을 받고 타에 판매하는 경우) <br>
								   - 기타 이에 준하는 부정한 이용으로 판단되는 경우 <br>
								 2. 상기 1호의 경우 세종은 해당 고객에게 1일 이상, 최대 5일 이내의 소명기한을 부여하며, 그 기한 내 고객으로부터 소명서를 제출할 경우 그 내용이 합당하다고 판단되면 해당 조치를 해지할 수 있습니다. <br>
								<br>
								<b>제5조(티켓 예매 시 결제 수단) </b><br>
								세종의 공연 티켓은 다음과 같은 결제 수단을 이용하여 예매할 수 있습니다. 
								<br>
								1. 가상계좌 (CMS: Cash Management Service) : 해당 공연일부터 3일 전까지 전화나 인터넷으로 예매할 수 있으며, 예매일로부터 익일 24:00까지 티켓 금액을 지정가상계좌로 입금하는 경우 예매가 완료됩니다. 입금을 하지 않을 경우 고객에게 별도의 통보 없이 예매내역이 전산으로 자동 취소됩니다. 
								<br>
								2. 신용카드 : 결제예매 개시일부터 공연시작 전까지 신용카드를 이용하여 티켓을 예매할 수 있으며, 전자금융거래법에 따라 결제가 처리됩니다. 
								<br>
								3. 현금 : 예매 개시일부터 공연 당일까지 세종 서비스플라자 및 공연장 매표소를 직접 방문하여 현금을 지불하고 티켓을 바로 구매할 수 있습니다. 
								<br>
								4. 상품권 (문예진흥원발행 상품권) : 세종이 인정하는 상품권은 세종 서비스플라자 및 공연장 매표소를 직접 방문하여 기획공연 티켓을 예매할 경우에만 사용이 가능하며, 상품권 사용 후의 차액은 해당 상품권 규정에 따라 사용잔액을 현금으로 돌려받을 수 있습니다. 
								<br>
								5. 제로페이 : 예매 개시일부터 공연당일까지 세종 서비스플라자 및 공연장 매표소를 직접 방문하여 제로페이를 이용하여 결제 가능합니다. <br>
								6. 일부 대관공연 및 공동주최 공연의 경우 주최 측의 사정으로 예매 결제수단에 제약이 따를 수 있습니다.<br>
								<br>
								<b>제6조(할인 서비스) </b><br>
								① 세종은 해당 공연별로 별도의 할인서비스를 제공하며, 모든 할인 혜택은 중복하여 적용되지 않습니다. 
								<br>
								② 전화, 인터넷, 방문 예매 시 할인율을 적용하여 예매할 수 있습니다. 예매 시 누락된 할인율은 공연시작 2시간 전까지 고객의 요구에 의해 추가 적용이 가능하며, 할인율이 소급 적용되는 과정에서 기존에 예매한 좌석이 변경될 수도 있습니다. 단, 예매일(조기예매 등)을 기준으로 적용되는 할인율은 추후 소급 적용되지 않으며, 예매과정에서 고객의 실수로 할인이 누락되어 추가 적용을 원할 경우 티켓취소 수수료 규정에 따른 수수료가 부과됩니다.<br>
								③ 세종이 제공하는 공연별 할인서비스는 다음과 같습니다.<br>
								 1. 온라인회원 할인 : 세종 온라인회원 약관에 따라 예매와 혜택을 받을 수 있습니다. <br>
								 2. 조기 예매 할인 : 일부 공연에 한하여 매표 개시일 이후 일정기간을 조기 예매기간으로 지정하여 이 기간 동안 티켓을 예매하는 고객에게 할인 혜택을 제공할 수 있습니다. 단, 조기 예매 기간이 종료된 후 예매 내용을 변경할 경우 조기 예매 할인율을 재적용 받을 수 없습니다.<br>
								 3. 패키지 티켓 할인 : 공연 주최 측이 임의로 2개 이상의 다른 공연을 선정하여, 해당 공연 티켓을 동시에 예매하는 고객에게 패키지 할인 혜택을 제공합니다. 해당 공연 중 최초 공연되는 티켓 예매 시점까지만 할인율 적용이 가능하며, 티켓 변경이나 환불은 최초 공연일 하루 전까지 가능합니다. 
								<br>
								4. 쿠폰할인 : 세종은 세종과 기획사가 정한 정책에 따라 회원에게 쿠폰을 발급할 수 있습니다. 쿠폰은 중복사용이 불가하며 사용가능한 유효기간 내 티켓 취소 시 재사용이 가능합니다. 본인 구매에만 사용할 수 있으며, 어떠한 경우에도 타인에게 매매하거나 양도 할 수 없습니다. 회원이 부당 또는 부정하게 쿠폰을 취득한 경우 회원은 쿠폰을 사용할 수 없으며, 세종은 이를 회수 할 수 있습니다.
								<br>
								 5. 학생 할인 : 학생 할인은 전화나 인터넷 예매 시 할인율을 적용하여 예매할 수 있으며, 예매 후 공연 당일 현장매표소에서 티켓 수령 시 매표 요원에게 할인 받은 수량과 할인 대상자에 해당하는 학생증을 제시해야 합니다. 학생증을 제시하지 않을 경우에는 할인 받은 만큼의 차액을 지불해야 합니다. 
								<br>
								 6. 단체 할인 : 해당 공연별로 지정된 수량 이상의 티켓을 예매하는 고객에게 단체 할인 혜택을 제공하고, 동일 공연일 경우는 전체 공연일을 기준으로 지정된 수량 이상을 예매할 경우 단체 할인율을 적용 받을 수 있으며, 단체 예매 고객이 추가로 티켓을 예매할 경우에도 할인율을 재적용 받을 수 있습니다(잔여좌석이 남아 있을 경우에만 한함). 단체로 예매한 티켓의 일부를 환불할 경우 취소하고 남은 예매 좌석 수량이 지정된 단체 수량 미만으로 될 경우 할인혜택이 전부 취소되며, 티켓 환불은 본 약관 제7조에 의거하여 처리됩니다. 
								<br>
								 7. 카드 할인 및 기타 할인 수단 : 전화나 인터넷 예매 시 카드 할인율 및 세종에서 제공하는 다양한 할인 수단들을 적용하여 예매할 수 있으며, 카드 할인은 해당 카드로 결제 시에만 할인율이 제공됩니다. 기타 할인수단으로 예매한 경우 티켓을 찾을 때 매표소 직원은 할인 수단을 증명할 수 있는 대상물을 티켓 수량에 맞춰 제출할 것을 요구 할 수 있으며, 고객은 대상물을 제출하지 않을 경우 할인 받은 만큼의 차액을 지불해야 합니다. 
								<br>
								 8. 장애인과 국가 보훈 대상자 우대 할인 
								  <br>
								   가. 장애인은 보건복지부에서 발급하는 장애인 복지카드 소지자 본인을 의미하고, 국가 보훈 대상자란 국가보훈처에서 발급 하는 국가유공자증, 독립유공자증, 광주민주유공자증, 국가유공자유족증, 소지자 본인을 의미하며, 의사상자 및 의사자 유족은 보건복지부에서 발급한 의사자 증서, 의사자 유족증, 의상자 증서 소지자 본인을 의미합니다. <br>
									나. 세종 기획공연과 전시 티켓 예매 시 다음과 같이 50% 할인혜택을 제공하며, 예매 후 공연당일 티켓을 수령하거나 공연장에 입장할 때 공연 운영요원에게 장애인 복지카드, 유공자증, 의사자 증서, 의사자 유족증, 의상자 증서를 직접 제시해야만 합니다. 본인이 제시하지 않거나 미지참시에는 할인 받은 만큼의 차액을 지불해야 합니다. 
									 <br>
										- 1급~3급에 해당하는 복지카드 소지자 본인과 동반 1인까지 50% 할인
									 <br>
									   - 4급~6급에 해당하는 복지카드 소지자 본인만 50% 할인 
									 <br>
										- 유공자증 소지자 본인과 동반 1인까지 50% 할인 
									 <br>
										- 유족증, 의상자증 소지자 본인 1인만 50%할인 (단, 국가유공자 유족 중 수권유족이 부∙모에 해당할 경우는 선순위자가 아닌 모 또는 부일 경우에도 할인 대상에 포함) 
									 <br>
										- 유공자의 배우자 본인 1인만 50% 할인 (단, 국가 보훈처에서 발급하는 가족확인서와 주민등록증을 제시할 경우에 한함) 
									 <br>
									   다. 휠체어를 사용하는 장애인일 경우는 공연장별로 마련된 휠체어석을 예매할 수 있으며, 휠체어석에는 휠체어를 사용하는 장애인과 동반자만 예매할 수 있습니다. <b><br>
									 <br>
									 제7조(티켓 변경 및 환불) </b><br>
								① 세종문화티켓에서 판매하고 있는 티켓은 다음의 각호에 따라 예매 취소 및 환불이 가능합니다. 단, 공연 주최 측의 사정에 따라 일부 대관공연은 환불 조건이 변경 될 수 있습니다. 
								<br>
								 1. 티켓 환불 및 변경
								  <br>
									가. 티켓 환불은 해당 공연일을 기준으로 10일전까지는 별도의 수수료 없이 전액 환급되며, 해당 공연일 9일 전부터 공연일 하루 전 17시까지, 환불할 티켓 금액의 10%를 수수료로 공제 후 환불이 가능합니다.<br>
								  나. 공연 당일은 환불 처리가 불가능 합니다. <br>
								 다. 예매당일 취소 시 공연일로부터 3일전까지는 취소 수수료 없이 환불이 가능하나 공연일로부터 2일전부터 1일전 17시까지는 당일 예매건의 취소라도 10%의 취소수수료가 부과됩니다.
								<br>
								② 티켓 환불은 다음의 각호에 따라 예매 시 사용한 결제 수단으로만 처리합니다. 
								<br>
								  1. 가상계좌 결제 시 : 환불수수료를 공제한 후, 예매자명의 계좌로 환불합니다. 
								<br>
								  2. 신용카드 결제 시 : 티켓 예매 시 사용했던 카드를 통하여 전액 환불하고, 환불수수료는 재승인 처리 합니다. (신용카드로 결제된 티켓을 선물 받은 고객이 개인 사정으로 인해 환불을 요청할 경우 예매 시 결제했던 신용카드를 통해서만 처리 가능) 
								<br>
								  3. 현금 결제 시 : 환불수수료를 공제한 후 바로 현금으로 환불합니다. 
								<br>
								  4. 상품권 (문예진흥원발행 상품권) 티켓 예매 시 : 사용 했던 실물 상품권으로 환불처리 되며, 환불수수료 부과건의 경우 현금으로 지불해야 합니다. 
								<br>
								  5. 제로페이 : 서비스플라자로 방문하여 취소 가능합니다. 환불수수료 부과건의 경우 현금으로 지불해야 합니다. 
								<br>
								③ 할인쿠폰이 적용된 결제 건의 경우 쿠폰할인금을 제외한 실 결제금액만 환불되며 부분취소가 제한될 수 있습니다.
								<br>
								④ 특판, 기획사판매 등으로 명시된 티켓은 티켓을 직접 예매한 단체를 통해서만 환불 처리 합니다. 
								<br>
								⑤ 고객이 예매한 티켓을 소지하고 있을 경우는 환불 마감 시간까지 세종 서비스플라자로 직접 방문하거나 우편 등의 기타 방법을 이용하여 티켓을 반납 처리해야 합니다. 
								<br>
								⑥ 티켓 분실 시에는 환불 처리가 불가능 합니다.<br>
								<br>
								<b>제8조(기타 운영) </b><br>
								① 개인 사정으로 인하여 공연 시작 시간에 늦을 경우는 티켓을 환불할 수 없으며, 공연장 입장이 제한될 수 있습니다. 
								<br>
								② 초대권과 초대교환권은 환불할 수 없습니다. 초대교환권은 티켓에 명시된 시간과 장소에서만 지정석으로 교환할 수 있고 명시된 시간 이후에는 지정석으로 교환하지 못할 수 있으며, 이 경우 공연을 관람할 수 없습니다. 
								<br>
								③ 고객이 공연 당일 공연시작까지 예매한 티켓을 찾아가지 않더라도 그 좌석에 대한 권한은 티켓을 예매한 고객에게 있으므로 세종은 해당 좌석을 별도 판매하지 않습니다. 
								<br>
								④ 현장 매표소에서 전화나 인터넷 또는 모바일을 통해 예매한 티켓을 찾을 때 매표소 직원으로부터 예약번호와 예약자명, 생년월일 등의 정보를 티켓 수령 시 요구받을 수 있습니다. 이는 구매한 고객에게 티켓을 안전하게 전달하기 위한 절차로 만약 이 정보가 정확하지 않을 경우 티켓을 교부 받지 못할 수 있으며, 세종은 이에 대한 법적인 책임을 지지 않습니다. 
								<br>
								⑤ 세종의 공연 관람 연령은 각 공연마다 상이하므로 사전 공지 된 관람연령에 해당하지 않을 경우, 티켓을 예매했더라도 공연장에 입장할 수 없습니다. 
								<br>
								⑥ 세종은 세종문화티켓 이외의 경로를 통하여 티켓을 예매한 고객에게 발생하는 손해에 대해서는 책임지지 않습니다. 
								<br>
								⑦ 본 약관이 정하지 않는 사항은 관계 법령 또는 공연장 운영 관례에 따라 처리합니다. <b><br>
								<br>
								제9조(보상 규정) </b><br>
								① 세종은 다음의 각 호에 해당할 경우 별도의 비상 운영 방침을 정하고 세종 홈페이지를 통하여 공지합니다.<br>
								 1. 국가 비상사태 또는 천재지변 등의 사유로 공연이 취소되었을 경우 
								<br>
								 2. 공연이 시작되었으나 불가항력적인 사유로 공연이 중단되었을 경우 <br>
								② 공연 주최 측의 부득이한 사정으로 공연 시작 전 공연이 취소되었을 경우 다음의 각호와 같이 티켓금액을 전액 환불합니다. 
								<br>
								 1. 티켓 예매 시 이용한 결제방법과 동일한 절차로 환불합니다. 
								<br>
								 2. 기획공연일 경우는 세종이 직접 환불 처리하며, 대관공연일 경우는 환불의 주체가 세종이 아닌 대관공연 주최 측입니다. <br>
								③ 공연 당일 공연장에서 보호자와 8세 미만의 어린이가 티켓을 예매하고 공연 관람을 요청할 경우, 해당 티켓의 환불은 다음의 각호와 같습니다. 
								<br>
								 1. 만24개월부터 미취학 어린이는 세종에서 운영하는 아이들세상에서 어린이를 돌보아 줌으로 해당 어린이 티켓만 환불 (보호자 티켓은 환불 불가) 
								<br>
								 2. 만24개월 미만의 어린이는 해당 어린이와 보호자 1인 티켓만 환불 
								<br>
								④ 공연 당일 갑작스런 주요 출연자 교체를 원인으로 현장 매표소에서 티켓 환불을 요청할 경우, 티켓 예매 시 이용한 결제방법과 동일한 절차로 전액 환불합니다. 공연을 관람하지 않았을 경우에 한하여 공연환불 처리가 가능 합니다. 
								<br>
								⑤ 세종은 공연 일시가 변경되거나 공연이 취소되었을 경우, 세종의 홈페이지를 통하여 공지합니다. <br>
								<br>
								<b>제10조(관할 법원) </b><br>
								본 서비스와 관련된 분쟁으로 소송이 제기될 경우, 세종 소재지를 관할하는 법원을 전속 관할 법원으로 합니다.<br><br>
								<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2014. 12. 31.부터 시행합니다.<br> <br>
												<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2015. 05. 20.부터 시행합니다.<br> <br>
														<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2019. 04. 17.부터 시행합니다.<br> <br>
														<b>부        칙</b>
										 <br> <br>
								제1조(시행일) 이 약관은 2020. 01. 17.부터 시행합니다.<br> <br>
														<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2020. 03. 30.부터 시행합니다.<br> <br>
														<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2020. 08. 14.부터 시행합니다.<br> <br>
														<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2021. 05. 10.부터 시행합니다.<br> <br>
																				<b>부        칙</b>
								 <br> <br>
								제1조(시행일) 이 약관은 2022. 03. 25.부터 시행합니다.<br> <br>
											</div>
									</div>
								</article>
										</div>
									</div>
								
								</div><!-- #cont -->
								




								<!-- 내용 끝 -->

							</div>
						</div>
					</div>
				</section>

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->
				<!-- Footer  -->
			<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	    <!-- End footer -->

		<!-- Scripts -->
			<script src="http://localhost/group2_prj/assets/js/jquery.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

	</body>
</html>