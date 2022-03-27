<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/orderSub"/>
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
<link rel="stylesheet" href="${path }/style.css">
<link rel="stylesheet" href="${path }/style3.css">
<link rel="stylesheet" href="${path }/style2.css?ver=5">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function page_move(tagNum){
	   var f = document.paging; //폼 name
	   f.tagMain01.value = tagNum; //POST방식으로 넘기고 싶은 값
	   f.action="tapPage.do";//이동할 페이지
	   f.method="post";//POST방식
	   f.submit();
	}
	
	function kakaoAddressStart(){
		// 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('vue-daum-postcode-container');

//	     function foldDaumPostcode() {
//	         // iframe을 넣은 element를 안보이게 한다.
//	         element_wrap.style.display = 'none';
//	     }

//	     function sample3_execDaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                // 도로명 주소 받기, 지번주소 받기
	                addr = data.roadAddress;
	                zonecode = data.zonecode;

	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';

	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	                
	                var deliveryType = $('#deliveryType').val();
	                $.ajax({
	                	url : 'orderDeliveryTypeCheck.do',
	                	type : 'post',
	                	data : {
	                		'addr' : addr,
	                		'deliveryType' : deliveryType
	                	},
	                	success : function(data){
	                		if(data == 0){
	                			$.ajax({
	                				url : 'orderMorningDeliveryExcept.do',
	                				dataType : 'html',
	                				success : function(htmlOut){
	                					$('.modal-wrap__body').html(htmlOut);
	                				}
	                			})
	                		}else{
	                			$.ajax({
	                            	url : 'orderKakaoAddressSelectFinal.do',
	                            	dataType : 'html',
	                            	type : 'post',
	                            	data : {
	                            		'addr' : addr,
	                            		'zonecode' : zonecode
	                            	},
	                            	success : function(htmlOut){
	                            		$('.modal-wrap__body').html(htmlOut);
	                            	}
	                            })
	                		}
	                	}
	                })
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);

	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
