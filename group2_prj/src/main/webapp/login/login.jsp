<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <% //로그인되어있는 경우 메인페이지로 이동
		if(session.getAttribute("memberId") != null){
	 	response.sendRedirect("http://localhost/group2_prj/main/index.jsp"); 
} %>  
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인 | 통합회원서비스|</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="apple-touch-icon" sizes="180x180" href="http://localhost/group2_prj/static/commons/img/favicon_180.png">
        <link rel="icon" type="image/png" sizes="32x32" href="http://localhost/group2_prj/static/commons/img/favicon_32.png">
   		<link rel="icon" type="image/png" sizes="16x16" href="http://localhost/group2_prj/static/commons/img/favicon_16.png">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets/css/main.css" />
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\reset.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\subheader.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\headerFooter.css">
		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\login.css">
		<!-- popup플러그인 0923 16:06 test -->
		<script type="text/javascript" src="js\slide_me.js"></script>
		<script type="text/javascript" 
		src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
   		<link rel="stylesheet" href="http://localhost/group2_prj/assets\css\popup.css">
		<link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/sub_new.css">
  	    <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/style.css">
   	    <link rel="stylesheet" type="text/css" href="http://localhost/group2_prj/static/portal/css/layout_new.css">
		<!--google icons-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
		<!--google fonts-->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<!--제이쿼리-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

				
	<style>
     section#header{
 		 /* background-image:  url("../images/subvisual-200001.jpg"); */
  	background: url("http://localhost/group2_prj/images/subvisual-common.jpg") no-repeat ; 
  	background-size: 100%; 
  	background-attachment: fixed;
  
	}

		#nav{
			margin-right: 130px;
		}
	</style>
	</head>
	<body class="homepage is-preload">

		<div id="page-wrapper">
		<!--header-->
		<c:import url="http://localhost/group2_prj/common/user_subpage_header.jsp"/>		
		<!--header-->

		<!--❤️여기에 서브제목 입력하세욮 ex) 공연일정-->
		<div id="sut-t_wrap">
			<h2 id="sub-t">
				<strong
					style="opacity: 1; font-family: 'Noto Sans KR', sans-serif; font-weight: 700;"
					class="ani">로그인</strong>
			</h2>
		</div>
		</section>

		<!--------------------------------------위까지가 헤더----------------------------------------->	
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
									<a href="http://localhost/group2_prj/login/login.jsp" >
										<span>통합회원서비스</span>
									</a>
									<!-- display:none -->
									<ul class="depth" >
										<li>
											<a href="http://localhost/group2_prj/reservation/show_search.jsp">공연정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-ticketMethod.jsp">예매정보</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-FAQ1.jsp">고객센터</a>
										</li>
										<li>
											<a href="http://localhost/group2_prj/subpage/subpage-location.jsp">오시는길</a>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<li>
									<div class="rel">
									<a href="http://localhost/group2_prj/login/login.jsp" ><span>로그인</span></a>
									<ul class="depth">
									<li><a href="http://localhost/group2_prj/login/login.jsp" ><span>로그인</span></a></li>
									<li><a href="http://localhost/group2_prj/signUp/signup.jsp" ><span>회원가입</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_id.jsp" ><span>아이디 찾기</span></a></li>
									<li><a href="http://localhost/group2_prj/login/find_password.jsp" ><span>패스워드 찾기</span></a></li>
									
									</ul>
									</div>
								</li>
							
							</li>
						</ul>
					</div>

				</div>
		   
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
					
					
					$(function(){ //유효성검사 다시 손봐야함
						$(function(){
							$("#memberId").keydown( function(evt) {
									if( evt.which ==13 ){// 눌린키의 키코드를 which 속성으로 받을 수 있다.
										chkNull();
									}//end if
								});//keydown
								$("#pwd").keydown( function(evt) {
									if( evt.which ==13 ){// 눌린키의 키코드를 which 속성으로 받을 수 있다.
										chkNull();
									}//end if
								});//keydown
							$("#btnLogin").click(function(){
								chkNull();
								
							});//click
							});//ready
							
							function chkNull(){
								//아이디에 입력한 값을 얻는다.
								var id=$("#memberId").val();
									if(id.trim() == ""){
										alert("아이디를 입력해주세요.")
										$("#memberId").val("");//입력된 공백 아이디를 초기화한다.
									return ;
								}else{
									$("#pwd").focus();
								}//end if
								
								//아이디 특수문자 제외 영문,숫자 4~20자이내+중복검사 필수
								 if(!id.match('^[a-zA-Z0-9]{4,20}$')) {
										 alert('아이디는 특수문자를 제외한 영문, 숫자 조합 4~20자로 입력해주세요.');
										$('#memberId').focus();
										 return ;
									 }//idcheck
								
								//비밀번호에 입력한 값을 얻는다.
								var pass=$("#pwd").val();
								if( pass.trim() == ""){
									alert("비밀번호를 입력해주세요.")
									$("#pwd").val("");//입력된 공백 비밀번호를 초기화한다.
									return;
							
								}//end if
					
							 var num = pass.search(/[0-9]/);
							 var eng = pass.search(/[a-zA-Z]/);
							 var spe= pass.search(/[~!@#$%^&*()_+|<>?:{}]/); 
								//비밀번호 유효성 검사 :영문, 숫자, 특수문자 중 2종류 이상 8~12자 이내
								if(pass.length < 8 || pass.length >13){
										  alert("비밀번호를 8자리 ~ 21자리 이내로 입력해주세요.");
										  $("#password").focus();
										  return ;
									}
							 
										if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
										  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
										  $("#password").focus();
										  return;
									}
								
								//아이디와 비밀번호가 모두 입력된 후 form 태그의 action으로 설정된페이지로 요청을
								//보낸다.
								$("#memberLoginForm").submit();
								
							}//chkNull */
					
					});//ready
					</script>


							<style>
							.tabs-st1,.tabs-st2{display: none;}
							</style>
							
		
					
							 
							<article class="login inner member_com">
							<form name="memberLoginForm" id="memberLoginForm" action="http://localhost/group2_prj/login/login_process.jsp" method="post">
								<input type="hidden" name="loginFlag" value="" />
								<input type="hidden" name="menuNo" value="200100" />
								<input type="hidden" name="csrfToken" id="csrfToken" value="38394981-5565-4000-b859-9a058704f036"/>
								<ul class="clearfix half_w">
									<li class="l form_w">
										<h3 class="tit-st4">우신문화회관  회원  로그인</h3>
							
										<ul class="form f20">
											<li class="id"><label for="username" class="hide">아이디</label><input type="text" name="memberId" id="memberId" placeholder="아 이 디" autofocus /> </li>
											<li class="pw"><label for="password" class="hide">패스워드</label><input type="password" name="pwd" id="pwd" maxlength="12"autocomplete="off"   placeholder="비밀번호" /></li>
										</ul>
								
										
										<button type="button" class="bg-black btn-login f20" id="btnLogin" style="margin-left:3.5px;width:100%;">로그인</button>
									 
							
										<div class="etc">
											<span><a href="http://localhost/group2_prj/login/find_id.jsp">아이디 찾기</a></span>
											<span><a href="http://localhost/group2_prj/login/find_password.jsp">비밀번호 찾기</a></span>
											<span><a href="http://localhost/group2_prj/signUp/regisiter_agree.jsp">회원가입</a></span>
											
										</div>
									</li>
								
								</ul>
							</form>
						</article>

				<!----------------------------------------------여기서부터 끝까지 footer-------------------------------------------->

	<!-- Footer -->
	<c:import url="http://localhost/group2_prj/common/user_allPage_footer.jsp"/> 
	<!-- End footer -->
		    <!--js  -->
			<script src="http://localhost/group2_prj/assets/js/jquery.dropotron.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/browser.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/breakpoints.min.js"></script>
			<script src="http://localhost/group2_prj/assets/js/util.js"></script>
			<script src="http://localhost/group2_prj/assets/js/main.js"></script>

</body>
</html>