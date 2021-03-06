<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/paymentSingle"/>
<!DOCTYPE html>
<html class="">
<head>

<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="title" name="title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords"
	content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:title" property="og:title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description"
	property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image"
	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
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
<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style2.css?ver=1">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	function policyCheckModal(){
		$.ajax({
			url : 'paymentMyInfoPolicy.do',
			dataType : 'html',
			success : function(htmlOut){
				$('html').attr('class', 'mode-popup');
				$('.checkout').append(htmlOut);
				$('#paymentMyInfoPolicy').val(1);
			}
		})
	}
	
	$(function(){
		var finalRealPrice01 = Number(${fn:replace(vo.paymentRealFinalPrice, ',', '')});
		
		
		var currentScroll = 0;
		$('.row--v-center.same-with-order-wrap > span').trigger('click');
		
		$(document).on('click', '#closeFinalCheck', function(){
			$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
			$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
			setTimeout(function() {
				$('.swal2-container').detach();
			}, 100);
		})
		
		$(document).on('click', '.swal2-container.swal2-center.swal2-backdrop-show', function(e){
			if (!$(e.target).hasClass("swal2-popup") && !$(e.target).hasClass("swal2-header") && !$(e.target).hasClass("swal2-content") && !$(e.target).hasClass("swal2-actions")
					&& !$(e.target).hasClass("swal2-icon") && !$(e.target).hasClass("swal2-icon-content") && !$(e.target).hasClass("swal2-html-container")) {
				$('.swal2-container').attr('class', 'swal2-container swal2-center swal2-backdrop-hide');
				$('.swal2-popup').attr('swal2-popup swal2-modal swal2-icon-info swal2-hide');
				setTimeout(function() {
					$('.swal2-container').detach();
			    	$('html').attr('class', '');
			    	$('body').attr('class', '');
			    	$('noscript').removeAttr('aria-hidden');
			    	$('#__nuxt').removeAttr('aria-hidden');
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
	    	
	    	
	    // 주문자 정보와 같습니다 체크박스
	    $(document).on('click', '.row--v-center.same-with-order-wrap svg', function(){
	    	if($('#samePerson').val() == 0){
	    		$('#samePerson').val(1);
	    		$('.form-text').eq(0).val($('#memberName').val()); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val($('#memberPhone').val()); // 연락처를 입력해주세요
	    	}else{
	    		$('#samePerson').val(0);
	    		$('.form-text').eq(0).val(''); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val(''); // 연락처를 입력해주세요
	    	}
	    })
	    
	    
	    // 주문자 정보와 같습니다 문자열
	    $(document).on('click', '.row--v-center.same-with-order-wrap > span', function(){
	    	if($('#samePerson').val() == 0){
	    		$('#samePerson').val(1);
	    		$('.form-text').eq(0).val($('#memberName').val()); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val($('#memberPhone').val()); // 연락처를 입력해주세요
	    	}else{
	    		$('#samePerson').val(0);
	    		$('.form-text').eq(0).val(''); // 받는분 이름을 입력해주세요.
	    		$('.form-text').eq(1).val(''); // 연락처를 입력해주세요
	    	}
	    })
	    
	    $(document).on('click', '.checkout__items svg', function(){
	    	if($('#orderListOpenClose').val() == 1){
	    		$(this).attr('aria-labelledby', 'arrow-down-1');
	    		$('#orderListOpenClose').val(0);
	    		$('.products').css('display', 'none');
	    		$.ajax({
	    			url : 'paymentArrow.do',
	    			dataType : 'html',
	    			type : 'post',
	    			data : {
	    				'check' : 0
	    			},
	    			success : function(htmlOut){
	    				$('.checkout__items svg g').html(htmlOut);
	    			}
	    		})
	    	}else{
	    		$(this).attr('aria-labelledby', 'arrow-up-1');
	    		$('#orderListOpenClose').val(1);
	    		$('.products').css('display', '');
	    		$.ajax({
	    			url : 'paymentArrow.do',
	    			dataType : 'html',
	    			type : 'post',
	    			data : {
	    				'check' : 1
	    			},
	    			success : function(htmlOut){
	    				$('.checkout__items svg g').html(htmlOut);
	    			}
	    		})
	    	}
	    });
	    
	    
	    // 결제하기 버튼
	    $(document).on('click', '#pay-btn2', function(){
	    	// 공동현관 메모 비어있을 시 리턴
	    	if(($('.form-text').eq(2).val().length == 0 && $('#paymentDeliveryTypeCheck').val() == 0) || ($('#typeSelect option:checked').text() == '선택하기') && $('#paymentDeliveryTypeCheck').val() == 0){
	    		$('html').attr('class', 'swal2-shown swal2-height-auto');
		    	$('body').attr('class', 'swal2-shown swal2-height-auto');
		    	$('noscript').attr('aria-hidden', 'true');
		    	$('#__nuxt').attr('aria-hidden', 'true');
	    		$.ajax({
	    			url : 'paymentEnterExitType.do',
	    			dataType : 'html',
	    			success : function(htmlOut){
	    				$('body').append(htmlOut);
	    				return false;
	    			}
	    		});
	    		return false;
	    	}else if($('.form-text').eq(0).val().length == 0){
	    		alert('받는분 이름을 입력해 주세요.');
	    		return false;
	    	}else if($('.form-text').eq(1).val().length == 0){
	    		alert('받는분 연락처를 입력해 주세요.');
	    		return false;
	    	}else if($('#paymentMyInfoPolicyCheck').val() == 0){
	    		alert('개인정보 수집·이용에 동의해주세요');
	    		return false;
	    	}
	    	
			var zNum = $('.deliveryZipcodeCode').val();
			var productsName = $('#productsName').val();
			var productsNum = $('#productsNum').val();
			if($('#productsNum').val() > 0){
				productsName += ' 외 '+ (Number(productsNum) - 1) + '개';
			}
			
			$.ajax({
				url : 'getZipcode.do',
				type : 'post',
				data : {
					'deliveryZipcodeCode' : zNum
				},
				success : function(data){
// 					alert($('#productsFinalPrice').val() + ' ' + $('#memberName').val());
// 					alert($('#memberPhone').val() + ' ' + $('#productsFinalShippingAddress2').val());
// 					alert(data + ' ' + productsName);

					// 쿠폰과 포인트로인해 가격이 0원일 때
					if(Number($('#productsFinalPrice').val().replace(',', '')) == 0){
						var form = document.createElement('form'); // 폼객체 생성
			        	for(var i = 0; i < $('.itemTagMain').length; i++){
			        		 
			        		// 아이템 태그메인
			        		var payment_item_tag_main = $('.itemTagMain').eq(i).val();
			        		
			        		var objs1;
			     	        objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			     	        objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			     	        objs1.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_tag_main'); // 객체이름
			     	        objs1.setAttribute('value', payment_item_tag_main); //객체값
			     	        form.appendChild(objs1);
			     	        
			     	        
			     	        // 아이템 코드
			     	        var payment_item_code = $('.itemCode').eq(i).val();
			     	        
			     	        var objs2;
			     	        objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			     	        objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			     	        objs2.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_code'); // 객체이름
			     	        objs2.setAttribute('value', payment_item_code); //객체값
			     	        form.appendChild(objs2);
			     	        
			     	        
			     	        // 아이템 이름/사이즈
			     	        var payment_item_name_size = $('.bd.left .title').eq(i).text();
			     	        
			     	       	var objs3;
			     	      	objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			     	     	objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			     	    	objs3.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_name_size'); // 객체이름
			     	   		objs3.setAttribute('value', payment_item_name_size); //객체값
			     	        form.appendChild(objs3);
			     	   		
			     	   		// 아이템 수량
			     	   		var payment_item_quantity = $('.ItemQuantity').eq(i).val();
			     	   		
				     	   	var objs4;
				     	   	objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				     	  	objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				     	 	objs4.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_quantity'); // 객체이름
				     		objs4.setAttribute('value', payment_item_quantity); //객체값
		     	        	form.appendChild(objs4);
				     		
				     		// 아이템 가격
				     		var payment_item_price = $('.itemPrice').eq(i).val();
				     		
				     		var objs5;
				     		objs5 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				     		objs5.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				     		objs5.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_price'); // 객체이름
				     		objs5.setAttribute('value', payment_item_price); //객체값
		     	        	form.appendChild(objs5);
			        	}
			        	
			        	// 배송 예정일
			        	var payment_date = $('.date.left').text();
			        	
			        	var objs19;
			        	objs19 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs19.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs19.setAttribute('name', 'payment_date_impl'); // 객체이름
			        	objs19.setAttribute('value', payment_date); //객체값
	     	        	form.appendChild(objs19);
			        	
			        	
			        	// 사용한 쿠폰 번호
			        	var coupon_check_num = $('#couponCheckNum').val();
			        	
			        	var objs20;
			        	objs20 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs20.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs20.setAttribute('name', 'coupon_check_num'); // 객체이름
			        	objs20.setAttribute('value', coupon_check_num); //객체값
	     	        	form.appendChild(objs20);
			        	
			        	
			        	
			        	// 받는분
			        	var payment_recipient = $('.form-text').eq(0).val();
			        	
			        	var objs6;
			        	objs6 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs6.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs6.setAttribute('name', 'payment_recipient'); // 객체이름
			        	objs6.setAttribute('value', payment_recipient); //객체값
	     	        	form.appendChild(objs6);
			        	
			        	
			        	// 연락처
			        	var payment_recipient_phone = $('.form-text').eq(1).val();
			        	
			        	var objs7;
			        	objs7 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs7.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs7.setAttribute('name', 'payment_recipient_phone'); // 객체이름
			        	objs7.setAttribute('value', payment_recipient_phone); //객체값
	     	        	form.appendChild(objs7);
			        	
			        	
			        	// 배송방법
			        	var payment_delivery_type = $('#paymentDeliveryTypeCheck').val(); // 0이면 새벽배송, 1이면 택배배송
			        																	// 0이면 출입방법, 1이면 배송메모
			        	var objs8;
			        	objs8 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs8.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs8.setAttribute('name', 'payment_delivery_type'); // 객체이름
			        	objs8.setAttribute('value', payment_delivery_type); //객체값
	     	        	form.appendChild(objs8);
			        	
			        	
			        	// 배송주소 중 우편번호
			        	var payment_zipcode = data;
			        	
			        	var objs9;
			        	objs9 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs9.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs9.setAttribute('name', 'payment_zipcode'); // 객체이름
			        	objs9.setAttribute('value', payment_zipcode); //객체값
	     	        	form.appendChild(objs9);
			        	
			        	// 배송주소 중 상세주소
			        	var payment_address = $('#productsFinalShippingAddress2').val();
			        	
			        	var objs10;
			        	objs10 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs10.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs10.setAttribute('name', 'payment_address'); // 객체이름
			        	objs10.setAttribute('value', payment_address); //객체값
	     	        	form.appendChild(objs10);
			        	
			        	// 택배 : 배송 메모(새벽 : 공동 현관 비번)
			        	var payment_memo = $('.form-text').eq(2).val();
			        	
			        	var objs11;
			        	objs11 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs11.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs11.setAttribute('name', 'payment_memo'); // 객체이름
			        	objs11.setAttribute('value', payment_memo); //객체값
	     	        	form.appendChild(objs11);
			        	
			        	
			        	// 상품 금액
			        	var payment_price = $('#productsPrice').val().replace(',', '');
			        	
			        	var objs12;
			        	objs12 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs12.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs12.setAttribute('name', 'payment_price'); // 객체이름
			        	objs12.setAttribute('value', payment_price); //객체값
	     	        	form.appendChild(objs12);
			        	
			        	
			        	// 배송비
			        	var payment_delivery_price = $('#paymentFinalDeliveryPrice').val().replace(',', '');
			        	
			        	var objs13;
			        	objs13 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs13.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs13.setAttribute('name', 'payment_delivery_price'); // 객체이름
			        	objs13.setAttribute('value', payment_delivery_price); //객체값
	     	        	form.appendChild(objs13);
			        	
			        	
			        	// 합계
			        	var payment_sum_price = Number(payment_price) + Number(payment_delivery_price);
			        	
			        	var objs14;
			        	objs14 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs14.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs14.setAttribute('name', 'payment_sum_price'); // 객체이름
			        	objs14.setAttribute('value', payment_sum_price); //객체값
	     	        	form.appendChild(objs14);
			        	
			        	
			        	// 쿠폰사용
			        	var payment_coupon_price = $('#couponPrice').val().replace(',', '');
			        	
			        	var objs15;
			        	objs15 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs15.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs15.setAttribute('name', 'payment_coupon_price'); // 객체이름
			        	objs15.setAttribute('value', payment_coupon_price); //객체값
	     	        	form.appendChild(objs15);
			        	
			        	
			        	// 포인트사용
			        	var payment_point_price = $('#memberRealPoint').val();
			        	
			        	var objs16;
			        	objs16 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs16.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs16.setAttribute('name', 'payment_point_price'); // 객체이름
			        	objs16.setAttribute('value', payment_point_price); //객체값
	     	        	form.appendChild(objs16);
			        	
			        	
			        	// 상품할인
			        	var payment_sail_price = $('#paymentFinalSalePrice').val().replace(',', '');
			        	
			        	var objs17;
			        	objs17 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs17.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs17.setAttribute('name', 'payment_sail_price'); // 객체이름
			        	objs17.setAttribute('value', payment_sail_price); //객체값
	     	        	form.appendChild(objs17);
			        	
			        	
			        	// 결제 금액
			        	var payment_final_price = $('#productsFinalPrice').val().replace(',', '');
			        	
			        	var objs18;
			        	objs18 = document.createElement('input'); // 값이 들어있는 녀석의 형식
			        	objs18.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			        	objs18.setAttribute('name', 'payment_final_price'); // 객체이름
			        	objs18.setAttribute('value', payment_final_price); //객체값
	     	        	form.appendChild(objs18);
			        	
			        	
			        	
			        	form.setAttribute('method', 'post'); //get,post 가능
			            form.setAttribute('action', "paymentComplete.do"); //보내는 url
			            document.body.appendChild(form);
			            form.submit();
			            return false;
					}
					
					var IMP = window.IMP;
			        IMP.init('imp80414894');
			        IMP.request_pay({
				          pg: 'html5_inicis', 
				          pay_method: 'card',
				          merchant_uid: 'merchant_' + new Date().getTime(),
				          name: productsName,
				          //결제창에서 보여질 이름
				          amount: Number($('#productsFinalPrice').val().replace(',', '')),
				          //가격
				          buyer_email: $('#memberEmail').val(),
				          buyer_name: $('#memberName').val(),
				          buyer_tel: $('#memberPhone').val(),
				          buyer_addr: $('#productsFinalShippingAddress2').val(),
				          buyer_postcode: data
			        }, function (rsp) {
				         console.log(rsp);
				         if (rsp.success) {
				        	 // 여기부터 주문 상세에 필요한 리스트들, 값들 전부 넘기기
				        	 
				        	var form = document.createElement('form'); // 폼객체 생성
				        	for(var i = 0; i < $('.itemTagMain').length; i++){
				        		 
				        		// 아이템 태그메인
				        		var payment_item_tag_main = $('.itemTagMain').eq(i).val();
				        		
				        		var objs1;
				     	        objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				     	        objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				     	        objs1.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_tag_main'); // 객체이름
				     	        objs1.setAttribute('value', payment_item_tag_main); //객체값
				     	        form.appendChild(objs1);
				     	        
				     	        
				     	        // 아이템 코드
				     	        var payment_item_code = $('.itemCode').eq(i).val();
				     	        
				     	        var objs2;
				     	        objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				     	        objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				     	        objs2.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_code'); // 객체이름
				     	        objs2.setAttribute('value', payment_item_code); //객체값
				     	        form.appendChild(objs2);
				     	        
				     	        
				     	        // 아이템 이름/사이즈
				     	        var payment_item_name_size = $('.bd.left .title').eq(i).text();
				     	        
				     	       	var objs3;
				     	      	objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				     	     	objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				     	    	objs3.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_name_size'); // 객체이름
				     	   		objs3.setAttribute('value', payment_item_name_size); //객체값
				     	        form.appendChild(objs3);
				     	   		
				     	   		// 아이템 수량
				     	   		var payment_item_quantity = $('.ItemQuantity').eq(i).val();
				     	   		
					     	   	var objs4;
					     	   	objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
					     	  	objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
					     	 	objs4.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_quantity'); // 객체이름
					     		objs4.setAttribute('value', payment_item_quantity); //객체값
			     	        	form.appendChild(objs4);
					     		
					     		// 아이템 가격
					     		var payment_item_price = $('.itemPrice').eq(i).val();
					     		
					     		var objs5;
					     		objs5 = document.createElement('input'); // 값이 들어있는 녀석의 형식
					     		objs5.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
					     		objs5.setAttribute('name', 'paymentMyDetailInfo[' + i + '].payment_item_mapping_item_price'); // 객체이름
					     		objs5.setAttribute('value', payment_item_price); //객체값
			     	        	form.appendChild(objs5);
				        	}
				        	
				        	// 배송 예정일
				        	var payment_date = $('.date.left').text();
				        	
				        	var objs19;
				        	objs19 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs19.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs19.setAttribute('name', 'payment_date_impl'); // 객체이름
				        	objs19.setAttribute('value', payment_date); //객체값
		     	        	form.appendChild(objs19);
				        	
				        	
				        	// 사용한 쿠폰 번호
				        	var coupon_check_num = $('#couponCheckNum').val();
				        	
				        	var objs20;
				        	objs20 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs20.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs20.setAttribute('name', 'coupon_check_num'); // 객체이름
				        	objs20.setAttribute('value', coupon_check_num); //객체값
		     	        	form.appendChild(objs20);
				        	
				        	
				        	
				        	// 받는분
				        	var payment_recipient = $('.form-text').eq(0).val();
				        	
				        	var objs6;
				        	objs6 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs6.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs6.setAttribute('name', 'payment_recipient'); // 객체이름
				        	objs6.setAttribute('value', payment_recipient); //객체값
		     	        	form.appendChild(objs6);
				        	
				        	
				        	// 연락처
				        	var payment_recipient_phone = $('.form-text').eq(1).val();
				        	
				        	var objs7;
				        	objs7 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs7.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs7.setAttribute('name', 'payment_recipient_phone'); // 객체이름
				        	objs7.setAttribute('value', payment_recipient_phone); //객체값
		     	        	form.appendChild(objs7);
				        	
				        	
				        	// 배송방법
				        	var payment_delivery_type = $('#paymentDeliveryTypeCheck').val(); // 0이면 새벽배송, 1이면 택배배송
				        																	// 0이면 출입방법, 1이면 배송메모
				        	var objs8;
				        	objs8 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs8.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs8.setAttribute('name', 'payment_delivery_type'); // 객체이름
				        	objs8.setAttribute('value', payment_delivery_type); //객체값
		     	        	form.appendChild(objs8);
				        	
				        	
				        	// 배송주소 중 우편번호
				        	var payment_zipcode = data;
				        	
				        	var objs9;
				        	objs9 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs9.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs9.setAttribute('name', 'payment_zipcode'); // 객체이름
				        	objs9.setAttribute('value', payment_zipcode); //객체값
		     	        	form.appendChild(objs9);
				        	
				        	// 배송주소 중 상세주소
				        	var payment_address = $('#productsFinalShippingAddress2').val();
				        	
				        	var objs10;
				        	objs10 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs10.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs10.setAttribute('name', 'payment_address'); // 객체이름
				        	objs10.setAttribute('value', payment_address); //객체값
		     	        	form.appendChild(objs10);
				        	
				        	// 택배 : 배송 메모(새벽 : 공동 현관 비번) todo
				        	var payment_memo = $('.form-text').eq(2).val();
				        	if(payment_delivery_type == 0){
				        		payment_memo = $('#typeSelect option:checked').text() + ' (' + payment_memo + ')';
				        	}
				        	
				        	var objs11;
				        	objs11 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs11.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs11.setAttribute('name', 'payment_memo'); // 객체이름
				        	objs11.setAttribute('value', payment_memo); //객체값
		     	        	form.appendChild(objs11);
				        	
				        	
				        	// 상품 금액
				        	var payment_price = $('#productsPrice').val().replace(',', '');
				        	
				        	var objs12;
				        	objs12 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs12.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs12.setAttribute('name', 'payment_price'); // 객체이름
				        	objs12.setAttribute('value', payment_price); //객체값
		     	        	form.appendChild(objs12);
				        	
				        	
				        	// 배송비
				        	var payment_delivery_price = $('#paymentFinalDeliveryPrice').val().replace(',', '');
				        	
				        	var objs13;
				        	objs13 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs13.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs13.setAttribute('name', 'payment_delivery_price'); // 객체이름
				        	objs13.setAttribute('value', payment_delivery_price); //객체값
		     	        	form.appendChild(objs13);
				        	
				        	
				        	// 합계
				        	var payment_sum_price = Number(payment_price) + Number(payment_delivery_price);
				        	
				        	var objs14;
				        	objs14 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs14.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs14.setAttribute('name', 'payment_sum_price'); // 객체이름
				        	objs14.setAttribute('value', payment_sum_price); //객체값
		     	        	form.appendChild(objs14);
				        	
				        	
				        	// 쿠폰사용
				        	var payment_coupon_price = $('#couponPrice').val().replace(',', '');
				        	
				        	var objs15;
				        	objs15 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs15.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs15.setAttribute('name', 'payment_coupon_price'); // 객체이름
				        	objs15.setAttribute('value', payment_coupon_price); //객체값
		     	        	form.appendChild(objs15);
				        	
				        	
				        	// 포인트사용
				        	var payment_point_price = $('#memberRealPoint').val();
				        	
				        	var objs16;
				        	objs16 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs16.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs16.setAttribute('name', 'payment_point_price'); // 객체이름
				        	objs16.setAttribute('value', payment_point_price); //객체값
		     	        	form.appendChild(objs16);
				        	
				        	
				        	// 상품할인
				        	var payment_sail_price = $('#paymentFinalSalePrice').val().replace(',', '');
				        	
				        	var objs17;
				        	objs17 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs17.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs17.setAttribute('name', 'payment_sail_price'); // 객체이름
				        	objs17.setAttribute('value', payment_sail_price); //객체값
		     	        	form.appendChild(objs17);
				        	
				        	
				        	// 결제 금액
				        	var payment_final_price = $('#productsFinalPrice').val().replace(',', '');
				        	
				        	var objs18;
				        	objs18 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				        	objs18.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				        	objs18.setAttribute('name', 'payment_final_price'); // 객체이름
				        	objs18.setAttribute('value', payment_final_price); //객체값
		     	        	form.appendChild(objs18);
				        	
				        	
				        	
				        	form.setAttribute('method', 'post'); //get,post 가능
				            form.setAttribute('action', "paymentComplete.do"); //보내는 url
				            document.body.appendChild(form);
				            form.submit();
				         } else {
					          var msg = '결제에 실패하였습니다.\n';
					          msg += '에러내용 : ' + rsp.error_msg;
					          alert(msg);
				         }
				    })
				 }
			})
		});
	    
	    // 일반 체크 모달창 확인 버튼
	    $(document).on('click', '.swal2-confirm.swal2-styled', function(){
	    	$('html').attr('class', '');
	    	$('body').attr('class', '');
	    	$('noscript').removeAttr('aria-hidden');
	    	$('#__nuxt').removeAttr('aria-hidden');
	    });
	    
	    // 할인 쿠폰 버튼
	    $(document).on('click', '.coupon button', function(){
	    	$('html').attr('class', 'mode-popup');
	    	var productsFinalPrice = finalRealPrice01;
	    	var paymentDeliveryTypeCheck = $('#paymentDeliveryTypeCheck').val();
	    	var itemTagMain = [];
			var itemCode = [];
			for(var i = 0; i < $('.itemTagMain').length; i++){
				itemTagMain[i] = $('.itemTagMain').eq(i).val();
				itemCode[i] = $('.itemCode').eq(i).val();
			}
			jQuery.ajaxSettings.traditional = true; // ajax로 리스트 형식을 보내기 위한 셋팅
			
	    	$.ajax({
	    		url : 'paymentCouponModal.do',
	    		dataType : 'html',
	    		type : 'post',
	    		data : {
	    			'productsFinalPrice' : productsFinalPrice,
	    			'itemTagMain' : itemTagMain,
	    			'itemCode' : itemCode,
	    			'paymentDeliveryTypeCheck' : paymentDeliveryTypeCheck
	    		},
	    		success : function(htmlOut){
	    			$('.checkout').append(htmlOut);
	    		}
	    	});
	    });
	    
	    // 쿠폰 모달창 중 x버튼, 선택 완료 버튼, 모달창 바깥 영역 클릭 시
	    $(document).on('click', '.modal-wrap.modal-wrap--full', function(e){
	    	if(!$(e.target).hasClass("select-coupon__title") && !$(e.target).hasClass("select-coupon__bar") && !$(e.target).hasClass("except1")
	    			&& !$(e.target).hasClass("select-coupon__body") && !$(e.target).hasClass("error-list") && !$(e.target).hasClass("row")
	    			&& !$(e.target).hasClass("select-coupon-item__check") && !$(e.target).hasClass("form-checkbox") && !$(e.target).hasClass("col")
	    			&& !$(e.target).hasClass("select-coupon-item__title") && !$(e.target).hasClass("select-coupon-item__description") && !$(e.target).hasClass("select-coupon-item__price") && !$(e.target).hasClass("select-coupon-item__date")
	    			&& !$(e.target).hasClass("row--v-center")){
	    		$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
	    		$('html').attr('class', '');
				$('html').scrollTop($('.checkout__delivery.checkout-column__delivery').offset().top);
				if($('#paymentMyInfoPolicy').val() == 1){
					$('html').scrollTop($('.checkout__result').offset().top);
					$('#paymentMyInfoPolicy').val(0);
				}
	    		setTimeout(function() {
					$('.modal.modal-leave-active.modal-leave-to').detach();
				}, 400);
	    	}
	    })
	    
	    
	    // 개인정보 수집 동의 문자열 클릭
	    $(document).on('click', '.row--v-center.checkout__agree .col-check', function(){
	    	if($('#paymentMyInfoPolicyCheck').val() == 0){
	    		$('#paymentMyInfoPolicyCheck').val(1);
	    	}else{
	    		$('#paymentMyInfoPolicyCheck').val(0);
	    	}
	    })
	    
	    // 개인정보 수집 동의 체크박스
	    $(document).on('click', '.row--v-center.checkout__agree svg', function(){
	    	if($('#paymentMyInfoPolicyCheck').val() == 0){
	    		$('#paymentMyInfoPolicyCheck').val(1);
	    	}else{
	    		$('#paymentMyInfoPolicyCheck').val(0);
	    	}
	    })
	    
	    
	    // 쿠폰 선택 시
	    $(document).on('click', '.row.select-coupon-item input:odd', function(){
	    	if($(this).val() == 'false'){
	    		$(this).val('true');
	    		
	    		for(var i = 0; i < $(this).closest('li').siblings('li').length; i++){
	    			if($(this).closest('li').siblings('li').eq(i).find('input').eq(1).val() == 'true'){
	    				$(this).closest('li').siblings('li').eq(i).children('label').trigger('click');
	    				$(this).closest('li').siblings('li').eq(i).find('input').eq(1).val('false');
	    			}
	    		}
	    			
	    	}else{
	    		$(this).val('false');
	    	}
	    })
	    
	    
	    // 쿠폰 선택 완료 버튼
	    $(document).on('click', '.select-coupon__nav .button__wrap', function(){
	    	var check = 0;
			for(var i = 0; i < $('.select-coupon__body').find('li').length; i++){
				if($('.select-coupon__body').find('li').eq(i).find('input').eq(1).val() == 'true'){
					check++;
				}
			}
			
			if(check == 0){
				$.ajax({
					url : 'paymentCouponEmptyCheck.do',
					dataType : 'html',
					success : function(htmlOut){
						$('body').append(htmlOut);
					}
				})
				return false;
			}
			
			var pointAmount = $('.point__input input').val();
	    	
	    	for(var i = 0; i < $('.select-coupon__body').find('li').length; i++){
    			if($('.select-coupon__body').find('li').eq(i).find('input').eq(1).val() == 'true'){
    				var couponNum = $('.select-coupon__body').find('li').eq(i).find('input').eq(0).val();
    				var realSale = $('.select-coupon__body').find('li').eq(i).find('em').text();
    				
    				// 일단 쿠폰 버튼 문자열을 couponNum 데이터를 통해 바꾸고, 
    				// 한번더 에이작스 써서 계산하고 총 금액, 쿠폰 할인금액 수정.
    				$.ajax({
    					url : 'paymentSingleCouponState.do',
    					type : 'post',
    					dataType : 'html',
    					data : {
    						'couponNum' : couponNum,
    						'realSale' : realSale
    					},
    					success : function(htmlOut){
    						$('.coupon').find('.col.coupon__not-use').detach();
    						$('.coupon').find('.col.coupon__use').detach();
    						$('.coupon').find('.row--v-center').prepend(htmlOut);
    						
    						var productsFinalPrice = Number(finalRealPrice01) - Number(pointAmount);
    						$.ajax({
    							url : 'paymentSingleCouponSaleCal.do',
    	    					type : 'post',
    	    					data : {
    	    						'couponNum' : couponNum,
    	    						'realSale' : realSale,
    	    						'productsFinalPrice' : productsFinalPrice
    	    					},
    	    					success : function(data){
    	    						// 컨트롤러에서 계산해서 총 금액 가져오기.
    	    						var arr = data.split(':');
    	    						$('.row--v-end.row--h-between').find('b').text(Number(arr[0]).toLocaleString('en') + ' 원');
    	    						$('#productsFinalPrice').val(Number(arr[0]).toLocaleString('en'));
    	    						$('.row--v-center.row--h-between.coupon').find('em').text('- ' + Number(arr[1]).toLocaleString('en'));
    	    						$('#couponPrice').val(Number(arr[1]).toLocaleString('en'));
    	    						$('#couponCheckNum').val(couponNum);
    	    						
    	    						var usePoint = $('#memberRealPoint').val();
    	    				    	var useCoupon = $('#couponPrice').val().replace(',', '');
    	    				        if(Number(finalRealPrice01) - Number(usePoint) - Number(useCoupon) < 0){
    	    				    		var remainPrice = Number(finalRealPrice01) - Number(useCoupon);
    	    				    		$('#memberRealPoint').val(remainPrice);
    	    					        $('.row--v-center.row--h-between.point01').find('em').text('- ' + Number(remainPrice).toLocaleString('en'));
    	    					        $('.point__input').children('input').val(remainPrice);
    	    					        var finalRealPrice02 = Number(finalRealPrice01) - Number(useCoupon) - Number(remainPrice);
    	    					        $('.row--v-end.row--h-between').find('b').text(Number(finalRealPrice02).toLocaleString('en') + ' 원');
    	    					        $('#productsFinalPrice').val(Number(finalRealPrice02).toLocaleString('en'));
    	    				    	}
    	    					}
    						})
    					}
    				})
    			}
    		}
	    	
	    })
	    
	    
	    // 쿠폰 선택 안하고 버튼 클릭시 확인 모달창
	    $(document).on('click', '.coupon-ok', function(){
	    	$.ajax({
	    		url : 'paymentCouponReturn.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.coupon').find('.col.coupon__not-use').detach();
					$('.coupon').find('.col.coupon__use').detach();
					$('.coupon').find('.row--v-center').prepend(htmlOut);
	    		}
	    	});
	    	
	    	var pointAmount = $('.point__input input').val();
	    	var productsFinalPrice = Number(finalRealPrice01) - Number(pointAmount);
	    	
	    	$('.row--v-end.row--h-between').find('b').text(Number(productsFinalPrice).toLocaleString('en') + ' 원');
			$('#productsFinalPrice').val(Number(productsFinalPrice).toLocaleString('en'));
			$('.row--v-center.row--h-between.coupon').find('em').text('0');
			$('#couponPrice').val('0');
			$('#couponCheckNum').val('0');
			
			$('.modal').attr('class', 'modal modal-leave-active modal-leave-to');
    		$('html').attr('class', '');
			$('html').scrollTop($('.checkout__delivery.checkout-column__delivery').offset().top);
    		setTimeout(function() {
				$('.modal.modal-leave-active.modal-leave-to').detach();
			}, 400);
	    })
	    
	    $(document).on("propertychange change keyup paste input", '.point__input input', function() {
	    	var oldVal = $('#memberPoint').val();
	        var currentVal = $(this).val();
	        if(Number(oldVal) < Number(currentVal)){
	        	currentVal = oldVal;
	        	$(this).val(currentVal);
	        }else if(Number(currentVal) < 0){
	        	currentVal = 0;
	        	$(this).val(0);
	        }
	        
	        var finalRealPrice02 = Number(finalRealPrice01) - Number($('#couponPrice').val().replace(',', '')) - Number(currentVal);
	        $('.row--v-end.row--h-between').find('b').text(Number(finalRealPrice02).toLocaleString('en') + ' 원');
	        $('#productsFinalPrice').val(Number(finalRealPrice02).toLocaleString('en'));
	        $('#memberRealPoint').val(currentVal);
	        $('.row--v-center.row--h-between.point01').find('em').text('- ' + Number(currentVal).toLocaleString('en'));
	        
	        var usePoint = $('#memberRealPoint').val();
	    	var useCoupon = $('#couponPrice').val().replace(',', '');
	        if(Number(finalRealPrice01) - Number(usePoint) - Number(useCoupon) < 0){
	    		var remainPrice = Number(finalRealPrice01) - Number(useCoupon);
	    		$('#memberRealPoint').val(remainPrice);
		        $('.row--v-center.row--h-between.point01').find('em').text('- ' + Number(remainPrice).toLocaleString('en'));
		        $('.point__input').children('input').val(remainPrice);
		        var finalRealPrice021 = Number(finalRealPrice01) - Number(useCoupon) - Number(remainPrice);
		        $('.row--v-end.row--h-between').find('b').text(Number(finalRealPrice021).toLocaleString('en') + ' 원');
		        $('#productsFinalPrice').val(Number(finalRealPrice021).toLocaleString('en'));
	    	}
	    });
	    
	    $(document).on('click', '.button.button--side-padding.button--size-small.point-all', function(){
	    	var oldVal = $('#memberPoint').val();
	    	$('.point__input').children('input').val(oldVal);
	    	
	    	var finalRealPrice02 = Number(finalRealPrice01) - Number($('#couponPrice').val().replace(',', '')) - Number(oldVal);
	        $('.row--v-end.row--h-between').find('b').text(Number(finalRealPrice02).toLocaleString('en') + ' 원');
	        $('#productsFinalPrice').val(Number(finalRealPrice02).toLocaleString('en'));
	        $('#memberRealPoint').val(oldVal);
	        $('.row--v-center.row--h-between.point01').find('em').text('- ' + Number(oldVal).toLocaleString('en'));
	        
	        var usePoint = $('#memberRealPoint').val();
	    	var useCoupon = $('#couponPrice').val().replace(',', '');
	    	if(Number(finalRealPrice01) - Number(usePoint) - Number(useCoupon) < 0){
	    		var remainPrice = Number(finalRealPrice01) - Number(useCoupon);
	    		$('#memberRealPoint').val(remainPrice);
		        $('.row--v-center.row--h-between.point01').find('em').text('- ' + Number(remainPrice).toLocaleString('en'));
		        $('.point__input').children('input').val(remainPrice);
		        var finalRealPrice02 = Number(finalRealPrice01) - Number(useCoupon) - Number(remainPrice);
		        $('.row--v-end.row--h-between').find('b').text(Number(finalRealPrice02).toLocaleString('en') + ' 원');
		        $('#productsFinalPrice').val(Number(finalRealPrice02).toLocaleString('en'));
	    	}
	    })
	})
</script>
<style>	
a[data-v-7aa1f9b44]{
    position: left;
    bottom: 20px;
    right: 20px;
    width: 150px;
    height: 50px;
    opacity: .9;
    background-image: url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_Delivery-on-Header.gif);
    background-repeat: no-repeat;
    background-size: 150px;
    background-position: 100%;
}

</style>	
</head>
<body class="">
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
					<input type="hidden" value="${member.name }" id="memberName">
					<input type="hidden" value="${member.email }" id="memberEmail">
					<input type="hidden" value="${member.phone }" id="memberPhone">
					<input type="hidden" value="${list[0].paymentItem }" id="productsName"> 
					<input type="hidden" value="${fn:length(list)}" id="productsNum">
					<input type="hidden" value="${vo.paymentDeliveryTypeCheck }" id="paymentDeliveryTypeCheck"> <!-- 배송방법 0, 1 -->
					<input type="hidden" value="${vo.paymentFinalDeliveryPrice }" id="paymentFinalDeliveryPrice"> <!-- 배송방법 0, 1 -->
					<input type="hidden" value="${vo.paymentFinalPrice }" id="productsPrice"> <!-- 상품 금액 -->
					<input type="hidden" value="${vo.paymentRealFinalPrice }" id="productsFinalPrice"> <!-- 최종 결제 금액 -->
					<input type="hidden" value="${vo.paymentFinalSalePrice }" id="paymentFinalSalePrice"> <!-- 상품 할인 금액 (콤마있음) -->
					<input type="hidden" value="${vo.paymentShippingAddress1 }" id="productsFinalShippingAddress1"> <!-- 집코드 -->
					<input type="hidden" value="${vo.paymentShippingAddress2 }" id="productsFinalShippingAddress2"> <!-- 상세 주소 -->
					<input type="hidden" value="0" id="couponPrice"> <!-- 쿠폰 할인 가격. 콤마 있음 -->
					<input type="hidden" value="0" id="couponCheckNum"> <!-- 선택한 쿠폰 코드 -->
					<input type="hidden" value="${point.payment_point }" id="memberPoint"> <!-- 사용 가능 포인트.  todo -->
					<input type="hidden" value="0" id="memberRealPoint"> <!-- 사용 포인트.  todo -->
					<input type="hidden" value="1" id="samePerson">
					<input type="hidden" value="1" id="orderListOpenClose">
					<input type="hidden" value="0" id="paymentMyInfoPolicyCheck">
					<input type="hidden" value="0" id="paymentMyInfoPolicy">
					<div class="hidden-div" style="display:none">
					<!-- 쿠폰 조건을 걸기 위한 태그메인, 아이템 코드 -->
						<c:forEach var="list1" items="${list }">
							<input type="hidden" value="${list1.paymentTagMain }" class="itemTagMain">
							<input type="hidden" value="${list1.paymentItemCode }" class="itemCode">
							<input type="hidden" value="${list1.paymentItemQuantity }" class="ItemQuantity">
							<input type="hidden" value="${fn:replace(list1.paymentPrice , ',', '') }" class="itemPrice">
						</c:forEach>
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b44="" href="#" class="header__top-left"></a>
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
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(600);" class="item">세트상품 </a>
									<a data-v-7aa1f9b4="" href="event.do" class="item">이벤트 </a>
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
				</header>
				<!---->
				<div data-v-1739428d="" class="container">
					<div data-v-8f2f8136="" data-v-1739428d=""
						class="checkout-container">
						<article data-v-8f2f8136="" class="checkout">
							<div data-v-8f2f8136="" class="checkout__header">
								<h2 data-v-8f2f8136="" class="header">주문/결제하기</h2>
							</div>
							<div data-v-8f2f8136="">
								<section data-v-8f2f8136="" class="checkout__items">
									<header data-v-8f2f8136="" class="row--v-center">
										<h3 data-v-8f2f8136="" class="col checkout__section-title">주문상품정보</h3>
										<button data-v-8f2f8136="" type="button">
											<span data-v-8f2f8136="" class="row--v-center"><svg
													data-v-8f2f8136="" xmlns="http://www.w3.org/2000/svg"
													width="24" height="24" viewBox="0 0 24 24"
													aria-labelledby="arrow-up-1" role="presentation"
													class="icon" style="width: 20px; height: 15px;">
													<g fill="none" fill-rule="evenodd"> <path
														fill="currentColor" fill-rule="nonzero"
														d="M3.455 16.362a.5.5 0 0 1-.69-.724l8.946-8.5a.5.5 0 0 1 .689 0l8.944 8.5a.5.5 0 0 1-.688.724l-8.6-8.172-8.601 8.172z"></path></g></svg></span>
										</button>
									</header>
									<!---->
									<div data-v-8f2f8136="" class="products">
										<ul data-v-8f2f8136="">
											<li data-v-8f2f8136="">
												<div data-v-8f2f8136="" class="products-delivery-date-wrap">
													<div data-v-8f2f8136="" class="products-delivery-date-left">수령일</div>
													<div data-v-8f2f8136=""
														class="products-delivery-date-right">${vo.paymentDeliveryDate }</div>
												</div>
												<ul data-v-8f2f8136="" class="items">
													<c:forEach var="list1" items="${list }">
														<li data-v-8f2f8136="" class="row">
															<div data-v-8f2f8136="" class="col info">
																<strong data-v-8f2f8136="">${list1.paymentItem }</strong>
																<span data-v-8f2f8136="">일회용품(포크+물티슈) - ${list1.paymentDisposable }</span>
															</div>
															<div data-v-8f2f8136="" class="count">
																<em data-v-8f2f8136="">${list1.paymentItemQuantity }</em>개
															</div>
															<div data-v-8f2f8136="" class="price">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</div>
														</li>
													</c:forEach>
												</ul>
											</li>
										</ul>
										<table data-v-8f2f8136="">
											<colgroup data-v-8f2f8136="">
												<col data-v-8f2f8136="" width="100px">
												<col data-v-8f2f8136="" width="270px">
												<col data-v-8f2f8136="" width="45px">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
												<col data-v-8f2f8136="" width="*">
											</colgroup>
											<thead data-v-8f2f8136="">
												<tr data-v-8f2f8136="">
													<th data-v-8f2f8136="" scope="col">수령일</th>
													<th data-v-8f2f8136="" scope="col">주문상품</th>
													<th data-v-8f2f8136="" scope="col">수량</th>
													<th data-v-8f2f8136="" scope="col" class="right">가격</th>
													<th data-v-8f2f8136="" scope="col" class="right">할인금액
													</th>
													<th data-v-8f2f8136="" scope="col" class="right">배송비</th>
													<th data-v-8f2f8136="" scope="col" class="right">결제예상금액</th>
												</tr>
											</thead>
											<tbody data-v-8f2f8136="">
												<c:forEach var="list1" items="${list }" varStatus="i">
													<c:if test="${i.index == 0 }">
														<tr data-v-8f2f8136="">
															<td data-v-8f2f8136="" rowspan="${fn:length(list)}" class="date left">${vo.paymentDeliveryDate }</td>
															<td data-v-8f2f8136="" class="bd left">
																<strong data-v-8f2f8136="" class="title">${list1.paymentItem }</strong>
																<div data-v-8f2f8136="" class="option">일회용품(포크+물티슈) ${list1.paymentDisposable }</div>
															</td>
															<td data-v-8f2f8136="" class="qry">${list1.paymentItemQuantity }</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">- ${list1.paymentSalePrice }</em>원
															</td>
															<td data-v-8f2f8136="" rowspan="2" class="price right">
																<em data-v-8f2f8136="">${vo.paymentDeliveryPrice }</em>원
															</td>
															<td data-v-8f2f8136="" rowspan="2" class="price-total right">${vo.paymentPredictionPrice }원</td>
														</tr>
													</c:if>
													<c:if test="${i.index > 0 }">
														<tr data-v-8f2f8136="">
															<!---->
															<td data-v-8f2f8136="" class="bd left">
																<strong data-v-8f2f8136="" class="title">${list1.paymentItem }</strong>
																<div data-v-8f2f8136="" class="option">일회용품(포크+물티슈) ${list1.paymentDisposable }</div>
															</td>
															<td data-v-8f2f8136="" class="qry">${list1.paymentItemQuantity }</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">${list1.paymentPrice }</em>원
															</td>
															<td data-v-8f2f8136="" class="price right">
																<em data-v-8f2f8136="">- ${list1.paymentSalePrice }</em>원
															</td>
														</tr>
													</c:if>
												</c:forEach>
												
											</tbody>
										</table>
									</div>
								</section>
								<section data-v-8f2f8136="" class="checkout__person">
									<div data-v-8f2f8136="" class="wrap">
										<div data-v-8f2f8136="" class="buyer">
											<h3 data-v-8f2f8136="" class="checkout__section-title">주문자
												정보</h3>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">보내는 분</dt>
												<dd data-v-8f2f8136="" class="col">${member.name }</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">이메일</dt>
												<dd data-v-8f2f8136="" class="col">${member.email }</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row--v-center">
												<dt data-v-8f2f8136="">연락처</dt>
												<dd data-v-8f2f8136="" class="col">${member.phone }</dd>
											</dl>
										</div>
										<div data-v-8f2f8136="" class="receiver">
											<header data-v-8f2f8136=""
												class="row--v-center row--h-between">
												<h3 data-v-8f2f8136="" class="checkout__section-title">받는
													사람 정보</h3>
											</header>
											<div data-v-8f2f8136="">
												<fieldset data-v-8f2f8136="" class="form-fieldset">
													<legend data-v-8f2f8136="">받는 사람 정보 입력 폼</legend>
													<input data-v-8bb17226="" data-v-8f2f8136="" id="xx"
														type="text" name="xx" placeholder="받는분 이름을 입력해주세요"
														maxlength="50" autocorrect="off" autocapitalize="off"
														class="form-text" value="${member.name }"
														style="height: 47px; margin-bottom: 10px;"> <input
														data-v-8bb17226="" data-v-8f2f8136="" id="yy" type="tel" value="${member.phone }"
														name="yy" placeholder="연락처를 입력해주세요" minlength="9"
														maxlength="12" autocorrect="off" autocapitalize="off"
														class="form-text" style="height: 47px;">
												</fieldset>
												<label data-v-8f2f8136=""
													class="row--v-center same-with-order-wrap"><label
													data-v-2673f877="" data-v-8f2f8136="" class="form-checkbox"><input
														data-v-2673f877="" type="checkbox" value="false">
														<span data-v-2673f877=""><svg data-v-2673f877=""
																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
																<path data-v-2673f877="" fill="currentColor"
																	fill-rule="nonzero"
																	d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
													<span data-v-8f2f8136="">주문자 정보와 같습니다.</span></label>
											</div>
										</div>
									</div>
								</section>
								<section data-v-8f2f8136=""
									class="checkout__delivery checkout-column__delivery">
									<header data-v-8f2f8136="">
										<h3 data-v-8f2f8136="" class="checkout__section-title">배송정보</h3>
										<span data-v-8f2f8136="" class="time-info">주문 변경 및 취소는
											<b style="font-weight: normal; color: #35ad73;">수령일 하루 전
												오후 3시까지 가능</b>
										</span>
										<div data-v-8f2f8136="" class="delivery">
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송 방법</dt>
												<dd data-v-8f2f8136="" class="col">${vo.paymentDeliveryType }</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송 예정일</dt>
												<dd data-v-8f2f8136="" class="col">
													<b data-v-8f2f8136="">${vo.paymentPredictionDate }</b>
													<div data-v-8f2f8136="" class="detail-address">${vo.paymentPredictionDateSummary }</div>
												</dd>
											</dl>
											<dl data-v-8f2f8136="" class="row">
												<dt data-v-8f2f8136="">배송지</dt>
												<dd data-v-8f2f8136="" class="col">
													${vo.paymentShippingAddress1 }<span data-v-8f2f8136="" class="detail-address">${vo.paymentShippingAddress2 }</span>
												</dd>
											</dl>
											<input type="hidden" class="deliveryZipcodeCode" value="${vo.paymentShippingAddress3 }">
										</div>
									</header>
								</section>
								<!---->
								
								<c:if test="${vo.paymentDeliveryTypeCheck == 0 }">
									<section data-v-8f2f8136="" class="checkout__method">
										<div data-v-8f2f8136="" class="info-wrap">
											<h3 data-v-8f2f8136="" class="checkout__section-title">출입방법</h3>
											<span data-v-8f2f8136="" class="info-hover-icon"></span>
											<!---->
										</div>
										<div data-v-8f2f8136="" class="method__checks">
											<span data-v-615e9308="" data-v-8f2f8136=""
												class="form-select"
												style="height: 46px; margin-bottom: 10px;"><select id="typeSelect"
												data-v-615e9308=""><option data-v-615e9308="" 
														value="" disabled="disabled" selected="selected">선택하기</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="자유출입 가능">자유출입 가능</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="공동현관 비밀번호">공동현관 비밀번호</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="경비실 호출">경비실 호출</option>
													<option data-v-8f2f8136="" data-v-615e9308="" value="세대 호출">세대
														호출</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="경비실 배송">경비실 배송</option>
													<option data-v-8f2f8136="" data-v-615e9308=""
														value="무인택배함 배송">무인택배함 배송</option>
													<option data-v-8f2f8136="" data-v-615e9308="" value="기타사항">기타사항</option></select>
												<svg data-v-615e9308="" viewBox="0 0 12 7"
													xmlns="http://www.w3.org/2000/svg">
													<polygon data-v-615e9308="" id="Triangle" fill="#C9CACC"
														points="6 0 12 7 7.84372567e-14 7"></polygon></svg></span> <input
												data-v-8bb17226="" data-v-8f2f8136="" type="text"
												name="xxxx" placeholder="" maxlength="50" autocorrect="off"
												autocapitalize="off" class="form-text"
												style="height: 46px; margin-bottom: 10px;">
										</div>
										<div data-v-8f2f8136="" class="added-form">
											<p data-v-8f2f8136="" class="added-form-info">공동현관 및
												무인택배함 비밀번호는 조합 방식 및 순서( #, 호출버튼) 와 함께 자세히 기재해주세요.</p>
											<!---->
										</div>
									</section>
								</c:if>
								<c:if test="${vo.paymentDeliveryTypeCheck == 1 }">
									<section data-v-8f2f8136="" class="checkout__method">
										<div data-v-8f2f8136="" class="info-wrap">
											<h3 data-v-8f2f8136="" class="checkout__section-title">배송메모</h3>
										</div>
										<div data-v-8f2f8136="" class="method__checks parcel">
											<input data-v-8bb17226="" data-v-8f2f8136="" type="text"
												name="xxxx" placeholder="배송메모를 입력해주세요." maxlength="50"
												autocorrect="off" autocapitalize="off" class="form-text"
												style="height: 46px; margin-bottom: 10px;">
										</div>
										<div data-v-8f2f8136="" class="method">
											<div data-v-8f2f8136="" class="disposable-checkbox-wrap">
												<input data-v-8f2f8136="" id="reuseDeliveryMsgFlag-checkbox"
													type="checkbox" name="reuseDeliveryMsgFlag"
													class="disposable-checkbox"> <label
													data-v-8f2f8136="" for="reuseDeliveryMsgFlag-checkbox"
													class="disposable-checkbox-label"><span
													data-v-8f2f8136="" class="disposable-checkbox-text">
														다음에도 사용하기 </span></label>
											</div>
										</div>
									</section>
								</c:if>
								
								<!---->
								<div data-v-8f2f8136="" class="checkout-column">
									<div data-v-8f2f8136="" class="checkout-column__payment">
										
										<section data-v-8f2f8136="" class="checkout__coupoint">
											<div data-v-8f2f8136="" class="coupon">
												<h3 data-v-8f2f8136="" class="checkout__section-title">할인
													쿠폰</h3>
												<button data-v-8f2f8136="" type="button">
													<span data-v-8f2f8136="" class="row--v-center"><em
														data-v-8f2f8136="" class="col coupon__not-use">내 쿠폰
															${listSize }장</em> <svg data-v-8f2f8136=""
															xmlns="http://www.w3.org/2000/svg" width="24" height="24"
															viewBox="0 0 24 24" aria-labelledby="arrow-right-1"
															role="presentation" class="icon">
															<g fill="none" fill-rule="evenodd"> <path
																stroke="currentColor" stroke-linecap="round"
																stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg></span>
												</button>
											</div>
											<div data-v-8f2f8136="" class="point">
												<h3 data-v-8f2f8136="" class="checkout__section-title">포인트
													사용</h3>
												<div data-v-8f2f8136="" class="point-wrap row--v-center">
													<span data-v-8f2f8136="" class="point__input">
														<input data-v-8bb17226="" data-v-8f2f8136="" id="pp" type="tel" value="0"
															name="pp" placeholder="포인트를 입력해주세요" autocorrect="off"
															autocapitalize="off" class="form-text" max="0"
															style="height: 46px; text-align: right;"> 
														<i data-v-8f2f8136="">P</i>
													</span>
													<button data-v-a1c889e0="" data-v-8f2f8136="" type="button"
														title=""
														class="button button--side-padding button--size-small point-all"
														style="width: 80px; height: 46px; margin-left: 10px; border-radius: 2px;">
														<span data-v-a1c889e0="" class="button__wrap">전액사용</span>
													</button>
												</div>
												<dl data-v-8f2f8136="" class="row--v-center point__use">
													<dt data-v-8f2f8136="" class="col label">사용 가능한 포인트</dt>
													<dd data-v-8f2f8136="" class="num"><fmt:formatNumber value="${point.payment_point }" pattern="#,###" /> P</dd>
												</dl>
											</div>
											<!---->
										</section>
									</div>
									<div data-v-8f2f8136="" class="checkout-column">
										<section data-v-8f2f8136="" class="checkout__result">
											<h3 data-v-8f2f8136="" class="checkout__section-title">결제
												금액</h3>
											<div data-v-8f2f8136="" class="bd">
												<div data-v-8f2f8136="">
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">상품 금액</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">${vo.paymentFinalPrice }</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136=""
														class="row--v-center row--h-between discount">
														<dt data-v-8f2f8136="">상품 할인</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">- ${vo.paymentFinalSalePrice }</em> 원
														</dd>
													</dl>
												</div>
												<div data-v-8f2f8136="">
													<dl data-v-8f2f8136="" class="row--v-center row--h-between coupon">
														<dt data-v-8f2f8136="">쿠폰 사용</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">0</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136="" class="row--v-center row--h-between point01">
														<dt data-v-8f2f8136="">포인트 사용</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">0</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136="" class="row--v-center row--h-between">
														<dt data-v-8f2f8136="">배송비</dt>
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">${vo.paymentFinalDeliveryPrice }</em> 원
														</dd>
													</dl>
													<dl data-v-8f2f8136=""
														class="row--v-center row--h-between delivery-fee-info-wrap"
														style="color: red;">
														<div data-v-8f2f8136="" class="delivery-fee-title-wrap">
															<dt data-v-8f2f8136="">배송비 할인</dt>
															<span data-v-8f2f8136="" class="info-hover-icon"></span>
														</div>
														<!---->
														<dd data-v-8f2f8136="">
															<em data-v-8f2f8136="">- ${vo.paymentFinalDeliverySalePrice }</em> 원
														</dd>
													</dl>
													<!---->
												</div>
												<!---->
												<dl data-v-8f2f8136="" class="row--v-end row--h-between">
													<dt data-v-8f2f8136="">최종 결제금액</dt>
													<dd data-v-8f2f8136="">
														<b data-v-8f2f8136="">${vo.paymentRealFinalPrice } 원</b>
													</dd>
												</dl>
											</div>
										</section>
										<div data-v-8f2f8136="" class="row--v-center checkout__agree">
											<label data-v-8f2f8136="" class="row--v-center col"><label
												data-v-2673f877="" data-v-8f2f8136="" class="form-checkbox"><input
													data-v-2673f877="" type="checkbox" value="false"> <span
													data-v-2673f877=""><svg data-v-2673f877=""
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
															<path data-v-2673f877="" fill="currentColor"
																fill-rule="nonzero"
																d="M8.489 13.597l7.304-7.304a1 1 0 0 1 1.414 1.414l-8 8a1 1 0 0 1-1.403.011l-4-3.875a1 1 0 1 1 1.392-1.436l3.293 3.19z"></path></svg></span></label>
												<span data-v-8f2f8136="" class="col col-check">개인정보 수집·이용 동의
													(필수)</span></label> <a data-v-8f2f8136="" href='javascript:void(0);' onclick="policyCheckModal();">내용보기</a>
										</div>
										<!---->
										<nav data-v-8f2f8136="" class="nav checkout__nav"
											style="margin-bottom: 0px;">
											<button data-v-a1c889e0="" data-v-8f2f8136="" type="button"
												title="" class="button button--size-large" id="pay-btn2"
												style="border-radius: 2px; font-size: 16px;">
												<span data-v-a1c889e0="" class="button__wrap">결제하기</span>
											</button>
										</nav>
									</div>
								</div>
							</div>
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
						</article>
					</div>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>