//	     }
	}
	
	$(function(){
		// 들어올 때 새벽배송 클릭
		$('#delivery-morning').trigger("click");
		
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
    	
    	
    	// 모달창 닫기
    	$(document).on('click', '.modal-wrap', function(e){
        	
        	if(!$(e.target).hasClass("content-name") && !$(e.target).hasClass("content-price-wrap") && !$(e.target).hasClass("content-right") && 
        			!$(e.target).hasClass("dropdown") && !$(e.target).hasClass("add-items-group-body-contents") && !$(e.target).hasClass("content-wrap") && 
        			!$(e.target).hasClass("add-items-group") && !$(e.target).hasClass("content-discounted-price") && !$(e.target).hasClass("detail-wrap")
        			&& !$(e.target).hasClass("modal-list-img") && !$(e.target).hasClass("order_modal_btn") && !$(e.target).hasClass("menu-tab")
        			&& !$(e.target).hasClass("order-modal-tab-name") && !$(e.target).hasClass("dropdown-icon") && !$(e.target).hasClass("modal-header-slot-title")
        			&& !$(e.target).hasClass("modal-header-slot") && !$(e.target).hasClass("add-items") && !$(e.target).hasClass("except1") && !$(e.target).hasClass("except2")
        			&& !$(e.target).hasClass("add-items-selected") && !$(e.target).hasClass("add-items-selected-text") && !$(e.target).hasClass("count-and-price")
        			&& !$(e.target).hasClass("button__wrap") && !$(e.target).hasClass("confirm-icon") && !$(e.target).hasClass("add-items-content-wrap")
        			&& !$(e.target).hasClass("content-left") && !$(e.target).hasClass("dropdown-btn") && !$(e.target).hasClass("dropdown-content") && !$(e.target).hasClass("except3")
        			&& !$(e.target).hasClass("confirm-list") && !$(e.target).hasClass("confirm-list-delete") && !$(e.target).hasClass("except4") && !$(e.target).hasClass("order-menu-temp-name")
        			&& !$(e.target).hasClass("except5") && !$(e.target).hasClass("except6") && !$(e.target).hasClass("button button--size-large") && !$(e.target).hasClass("hidden-save-close")
        			&& !$(e.target).hasClass("toggle-drop-down") && !$(e.target).hasClass("order-modal-select") && !$(e.target).hasClass("content-price") && !$(e.target).hasClass("order-menu-temp-discount")
        			&& !$(e.target).hasClass("discount-price") && !$(e.target).hasClass("order-menu-temp-price") && !$(e.target).hasClass("page-header--modal") && !$(e.target).hasClass("col")
        			&& !$(e.target).hasClass("address-index") && !$(e.target).hasClass("address-index__body") && !$(e.target).hasClass("error-list") && !$(e.target).hasClass("button--size-large-mobile")
        			&& !$(e.target).hasClass("add-search__back") && !$(e.target).hasClass("modal-wrap__body") && !$(e.target).hasClass("add-confirm__back") && !$(e.target).hasClass("add-confirm__body")
        			&& !$(e.target).hasClass("add-confirm__address") && !$(e.target).hasClass("form-text") && !$(e.target).hasClass("form-fieldset") && !$(e.target).hasClass("form-field")
        			&& !$(e.target).hasClass("form-label") && !$(e.target).hasClass("row--v-center") && !$(e.target).hasClass("add-confirm-form") && !$(e.target).hasClass("add-confirm__empty")
        			&& !$(e.target).hasClass("result-text") && !$(e.target).hasClass("result-text-sub") && !$(e.target).hasClass("result-text-sub-morning") && !$(e.target).hasClass("disable-place-title")
        			&& !$(e.target).hasClass("disable-place-text") && !$(e.target).hasClass("name-wrap") && !$(e.target).hasClass("item__head") && !$(e.target).hasClass("round-text")
        			&& !$(e.target).hasClass("item__address") && !$(e.target).hasClass("item__nav") && !$(e.target).hasClass("button--size-small") && !$(e.target).hasClass("vue-daum-postcode")
        			&& !$(e.target).hasClass("content-img-wrap") && !$(e.target).hasClass("modal-content") && !$(e.target).hasClass("add-items-body-header") && !$(e.target).hasClass("header-content-right")
        			&& !$(e.target).hasClass("header-content") && !$(e.target).hasClass("header-content-left") && !$(e.target).hasClass("header-content-title") && !$(e.target).hasClass("header-content-price-wrap")
        			&& !$(e.target).hasClass("header-content-price") && !$(e.target).hasClass("header-content-discounted-price") && !$(e.target).hasClass("header-img") && !$(e.target).hasClass("add-items-body")
        			&& !$(e.target).hasClass("menu__options") && !$(e.target).hasClass("menu__label") && !$(e.target).hasClass("form-radio") && !$(e.target).hasClass("form-radio-circle")
        			&& !$(e.target).hasClass("form-radio-circle-interior") && !$(e.target).hasClass("radio-side-text") && !$(e.target).hasClass("menu__period-select") && !$(e.target).hasClass("dropdown-btn-flex-wrap")
        			&& !$(e.target).hasClass("bundle-modal-style") && !$(e.target).hasClass("date-picker-with-icon") && !$(e.target).hasClass("date-picker-input") && !$(e.target).hasClass("date-select-calendar-icon")
        			&& !$(e.target).hasClass("menu-select-panel") && !$(e.target).hasClass("menu__price") && !$(e.target).hasClass("menu__price-current-price") && !$(e.target).hasClass("add-items-button")
        			&& !$(e.target).hasClass("form-radio-input") && !$(e.target).hasClass("modal-header-slot-back")){
//         		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
//             	for (let i = 0; i < TimeoutId; i++) {
//             	  clearTimeout(i);
//             	}
            	$('.swal2-container').detach();
        		$('html').attr('class', '');
        		$('body').attr('class', '');
        		
        		$('.modal').detach();
        		$('#addressModalCheck').val(0);
        		$('#defaultBesongjiCheck').val('n');
        		
        		$('.modal-wrap').detach();
            	$('html').attr('class', '');
            	
//             	var oldQuantity = $('#oldQuantity').val();
//             	var oldPrice = $('#oldPrice').val();
//             	$('#latelyQuantity').val(oldQuantity);
//             	$('#latelyPrice').val(oldPrice);
            	
//             	var cloneElements = $('.hidden-div').children('div').clone();
//             	$('.hidden-div2').empty();
//             	cloneElements.appendTo('.hidden-div2');
            	
//             	button_activation();
        	}
        })
    	
    	// 배송지 선택 도움말 모달창 닫기
    	$(document).on('click', '.modal-mask', function(e){
	    	if(!$(e.target).hasClass("modal-wrapper") && !$(e.target).hasClass("modal-header") && !$(e.target).hasClass("except") && !$(e.target).hasClass("desc-title")
	    			&& !$(e.target).hasClass("desc-wrap") && !$(e.target).hasClass("desc-text") && !$(e.target).hasClass("modal-body")){
	    		$('.modal-mask').detach();
	    	}
	    });
    	
    	// 배송지 선택 오른쪽 아이콘 도움말 모달창
    	$(document).on('click', '.delivery-desc-btn', function(){
        	$.ajax({
        		url : 'orderSubShippingAddressExplainModal.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.order').append(htmlOut);
        		}
        	})
        });
    	
    	// 일반배송 주문 탭 버튼
    	$(document).on('click', '.nav-tab__wrap button:even', function(){
 		// 선택해놓은 물품들이 있다면 확인 모달창 띄우기
 		// 선택해놓은 물품들이 없다면 바로 넘기기
	 		$(location).attr("href", "order.do");
	 	})
	 	
	 	// 새벽배송 버튼
	    $(document).on('click', '.delivery-morning', function(){
	    	$('#deliveryType').val(0);
	    	$.ajax({
	    		url : 'orderSubMorningBesongji.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.order-address-wrap').html(htmlOut);
// 	    			button_activation();
	    		}
	    	})
	    })
	    
	    
	    // 택배배송 버튼
	    $(document).on('click', '.delivery-parcel', function(){
	    	$('#deliveryType').val(1);
	    	$.ajax({
	    		url : 'orderSubParcelBesongji.do',
	    		dataType : 'html',
	    		success : function(htmlOut){
	    			$('.order-address-wrap').html(htmlOut);
// 	    			button_activation();
	    		}
	    	})
	    });
    	
    	// 배송지 선택 맨 처음 화면
        $(document).on('click', '.order-address-wrap button', function(){
        	$('#addressModalCheck').val(1); // 다른 같은 클래스 버튼 작동 안되게끔
        	$('#defaultBesongjiCheck').val('n'); // 기본 배송지 주소 설정 체크
        	$('html').attr('class', 'mode-popup');
        	
        	var member_delivery_type = $('#deliveryType').val();
        	
        	$.ajax({
        		url : 'orderZipCodeSelectModal.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'member_delivery_type' : member_delivery_type
        		},
        		success : function(htmlOut){
        			$('.order').append(htmlOut);
        		}
        	})
        });
    	
     	// 배송지 선택창에서 배송지 추가 버튼
        $(document).on('click', '.button.button--size-large-mobile .button__wrap', function(){
        	$.ajax({
        		url : 'orderKakaoAddressContainer.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.modal-wrap__body').html(htmlOut);
        			
        			kakaoAddressStart();
        		}
        	})
        });
     	
     	// 카카오톡 주소 api 화면에서 백 화살표 버튼
        $(document).on('click', '.add-search__back', function(){
        	var member_delivery_type = $('#deliveryType').val();
        	
        	$.ajax({
        		url : 'orderZipCodeSelectModalDetail.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'member_delivery_type' : member_delivery_type
        		},
        		success : function(htmlOut){
        			$('.modal-wrap__body').html(htmlOut);
        		}
        	})
        });
     	
     	// 새벽배송에서 너무 먼 지역 클릭해서 불가능 모달 떴을 때 뒤로 가는 화살표 버튼
        $(document).on('click', '.add-confirm__back', function(){
        	$.ajax({
        		url : 'orderKakaoAddressContainer.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.modal-wrap__body').html(htmlOut);
        			
        			kakaoAddressStart();
        		}
        	})
        });
     	
     	// 새벽배송 불가능 지역 창 확인 버튼
        $(document).on('click', '.button.add-confirm__empty__button .button__wrap', function(){
        	$.ajax({
        		url : 'orderKakaoAddressContainer.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.modal-wrap__body').html(htmlOut);
        			
        			kakaoAddressStart();
        		}
        	})
        });
     	
     	// 배송지 등록 버튼
        $(document).on('click', '.kakaoFinalRegistration', function(){
        	if($('.form-text').eq(0).val().length == 0){
        		alert('상세주소를 입력해주세요.');
        		return false;
        	}else if($('.form-text').eq(1).val().length == 0){
        		alert('배송지명을 입력해주세요.');
        		return false;
        	}
        	$('#addressCheck').val(1); // 배송지 설정 완료했다는 의미 (구매하기 버튼 활성화 조건)
        	
        	var zonecode = $('.add-confirm__address').children('em').text();
        	var address = $('.add-confirm__address').children('span').text();
        	var detailAddress = $('.form-text').eq(0).val();
        	var shippingAddress = $('.form-text').eq(1).val();
        	var defaultAddressCheck = $('#defaultBesongjiCheck').val();
        	var deliveryType = $('#deliveryType').val();
        	
        	$('.modal').detach();
        	
        	$.ajax({
        		url : 'memberZipcodeRegistration.do',
        		type : 'post',
        		data : {
        			'member_zipcode' : zonecode,
        			'member_address' : address,
        			'member_detail_address' : detailAddress,
        			'member_shipping_address' : shippingAddress,
        			'member_default_address' : defaultAddressCheck,
        			'member_delivery_type' : deliveryType
        		},
        		success : function(data){ // 에이작스는 반환값이 필요 없어도
        									// success 를 실행하려면 null이라도 반환 시켜야함.
        			$('#addressModalCheck').val(0);
        			$.ajax({
        	    		url : 'orderBesongjiRegistrationCompleteCheckModal.do',
        	    		dataType : 'html',
        	    		success : function(htmlOut){
        	    			$('html').attr('class', 'swal2-toast-shown swal2-shown');
        	    	    	$('body').attr('class', 'swal2-toast-shown swal2-shown');
        	    			$('body').append(htmlOut);
        	    			
        	    			setTimeout(function() {
        	    				$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').css('overflow-y', 'auto');
        	    				
        	    				setTimeout(function() {
        	    					$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
        	    					$('html').attr('class', '');
        	    					$('body').attr('class', '');
        	    				}, 3000);
        	    			}, 500);
        	    			
        	    			if(deliveryType == 0){
    	    	    			$.ajax({
    	    	    				url : 'orderSubMorningBesongji.do',
    	    	    				dataType : 'html',
    	    	    				success : function(htmlOut){
    	    	    					$('.order-address-wrap').html(htmlOut);
//     	    	    					button_activation();
    	    	    				}
    	    	    			})
        	    			}else{
        	    				$.ajax({
    	    	    				url : 'orderSubParcelBesongji.do',
    	    	    				dataType : 'html',
    	    	    				success : function(htmlOut){
    	    	    					$('.order-address-wrap').html(htmlOut);
//     	    	    					button_activation();
    	    	    				}
    	    	    			})
        	    			}
        	    		}
        	    	});
        		}
        	});
        	
//         	button_activation();
        });
     
    	// 기본 배송지 설정 체크 박스
        $(document).on('click', '#f_dest_is_main', function(){
        	if($('#defaultBesongjiCheck').val() == 'n'){
        		$('#defaultBesongjiCheck').val('y');
        	}else{
        		$('#defaultBesongjiCheck').val('n');
        	}
        })
        
     	// 기본 배송지로 설정 버튼
        $(document).on('click', '.delivery_default_select', function(){
        	$.ajax({
        		url : 'orderDefaultDeliveryCheckModal.do',
        		dataType : 'html',
        		context : this,
        		success : function(htmlOut){
        			$(this).after('<input type="hidden" id="defaultDeliverydeleteCheck">');
        			$('html').attr('class', 'mode-popup swal2-shown swal2-height-auto');
        			$('body').attr('class', 'swal2-shown swal2-height-auto');
        			$('noscript').attr('aria-hidden', 'true');
        			$('#__nuxt').attr('aria-hidden', 'true');
        			$('body').append(htmlOut);
        		}
        	})
        });
    	
     	// 기본 배송지 설정 변경 체크 모달창 취소 버튼
        $(document).on('click', '.swal2-cancel.swal2-styled', function(){
        	$('#defaultDeliverydeleteCheck').detach();
        	$('#checkDefaultDelivery').val(0);
        });
     	
     	// 기본 배송지 설정 변경 체크 모달창 확인 버튼
        $(document).on('click', '.swal2-confirm.swal2-styled', function(){
        	var member_zipcode_code = $('#defaultDeliverydeleteCheck').closest('li').find('input:odd').val();
        	var member_delivery_type = $('#deliveryType').val();
        	
        	$.ajax({
        		url : 'orderDeliveryDefaultSelect.do',
        		type : 'post',
        		data : {
        			'member_zipcode_code' : member_zipcode_code
        		},
        		success : function(data){
        			
        			$.ajax({
        	    		url : 'orderZipCodeSelectModalDetail.do',
        	    		dataType : 'html',
        	    		type : 'post',
        	    		data : {
        	    			'member_delivery_type' : member_delivery_type
        	    		},
        	    		success : function(htmlOut){
        	    			$('.modal-wrap__body').html(htmlOut);
        	    			$('#checkDefaultDelivery').val(0);
        	    		}
        	    	})
        		}
        	})
        });
     	
     	// 배송지 목록 선택 버튼
     	$(document).on('click', '.button.button--side-padding.button--size-small.select', function(){
     		var member_zipcode_code = $(this).closest('li').find('input').val();
     		$('.modal').detach();
     		$.ajax({
     			url : 'orderSubCommonBesongji.do',
     			type : 'post',
     			dataType : 'html',
     			data : {
     				'member_zipcode_code' : member_zipcode_code
     			},
     			success : function(htmlOut){
     				$('.order-address-wrap').html(htmlOut);
     				
     				
     				$('#addressModalCheck').val(0);
        			$.ajax({
        	    		url : 'orderBesongjiRegistrationCompleteCheckModal.do',
        	    		dataType : 'html',
        	    		success : function(htmlOut){
        	    			$('html').attr('class', 'swal2-toast-shown swal2-shown');
        	    	    	$('body').attr('class', 'swal2-toast-shown swal2-shown');
        	    			$('body').append(htmlOut);
        	    			
        	    			setTimeout(function() {
        	    				$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').css('overflow-y', 'auto');
        	    				
        	    				setTimeout(function() {
        	    					$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
        	    					$('html').attr('class', '');
        	    					$('body').attr('class', '');
        	    				}, 3000);
        	    			}, 500);
        	    		}
        	    	});
     			}
     		})
     	});
     	
     	// 앞으로 갔다가 뒤로가기 버튼 누른 뒤 배송지 목록 선택 버튼
     	$(document).on('click', '.button__wrap.delivery_select', function(){
     		var member_zipcode_code = $(this).closest('li').find('input').val();
     		$('.modal').detach();
     		
     		$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
     		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
        	for (let i = 0; i < TimeoutId; i++) {
        	  clearTimeout(i);
        	}
        	
     		$.ajax({
     			url : 'orderSubCommonBesongji.do',
     			type : 'post',
     			dataType : 'html',
     			data : {
     				'member_zipcode_code' : member_zipcode_code
     			},
     			success : function(htmlOut){
     				$('.order-address-wrap').html(htmlOut);
     				
     				
     				$('#addressModalCheck').val(0);
        			$.ajax({
        	    		url : 'orderBesongjiRegistrationCompleteCheckModal.do',
        	    		dataType : 'html',
        	    		success : function(htmlOut){
        	    			$('html').attr('class', 'swal2-toast-shown swal2-shown');
        	    	    	$('body').attr('class', 'swal2-toast-shown swal2-shown');
        	    			$('body').append(htmlOut);
        	    			
        	    			setTimeout(function() {
        	    				$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').css('overflow-y', 'auto');
        	    				
        	    				setTimeout(function() {
        	    					$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
        	    					$('html').attr('class', '');
        	    					$('body').attr('class', '');
        	    				}, 3000);
        	    			}, 500);
        	    		}
        	    	});
     			}
     		})
     	});
     	
     	// 정기배송 상품 선택 버튼(모달창 띄우기)
     	$(document).on('click', '.add.add-reco.add.add-reco', function(){
     		var deliveryType = $('#deliveryType').val();
     		$('html').attr('class', 'mode-popup');
     		
     		$.ajax({
     			url : 'orderSubModal.do',
     			type : 'post',
     			dataType : 'html',
     			data : {
     				'deliveryType' : deliveryType
     			},
     			success : function(htmlOut){
     				$('.order').append(htmlOut);
     			}
     		})
     	})
     	
     	
     	// 모달창에서 선택 버튼
     	$(document).on('click', '.subscribe-select', function(){
     		var item_code = $(this).parent().siblings('input').val();
     		
     		$.ajax({
     			url : 'orderSubModalDetail.do',
     			type : 'post',
     			dataType : 'html',
     			data : {
     				'item_code' : item_code
     			},
     			success : function(htmlOut){
     				$('.modal-content.modal-content-height-full').html(htmlOut);
     				$('.form-radio-input').eq(0).trigger('click');
     				$('.modal-header-slot').prepend('<div data-v-3222e1c8="" data-v-09c23eb4="" class="modal-header-slot-back"></div>');
     			}
     		})
     	})
     	
     	
     	// 모달창에서 사이즈 체크
     	$(document).on('click', '.form-radio-input', function(){
     		$('#subModalSizeCheck').val($(this).val());
     	})
     	
     	// 모달창 뒤로가기 버튼
     	$(document).on('click', '.modal-header-slot-back', function(){
     		var deliveryType = $('#deliveryType').val();
     		
     		$.ajax({
     			url : 'orderSubModalFirstDetail.do',
     			type : 'post',
     			dataType : 'html',
     			data : {
     				'deliveryType' : deliveryType
     			},
     			success : function(htmlOut){
     				$('.modal-content.modal-content-height-full').html(htmlOut);
     			}
     		})
     	})
     	
     	// 모달창 기간선택 버튼 todo
     	$(document).on('click', '.button.dropdown', function(){
     		// 리스트가 드랍된 상태에서 다시 클릭하면 닫혀야 함
     		
     		$('.dropdown-btn').attr('class', 'dropdown-btn dropdown-open');
     		
     		$.ajax({
     			url : 'orderSubModalList.do',
     			dataType : 'html',
     			success : function(htmlOut){
     				$('.dropdown-btn.dropdown-open').append(htmlOut);
     			}
     		})
     	})
	})
