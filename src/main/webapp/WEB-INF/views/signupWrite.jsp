<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/signupWrite"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_leaf.png" sizes="196x196">
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/style2.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
function emailCheck01(){
	var email = $('#f_email').val();
	if(email.length == 0) return "";
	$.ajax({
		url : 'emailCheck.do',
		type : 'post',
		dataType : 'html',
		data : {
			'email' : email
		},
		success : function(htmlOut){
			$('.email_field').children('.validation').detach();
			$('.email_field').append(htmlOut);
		}
	})
}

function closeBtn(){
	$('.swal2-backdrop-show').detach();
}

function detailModal01(){
	$.ajax({
		url : 'detailModal01.do',
		type : 'post',
		dataType : 'html',
		success : function(htmlOut){
			$('.check1').parent().trigger("click");
			$('.check01').trigger("click");
			$('.container').children('.register').append(htmlOut);
		}
	})
}

function detailModal02(){
	$.ajax({
		url : 'detailModal02.do',
		type : 'post',
		dataType : 'html',
		success : function(htmlOut){
			$('.check2').parent().trigger("click");
			$('.check02').trigger("click");
			$('.container').children('.register').append(htmlOut);
		}
	})
}

function closeModal(){
	$('.modal').detach();
}

function page_move(tagNum){
    var f = document.paging; //폼 name
    f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
    f.action="tapPage.do";//이동할 페이지
    f.method="post";//POST방식
    f.submit();
}

$(function(){
	$(document).on('click', '#sign_up_btn', function(){
		var check = $('#f_password').val(); // api라면 null, 이메일 회원가입이면 값이 뭐라도 있음
		var email = $('#f_email').val();
		var tel = $('#f_tel').val();
		var nickname = $('#f_nickname').val();
		var name = $('#f_name').val();
		var birth1 = $('#f_birth1').val();
		var birth2 = $('#f_birth2').val();
		var birth3 = $('#f_birth3').val();
		var genderTmp = $('#genderCheck').val();
		var gender = "";
		if(genderTmp == 0){
			gender = "여자";
		}else if(genderTmp == 1){
			gender = "남자";
		}else{
			gender = "미선택";
		}
		var memberType = $('#member_type').val();
		
		// 생년월일 select 값 구하는 법
		// 연도 값 : $("#f_birth1").val();
		// 월 값 : $("#f_birth2").val();
		// 일 값 : $("#f_birth3").val();
		// 들어오고 아무짓 안한 상태면 null, 선택 안함 선택시 ""
		
		var emailCheck = $('#emailCheck').val();
		var passwordCheck = $('#passwordCheck').val();
		var passwordReCheck = $('#passwordReCheck').val();
		var nameCheck = $('#nameCheck').val();
		var phoneCheck = $('#phoneCheckValue').val();
		var termsCheck = $('#termsCheck').val();
		
		if(emailCheck != 1){
			$.ajax({
				url : 'emailFinalCheck.do',
				type : 'post',
				dataType : 'html',
				data : {
					'email' : email
				},
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(passwordCheck != 1 && check != null){
			$.ajax({
				url : 'passwordFinalCheck.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(passwordReCheck != 1 && check != null){
			$.ajax({
				url : 'passwordReFinalCheck.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(nameCheck != 1){
			$.ajax({
				url : 'nameFinalCheck.do',
				dataType : 'html',
				data : {
					'nameCheck' : nameCheck
				},
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(tel.length < 10){
			$.ajax({
				url : 'phoneFirstCheck.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(phoneCheck != 1){
			$.ajax({
				url : 'phoneLastCheck.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else if(termsCheck == 'false'){
			$.ajax({
				url : 'termsCheck.do',
				dataType : 'html',
				success : function(htmlOut){
					$('body').append(htmlOut);
				}
			})
			return false;
		}else{
			alert("가입 완료");
			var f = document.signupSuccess; //폼 name
		    f.email.value = email; //POST방식으로 넘기고 싶은 값
		    if(check == null){
		    	f.password.value = "";
		    }else{
		    	f.password.value = check;
		    }
		    f.name.value = name;
		    if(nickname == null){
		    	f.nickname.value = "";
		    }else{
		    	f.nickname.value = nickname;
		    }
		    if(birth1 == null || birth2 == null || birth3 == null){
		    	f.birthdayTmp.value = "0000-00-00";
		    }else{
		    	f.birthdayTmp.value = birth1 + "-" + birth2 + "-" + birth3;
		    }
		    f.phone.value = tel;
		    if(gender == null){
		    	f.gender.value = "";
		    }else{
		    	f.gender.value = gender;
		    }
		    f.memberType.value = memberType;
		    f.action="signupSuccess.do";//이동할 페이지
		    f.method="post";//POST방식
		    f.submit();	
		}
	})
	
	$(document).on('click', '#closeFinalCheck', function(){
		$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
		$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
		setTimeout(function() {
			$('.swal2-container').detach();
		}, 100);
	})
	
	$('#f_email').keyup(function(){
		$('.email_field').children('.validation').detach();
		$('.email_field').append('<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="-1">');
	})
	
	$('#f_password').keyup(function(){
		var password = $('#f_password').val().length;
		var passwordRe = $('#f_re_password').val().length;
		var passwordVal = $('#f_password').val();
		var passwordReVal = $('#f_re_password').val();
		$('.password_field').children('.validation').detach();
		if(password == 0){
			$('.password_field').append('<input type="hidden" class="validation" name="passwordCheck" id="passwordCheck" value="-1">')
		}else if(password >= 8){
			$('.password_field').append('<p data-v-5781a129="" class="validation">사용할 수 있는 비밀번호입니다.</p>')
			$('.password_field').append('<input type="hidden" class="validation" name="passwordCheck" id="passwordCheck" value="1">')
			if(passwordRe >= 8){
				$('.password_re_field').children('.validation').detach();
				if(passwordVal == passwordReVal){
					$('.password_re_field').append('<p data-v-5781a129="" class="validation">비밀번호가 일치합니다.</p>')
					$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="1">')
				}else{
					$('.password_re_field').append('<p data-v-5781a129="" class="validation error">비밀번호가 일치하지 않습니다.</p>')
					$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="0">')
				}
			}
		}else{
			$('.password_field').append('<p data-v-5781a129="" class="validation error">비밀번호를 8자 이상 입력해주세요.</p>')
			$('.password_field').append('<input type="hidden" class="validation" name="passwordCheck" id="passwordCheck" value="0">')
		}
	});
	
	$('#f_re_password').keyup(function(){
		var password = $('#f_password').val().length;
		var passwordRe = $('#f_re_password').val().length;
		var passwordStr = $('#f_password').val();
		var passwordReStr = $('#f_re_password').val();
		$('.password_re_field').children('.validation').detach();
		if(passwordRe >= password){
			if(passwordStr == passwordReStr){
				$('.password_re_field').append('<p data-v-5781a129="" class="validation">비밀번호가 일치합니다.</p>')
				$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="1">')
			}else{
				$('.password_re_field').append('<p data-v-5781a129="" class="validation error">비밀번호가 일치하지 않습니다.</p>')
				$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="0">')
			}
		}else if(passwordRe == 0){
			$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="-1">')
		}else{
			$('.password_re_field').append('<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="0">')
		}
	});
	
	$('#f_name').keyup(function(){
		var check_num = /[0-9]/; // 숫자 
		var check_eng = /[a-zA-Z]/; // 문자 
		var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
		var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		var nameCheck = $('#f_name').val();
		
		if( check_num.test(nameCheck) || check_spc.test(nameCheck) ) {
			$('.name_field').children('.validation.error').detach();
			$('.name_field').append('<p data-v-5781a129="" class="validation error">이름은 한글/영문만 입력 가능합니다.</p>')
			$('#nameCheck').val('-1');
			return false; 
		}

		var name = $('#f_name').val().length;
		$('.name_field').children('.validation').detach();
		if(name > 0){
			$('.name_field').append('<input type="hidden" class="validation" name="nameCheck" id="nameCheck" value="1">');
		}else{
			$('.name_field').append('<input type="hidden" class="validation" name="nameCheck" id="nameCheck" value="0">');
		}
	});
	
	$('.female').trigger("click");
	$('html').scrollTop(0);
	$('.male').on('click', function(){
		$('.gender_field').children('.validation').detach();
		$('.gender_field').append('<input type="hidden" class="validation" name="genderCheck" id="genderCheck" value="1">')
	});
	$('.female').on('click', function(){
		$('.gender_field').children('.validation').detach();
		$('.gender_field').append('<input type="hidden" class="validation" name="genderCheck" id="genderCheck" value="0">')
	});
	$('.xxxx').on('click', function(){
		$('.gender_field').children('.validation').detach();
		$('.gender_field').append('<input type="hidden" class="validation" name="genderCheck" id="genderCheck" value="-1">')
	});
	
	$(document).on('click', '#phoneCheck', function(){
		var tel = $('#f_tel').val();
		var check;
		$.ajax({
			url : 'phoneBeforeCheck.do',
			type : 'post',
			data : {
				'phone' : tel
			},
			success : function(data){
				if(data == "1"){
					
					$.ajax({
						url : 'phoneCheck.do',
						type : 'post',
						dataType : 'html',
						data : {
							'phone' : tel
						},
						success : function(htmlOut){
							$('.phone_check_field').children('.row').detach();
							$('.phone_check_field').children('.validation').detach();
							$('.phone_check_field').children('.form-field-group').detach();
							$('.phone_check_field').append(htmlOut);
							
							$.ajax({
								url : 'checkBox.do',
								type : 'post',
								dataType : 'html',
								success : function(htmlOut01){
									$('body').append(htmlOut01);
									
									$.ajax({
										url : 'smsCheck.do',
										type : 'post',
										data : {
											'phone' : tel
										},
										success : function(){
										}
									});
								}
							});
						}
					});
				}else{
					$.ajax({
						url : 'phoneCheckFail.do',
						type : 'post',
						dataType : 'html',
						data : {
							'phone' : tel
						},
						success : function(htmlOut){
							$('body').append(htmlOut);
						}
					});
				}
			}
		});
	});
	
	$(document).on('click', '#certificationBtn', function(){
		var certification = $('#certification').val();
		if(certification.length == 0){
			alert("인증번호를 입력해주세요.");
			return false;
		}
		$.ajax({
			url : 'certificationCheck.do',
			type : 'post',
			data : {
				'certification' : certification
			},
			success : function(data){
				if(data == "1"){
					$('.phone_check_field').children('.form-field-group').children('p.validation').detach();
					$('.phone_check_field').children('.form-field-group').append('<p data-v-5781a129="" class="validation">인증번호가 확인 되었습니다.</p>');
					$('.phone_check_field').children('input.validation').attr('value', '1');
					$('#certificationBtn').attr('disabled', 'disabled');
					$('#certificationBtn').attr('class', 'button button--disabled');
					$('#certification').attr('disabled', 'disabled');
				}else{
					$('.phone_check_field').children('.form-field-group').children('p.validation').detach();
					$('.phone_check_field').children('.form-field-group').append('<p data-v-5781a129="" class="validation error">유효한 인증번호가 아닙니다. 다시 한 번 확인해주세요</p>');
					$('.phone_check_field').children('input.validation').attr('value', '0');
				}
			}
		})
	})
	
	$('.check0').on('click', function(){
		var check = $(this).prev().children('input').val();
		var check1 = $('.check01').prev().val();
		var check2 = $('.check02').prev().val();
		if(check == 'true'){
			$(this).prev().children('input').val('false');
		}else{
			$(this).prev().children('input').val('true');
		}
		var check0 = $(this).prev().children('input').val();
		if(check0 != check1){
			$('.check01').trigger("click");
		}
		if(check0 != check2){
			$('.check02').trigger("click");
		}
	});
	
	$('.check00').on('click', function(){
		var check = $(this).prev().val();
		var check1 = $('.check01').prev().val();
		var check2 = $('.check02').prev().val();
		if(check == 'true'){
			$(this).prev().val('false');
		}else{
			$(this).prev().val('true');
		}
		var check0 = $(this).prev().val();
		if(check0 != check1){
			$('.check01').trigger("click");
		}
		if(check0 != check2){
			$('.check02').trigger("click");
		}
	});
	
	$('.check1').click(function(e){
		var check = $('.check00').prev().val();
		var check1 = $(this).prev().children('input').val();
		var check2 = $('.check02').prev().val();
		if(check1 == 'true'){
			$(this).prev().children('input').val('false');
			if(check == 'true'){
				$('.check00').trigger("click");
				$('.check02').trigger("click");
			}
		}else{
			$(this).prev().children('input').val('true');
			if(check2 == 'true'){
				if(check == 'false'){
					$('.check00').trigger("click");
				}
			}
		}
	});
	
	$('.check01').on('click', function(){
		var check = $('.check00').prev().val();
		var check1 = $(this).prev().val();
		var check2 = $('.check02').prev().val();
		if(check1 == 'true'){
			$(this).prev().val('false');
			if(check == 'true'){
				$('.check00').trigger("click");
				$('.check02').trigger("click");
			}
		}else{
			$(this).prev().val('true');
			if(check2 == 'true'){
				if(check == 'false'){
					$('.check00').trigger("click");
				}
			}
		}
	});
	
	$('.check2').on('click', function(){
		var check = $('.check00').prev().val();
		var check1 = $('.check01').prev().val();
		var check2 = $(this).prev().children('input').val();
		if(check2 == 'true'){
			$(this).prev().children('input').val('false');
			if(check == 'true'){
				$('.check00').trigger("click");
				$('.check01').trigger("click");
			}
		}else{
			$(this).prev().children('input').val('true');
			if(check1 == 'true'){
				if(check == 'false'){
					$('.check00').trigger("click");
				}
			}
		}
	});
	
	$('.check02').on('click', function(){
		var check = $('.check00').prev().val();
		var check1 = $('.check01').prev().val();
		var check2 = $(this).prev().val();
		if(check2 == 'true'){
			$(this).prev().val('false');
			if(check == 'true'){
				$('.check00').trigger("click");
				$('.check01').trigger("click");
			}
		}else{
			$(this).prev().val('true');
			if(check1 == 'true'){
				if(check == 'false'){
					$('.check00').trigger("click");
				}
			}
		}
	});
	
	$(document).on('click', '.swal2-container.swal2-center.swal2-backdrop-show', function(e){
		if (!$(e.target).hasClass("swal2-popup") && !$(e.target).hasClass("swal2-header") && !$(e.target).hasClass("swal2-content") && !$(e.target).hasClass("swal2-actions")
				&& !$(e.target).hasClass("swal2-icon") && !$(e.target).hasClass("swal2-icon-content") && !$(e.target).hasClass("swal2-html-container")) {
			$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
			$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
			setTimeout(function() {
				$('.swal2-container').detach();
			}, 100);
		}
	});
	
	$(document).on('click', '#sideEvent', function(){
		$(location).attr("href", "event.do");
	});
	
	$(document).on('click', '#sideBasket', function(){
		$(location).attr("href", "basket.do");
	})
	
	$(document).on('click', '.header__toggle-button', function(){
		$('html').attr('class', 'mode-popup');
		$.ajax({
			url : 'sideMune.do',
			dataType : 'html',
			success : function(htmlOut){
				$('#header-area').after(htmlOut);
			}
		})
	});
	$(document).on('click', '.side-nav__overlay', function(e){
		if (!$(e.target).hasClass(".side-nav__wrap")) {
			$('.side-nav').attr('class', 'side-nav side-nav-leave-active side-nav-leave-to');
			$('html').removeClass('mode-popup');
			setTimeout(function() {
				$('.side-nav').detach();
			}, 350);
		}
	});

	var lastScrollTop = 0,
    	delta = 90;
    	$(window).scroll(function(event){
    		var st = $(this).scrollTop();
    		if(Math.abs(lastScrollTop - st) <= delta) return;
    		if((st > lastScrollTop) && (lastScrollTop > 0)){
    			if(window.innerWidth > 1023){
    				$(".header").css("top","-130px");
    			}else{
    				$(".header").css("top","-50px");
    			}
    		}else{
    			$(".header").css("top","0px");
    		}
    		lastScrollTop = st;
    	});
});
</script>
</head>
<body class="" style="padding-right: 0px;">
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&"
			height="0" width="0" style="display: none; visibility: hidden"
			title="gtm"></iframe>
	</noscript>
	<div id="__nuxt">
		<div id="__layout">
			<main data-v-1739428d="" class="viewport-none-footer">
								<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<form name="paging">
						<input type="hidden" name="tagMain01" value="">
						<input type="hidden" name="itemCode01" value="">
						<input type="hidden" name="tagSub01" value="">
					</form>
					<form name="signupSuccess">
						<input type="hidden" name="email" value="">
						<input type="hidden" name="password" value="">
						<input type="hidden" name="name" value="">
						<input type="hidden" name="nickname" value="">
						<input type="hidden" name="birthdayTmp" value="">
						<input type="hidden" name="phone" value="">
						<input type="hidden" name="gender" value="">
						<input type="hidden" name="memberType" value="">
					</form>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
							
								<c:choose>
										<c:when test="${empty member.gender}">
											<a href="signup.do" data-v-30697495="">회원가입</a>
											<a data-v-30697495="" href="login.do">로그인</a>
										</c:when>
										<c:otherwise>
											<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>님</span></a>
										</c:otherwise>
									</c:choose>
								<span data-v-7aa1f9b4="">1:1문의</span> <a data-v-7aa1f9b4=""
									href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank">B2B
									신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="main.do" class="nuxt-link-active"></a>
							<!---->
						</div>
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(0);" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(200);" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(100);" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(300);" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(400);" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(500);" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(600);" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(700);" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(800);" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(1);" class="new"> 초코베리머치 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="javascript:page_move(100);" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(200);" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="javascript:page_move(300);" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(1);" class="item">초코베리머치
								</a><a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 30px; height: 30px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="basket.do" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="order.do" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
								data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 30px; height: 30px;"></a> <a data-v-7aa1f9b4=""
								href="basket.do" class="cart-logo-wrap item"><div style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_menu.PNG" alt="user-menu"
										style="width: 30px; height: 30px;">
								</button>
							</nav>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
					<input type=hidden value="${memberType }" id="member_type">
				</header>
				<!---->
				<div data-v-1739428d="" class="container">
					<article data-v-5781a129="" data-v-1739428d="" class="register">
						<header data-v-5781a129="" class="register__header">
							<h2 data-v-5781a129="">
								<img data-v-5781a129="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG"
									alt="FRESHCODE">
							</h2>
							<p data-v-5781a129="">프리미엄 샐러드 배송</p>
						</header>
							<div data-v-5781a129="" class="register__form">
								<fieldset data-v-5781a129=""
									class="form-fieldset register-section">
									<legend data-v-5781a129="">회원가입 기본정보 입력폼</legend>
									<div data-v-5781a129="" class="register-section__field-group">
										<h3 data-v-5781a129="">계정 정보</h3>
										<div data-v-5781a129=""
											class="form-field register-section__field email_field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_email" class="required">이메일(아이디)</label>
											</p>
											<c:choose>
												<c:when test="${empty member.name}">
													<div data-v-5781a129="" class="row">
														<div data-v-5781a129="" class="col">
															<input data-v-8bb17226="" data-v-5781a129="" id="f_email"
																type="email" name="f_email" placeholder="이메일 입력"
																autocorrect="off" autocapitalize="off" class="form-text">
														</div>
														<div data-v-5781a129="" class="col-4">
															<button data-v-a1c889e0="" data-v-5781a129="" type="button"
																title="" class="button" onclick="emailCheck01();">
																<span data-v-a1c889e0="" class="button__wrap">중복 확인</span>
															</button>
														</div>
													</div>
													<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="-1">
												</c:when>
												<c:otherwise>
													<div data-v-5781a129="" class="row">
														<div data-v-5781a129="" class="col">
															<input data-v-8bb17226="" data-v-5781a129="" id="f_email" value="${member.email }"
																type="email" name="f_email" placeholder="이메일 입력"
																autocorrect="off" autocapitalize="off" class="form-text" readonly>
														</div>
														<input type="hidden" class="validation" name="emailCheck" id="emailCheck" value="1">
													</div>
												</c:otherwise>
											</c:choose>
											<!---->
										</div>
										
										<c:if test="${empty member.email }">
											<div data-v-5781a129=""
												class="form-field register-section__field password_field">
												<p data-v-5781a129="" class="form-label">
													<label data-v-5781a129="" for="f_password" class="required">비밀번호</label>
												</p>
												<div data-v-5781a129="" class="form-field-group">
													<input data-v-8bb17226="" data-v-5781a129="" id="f_password"
														type="password" name="f_password"
														placeholder="비밀번호 8자 이상 입력(영문 대/소문자, 숫자포함)"
														autocorrect="off" autocapitalize="off" class="form-text">
												</div>
												<input type="hidden" class="validation" name="passwordCheck" id="passwordCheck" value="-1">
												<!---->
											</div>
											<div data-v-5781a129=""
												class="form-field register-section__field password_re_field">
												<p data-v-5781a129="" class="form-label">
													<label data-v-5781a129="" for="f_password" class="required">비밀번호
														재확인</label>
												</p>
												<div data-v-5781a129="" class="form-field-group">
													<input data-v-8bb17226="" data-v-5781a129="" type="password" id="f_re_password"
														name="f_re_password" placeholder="비밀번호 재입력"
														autocorrect="off" autocapitalize="off" class="form-text">
												</div>
												<input type="hidden" class="validation" name="passwordReCheck" id="passwordReCheck" value="-1">
												<!---->
											</div>
										</c:if>
										
										
									</div>
									<div data-v-5781a129="" class="register-section__field-group">
										<h3 data-v-5781a129="">개인 정보</h3>
										<div data-v-5781a129=""
											class="form-field register-section__field name_field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_name" class="required">이름</label>
											</p>
											<c:choose>
												<c:when test="${empty member.name}">
													<div data-v-5781a129="" class="form-field-group">
														<input data-v-8bb17226="" data-v-5781a129="" id="f_name"
															type="text" name="f_name" placeholder="이름 입력"
															autocorrect="off" autocapitalize="off" class="form-text">
													</div>
													<input type="hidden" class="validation" name="nameCheck" id="nameCheck" value="0">
												</c:when>
												<c:otherwise>
													<div data-v-5781a129="" class="form-field-group">
														<input data-v-8bb17226="" data-v-5781a129="" id="f_name" value="${member.name }"
															type="text" name="f_name" placeholder="이름 입력"
															autocorrect="off" autocapitalize="off" class="form-text" readonly>
													</div>
													<input type="hidden" class="validation" name="nameCheck" id="nameCheck" value="1">
												</c:otherwise>
											</c:choose>
											<!---->
										</div>
										<div data-v-5781a129=""
											class="form-field register-section__field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_nickname">닉네임</label>
											</p>
											<input data-v-8bb17226="" data-v-5781a129="" id="f_nickname"
												type="text" name="f_nickname"
												placeholder="닉네임 입력(미입력시 이름 자동 입력)" autocorrect="off"
												autocapitalize="off" class="form-text">
										</div>
										<div data-v-5781a129=""
											class="form-field register-section__field phone_check_field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_tel" class="required">휴대폰
													번호</label>
											</p>
											<div data-v-5781a129="" class="row">
												<div data-v-5781a129="" class="col">
													<input data-v-8bb17226="" data-v-5781a129="" id="f_tel"
														type="tel" name="f_tel" placeholder="휴대폰 번호 입력(-제외)"
														maxlength="11" autocorrect="off" autocapitalize="off"
														class="form-text">
												</div>
												<div data-v-5781a129="" class="col-4">
													<button data-v-a1c889e0="" data-v-5781a129="" type="button"
														title="" class="button" id="phoneCheck">
														<span data-v-a1c889e0="" class="button__wrap">인증 요청</span>
													</button>
												</div>
											</div>
											<input type="hidden" class="validation" name="phoneCheckValue" id="phoneCheckValue" value="0">
										</div>
										<div data-v-5781a129=""
											class="form-field register-section__field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_birth">생년월일</label>
											</p>
											<div data-v-5781a129="" class="row">
												<span data-v-615e9308="" data-v-5781a129=""
													class="form-select row--v-center"><select
													data-v-615e9308="" id="f_birth1"><option
															data-v-615e9308="" value="" disabled="disabled"
															selected="selected">YYYY</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2009">2009</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2008">2008</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2007">2007</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2006">2006</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2005">2005</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2004">2004</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2003">2003</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2002">2002</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2001">2001</option>
														<option data-v-5781a129="" data-v-615e9308="" value="2000">2000</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1999">1999</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1998">1998</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1997">1997</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1996">1996</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1995">1995</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1994">1994</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1993">1993</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1992">1992</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1991">1991</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1990">1990</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1989">1989</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1988">1988</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1987">1987</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1986">1986</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1985">1985</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1984">1984</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1983">1983</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1982">1982</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1981">1981</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1980">1980</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1979">1979</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1978">1978</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1977">1977</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1976">1976</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1975">1975</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1974">1974</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1973">1973</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1972">1972</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1971">1971</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1970">1970</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1969">1969</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1968">1968</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1967">1967</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1966">1966</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1965">1965</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1964">1964</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1963">1963</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1962">1962</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1961">1961</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1960">1960</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1959">1959</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1958">1958</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1957">1957</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1956">1956</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1955">1955</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1954">1954</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1953">1953</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1952">1952</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1951">1951</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1950">1950</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1949">1949</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1948">1948</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1947">1947</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1946">1946</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1945">1945</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1944">1944</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1943">1943</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1942">1942</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1941">1941</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1940">1940</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1939">1939</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1938">1938</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1937">1937</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1936">1936</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1935">1935</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1934">1934</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1933">1933</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1932">1932</option>
														<option data-v-5781a129="" data-v-615e9308="" value="1931">1931</option>
														<option data-v-5781a129="" data-v-615e9308="" value="">선택
															안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
														xmlns="http://www.w3.org/2000/svg">
														<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
															points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <span
													data-v-615e9308="" data-v-5781a129=""
													class="form-select row--v-center birth"><select
													data-v-615e9308="" id="f_birth2"><option
															data-v-615e9308="" value="" disabled="disabled"
															selected="selected">MM</option>
														<option data-v-5781a129="" data-v-615e9308="" value="01">1</option>
														<option data-v-5781a129="" data-v-615e9308="" value="02">2</option>
														<option data-v-5781a129="" data-v-615e9308="" value="03">3</option>
														<option data-v-5781a129="" data-v-615e9308="" value="04">4</option>
														<option data-v-5781a129="" data-v-615e9308="" value="05">5</option>
														<option data-v-5781a129="" data-v-615e9308="" value="06">6</option>
														<option data-v-5781a129="" data-v-615e9308="" value="07">7</option>
														<option data-v-5781a129="" data-v-615e9308="" value="08">8</option>
														<option data-v-5781a129="" data-v-615e9308="" value="09">9</option>
														<option data-v-5781a129="" data-v-615e9308="" value="10">10</option>
														<option data-v-5781a129="" data-v-615e9308="" value="11">11</option>
														<option data-v-5781a129="" data-v-615e9308="" value="12">12</option>
														<option data-v-5781a129="" data-v-615e9308="" value="">선택
															안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
														xmlns="http://www.w3.org/2000/svg">
														<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
															points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <span
													data-v-615e9308="" data-v-5781a129=""
													class="form-select row--v-center birth"><select
													data-v-615e9308="" id="f_birth3"><option
															data-v-615e9308="" value="" disabled="disabled"
															selected="selected">DD</option>
														<option data-v-5781a129="" data-v-615e9308="" value="01">1</option>
														<option data-v-5781a129="" data-v-615e9308="" value="02">2</option>
														<option data-v-5781a129="" data-v-615e9308="" value="03">3</option>
														<option data-v-5781a129="" data-v-615e9308="" value="04">4</option>
														<option data-v-5781a129="" data-v-615e9308="" value="05">5</option>
														<option data-v-5781a129="" data-v-615e9308="" value="06">6</option>
														<option data-v-5781a129="" data-v-615e9308="" value="07">7</option>
														<option data-v-5781a129="" data-v-615e9308="" value="08">8</option>
														<option data-v-5781a129="" data-v-615e9308="" value="09">9</option>
														<option data-v-5781a129="" data-v-615e9308="" value="10">10</option>
														<option data-v-5781a129="" data-v-615e9308="" value="11">11</option>
														<option data-v-5781a129="" data-v-615e9308="" value="12">12</option>
														<option data-v-5781a129="" data-v-615e9308="" value="13">13</option>
														<option data-v-5781a129="" data-v-615e9308="" value="14">14</option>
														<option data-v-5781a129="" data-v-615e9308="" value="15">15</option>
														<option data-v-5781a129="" data-v-615e9308="" value="16">16</option>
														<option data-v-5781a129="" data-v-615e9308="" value="17">17</option>
														<option data-v-5781a129="" data-v-615e9308="" value="18">18</option>
														<option data-v-5781a129="" data-v-615e9308="" value="19">19</option>
														<option data-v-5781a129="" data-v-615e9308="" value="20">20</option>
														<option data-v-5781a129="" data-v-615e9308="" value="21">21</option>
														<option data-v-5781a129="" data-v-615e9308="" value="22">22</option>
														<option data-v-5781a129="" data-v-615e9308="" value="23">23</option>
														<option data-v-5781a129="" data-v-615e9308="" value="24">24</option>
														<option data-v-5781a129="" data-v-615e9308="" value="25">25</option>
														<option data-v-5781a129="" data-v-615e9308="" value="26">26</option>
														<option data-v-5781a129="" data-v-615e9308="" value="27">27</option>
														<option data-v-5781a129="" data-v-615e9308="" value="28">28</option>
														<option data-v-5781a129="" data-v-615e9308="" value="29">29</option>
														<option data-v-5781a129="" data-v-615e9308="" value="30">30</option>
														<option data-v-5781a129="" data-v-615e9308="" value="31">31</option>
														<option data-v-5781a129="" data-v-615e9308="" value="">선택
															안 함</option></select> <svg data-v-615e9308="" viewBox="0 0 12 7"
														xmlns="http://www.w3.org/2000/svg">
														<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
															points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span>
											</div>
										</div>
										<div data-v-5781a129=""
											class="form-field register-section__field">
											<p data-v-5781a129="" class="form-label">
												<label data-v-5781a129="" for="f_gender">성별</label>
											</p>
											<div data-v-5781a129="" class="row gender_field">
												<label data-v-5781a129="" class="row--v-center"><label
													data-v-12d1ffd0="" data-v-5781a129="" class="form-radio female"><input
														data-v-12d1ffd0="" type="radio" name="spot-search-radio"
														value="female"> <span data-v-12d1ffd0=""><i
															data-v-12d1ffd0=""></i></span></label> <span data-v-5781a129="">여성</span></label>
												<label data-v-5781a129="" class="row--v-center"><label
													data-v-12d1ffd0="" data-v-5781a129="" class="form-radio male"><input
														data-v-12d1ffd0="" type="radio" name="spot-search-radio"
														value="male"> <span data-v-12d1ffd0=""><i
															data-v-12d1ffd0=""></i></span></label> <span data-v-5781a129="">남성</span></label>
												<label data-v-5781a129="" class="row--v-center"><label
													data-v-12d1ffd0="" data-v-5781a129="" class="form-radio xxxx"><input
														data-v-12d1ffd0="" type="radio" name="spot-search-radio"
														value=""> <span data-v-12d1ffd0=""><i
															data-v-12d1ffd0=""></i></span></label> <span data-v-5781a129="">선택
														안 함</span></label>
												<input type="hidden" class="validation" name="genderCheck" id="genderCheck" value="0">
											</div>
										</div>
									</div>
<!-- 									<div data-v-5781a129="" class="register-section__field-group"> -->
<!-- 										<h3 data-v-5781a129="">추가 정보</h3> -->
<!-- 										<div data-v-5781a129="" -->
<!-- 											class="form-field register-section__field"> -->
<!-- 											<p data-v-5781a129="" class="form-label"> -->
<!-- 												<label data-v-5781a129="">마케팅 알림 수신</label> <span -->
<!-- 													data-v-5781a129="">이메일, SMS 모두 수신 동의시 2,000원 할인 쿠폰 -->
<!-- 													지급! <span data-v-5781a129="" class="mobile">(1인 최대 1회 -->
<!-- 														지급)</span> -->
<!-- 												</span> -->
<!-- 											</p> -->
<!-- 											<div data-v-5781a129="" -->
<!-- 												class="row register-extra__body register-extra__notification"> -->
<!-- 												<label data-v-5781a129="" class="row--v-center"><label -->
<!-- 													data-v-2673f877="" data-v-5781a129="" class="form-checkbox"><input -->
<!-- 														data-v-2673f877="" type="checkbox" value="false"> <span -->
<!-- 														data-v-2673f877=""><svg data-v-2673f877="" -->
<!-- 																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"> -->
<!-- 																<path data-v-2673f877="" fill="currentColor" -->
<!-- 																	fill-rule="nonzero" -->
<!-- 																	d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label> -->
<!-- 													<span data-v-5781a129="">이메일 수신</span></label> <label -->
<!-- 													data-v-5781a129="" class="row--v-center"><label -->
<!-- 													data-v-2673f877="" data-v-5781a129="" class="form-checkbox"><input -->
<!-- 														data-v-2673f877="" type="checkbox" value="false"> <span -->
<!-- 														data-v-2673f877=""><svg data-v-2673f877="" -->
<!-- 																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"> -->
<!-- 																<path data-v-2673f877="" fill="currentColor" -->
<!-- 																	fill-rule="nonzero" -->
<!-- 																	d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label> -->
<!-- 													<span data-v-5781a129="">SMS수신</span></label> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</fieldset>
								<fieldset data-v-5781a129=""
									class="form-fieldset register-section register-section__field-group">
									<legend data-v-5781a129="">이용약관 확인폼</legend>
									<h3 data-v-5781a129="">이용 약관</h3>
									<div data-v-5781a129="" class="form-terms">
										   <label data-v-5781a129="" class="row--v-center">
										   <label data-v-2673f877="" data-v-5781a129="" class="form-checkbox"><input
												data-v-2673f877="" type="checkbox" id="termsCheck" value="false"> <span
												data-v-2673f877="" class="check00"><svg data-v-2673f877=""
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
														<path data-v-2673f877="" fill="currentColor"
															fill-rule="nonzero"
															d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
											<div data-v-5781a129="" class="check0">
												<span data-v-5781a129=""><strong data-v-5781a129="">전체
														동의</strong></span>
											</div></label>
											
											<label data-v-5781a129="" class="row--v-center"><label
											data-v-2673f877="" data-v-5781a129="" class="form-checkbox"><input
												data-v-2673f877="" type="checkbox" value="false"> <span
												data-v-2673f877="" class="check01"><svg data-v-2673f877=""
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
														<path data-v-2673f877="" fill="currentColor"
															fill-rule="nonzero"
															d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
											<div data-v-5781a129="" class="check1">
												<span data-v-5781a129="">(필수)이용약관에 동의합니다.</span> <a
													data-v-5781a129="" href='javascript:void(0);' onclick="detailModal01();">
													<small data-v-5781a129="">자세히
														보기</small></a>
											</div></label> 
											
											<label data-v-5781a129="" class="row--v-center"><label
											data-v-2673f877="" data-v-5781a129="" class="form-checkbox"><input
												data-v-2673f877="" type="checkbox" value="false"> <span
												data-v-2673f877="" class="check02"><svg data-v-2673f877=""
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
														<path data-v-2673f877="" fill="currentColor"
															fill-rule="nonzero"
															d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
											<div data-v-5781a129="" class="check2">
												<span data-v-5781a129="">(필수)개인정보처리방침에 동의합니다.</span> <a
													data-v-5781a129="" href='javascript:void(0);' onclick="detailModal02();"><small data-v-5781a129="">자세히
														보기</small></a>
											</div></label>
									</div>
								</fieldset>
								<nav data-v-5781a129="" class="register__nav">
									<button data-v-a1c889e0="" data-v-5781a129="" type="button"
										title="" class="button register_gtm button--size-large" id="sign_up_btn">
										<span data-v-a1c889e0="" class="button__wrap">가입하기</span>
									</button>
								</nav>
							</div>
						<!---->
					</article>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>