</script>
</head>
<body>
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
					<input type="hidden" value="0" id="deliveryType">
					<input type="hidden" value="0" id="addressModalCheck">
					<input type="hidden" value="n" id="defaultBesongjiCheck">
					<input type="hidden" value="" id="subModalSizeCheck">
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
				</header>
				<!---->
				<div data-v-1739428d="" class="container">
					<div data-v-3222e1c8="" data-v-1739428d="" class="order-container">
						<div data-v-3222e1c8="" class="order">
							<div data-v-3222e1c8="" class="order-wrap">
								<div data-v-3222e1c8="" class="order-type-wrap">
									<nav data-v-4b8c16c4="" data-v-3222e1c8="" class="nav-tab">
										<div data-v-4b8c16c4="" class="nav-tab__wrap">
											<div data-v-4b8c16c4="" class="">
												<button data-v-4b8c16c4="" type="button" class="general">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">일반배송 주문</span>
												</button>
											</div>
											<div data-v-4b8c16c4="" class="on">
												<button data-v-4b8c16c4="" type="button" class="sub">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">정기배송 주문</span>
												</button>
											</div>
										</div>
									</nav>
								</div>
								<div data-v-3222e1c8="" class="order-delivery-wrap">
									<div data-v-3222e1c8="" class="order-delivery-header">
										<p data-v-3222e1c8="" class="header-title">배송지 선택</p>
										<img data-v-3222e1c8=""
											src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_information-green%403x.png" alt="배송 설명 버튼"
											class="delivery-desc-btn">
									</div>
									<div data-v-3222e1c8="" class="order-delivery-radio-wrap">
										<div data-v-3222e1c8="" class="order-delivery-wrap">
											<!---->
											<input data-v-3222e1c8="" id="delivery-morning" type="radio"
												name="delivery" value="morning"><label
												data-v-3222e1c8="" for="delivery-morning" class="delivery-morning"> 새벽배송 </label> <input
												data-v-3222e1c8="" id="delivery-parcel" type="radio"
												name="delivery" value="parcel"><label
												data-v-3222e1c8="" for="delivery-parcel" class="delivery-parcel"> 택배배송 </label>
										</div>
									</div>
									<div data-v-3222e1c8="" class="order-address-wrap">
										<button data-v-3222e1c8="" type="button">
											<span data-v-3222e1c8="" class="row--v-center row--h-between">
												<c:if test="${fn:length(list) == 0}">
													<span class="col ta-left" data-v-3222e1c8="">서울, 경기, 인천 일부 새벽배송지 선택</span>
													<input type="hidden" value="0" id="addressCheck">
												</c:if>
												<c:if test="${fn:length(list) > 0}">
													<c:forEach var="memberZipcode" items="${list }">
														<c:if test="${memberZipcode.member_default_address == 'y' }">
															<span data-v-3222e1c8="" class="col ta-left">
																<b data-v-3222e1c8="" class="subject">
																	<span data-v-3222e1c8="">${memberZipcode.member_shipping_address }</span>
																</b> 
																<span data-v-3222e1c8="" class="description">${memberZipcode.member_address } ${memberZipcode.member_detail_address }</span>
																<input type="hidden" value="${memberZipcode.member_zipcode_code }">
																<input type="hidden" value="1" id="addressCheck">
															</span>
														</c:if>
													</c:forEach>
												</c:if>
												<i data-v-3222e1c8="" class="ico">
													<svg
														data-v-3222e1c8="" xmlns="http://www.w3.org/2000/svg"
														width="24" height="24" viewBox="0 0 24 24"
														aria-labelledby="arrow-right-1" role="presentation"
														class="icon">
														<g fill="none" fill-rule="evenodd"> <path
															stroke="currentColor" stroke-linecap="round"
															stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6"></path></g></svg>
												</i>
											</span>
										</button>
									</div>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<div data-v-3222e1c8="" class="order-selected-item-wrap">
									<div data-v-3222e1c8="" class="order-selected-item-header">
										<p data-v-3222e1c8="" class="header-title">상품 선택</p>
									</div>
									<div data-v-3222e1c8="" class="header-description">정기배송
										상품은 한 제품씩 구매 가능합니다.</div>
									<div data-v-3222e1c8="" class="order-selected-item">
										<button data-v-3222e1c8="" type="button"
											class="add add-reco add add-reco">
											<div data-v-3222e1c8="">
												<span data-v-3222e1c8="">정기배송 상품 선택</span>
												<div data-v-3222e1c8="" class="v-spinner"
													style="left: 50%; position: absolute; display: none;">
													<div class="v-clip"
														style="height: 18px; width: 18px; border-width: 2px; border-style: solid; border-color: rgb(201, 238, 222) rgb(201, 238, 222) transparent; border-radius: 100%; background: transparent;"></div>
												</div>
											</div>
										</button>
									</div>
									<!---->
								</div>
								<!---->
								<div data-v-3222e1c8="" class="order-delivery-date-wrap">
									<!---->
									<!---->
									<div data-v-3222e1c8="" class="order-delivery-date-body"></div>
									<!---->
								</div>
								<div data-v-3222e1c8="" class="order-result-info-wrap">
									<div data-v-3222e1c8="" class="order-result-info-header">
										<p data-v-3222e1c8="" class="header-title">결제예상금액</p>
									</div>
									<div data-v-3222e1c8="" class="order-result-info-body">
										<div data-v-3222e1c8=""
											class="row--v-center row--h-center order-result-content">
											<div data-v-3222e1c8="">
												<div data-v-3222e1c8="" class="info-content">
													<div data-v-3222e1c8="" class="info-content-title">상품
														수 / 금액</div>
													<div data-v-3222e1c8="">0개 / 0원</div>
												</div>
											</div>
											<div data-v-3222e1c8="">
												<div data-v-3222e1c8="" class="info-content">
													<div data-v-3222e1c8="" class="info-content-title">배송횟수
														/ 배송비</div>
													<div data-v-3222e1c8="">0회 / 0원</div>
												</div>
											</div>
											<div data-v-3222e1c8="">
												<div data-v-3222e1c8="" class="info-content">
													<div data-v-3222e1c8="" class="info-content-title"
														style="color: rgb(17, 77, 35);">할인금액</div>
													<div data-v-3222e1c8=""
														style="color: rgb(17, 77, 35); font-weight: bold;">
														- 0원</div>
												</div>
											</div>
											<div data-v-3222e1c8="" class="order-result-info-total">
												<div data-v-3222e1c8="">
													<b data-v-3222e1c8="">결제예상금액</b>
												</div>
												<div data-v-3222e1c8="">
													<em data-v-3222e1c8="">0원</em>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div data-v-3222e1c8="" class="order-result-payment ">
									<div data-v-3222e1c8="" class="row--v-center "
										style="flex-basis: 100%;">
										<div data-v-3222e1c8="" class="col">
											<button data-v-a1c889e0="" data-v-3222e1c8="" type="button"
												title="" disabled="disabled"
												class="button button--size-large button--disabled"
												style="width: 100%; height: 50px; margin: 0px auto; border-radius: 2px; font-size: 16px; font-weight: 400; background-color: rgb(184, 212, 198);">
												<span data-v-a1c889e0="" class="button__wrap"> 구매하기 </span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
						</div>
					</div>
				</div>
				<!---->
			</main>
		</div>
	</div>
	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>