<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/order"/>
<!DOCTYPE html>
<html>
<head>
<title>샐러딧 - 프리미엄 샐러드 배달 서비스</title>
<meta charset="UTF-8">
<meta data-n-head="ssr" data-hid="title" name="title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description" content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords" content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="og:title" property="og:title" content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description" property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:url" property="og:url" content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image" content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
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

function button_activation(){
	var minPriceCheck = $('.info-content').eq(0).children().eq(2).val();
	var calendarCheck = $('#checkCalendar').val();
	var addressCheck = $('#addressCheck').val(); 
	
	if(minPriceCheck == 1 && calendarCheck == 1 && addressCheck == 1){
		$('.order-result-payment .button.button--size-large').attr('class', 'button button--size-large');
		$('.order-result-payment .button.button--size-large').css('width', '100%');
		$('.order-result-payment .button.button--size-large').css('height', '50px');
		$('.order-result-payment .button.button--size-large').css('margin', '0px auto');
		$('.order-result-payment .button.button--size-large').css('border-radius', '2px');
		$('.order-result-payment .button.button--size-large').css('font-size', '16px');
		$('.order-result-payment .button.button--size-large').css('font-weight', '400');
		$('.order-result-payment .button.button--size-large').css('background-color', 'rgb(53, 173, 115)');
		$('.order-result-payment .button.button--size-large').removeAttr('disabled');
		
		var deliveryCheck = $('.info-content').eq(1).children().eq(2).val();
		var totalPrice = 0;
		var realPrice = $('#realPrice').val();
		
		if(deliveryCheck == 0){
			totalPrice = Number(realPrice) + 3500;
		}else{
			totalPrice = Number(realPrice);
		}
		
		$('.order-result-info-total').find('em').text(totalPrice.toLocaleString('en') + '원');
	}else{
		$('.order-result-payment .button.button--size-large').attr('class', 'button button--size-large button--disabled');
		$('.order-result-payment .button.button--size-large').attr('disabled', 'disabled');
		$('.order-result-payment .button.button--size-large').css('width', '100%');
		$('.order-result-payment .button.button--size-large').css('height', '50px');
		$('.order-result-payment .button.button--size-large').css('margin', '0px auto');
		$('.order-result-payment .button.button--size-large').css('border-radius', '2px');
		$('.order-result-payment .button.button--size-large').css('font-size', '16px');
		$('.order-result-payment .button.button--size-large').css('font-weight', '400');
		$('.order-result-payment .button.button--size-large').css('background-color', 'rgb(184, 212, 198)');
		$('.order-result-info-total').find('em').text('0원');
	}
}

function kakaoAddressStart(){
	// 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('vue-daum-postcode-container');

//     function foldDaumPostcode() {
//         // iframe을 넣은 element를 안보이게 한다.
//         element_wrap.style.display = 'none';
//     }

//     function sample3_execDaumPostcode() {
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
//     }
}

$(function() { 
	
	var realPrice10 = $('#realPrice').val();
	
	if(realPrice10 < 10000){
		var remainPrice = 10000 - realPrice10;
		$.ajax({
			url : 'orderMinPrice.do',
			type : 'post',
			dataType : 'html',
			data : {
				'remainPrice' : remainPrice
			},
			success : function(htmlOut){
				$('.info-content').eq(0).find('.min').detach();
				$('.info-content').eq(0).append(htmlOut);
				$('.info-content').eq(0).children().eq(2).val(0);
				button_activation();
			}
		})
		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
	}else{
		$('.info-content').eq(0).find('.min').detach();
		$('.info-content').eq(0).children().eq(2).val(1);
		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
	}
	
	if(realPrice10 < 35000){
		var remainPrice = 35000 - realPrice10;
		$.ajax({
			url : 'orderMinPriceDelivery.do',
			type : 'post',
			dataType : 'html',
			data : {
				'remainPrice' : remainPrice
			},
			success : function(htmlOut){
				$('.info-content').eq(1).find('.min').detach();
				$('.info-content').eq(1).append(htmlOut);
				$('.info-content').eq(1).children().eq(2).val(0);
				button_activation();
			}
		})
	}else{
		$('.info-content').eq(1).find('.min').detach();
		$('.info-content').eq(1).children().eq(2).val(1);
		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
	}
	
	
	
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
			$('#closeBtn').trigger('click');
			$('#defaultDeliverydeleteCheck').detach();
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
    
    $('#delivery-morning').trigger("click");
    
    $(document).on('click', '.delivery-desc-btn', function(){
    	$.ajax({
    		url : 'orderShippingAddressExplainModal.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.order').append(htmlOut);
    		}
    	})
    });
    
    $(document).on('click', '.modal-mask', function(e){
    	if(!$(e.target).hasClass("modal-wrapper") && !$(e.target).hasClass("modal-header") && !$(e.target).hasClass("except") && !$(e.target).hasClass("desc-title")
    			&& !$(e.target).hasClass("desc-wrap") && !$(e.target).hasClass("desc-text") && !$(e.target).hasClass("modal-body")){
    		$('.modal-mask').detach();
    	}
    });
    
    $(document).on('click', '.add', function(){
    	$('html').attr('class', 'mode-popup');
    	$.ajax({
    		url : 'orderModal.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'item_tag_main' : 200
    		},
    		success : function(htmlOut){
    			$('.order').append(htmlOut);
    			
    			var oldPrice = $('#oldPrice').val();
    			$('.count-and-price').text($('#oldQuantity').val() + '개' + ' / ' + Number(oldPrice).toLocaleString('en') + '원');
    		}
    	})
    });
    
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
    			&& !$(e.target).hasClass("item__address") && !$(e.target).hasClass("item__nav") && !$(e.target).hasClass("button--size-small")){
    		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
        	for (let i = 0; i < TimeoutId; i++) {
        	  clearTimeout(i);
        	}
        	$('.swal2-container').detach();
    		$('html').attr('class', '');
    		$('body').attr('class', '');
    		
    		$('.modal').detach();
    		$('#addressModalCheck').val(0);
    		$('#defaultBesongjiCheck').val('n');
    		
    		$('.modal-wrap').detach();
        	$('html').attr('class', '');
        	
        	var oldQuantity = $('#oldQuantity').val();
        	var oldPrice = $('#oldPrice').val();
        	$('#latelyQuantity').val(oldQuantity);
        	$('#latelyPrice').val(oldPrice);
        	
        	var cloneElements = $('.hidden-div').children('div').clone();
        	$('.hidden-div2').empty();
        	cloneElements.appendTo('.hidden-div2');
        	
        	button_activation();
    	}
    })
    
    $(document).on('click','.order_modal_btn', function(){
    	var tagMain = $(this).prev().val();
    	$(this).parent().attr('class', 'on');
    	$(this).parent().siblings().attr('class', '');
    	$.ajax({
    		url : 'orderModalAjax.do',
    		type : 'post',
    		dataType : 'html',
    		data : {
    			'item_tag_main' : tagMain
    		},
    		success : function(htmlOut){
    			$('.add-items-group-body').html(htmlOut);
    		}
    	});
    	
    	$( '.modal-content.modal-content-height-full' ).animate( {
    		scrollTop : 0
    	}, 400 );
    });
    
    $(document).on('click', '.button.dropdown', function(){
    	var tagMain = $(this).siblings().first().val();
    	var itemCode = $(this).prev().val();
    	var checkCode = $('.dropdown-btn.dropdown-open').children('input').last().val();
    	
    	$('.dropdown-btn.dropdown-open').attr('class', 'dropdown-btn');
    	$('.toggle-drop-down').detach();
    	if(itemCode != checkCode){
	    	$(this).parent().attr('class', 'dropdown-btn dropdown-open');
	    	
	    	
	    	$.ajax({
	    		url : 'orderDropDown.do',
	    		type : 'post',
	    		dataType : 'html',
	    		data : {
	    			'item_tag_main' : tagMain,
	    			'item_code' : itemCode
	    		},
	    		context: this,
	    		success : function(htmlOut){
	    			$(this).after(htmlOut);
	    		}
	    	})
	    }
    });
    
    $(document).on('click', '.order-modal-select', function(){
    	// 먼저 모든 타임아웃 동작 중지
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', 'mode-popup');
		$('body').attr('class', '');
    	
    	var itemName = $(this).children('input').first().val();
    	var itemPrice = $(this).children('input').last().val();
    	var itemSize = $(this).children('div').children('div').first().children('span').first().text();
    	var itemSizeSummary = $(this).children('input').eq(1).val();
    	var itemCode = $(this).children('input').eq(2).val();
    	var itemTagMain = $(this).children('input').eq(3).val();
    	var itemPriceSub = $(this).children('input').eq(4).val();
    	
    	var oldQuantity = $('#oldQuantity').val();
    	var oldPrice = $('#oldPrice').val();
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	
    	$('.toggle-drop-down').detach();
    	$('.dropdown-btn.dropdown-open').attr('class', 'dropdown-btn');
    	
    	$('.swal2-container').remove();
    	// ${itemInfo.item_tag_main}/${itemInfo.item_code }/${itemSizeSummary}
    	if($('.hidden-div2').children('.' + itemTagMain + '\\/' + itemCode + '\\/' + itemSizeSummary).length > 0){
    		$.ajax({
    			url : 'orderSaveFail.do',
    			dataType : 'html',
    			success : function(htmlOut){
    				$('body').append(htmlOut);
    				$('html').attr('class', 'mode-popup swal2-toast-shown swal2-shown');
    				$('body').attr('class', 'swal2-toast-shown swal2-shown');
    				var timer1 = setTimeout(function() {
    					$('.swal2-container').css('overflow-y', 'auto');
    				}, 500);
    				var timer2 = setTimeout(function() {
    					$('.swal2-container').attr('class', 'swal2-container swal2-bottom toast-container-class swal2-backdrop-hidden');
    				}, 2450);
    				var timer3 = setTimeout(function() {
    					$('.swal2-container').detach();
    					$('html').attr('class', 'mode-popup');
    					$('body').attr('class', '');
    				}, 2500);
    			}
    		});
    	}else{
        	$('#latelyQuantity').val(Number(latelyQuantity) + 1);
        	$('#latelyPrice').val(Number(latelyPrice) + Number(itemPrice.replace(',', '')));
    		
    		$.ajax({
        		url : 'orderSaveTmp.do',
        		type : 'post',
        		dataType : 'html',
        		data : {
        			'item_code' : itemCode,
        			'item_tag_main' : itemTagMain,
        			'itemPrice' : itemPrice,
        			'item_name' : itemName,
        			'itemSize' : itemSize,
        			'itemSizeSummary' : itemSizeSummary,
        			'itemPriceSub' : itemPriceSub
        		},
        		success : function(htmlOut){
        			$('.hidden-div2').append(htmlOut); 
        			// 모달창 꺼질 땐 hidden-div2 안은 지워야 한다.
        			// 선택 완료 말고 그냥 엑스버튼이나 공백을 눌러서 꺼버릴 시, 
        			// 최근에 선택했던 것들을 비교해서 지워야 하기 때문
        		}
        	});
    		
    		$.ajax({
    			url : 'calculate.do',
    			type : 'post',
    			data : {
    				'price' : itemPrice,
    				'latelyPrice' : latelyPrice
    			},
    			success : function(data){
    				$('.count-and-price').text($('#latelyQuantity').val() + '개' + ' / ' + data + '원');
    			}
    		});
    		
    		$.ajax({
    			url : 'orderSaveSuccess.do',
    			dataType : 'html',
    			success : function(htmlOut){
    				$('body').append(htmlOut);
    				$('html').attr('class', 'mode-popup swal2-toast-shown swal2-shown');
    				$('body').attr('class', 'swal2-toast-shown swal2-shown');
    				var timer1 = setTimeout(function() {
    					$('.swal2-container').css('overflow-y', 'auto');
    				}, 500);
    				var timer2 = setTimeout(function() {
    					$('.swal2-container').attr('class', 'swal2-container swal2-bottom toast-container-class swal2-backdrop-hidden');
    				}, 2450);
    				var timer3 = setTimeout(function() {
    					$('.swal2-container').detach();
    					$('html').attr('class', 'mode-popup');
    					$('body').attr('class', '');
    				}, 2500);
    			}
    		});
    	}
    })
    
    $(document).on('click', '.hidden-save-open', function(){
    	if($('.hidden-div2').children('div').length == 0) return false;
    	
    	$('.modal-content.modal-content-height-full').css('overflow-y', 'hidden');
    	$('.add-items-body').css('opacity', '0.3');
    	$('.add-items-body').css('pointer-events', 'none');
    	$.ajax({
    		url : 'confirmIconChange2.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.confirm-icon').append(htmlOut);
    		}
    	});
    	$('.hidden-save-open').detach();
    	
//     	alert($('.hidden-div').children('div').eq(0).children('.savePrice').val() + " " + $('.hidden-div').children('div').eq(1).children('.savePrice').val());
		var saveItemCode = [], data = {}; // {} 중괄호는 데이터 dictionary 선언, [] 대괄호는 배열 선언
		var saveTagMain = [];
		var savePrice = [];
		var savePriceSub = [];
		var saveItemName = [];
		var saveItemSize = [];
		var saveDisposable = [];
		var saveitemSizeSummary = [];
	    for(var i = 0; i < $('.hidden-div2').children('div').length; i++){
	    	saveItemCode[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemCode').val();
	    	saveTagMain[i] = $('.hidden-div2').children('div').eq(i).children('.saveTagMain').val();
	    	savePrice[i] = $('.hidden-div2').children('div').eq(i).children('.savePrice').val();
	    	savePriceSub[i] = $('.hidden-div2').children('div').eq(i).children('.savePriceSub').val();
	    	saveItemName[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemName').val();
	    	saveItemSize[i] = $('.hidden-div2').children('div').eq(i).children('.saveItemSize').val();
	    	saveDisposable[i] = $('.hidden-div2').children('div').eq(i).children('.saveDisposable').val();
	    	saveitemSizeSummary[i] = $('.hidden-div2').children('div').eq(i).children('.saveitemSizeSummary').val();
	    }
	    
	    data.saveItemCode = saveItemCode;
	    data.saveTagMain = saveTagMain;
	    data.savePrice = savePrice;
	    data.savePriceSub = savePriceSub;
	    data.saveItemName = saveItemName;
	    data.saveItemSize = saveItemSize;
	    data.saveDisposable = saveDisposable;
	    data.saveitemSizeSummary = saveitemSizeSummary;
	    jQuery.ajaxSettings.traditional = true;
	    
    	$.ajax({
    		url : 'orderHiddenSavePresentation.do',
    		dataType : 'html',
    		type : 'post',
    		data : data,
    		success : function(htmlOut){
    			$('.add-items-content-wrap').append(htmlOut);
    		}
    	});
    });
    
    $(document).on('click', '.hidden-save-close', function(){
    	$('.modal-content.modal-content-height-full').css('overflow-y', 'auto');
    	$('.add-items-body').css('opacity', '1');
    	$('.add-items-body').css('pointer-events', 'auto');
    	$.ajax({
    		url : 'confirmIconChange1.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.confirm-icon').append(htmlOut);
    		}
    	});
    	$('.hidden-save-close').detach();
    	$('.add-items-confirm-list').detach();
    })
    
    // 삭제버튼 클릭시
    $(document).on('click', '.except4', function(){
    	var tmp = $(this).parent().siblings('input').eq(0).val();
    	for(var i = 0; i < $('.hidden-div2').children('div').length; i++){
    		var x2 = $('.hidden-div2').children('div').eq(i);
    		if(x2.attr('class') == tmp){
    			x2.detach();
    			$(this).parent().parent().detach();
    		}
    	}
    	
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	var selectPrice = $(this).parent().siblings('input').eq(1).val();
    	$('#latelyQuantity').val(Number(latelyQuantity) - 1);
    	$('#latelyPrice').val(Number(latelyPrice) - Number(selectPrice.replace(',','')));
    	var latelyPriceTmp = $('#latelyPrice').val();
		$('.count-and-price').text($('#latelyQuantity').val() + '개' + ' / ' + Number(latelyPriceTmp).toLocaleString('en') + '원');
    	
    	if($('.hidden-div2').children('div').length == 0){
    		$('.hidden-save-close').trigger('click');
    	}
    });
    
    
    
    $(document).on('click', '.button__wrap', function(){ // 상품 선택완료 버튼
    	if($('#addressModalCheck').val() == 1){
    		return false;
    	}
    	
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', '');
		$('body').attr('class', '');
		
    	$('.modal-wrap').detach();
    	
    	var latelyQuantity = $('#latelyQuantity').val();
    	var latelyPrice = $('#latelyPrice').val();
    	$('#oldQuantity').val(latelyQuantity);
    	$('#oldPrice').val(latelyPrice);
    	
    	var cloneElements = $('.hidden-div2').children('div').clone();
    	$('.hidden-div').empty();
    	cloneElements.appendTo('.hidden-div');
    	
    	if($('.hidden-div-real').children('div').length > 0){
    		var firstLength = $('.hidden-div-real').children('div').length;
		    for(var i = 0; i < $('.hidden-div').children('div').length; i++){
		    	var checkR = 0;
		    	for(var j = 0; j < firstLength; j++){
		    		if($('.hidden-div').children('div').eq(i).attr('class') == $('.hidden-div-real').children('div').eq(j).attr('class')){
		    			checkR++;
		    			break;
		    		}
		    	}
		    	if(checkR == 0){
		    		var cloneElements = $('.hidden-div').children('div').eq(i).clone();
		        	cloneElements.appendTo('.hidden-div-real');
		    	}
		    }
		    
		    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
		    	var checkR = 0;
		    	for(var j = 0; j < $('.hidden-div').children('div').length; j++){
		    		if($('.hidden-div-real').children('div').eq(i).attr('class') == $('.hidden-div').children('div').eq(j).attr('class')){
		    			checkR++;
		    			break;
		    		}
		    	}
		    	if(checkR == 0){
		    		$('.hidden-div-real').children('div').eq(i).append("<div class='checkDelete' style='display:none'></div>");
		    	}
		    }
		    $('.checkDelete').parent().detach();
	    }else{
	    	var cloneElements = $('.hidden-div').children('div').clone();
        	cloneElements.appendTo('.hidden-div-real');
	    }
    	
    	var saveItemCode = [], data = {};
		var saveTagMain = [];
		var savePrice = [];
		var savePriceSub = [];
		var saveItemName = [];
		var saveItemSize = [];
		var saveitemSizeSummary = [];
		var saveitemQuantity = [];
		var saveDisposable = [];
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	saveItemCode[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemCode').val();
	    	saveTagMain[i] = $('.hidden-div-real').children('div').eq(i).children('.saveTagMain').val();
	    	savePrice[i] = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    	savePriceSub[i] = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    	saveItemName[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemName').val();
	    	saveItemSize[i] = $('.hidden-div-real').children('div').eq(i).children('.saveItemSize').val();
	    	saveitemSizeSummary[i] = $('.hidden-div-real').children('div').eq(i).children('.saveitemSizeSummary').val();
	    	saveitemQuantity[i] = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    	saveDisposable[i] = $('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val();
	    }
	    
	    data.saveItemCode = saveItemCode;
	    data.saveTagMain = saveTagMain;
	    data.savePrice = savePrice;
	    data.savePriceSub = savePriceSub;
	    data.saveItemName = saveItemName;
	    data.saveItemSize = saveItemSize;
	    data.saveitemSizeSummary = saveitemSizeSummary;
	    data.saveitemQuantity = saveitemQuantity;
	    data.saveDisposable = saveDisposable;
	    jQuery.ajaxSettings.traditional = true; // ajax로 리스트 형식을 보내기 위한 셋팅
    	
    	if($('.hidden-div').children('div').length > 0){
    		$.ajax({
    			url : 'orderSaveComplete.do',
    			type : 'post',
    			dataType : 'html',
    			data : data,
    			success : function(htmlOut){
    				$('.order-selected-item-wrap').html(htmlOut);
    			}
    		});
    	}else{
    		$.ajax({
        		url : 'orderAllDeletePaging.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.order-selected-item-wrap').html(htmlOut);
        		}
        	});
    	}
	    
	    var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    var disposablePrice = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	disposablePrice = disposablePrice + Number($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() * 100);
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    
	    realPrice += disposablePrice;
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('en') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('en') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('click', '.swal2-title', function(){
    	if($('#addressModalCheck').val() == 1){
    		return false;
    	}
    	$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
    	const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	$('.swal2-container').detach();
		$('html').attr('class', 'mode-popup');
		$('body').attr('class', '');
    });
    
    $(document).on('click', '.form-number__control:even:even', function(){
    	if($(this).siblings('span').children('input').val() == 1){
    		return false;
    	}
    	// 돔 요소 자체를 가져오고 싶으면 [] 를 써서 인덱스를 지정해야 한다. 
		$(this).siblings('span').children('input')[0].stepDown();
		
    	var onePrice = $(this).siblings('input').eq(1).val().replace(',', '');
    	var oldPrice;
    	var onePriceSub = $(this).siblings('input').eq(2).val().replace(',', '');
    	var oldPriceSub;
    	var oldQuantity;
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		check++;
	    	}
	    	if(check != 0){
	    		oldPrice = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    		oldPrice = oldPrice.replace(',', '');
	    		var resultP = Number(oldPrice) - Number(onePrice);
	    		$(this).parent().parent().parent().find('.selected-item-price').children().text(Number(resultP).toLocaleString('en') + '원');
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(Number(resultP).toLocaleString('en'));
	    		
	    		oldPriceSub = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    		oldPriceSub = oldPriceSub.replace(',', '');
	    		var resultPS = Number(oldPriceSub) - Number(onePriceSub);
	    		$(this).parent().parent().parent().find('.selected-item-discount').text(Number(resultPS).toLocaleString('en'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(Number(resultPS).toLocaleString('en'));
	    		
	    		oldQuantity = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    		var resultQ = Number(oldQuantity) - 1;
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(resultQ);
	    		if($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() != 0){
	    			$(this).closest('.selected-item').find('.form-number__input').eq(1).children('input').val($(this).siblings('span').children('input').val());
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(resultQ);
	    			$(this).closest('.selected-item').find('em').eq(1).text((resultQ * 100).toLocaleString('en') + '원');
	    		}
	    		
	    		break;
	    	}
	    }
    	
    	var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    var disposablePrice = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	disposablePrice = disposablePrice + Number($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() * 100);
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    realPrice += disposablePrice;
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('en') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('en') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('click', '.form-number__control:odd:even', function(){
		$(this).siblings('span').children('input')[0].stepUp();
		
		var onePrice = $(this).siblings('input').eq(1).val().replace(',', '');
    	var oldPrice;
    	var onePriceSub = $(this).siblings('input').eq(2).val().replace(',', '');
    	var oldPriceSub;
    	var oldQuantity;
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		check++;
	    	}
	    	if(check != 0){
	    		oldPrice = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val();
	    		oldPrice = oldPrice.replace(',', '');
	    		var resultP = Number(oldPrice) + Number(onePrice);
	    		$(this).parent().parent().parent().find('.selected-item-price').children().text(Number(resultP).toLocaleString('en') + '원');
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(Number(resultP).toLocaleString('en'));
	    		
	    		oldPriceSub = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    		oldPriceSub = oldPriceSub.replace(',', '');
	    		var resultPS = Number(oldPriceSub) + Number(onePriceSub);
	    		$(this).parent().parent().parent().find('.selected-item-discount').text(Number(resultPS).toLocaleString('en'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(Number(resultPS).toLocaleString('en'));
	    		
	    		oldQuantity = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    		var resultQ = Number(oldQuantity) + 1;
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(resultQ);
	    		
	    		if($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() != 0){
	    			$(this).closest('.selected-item').find('.form-number__input').eq(1).children('input').val($(this).siblings('span').children('input').val());
		    		$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(resultQ);
		    		$(this).closest('.selected-item').find('em').eq(1).text((resultQ * 100).toLocaleString('en') + '원');
	    		}
	    		break;
	    	}
	    }
    	
    	var realPrice = 0;
	    var realPriceSub = 0;
	    var realQuantity = 0;
	    var disposablePrice = 0;
	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	disposablePrice = disposablePrice + Number($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() * 100);
	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    		realPriceSub += (tmp1 - tmp2);
	    	}
	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    }
	    realPrice += disposablePrice;
	    $('#realPrice').val(realPrice);
    	$('#realPriceSub').val(realPriceSub);
    	$('#realQuantity').val(realQuantity);
    	
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + realPrice.toLocaleString('en') + '원');
    	$('.info-content').eq(2).children().eq(1).text('- ' + realPriceSub.toLocaleString('en') + '원');
    	
    	if(realPrice < 10000){
    		var remainPrice = 10000 - realPrice;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice < 35000){
    		var remainPrice = 35000 - realPrice;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('change', '.form-number__input:even input', function(){
    	if($(this).val() < 1){
    		$(this).val(1);
    	}
    	if($(this).val() > 100){
    		$(this).val(100);
    	}
    	
    	var className = $(this).parent().siblings('input').eq(0).val();
    	var Quantity = $(this).val();
    	var price = $(this).parent().siblings('input').eq(1).val() * Quantity;
    	var priceSub = $(this).parent().siblings('input').eq(2).val() * Quantity;
    	
    	// 수량, 가격, 할인 전 가격
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
    		var check = 0;
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		$('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val(Quantity);
	    		$('.hidden-div-real').children('div').eq(i).children('.savePrice').val(Number(price).toLocaleString('en'));
	    		$('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val(Number(priceSub).toLocaleString('en'));
	    		
	    		if($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() != 0){
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(Quantity);
	    			$(this).closest('.selected-item').find('.form-number__input').eq(1).children('input').val($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val());
	    			$(this).closest('.selected-item').find('em').eq(1).text((Number(Quantity) * 100).toLocaleString('en') + '원');
	    		}
	    		
	    		$(this).closest('.selected-item-header__body').find('em').text(Number(price).toLocaleString('en') + "원");
	    		$(this).closest('.selected-item-header__body').find('.selected-item-discount').text(Number(priceSub).toLocaleString('en'));
	    		
	    		var realPrice = 0;
	    	    var realPriceSub = 0;
	    	    var realQuantity = 0;
	    	    var disposablePrice = 0;
	    	    for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	    	disposablePrice = disposablePrice + Number($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() * 100);
	    	    	realPrice += Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	    	if(Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', '')) > 0){
	    	    		var tmp1 = Number($('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val().replace(',', ''));
	    	    		var tmp2 = Number($('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', ''));
	    	    		realPriceSub = Number(realPriceSub) + Number(tmp1) - Number(tmp2);
	    	    	}
	    	    	realQuantity += Number($('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val());
	    	    }
	    	    realPrice += disposablePrice;
	    	    $('#realPrice').val(Number(realPrice));
	        	$('#realPriceSub').val(Number(realPriceSub));
	        	$('#realQuantity').val(Number(realQuantity));
	        	
	        	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice).toLocaleString('en') + '원');
	        	$('.info-content').eq(2).children().eq(1).text('- ' + Number(realPriceSub).toLocaleString('en') + '원');
	    		
	        	if(realPrice < 10000){
	        		var remainPrice = 10000 - realPrice;
	        		$.ajax({
	        			url : 'orderMinPrice.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(0).find('.min').detach();
	        				$('.info-content').eq(0).append(htmlOut);
	        				$('.info-content').eq(0).children().eq(2).val(0);
	        				button_activation();
	        			}
	        		})
	        		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
	        	}else{
	        		$('.info-content').eq(0).find('.min').detach();
	        		$('.info-content').eq(0).children().eq(2).val(1);
	        		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
	        	}
	        	
	        	if(realPrice < 35000){
	        		var remainPrice = 35000 - realPrice;
	        		$.ajax({
	        			url : 'orderMinPriceDelivery.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(1).find('.min').detach();
	        				$('.info-content').eq(1).append(htmlOut);
	        				$('.info-content').eq(1).children().eq(2).val(0);
	        				button_activation();
	        			}
	        		})
	        	}else{
	        		$('.info-content').eq(1).find('.min').detach();
	        		$('.info-content').eq(1).children().eq(2).val(1);
	        		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
	        	}
	        	
	    		break;
	    	}
    	}
    	
    	button_activation();
    });
    
    $(document).on('change', '.form-number__input:odd input', function(){
    	if($(this).val() < 1){
    		$(this).val(1);
    	}
    	if($(this).val() > 100){
    		$(this).val(100);
    	}
    	var className = $(this).parent().siblings('input').eq(0).val();
    	var saveDisposable = $(this).val();
    	var oldSaveDisposable = 0;
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		oldSaveDisposable = $('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val();
	    		$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(saveDisposable);
	    	}
    	}
    	$(this).closest('.row--v-end.row--h-between.selected-item-selected-options__price').find('em').text((saveDisposable * 100).toLocaleString('en') + '원');
    	var realPrice = $('#realPrice').val();
    	var realQuantity = $('#realQuantity').val();
    	if(oldSaveDisposable < saveDisposable){
    		saveDisposable = Number(saveDisposable - oldSaveDisposable);
    		$('#realPrice').val(Number(realPrice) + Number(saveDisposable) * 100);
    	}else{
    		saveDisposable = Number(oldSaveDisposable - saveDisposable);
    		$('#realPrice').val(Number(realPrice) - Number(saveDisposable) * 100);
    	}
    	var realPrice1 = $('#realPrice').val();
    	$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
    	
    	if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('click', '.form-number__control:odd:odd', function(){
    	// 돔 요소 자체를 가져오고 싶으면 [] 를 써서 인덱스를 지정해야 한다. 
		$(this).siblings('span').children('input')[0].stepUp();
    	var saveDisposable = $(this).siblings('span').children('input').val();
		for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(saveDisposable);
	    	}
		}
		var realPrice = $('#realPrice').val();
		var realQuantity = $('#realQuantity').val();
		$('#realPrice').val(Number(realPrice) + 100);
		
		var realPrice1 = $('#realPrice').val();
		$(this).closest('.row--v-end.row--h-between.selected-item-selected-options__price').find('em').text(Number(saveDisposable * 100).toLocaleString('en') + '원');
		$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
		
		if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('click', '.form-number__control:even:odd', function(){
    	if($(this).siblings('span').children('input').val() == 1){
    		return false;
    	}
    	// 돔 요소 자체를 가져오고 싶으면 [] 를 써서 인덱스를 지정해야 한다. 
		$(this).siblings('span').children('input')[0].stepDown();
    	var saveDisposable = $(this).siblings('span').children('input').val();
		for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == $(this).siblings('input').eq(0).val()){
	    		$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(saveDisposable);
	    	}
		}
		var realPrice = $('#realPrice').val();
		var realQuantity = $('#realQuantity').val();
		$('#realPrice').val(Number(realPrice) - 100);
		
		var realPrice1 = $('#realPrice').val();
		$(this).closest('.row--v-end.row--h-between.selected-item-selected-options__price').find('em').text(Number(saveDisposable * 100).toLocaleString('en') + '원');
		$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
		
		if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    
    
    $(document).on('click', '.check-svg.default', function(){
    	var className = $(this).closest('.selected-item').find('input').eq(0).val();
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		if($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() > 0){
	    			var oldDisposable = $('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val();
	    			var realPrice = $('#realPrice').val();
	    			$('#realPrice').val(Number(realPrice) - Number(oldDisposable) * 100);
	    			
	    			var realPrice1 = $('#realPrice').val();
	    			var realQuantity = $('#realQuantity').val();
	    			$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
	    			
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(0);
	    			$(this).closest('.selected-item-options').next().css('display','none');
	    		}else{
	    			var realPrice = $('#realPrice').val();
	    			$('#realPrice').val(Number(realPrice) + 100);
	    			
	    			var realPrice1 = $('#realPrice').val();
	    			var realQuantity = $('#realQuantity').val();
	    			$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
	    			
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(1);
	    			$(this).closest('.selected-item-options').next().css('display','');
	    			$(this).closest('.selected-item-options').next().find('em').text('100원');
	    			$(this).closest('.selected-item-options').next().find('.form-number__input').children('input').val(1);
	    		}
	    		break;
	    	}
    	}
    	
    	var realPrice1 = $('#realPrice').val();
    	
    	if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    
    
    $(document).on('click', 'label.row--v-center span', function(){
    	var className = $(this).closest('.selected-item').find('input').eq(0).val();
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		if($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val() > 0){
	    			var oldDisposable = $('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val();
	    			var realPrice = $('#realPrice').val();
	    			$('#realPrice').val(Number(realPrice) - Number(oldDisposable) * 100);
	    			
	    			var realPrice1 = $('#realPrice').val();
	    			var realQuantity = $('#realQuantity').val();
	    			$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
	    			
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(0);
	    			$(this).closest('.selected-item-options').next().css('display','none');
	    		}else{
	    			var realPrice = $('#realPrice').val();
	    			$('#realPrice').val(Number(realPrice) + 100);
	    			
	    			var realPrice1 = $('#realPrice').val();
	    			var realQuantity = $('#realQuantity').val();
	    			$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
	    			
	    			$('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val(1);
	    			$(this).closest('.selected-item-options').next().css('display','');
	    			$(this).closest('.selected-item-options').next().find('em').text('100원');
	    			$(this).closest('.selected-item-options').next().find('.form-number__input').children('input').val(1);
	    		}
	    		break;
	    	}
    	}
    	
    	var realPrice1 = $('#realPrice').val();
    	
    	if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    $(document).on('click','.delete-menu-btn', function(){
    	$("<div class='checkDelete' style='display:none'></div>").insertBefore(this);
    	$('html').attr('class', 'swal2-shown swal2-height-auto');
    	$('body').attr('class', 'swal2-shown swal2-height-auto');
    	$('noscript').attr('aria-hidden', 'true');
    	$('#__nuxt').attr('aria-hidden', 'true');
    	$.ajax({
    		url : 'orderDeleteCheckModal.do',
    		dataType : 'html',
    		type : 'post',
    		success : function(htmlOut){
    			$('body').append(htmlOut);
    		}
    	});
    });
    
    $(document).on('click', '#okBtn', function(){
    	$('html').attr('class', '');
    	$('body').attr('class', '');
    	$('noscript').removeAttr('aria-hidden');
    	$('#__nuxt').removeAttr('aria-hidden');
    	
    	
    	var className = $('.checkDelete').prev().val();
    	for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
	    	if($('.hidden-div-real').children('div').eq(i).attr('class') == className){
	    		var price = $('.hidden-div-real').children('div').eq(i).children('.savePrice').val().replace(',', '');
	    		var disposable = Number($('.hidden-div-real').children('div').eq(i).children('.saveDisposable').val()) * 100;
	    		var thisPrice = Number(price) + Number(disposable);
	    		var realPrice = $('#realPrice').val();
	    		$('#realPrice').val(Number(realPrice) - Number(thisPrice));
	    		var realPriceSub = $('#realPriceSub').val();
	    		
	    		var savePriceSub = $('.hidden-div-real').children('div').eq(i).children('.savePriceSub').val();
	    		if(savePriceSub != null && savePriceSub != '' && savePriceSub != 0){
	    			savePriceSub = savePriceSub.replace(',', '');
	    			var realSavePriceSub = Number(savePriceSub) - Number(price);
	    			$('#realPriceSub').val(Number(realPriceSub) - Number(realSavePriceSub));
	    		}
	    		
	    		var saveitemQuantity = $('.hidden-div-real').children('div').eq(i).children('.saveitemQuantity').val();
	    		var realQuantity1 = $('#realQuantity').val();
	    		$('#realQuantity').val(Number(realQuantity1) - Number(saveitemQuantity));
	    		
	    		$('.hidden-div-real').children('div').eq(i).detach();
	    		
	    		
	    		var realPrice1 = $('#realPrice').val();
	    		var realQuantity = $('#realQuantity').val();
	    		$('.info-content').eq(0).children().eq(1).text(realQuantity + '개' + ' / ' + Number(realPrice1).toLocaleString('en') + '원');
	    		var realPriceSub1 = $('#realPriceSub').val();
	    		$('.info-content').eq(2).children().eq(1).text('- ' + Number(realPriceSub1).toLocaleString('en') + '원');
	    		if(realPrice1 < 10000){
	        		var remainPrice = 10000 - realPrice1;
	        		$.ajax({
	        			url : 'orderMinPrice.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(0).find('.min').detach();
	        				$('.info-content').eq(0).append(htmlOut);
	        				$('.info-content').eq(0).children().eq(2).val(0);
	        				button_activation();
	        			}
	        		})
	        		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
	        	}else{
	        		$('.info-content').eq(0).find('.min').detach();
	        		$('.info-content').eq(0).children().eq(2).val(1);
	        		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
	        	}
	        	
	        	if(realPrice1 < 35000){
	        		var remainPrice = 35000 - realPrice1;
	        		$.ajax({
	        			url : 'orderMinPriceDelivery.do',
	        			type : 'post',
	        			dataType : 'html',
	        			data : {
	        				'remainPrice' : remainPrice
	        			},
	        			success : function(htmlOut){
	        				$('.info-content').eq(1).find('.min').detach();
	        				$('.info-content').eq(1).append(htmlOut);
	        				$('.info-content').eq(1).children().eq(2).val(0);
	        				button_activation();
	        			}
	        		})
	        	}else{
	        		$('.info-content').eq(1).find('.min').detach();
	        		$('.info-content').eq(1).children().eq(2).val(1);
	        		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
	        	}
	        	
	        	$('.checkDelete').closest('.selected-item').detach();
	    		
	    		break;
	    	}
    	}
    	
    	for(var i = 0; i < $('.hidden-div').children('div').length; i++){
	    	if($('.hidden-div').children('div').eq(i).attr('class') == className){
	    		var savePrice = $('.hidden-div').children('div').eq(i).find('.savePrice').val().replace(',', '');
	    		var oldPrice = $('#oldPrice').val();
	    		$('#oldPrice').val(Number(oldPrice) - Number(savePrice));
	    		$('#oldQuantity').val(Number($('#oldQuantity').val()) - 1);
	    		
	    		$('.hidden-div').children('div').eq(i).detach();
	    		break;
	    	}
    	}
    	
    	for(var i = 0; i < $('.hidden-div2').children('div').length; i++){
	    	if($('.hidden-div2').children('div').eq(i).attr('class') == className){
	    		var savePrice = $('.hidden-div2').children('div').eq(i).find('.savePrice').val().replace(',', '');
	    		var latelyPrice = $('#latelyPrice').val();
	    		$('#latelyPrice').val(Number(latelyPrice) - Number(savePrice));
	    		$('#latelyQuantity').val(Number($('#latelyQuantity').val()) - 1);
	    		
	    		$('.hidden-div2').children('div').eq(i).detach();
	    		break;
	    	}
    	}
    	
    	
    	if($('.hidden-div-real').children('div').length == 0){
    		$.ajax({
        		url : 'orderAllDeletePaging.do',
        		dataType : 'html',
        		success : function(htmlOut){
        			$('.order-selected-item-wrap').html(htmlOut);
        		}
        	});
    	}
    	
    	button_activation();
    })
    
    $(document).on('click', '#closeBtn', function(){
    	$('html').attr('class', '');
    	$('body').attr('class', '');
    	$('noscript').removeAttr('aria-hidden');
    	$('#__nuxt').removeAttr('aria-hidden');
    	$('.checkDelete').detach();
    });
    
    $(document).on('click', '.header-btn', function(){
    	$('html').attr('class', 'swal2-shown swal2-height-auto');
    	$('body').attr('class', 'swal2-shown swal2-height-auto');
    	$('noscript').attr('aria-hidden', 'true');
    	$('#__nuxt').attr('aria-hidden', 'true');
    	
    	$.ajax({
    		url : 'orderAllDeleteCheckModal.do',
    		dataType : 'html',
    		type : 'post',
    		success : function(htmlOut){
    			$('body').append(htmlOut);
    		}
    	});
    });
    
    $(document).on('click', '#okAllBtn', function(){
    	$('html').attr('class', '');
    	$('body').attr('class', '');
    	$('noscript').removeAttr('aria-hidden');
    	$('#__nuxt').removeAttr('aria-hidden');
    	
    	$('#realQuantity').val(0);
    	$('#realPrice').val(0);
    	$('#realPriceSub').val(0);
    	$('#oldQuantity').val(0);
    	$('#oldPrice').val(0);
    	$('#latelyQuantity').val(0);
    	$('#latelyPrice').val(0);
    	
    	$('.hidden-div-real').empty();
    	$('.hidden-div').empty();
    	$('.hidden-div2').empty();
    	
    	
    	$.ajax({
    		url : 'orderAllDeletePaging.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.order-selected-item-wrap').html(htmlOut);
    		}
    	});
    	
    	$('.info-content').eq(0).children().eq(1).text('0개 / 0원');
    	$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	$('.info-content').eq(2).children().eq(1).text('- 0원');
    	
    	var realPrice1 = $('#realPrice').val();
    	if(realPrice1 < 10000){
    		var remainPrice = 10000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPrice.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(0).find('.min').detach();
    				$('.info-content').eq(0).append(htmlOut);
    				$('.info-content').eq(0).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    		$('.info-content').eq(1).children().eq(1).text('0회 / 3,500원');
    	}else{
    		$('.info-content').eq(0).find('.min').detach();
    		$('.info-content').eq(0).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 3,500원');
    	}
    	
    	if(realPrice1 < 35000){
    		var remainPrice = 35000 - realPrice1;
    		$.ajax({
    			url : 'orderMinPriceDelivery.do',
    			type : 'post',
    			dataType : 'html',
    			data : {
    				'remainPrice' : remainPrice
    			},
    			success : function(htmlOut){
    				$('.info-content').eq(1).find('.min').detach();
    				$('.info-content').eq(1).append(htmlOut);
    				$('.info-content').eq(1).children().eq(2).val(0);
    				button_activation();
    			}
    		})
    	}else{
    		$('.info-content').eq(1).find('.min').detach();
    		$('.info-content').eq(1).children().eq(2).val(1);
    		$('.info-content').eq(1).children().eq(1).text('1회 / 0원');
    	}
    	
    	button_activation();
    });
    
    
    
    $(document).on('click', '#closeAllBtn', function(){
    	$('html').attr('class', '');
    	$('body').attr('class', '');
    	$('noscript').removeAttr('aria-hidden');
    	$('#__nuxt').removeAttr('aria-hidden');
    })
    
    
    
    
    var solidCheckYear = 0; // 현재 연, 월 (불변 값) 
    var solidCheckMonth = 0;
    var solidCheckDay = 0;
    var todayCheckYear = 0; // 현재 연, 월을 선택한 값
    var todayCheckMonth = 0;
    var todayCheckDay = 0;
    var currentCheckYear = 0; // 화살표로 넘길 시 임의로 저장하는 값
    var currentCheckMonth = 0;
    $(document).on('click', '#date', function(){
    	if($('#firstModalCheck').val() == 0){
    		$('#firstModalCheck').val(1);
        	
        	var today = new Date();

        	var todayYear = today.getFullYear();
        	var todayMonth = ('0' + (today.getMonth() + 1)).slice(-2);
        	var todayDay = ('0' + today.getDate()).slice(-2);
//         	var weekList = new Array('일', '월', '화', '수', '목', '금', '토');
//         	var todayWeek = weekList[today.getDay()];
//         	var todayGetDay = today.getDay();
			solidCheckYear = Number(todayYear);
			solidCheckMonth = Number(todayMonth);
			solidCheckDay = Number(todayDay);
        	todayCheckYear = Number(todayYear);
        	todayCheckMonth = Number(todayMonth);
        	todayCheckDay = Number(todayDay);
        	currentCheckYear = Number(todayYear);
        	currentCheckMonth = Number(todayMonth);
        	
        	var getD = new Date(Number(solidCheckYear), Number(solidCheckMonth) - 1, Number(01));
        	var year = getD.getFullYear();
        	var month = ('0' + (getD.getMonth() + 1)).slice(-2);
        	var day = ('0' + getD.getDate()).slice(-2);
        	var getDay = getD.getDay();
        	
        	$('.vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper is-interactive');
        	$('.vc-popover-content-wrapper').css('position', 'absolute');
        	$('.vc-popover-content-wrapper').css('transform', 'translate3d(0px, -259px, 0px)');
        	$('.vc-popover-content-wrapper').css('top', '0px');
        	$('.vc-popover-content-wrapper').css('left', '0px');
        	$('.vc-popover-content-wrapper').css('will-change', 'transform');
        	$('.vc-popover-content-wrapper').attr('x-placement', 'top-start');
        	
        	$.ajax({
        		url : 'orderDateCalendar.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'year' : year,
        			'month' : month,
        			'day' : todayDay,
        			'getDay' : getDay
        		},
        		success : function(htmlOut){
        			$('.vc-popover-content-wrapper').html(htmlOut);
        			setTimeout(function() {
        	    		$('.vc-popover-content').attr('class', 'vc-popover-content direction-top vc-text-gray-900 vc-bg-white vc-border vc-border-gray-400 vc-rounded-lg');
        			}, 200);
        		}
        	})
    	}else{
    		$('#firstModalCheck').val(0);
    		$('#secondModalCheck').val(0);
    		$('#thirdModalCheck').val(0);
    		$('.vc-popover-content.direction-top.vc-text-gray-900.vc-bg-white.vc-border.vc-border-gray-400.vc-rounded-lg').attr('class', 'vc-popover-content direction-top vc-text-gray-900 vc-bg-white vc-border vc-border-gray-400 vc-rounded-lg slide-fade-leave-active slide-fade-leave-to');
    		setTimeout(function() {
    			$('.vc-popover-content.direction-top.vc-text-gray-900.vc-bg-white.vc-border.vc-border-gray-400.vc-rounded-lg').detach();
    			$('.v-date-custom .vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper');
    			$('.v-date-custom .vc-popover-content-wrapper').removeAttr('style');
            	$('.v-date-custom .vc-popover-content-wrapper').removeAttr('x-placement');
			}, 300);
    	}
    	
    });
    
    $(document).on('click', '.vc-title-wrapper .vc-title.vc-text-lg.vc-text-gray-800.vc-font-semibold', function(){
    	if($('#thirdModalCheck').val() == 1 && $('#secondModalCheck').val() == 0){
    		$('#thirdModalCheck').val(0);
    	}
    	if($('#secondModalCheck').val() == 0){
    		$('#secondModalCheck').val(1);
        	
        	$('.vc-title-wrapper .vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper is-interactive');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').attr('x-placement', 'bottom');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').css('position', 'absolute');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').css('transform', 'translate3d(-38px, 27px, 0px)');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').css('top', '0px');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').css('left', '0px');
        	$('.vc-title-wrapper .vc-popover-content-wrapper').css('will-change', 'transform');
        	
        	currentCheckYear = todayCheckYear;
        	currentCheckMonth = todayCheckMonth;
        	
        	$.ajax({
        		url : 'orderSelectPopover.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'year' : todayCheckYear,
        			'month' : todayCheckMonth,
        			'currentCheckYear' : currentCheckYear,
        			'currentCheckMonth' : currentCheckMonth,
        			'solidCheckYear' : solidCheckYear,
        			'solidCheckMonth' : solidCheckMonth,
        			'realCheck' : 1
        		},
        		success : function(htmlOut){
        			$('#modalWrap1').html(htmlOut);
        			
        			if(todayCheckYear == currentCheckYear){
    	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
    	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == currentCheckYear + '/' + currentCheckMonth + '/00'){
    	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
    	    					break;
    	    				}
    	    			}
        			}
        			setTimeout(function() {
        	    		$('.vc-popover-content.direction-bottom.vc-rounded-lg.vc-text-sm.vc-font-semibold.vc-text-white.vc-bg-gray-800.vc-border.vc-border-gray-700.vc-p-1.vc-shadow').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow');
        			}, 200);
        		}
        	});
    	}else{
    		$('#secondModalCheck').val(0);
			$('.vc-title-wrapper .vc-popover-content-wrapper .vc-popover-content').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow slide-fade-leave-active slide-fade-leave-to');
			setTimeout(function() {
				$('.vc-title-wrapper .vc-popover-content-wrapper .vc-popover-content').detach();
				$('.vc-title-wrapper .vc-popover-content-wrapper').removeAttr('style');
    			$('.vc-title-wrapper .vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper');
    			$('.vc-title-wrapper .vc-popover-content-wrapper').removeAttr('x-placement');
    			
			}, 300);
    	}
    	
    });
    
    $(document).on('click', '.vc-svg-icon:even', function(){
    	// 이전 연도
    	
    	if($('#secondModalCheck').val() == 0){
    		return false;
    	}
    	
    	currentCheckYear--;
    	$.ajax({
    		url : 'orderSelectPopover.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'month' : todayCheckMonth,
    			'currentCheckYear' : currentCheckYear,
    			'currentCheckMonth' : currentCheckMonth,
    			'solidCheckYear' : solidCheckYear,
    			'solidCheckMonth' : solidCheckMonth,
    			'realCheck' : 0
    		},
    		success : function(htmlOut){
    			$('#modalWrap1').html(htmlOut);
    			if(todayCheckYear == currentCheckYear){
	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == currentCheckYear + '/' + currentCheckMonth + '/00'){
	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
	    					break;
	    				}
	    			}
    			}
    			setTimeout(function() {
    	    		$('.vc-popover-content.direction-bottom.vc-rounded-lg.vc-text-sm.vc-font-semibold.vc-text-white.vc-bg-gray-800.vc-border.vc-border-gray-700.vc-p-1.vc-shadow').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow');
    			}, 200);
    		}
    	});
    });
    
    $(document).on('click', '.vc-svg-icon:odd', function(){
    	// 다음 연도
    	
    	if($('#secondModalCheck').val() == 0){
    		return false;
    	}
    	currentCheckYear++;
    	$.ajax({
    		url : 'orderSelectPopover.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'month' : todayCheckMonth,
    			'currentCheckYear' : currentCheckYear,
    			'currentCheckMonth' : currentCheckMonth,
    			'solidCheckYear' : solidCheckYear,
    			'solidCheckMonth' : solidCheckMonth,
    			'realCheck' : 0
    		},
    		success : function(htmlOut){
    			$('#modalWrap1').html(htmlOut);
    			
    			if(todayCheckYear == currentCheckYear){
	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == currentCheckYear + '/' + currentCheckMonth + '/00'){
	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
	    					break;
	    				}
	    			}
    			}
    			setTimeout(function() {
    	    		$('.vc-popover-content.direction-bottom.vc-rounded-lg.vc-text-sm.vc-font-semibold.vc-text-white.vc-bg-gray-800.vc-border.vc-border-gray-700.vc-p-1.vc-shadow').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow');
    			}, 200);
    		}
    	});
    });
    
    $(document).on('click', '.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent', function(){
    	// 포커싱은 아니지만 선택할 수 있는 달 이벤트
    	// 달을 찍을 때 todayCheckYear, todayCheckMonth 에 저장하고 닫기
    	if($('#thirdModalCheck').val() == 1){
    		return false;
    	}
    	
    	var arr = $(this).attr('id').split('/');
    	todayCheckYear = arr[0];
    	todayCheckMonth = arr[1];
    	currentCheckYear = arr[0];
    	currentCheckMonth = arr[1];
    	
    	var getD = new Date(Number(todayCheckYear), Number(todayCheckMonth) - 1, Number(01));
    	var year = getD.getFullYear();
    	var month = ('0' + (getD.getMonth() + 1)).slice(-2);
    	var day = ('0' + getD.getDate()).slice(-2);
    	day = Number(day) - 1;
    	var getDay = getD.getDay();
    	
    	if(todayCheckYear == solidCheckYear && todayCheckMonth == solidCheckMonth){
    		day = solidCheckDay;
    	}
    	
    	$.ajax({
    		url : 'orderDateCalendar.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'month' : todayCheckMonth, 
    			'getDay' : getDay,
    			'day' : day
    		},
    		success : function(htmlOut){
				$('.vc-title-wrapper .vc-popover-content-wrapper .vc-popover-content').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow slide-fade-leave-active slide-fade-leave-to');
				$('#secondModalCheck').val(0);
    			setTimeout(function() {
    				$('.vc-title-wrapper .vc-popover-content-wrapper .vc-popover-content').detach();
    				$('.vc-title-wrapper .vc-popover-content-wrapper').removeAttr('style');
        			$('.vc-title-wrapper .vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper');
        			$('.vc-title-wrapper .vc-popover-content-wrapper').removeAttr('x-placement');
        			
        			$('.vc-popover-content-wrapper').html(htmlOut);
        			setTimeout(function() {
        	    		$('.vc-popover-content').attr('class', 'vc-popover-content direction-top vc-text-gray-900 vc-bg-white vc-border vc-border-gray-400 vc-rounded-lg');
        	    		
        			}, 200);
    			}, 200);
    		}
    	})
    });
    
    $(document).on('click', '.vc-nav-title', function(){
    	if($('#secondModalCheck').val() == 0){
    		$('#secondModalCheck').val(1);
    		$('#thirdModalCheck').val(0);
    		
    		$.ajax({
        		url : 'orderSelectPopover.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'year' : todayCheckYear,
        			'month' : todayCheckMonth,
        			'currentCheckYear' : currentCheckYear,
        			'currentCheckMonth' : currentCheckMonth,
        			'solidCheckYear' : solidCheckYear,
        			'solidCheckMonth' : solidCheckMonth,
        			'realCheck' : 0
        		},
        		success : function(htmlOut){
        			$('#modalWrap1').html(htmlOut);
        			if(todayCheckYear == currentCheckYear){
    	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
    	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == todayCheckYear + '/' + todayCheckMonth + '/00'){
    	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
    	    					break;
    	    				}
    	    			}
        			}
        			setTimeout(function() {
        	    		$('.vc-popover-content.direction-bottom.vc-rounded-lg.vc-text-sm.vc-font-semibold.vc-text-white.vc-bg-gray-800.vc-border.vc-border-gray-700.vc-p-1.vc-shadow').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow');
        			}, 200);
        		}
        	});
    		
    	}else{
    		$('#secondModalCheck').val(0);
    		$('#thirdModalCheck').val(1);
    		
    		$.ajax({
        		url : 'orderSelectPopover2.do',
        		dataType : 'html',
        		type : 'post',
        		data : {
        			'year' : todayCheckYear,
        			'currentCheckYear' : currentCheckYear,
        			'solidCheckYear' : solidCheckYear
        		},
        		success : function(htmlOut){
        			$('#modalWrap1').html(htmlOut);
        			
   	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
   	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == todayCheckYear + '/00/00'){
   	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
   	    					break;
   	    				}
   	    			}
        			
        		}
        	});
    		
    	}
    });
    
    $(document).on('click', '.vc-svg-icon:even', function(){
    	// 이전 연도들
    	if($('#thirdModalCheck').val() == 0){
    		return false;
    	}
    	
    	currentCheckYear -= 12;
    	
    	$.ajax({
    		url : 'orderSelectPopover2.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'currentCheckYear' : currentCheckYear,
    			'solidCheckYear' : solidCheckYear
    		},
    		success : function(htmlOut){
    			$('#modalWrap1').html(htmlOut);
    			
	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == todayCheckYear + '/00/00'){
	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
	    					break;
	    				}
	    			}
    			
    		}
    	});
    });
    
    
    $(document).on('click', '.vc-svg-icon:odd', function(){
    	// 다음 연도들
    	if($('#thirdModalCheck').val() == 0){
    		return false;
    	}
    	
		currentCheckYear = Number(currentCheckYear) + 12;
    	
    	$.ajax({
    		url : 'orderSelectPopover2.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'currentCheckYear' : currentCheckYear,
    			'solidCheckYear' : solidCheckYear
    		},
    		success : function(htmlOut){
    			$('#modalWrap1').html(htmlOut);
    			
    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == todayCheckYear + '/00/00'){
    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
    					break;
    				}
    			}
    		}
    	});
    });
    
    
    $(document).on('click', '.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent', function(){
    	if($('#secondModalCheck').val() == 1){
    		return false;
    	}
    	
    	var arr = $(this).attr('id').split('/');
    	currentCheckYear = arr[0];
    	
    	$.ajax({
    		url : 'orderSelectPopover.do',
    		dataType : 'html',
    		type : 'post',
    		data : {
    			'year' : todayCheckYear,
    			'month' : todayCheckMonth,
    			'currentCheckYear' : currentCheckYear,
    			'currentCheckMonth' : currentCheckMonth,
    			'solidCheckYear' : solidCheckYear,
    			'solidCheckMonth' : solidCheckMonth,
    			'realCheck' : 0
    		},
    		success : function(htmlOut){
    			$('#secondModalCheck').val(1);
    			$('#thirdModalCheck').val(0);
    			$('#modalWrap1').html(htmlOut);
    			if(todayCheckYear == currentCheckYear){
	    			for(var i = 0; i < $('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').length; i++){
	    				if($('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('id') == todayCheckYear + '/' + todayCheckMonth + '/00'){
	    					$('.vc-w-12.vc-font-semibold.vc-cursor-pointer.vc-text-center.vc-leading-snug.vc-py-1.vc-rounded.vc-border-2.vc-border-transparent').eq(i).attr('class', 'vc-w-12 vc-font-semibold vc-cursor-pointer vc-text-center vc-leading-snug vc-py-1 vc-rounded vc-border-2 vc-border-transparent hover:vc-bg-gray-900 hover:vc-shadow-inner hover:vc-text-white focus:vc-border-indigo-600 vc-bg-indigo-100 vc-text-indigo-900 vc-border-transparent vc-font-bold vc-shadow vc-grid-focus');
	    					break;
	    				}
	    			}
    			}
    			setTimeout(function() {
    	    		$('.vc-popover-content.direction-bottom.vc-rounded-lg.vc-text-sm.vc-font-semibold.vc-text-white.vc-bg-gray-800.vc-border.vc-border-gray-700.vc-p-1.vc-shadow').attr('class', 'vc-popover-content direction-bottom vc-rounded-lg vc-text-sm vc-font-semibold vc-text-white vc-bg-gray-800 vc-border vc-border-gray-700 vc-p-1 vc-shadow');
    			}, 200);
    		}
    	});
    });
    
    
    $(document).on('click', '.vc-day-content.vc-focusable.vc-font-medium.vc-text-sm.vc-cursor-pointer.real-check', function(){
		
    	// 달력에서 최종 날짜 선택
    	
		$('#firstModalCheck').val(0);
    	$('#secondModalCheck').val(0);
		$('#thirdModalCheck').val(0);
		$('#checkCalendar').val(1);
		
		var arr = $(this).attr('id').split('/');
		year = arr[0];
		month = arr[1];
		day = arr[2];
		
		$('#date').val(year + '-' + month + '-' + day);
		$('.vc-popover-content.direction-top.vc-text-gray-900.vc-bg-white.vc-border.vc-border-gray-400.vc-rounded-lg').attr('class', 'vc-popover-content direction-top vc-text-gray-900 vc-bg-white vc-border vc-border-gray-400 vc-rounded-lg slide-fade-leave-active slide-fade-leave-to');
		setTimeout(function() {
			$('.vc-popover-content.direction-top.vc-text-gray-900.vc-bg-white.vc-border.vc-border-gray-400.vc-rounded-lg').detach();
			$('.v-date-custom .vc-popover-content-wrapper').attr('class', 'vc-popover-content-wrapper');
			$('.v-date-custom .vc-popover-content-wrapper').removeAttr('style');
        	$('.v-date-custom .vc-popover-content-wrapper').removeAttr('x-placement');
		}, 300);
		
		button_activation();
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
	    	    				url : 'orderMorningBesongji.do',
	    	    				dataType : 'html',
	    	    				success : function(htmlOut){
	    	    					$('.order-address-wrap').html(htmlOut);
	    	    					button_activation();
	    	    				}
	    	    			})
    	    			}else{
    	    				$.ajax({
	    	    				url : 'orderParcelBesongji.do',
	    	    				dataType : 'html',
	    	    				success : function(htmlOut){
	    	    					$('.order-address-wrap').html(htmlOut);
	    	    					button_activation();
	    	    				}
	    	    			})
    	    			}
    	    		}
    	    	});
    		}
    	});
    	
    	button_activation();
    });
    
    
    // 기본 배송지 설정 체크 박스
    $(document).on('click', '.defaultBesongji1', function(){
    	if($('#defaultBesongjiCheck').val() == 'n'){
    		$('#defaultBesongjiCheck').val('y');
    	}else{
    		$('#defaultBesongjiCheck').val('n');
    	}
    })
    
    
    // 기본 배송지 설정 체크 한글
    $(document).on('click', '.defaultBesongji2', function(){
    	if($('#defaultBesongjiCheck').val() == 'n'){
    		$('#defaultBesongjiCheck').val('y');
    	}else{
    		$('#defaultBesongjiCheck').val('n');
    	}
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
    
    
    // 새벽배송 버튼
    $(document).on('click', '.delivery-morning', function(){
    	$('#deliveryType').val(0);
    	$.ajax({
    		url : 'orderMorningBesongji.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.order-address-wrap').html(htmlOut);
    			$('.morning-parcel-desc-text').detach();
    			$('.order-type-wrap').next().append('<div data-v-064d23aa="" class="morning-parcel-desc-text">오후 5시 전까지 주문하면 다음 날 새벽에 도착합니다.</div>');
    			button_activation();
    		}
    	})
    })
    
    
    // 택배배송 버튼
    $(document).on('click', '.delivery-parcel', function(){
    	$('#deliveryType').val(1);
    	$.ajax({
    		url : 'orderParcelBesongji.do',
    		dataType : 'html',
    		success : function(htmlOut){
    			$('.order-address-wrap').html(htmlOut);
    			$('.morning-parcel-desc-text').detach();
    			$('.order-type-wrap').next().append('<div data-v-064d23aa="" class="morning-parcel-desc-text">오후 5시 전까지 주문하면 당일 발송됩니다.</div>');
    			button_activation();
    		}
    	})
    });
    
    
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
    	    		}
    	    	})
    		}
    	})
    });
 	
 	
 	// 배송지 목록 선택 버튼
 	$(document).on('click', '.button.button--side-padding.button--size-small', function(){
 		var member_zipcode_code = $(this).closest('li').find('input').val();
 		$('.modal').detach();
 		$.ajax({
 			url : 'orderCommonBesongji.do',
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
 	
 	// 배송지 목록 선택 버튼
 	$(document).on('click', '.button__wrap.delivery_select', function(){
 		var member_zipcode_code = $(this).closest('li').find('input').val();
 		$('.modal').detach();
 		
 		$('.swal2-container.swal2-bottom.toast-container-class.swal2-backdrop-show').detach();
 		const TimeoutId = setTimeout(() => console.log('timeout'), 1000);
    	for (let i = 0; i < TimeoutId; i++) {
    	  clearTimeout(i);
    	}
    	
 		$.ajax({
 			url : 'orderCommonBesongji.do',
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
 	
 	
 	// 구매하기 버튼
 	$(document).on('click', '.order-result-payment .button.button--size-large', function(){ // todo
//  		$(location).attr("href", "paymentSingle.do");
 	
 		var form = document.createElement('form'); // 폼객체 생성
 		for(var i = 0; i < $('.hidden-div-real').children('div').length; i++){
 			
 			// 주문 상품 1
 			var saveItemName = $('.hidden-div-real').children('div').eq(i).find('.saveItemName').val();
 			var saveItemSize = $('.hidden-div-real').children('div').eq(i).find('.saveItemSize').val();
 			var ns = saveItemName + '/' + saveItemSize;
 			
 			var objs1;
	        objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs1.setAttribute('name', 'paymentSingleList[' + i + '].paymentItem'); // 객체이름
	        objs1.setAttribute('value', ns); //객체값
	        form.appendChild(objs1);
 			
	        
	        // 주문 상품 2
	        var saveDisposable = $('.hidden-div-real').children('div').eq(i).find('.saveDisposable').val();
	        var saveDisposableComP = '';
	        if(saveDisposable == 0){
	        	saveDisposableComP += '선택안함';
	        }else{
	        	saveDisposableComP += saveDisposable + '개';
	        }
	        
	        var objs2;
	        objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs2.setAttribute('name', 'paymentSingleList[' + i + '].paymentDisposable'); // 객체이름
	        objs2.setAttribute('value', saveDisposableComP); //객체값
	        form.appendChild(objs2);
	        
	        
	        // 수량
	        var saveitemQuantity = $('.hidden-div-real').children('div').eq(i).find('.saveitemQuantity').val();
	        
	        var objs3;
	        objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs3.setAttribute('name', 'paymentSingleList[' + i + '].paymentItemQuantity'); // 객체이름
	        objs3.setAttribute('value', saveitemQuantity); //객체값
	        form.appendChild(objs3);
	        
	        
	        // 가격
	        var savePrice = 0;
	        
	        if($('.hidden-div-real').children('div').eq(i).find('.savePriceSub').val().replace(',', '') == 0){
	        	savePrice = Number($('.hidden-div-real').children('div').eq(i).find('.savePrice').val().replace(',', '')) + (Number($('.hidden-div-real').children('div').eq(i).find('.saveDisposable').val()) * 100);
	        }else{
	        	savePrice = Number($('.hidden-div-real').children('div').eq(i).find('.savePriceSub').val().replace(',', '')) + (Number($('.hidden-div-real').children('div').eq(i).find('.saveDisposable').val()) * 100);
	        }
	        
	        savePrice = savePrice.toLocaleString('en');
	        
	        var objs4;
	        objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs4.setAttribute('name', 'paymentSingleList[' + i + '].paymentPrice'); // 객체이름
	        objs4.setAttribute('value', savePrice); //객체값
	        form.appendChild(objs4);
	        
	        
	        // 할인 금액
	        var salePrice = 0;
	        
	        if($('.hidden-div-real').children('div').eq(i).find('.savePriceSub').val().replace(',', '') == 0){
	        	salePrice = 0;
	        }else{
	        	salePrice = Number($('.hidden-div-real').children('div').eq(i).find('.savePriceSub').val().replace(',', '')) - Number($('.hidden-div-real').children('div').eq(i).find('.savePrice').val().replace(',', ''));
	        }
	        salePrice = salePrice.toLocaleString('en');
	        
	        var objs5;
	        objs5 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs5.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs5.setAttribute('name', 'paymentSingleList[' + i + '].paymentSalePrice'); // 객체이름
	        objs5.setAttribute('value', salePrice); //객체값
	        form.appendChild(objs5);
 		}
 		
 		
 		// 수령일
 		var paymentDeliveryDate = $('.date-picker-input').val();
 		
 		var objs6;
        objs6 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs6.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs6.setAttribute('name', 'paymentDeliveryDate'); // 객체이름
        objs6.setAttribute('value', paymentDeliveryDate); //객체값
        form.appendChild(objs6);
        
        
        // 배송비
        var paymentDeliveryPrice = 0;
        
        if($('.info-content').eq(1).children().eq(2).val() == 0){
        	paymentDeliveryPrice = '3,500';
        }
        
        var objs7;
        objs7 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs7.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs7.setAttribute('name', 'paymentDeliveryPrice'); // 객체이름
        objs7.setAttribute('value', paymentDeliveryPrice); //객체값
        form.appendChild(objs7);
        
        
        // 결제예상금액
        var paymentPredictionPrice = 0;
        
        if($('.info-content').eq(1).children().eq(2).val() == 1){
        	paymentPredictionPrice = Number($('#realPrice').val());
        }else{
        	paymentPredictionPrice = Number($('#realPrice').val()) + 3500;
        }
        paymentPredictionPrice = paymentPredictionPrice.toLocaleString('en');
        
        var objs8;
        objs8 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs8.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs8.setAttribute('name', 'paymentPredictionPrice'); // 객체이름
        objs8.setAttribute('value', paymentPredictionPrice); //객체값
        form.appendChild(objs8);
        
        
        // 배송 방법
        var paymentDeliveryType = '';
        
        if($('#deliveryType').val() == 0){
        	paymentDeliveryType = '새벽배송';
        }else{
        	paymentDeliveryType = '택배배송';
        }
        
        var objs9;
        objs9 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs9.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs9.setAttribute('name', 'paymentDeliveryType'); // 객체이름
        objs9.setAttribute('value', paymentDeliveryType); //객체값
        form.appendChild(objs9);
        
        
        // 배송 방법 2
        var paymentDeliveryTypeCheck = $('#deliveryType').val();
        
        var objs20;
        objs20 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs20.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs20.setAttribute('name', 'paymentDeliveryTypeCheck'); // 객체이름
        objs20.setAttribute('value', paymentDeliveryTypeCheck); //객체값
        form.appendChild(objs20);
        
        
        // 배송 예정 일시
        var paymentPredictionDate = '';
        
        var arr = $('.date-picker-input').val().split('-');
        var year = arr[0];
        var month = String(arr[1]);
        var day = String(arr[2]);
        if(month.length == 1){
        	month = '0' + month;
        }
        if(day.length == 1){
        	day = '0' + day;
        }
        
        paymentPredictionDate = year + '-' + month + '-' + day;
        
        if($('#deliveryType').val() == 0){ 
        	paymentPredictionDate += ' 00:00-07:00';
        }
        
        var objs10;
        objs10 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs10.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs10.setAttribute('name', 'paymentPredictionDate'); // 객체이름
        objs10.setAttribute('value', paymentPredictionDate); //객체값
        form.appendChild(objs10);
        
        
        // 배송 예정 일시 요약
        var paymentPredictionDateSummary = '';
        
        if($('#deliveryType').val() == 0){ 
        	paymentPredictionDateSummary = '예정보다 빠르게 배송될 수 있습니다 (배송 후 문자 안내)';
        }else{
        	paymentPredictionDateSummary = '택배사의 사정에 따라 예정보다 지연될 수 있습니다.';
        }
        
        var objs11;
        objs11 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs11.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs11.setAttribute('name', 'paymentPredictionDateSummary'); // 객체이름
        objs11.setAttribute('value', paymentPredictionDateSummary); //객체값
        form.appendChild(objs11);
        
        
        // 배송지1
        var paymentShippingAddress1 = $('.subject span').text();
        
        var objs12;
        objs12 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs12.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs12.setAttribute('name', 'paymentShippingAddress1'); // 객체이름
        objs12.setAttribute('value', paymentShippingAddress1); //객체값
        form.appendChild(objs12);
        
        
        // 배송지2
        var paymentShippingAddress2 = $('.description').text();
        
        var objs13;
        objs13 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs13.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs13.setAttribute('name', 'paymentShippingAddress2'); // 객체이름
        objs13.setAttribute('value', paymentShippingAddress2); //객체값
        form.appendChild(objs13);
        
        
        // 배송지3 (배송지 고유 코드)
        var paymentShippingAddress3 = $('.description').next().val();
        
        var objs14;
        objs14 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs14.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs14.setAttribute('name', 'paymentShippingAddress3'); // 객체이름
        objs14.setAttribute('value', paymentShippingAddress3); //객체값
        form.appendChild(objs14);
        
        
        // 상품 금액
        var paymentFinalPrice = (Number($('#realPrice').val()) + Number($('#realPriceSub').val())).toLocaleString('en');
        
        var objs15;
        objs15 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs15.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs15.setAttribute('name', 'paymentFinalPrice'); // 객체이름
        objs15.setAttribute('value', paymentFinalPrice); //객체값
        form.appendChild(objs15);
        
        
        // 상품 할인
        var paymentFinalSalePrice = Number($('#realPriceSub').val()).toLocaleString('en');
        
        var objs16;
        objs16 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs16.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs16.setAttribute('name', 'paymentFinalSalePrice'); // 객체이름
        objs16.setAttribute('value', paymentFinalSalePrice); //객체값
        form.appendChild(objs16);
        
        
        // 배송비
        var paymentFinalDeliveryPrice = '';
        
        if($('.info-content').eq(1).children().eq(2).val() == 1){
        	paymentFinalDeliveryPrice = 0;
        }else{
        	paymentFinalDeliveryPrice = '3,500';
        }
        
        var objs17;
        objs17 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs17.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs17.setAttribute('name', 'paymentFinalDeliveryPrice'); // 객체이름
        objs17.setAttribute('value', paymentFinalDeliveryPrice); //객체값
        form.appendChild(objs17);
        
        
        // 배송비 할인
        var paymentFinalDeliverySalePrice = '';
        
        if($('.info-content').eq(1).children().eq(2).val() == 1){
        	paymentFinalDeliverySalePrice = '3,500';
        }else{
        	paymentFinalDeliverySalePrice = 0;
        }
        
        var objs18;
        objs18 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs18.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs18.setAttribute('name', 'paymentFinalDeliverySalePrice'); // 객체이름
        objs18.setAttribute('value', paymentFinalDeliverySalePrice); //객체값
        form.appendChild(objs18);
        
        
        // 최종 결제금액
        var paymentRealFinalPrice = Number($('#realPrice').val());
        
        if($('.info-content').eq(1).children().eq(2).val() == 0){
        	paymentRealFinalPrice += 3500;
        }
        paymentRealFinalPrice = paymentRealFinalPrice.toLocaleString('en');
        
        var objs19;
        objs19 = document.createElement('input'); // 값이 들어있는 녀석의 형식
        objs19.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
        objs19.setAttribute('name', 'paymentRealFinalPrice'); // 객체이름
        objs19.setAttribute('value', paymentRealFinalPrice); //객체값
        form.appendChild(objs19);
        
 		
        form.setAttribute('method', 'post'); //get,post 가능
        form.setAttribute('action', "paymentSingle.do"); //보내는 url
        document.body.appendChild(form);
        form.submit();
 	})
    
 });
</script>
</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WWVZF4F&" height="0" width="0" style="display: none; visibility: hidden" title="gtm"></iframe>
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
					<div class="hidden-div-real">
						<c:forEach var="orderItemCode" items="${orderItemCode }" varStatus="i">
							<div class="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
								<input type="hidden" value="${orderItemCode }" class="saveItemCode">
								<input type="hidden" value="${orderTagMain[i.index]}" class="saveTagMain">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePrice[i.index] * orderQuantity[i.index] + 100 * orderQuantity[i.index] }" pattern="#,###" />" class="savePrice">
								<input type="hidden" value="${orderItem[i.index].item_name }" class="saveItemName">
								<input type="hidden" value="${orderItemSize[i.index] }" class="saveItemSize">
								<input type="hidden" value="${orderItemSizeSummary[i.index]}" class="saveitemSizeSummary">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePriceSub[i.index] * orderQuantity[i.index] }" pattern="#,###" />" class="savePriceSub">
								<input type="hidden" value="${orderQuantity[i.index] }" class="saveDisposable">
								<input type="hidden" value="${orderQuantity[i.index] }" class="saveitemQuantity">
							</div>
						</c:forEach>
					</div>
					<div class="hidden-div">
						<c:forEach var="orderItemCode" items="${orderItemCode }" varStatus="i">
							<div class="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
								<input type="hidden" value="${orderItemCode }" class="saveItemCode">
								<input type="hidden" value="${orderTagMain[i.index]}" class="saveTagMain">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePrice[i.index] }" pattern="#,###" />" class="savePrice">
								<input type="hidden" value="${orderItem[i.index].item_name }" class="saveItemName">
								<input type="hidden" value="${orderItemSize[i.index] }" class="saveItemSize">
								<input type="hidden" value="${orderItemSizeSummary[i.index]}" class="saveitemSizeSummary">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePriceSub[i.index] }" pattern="#,###" />" class="savePriceSub">
								<input type="hidden" value="1" class="saveDisposable">
								<input type="hidden" value="1" class="saveitemQuantity">
							</div>
						</c:forEach>
					</div>
					<div class="hidden-div2">
						<c:forEach var="orderItemCode" items="${orderItemCode }" varStatus="i">
							<div class="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
								<input type="hidden" value="${orderItemCode }" class="saveItemCode">
								<input type="hidden" value="${orderTagMain[i.index]}" class="saveTagMain">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePrice[i.index] }" pattern="#,###" />" class="savePrice">
								<input type="hidden" value="${orderItem[i.index].item_name }" class="saveItemName">
								<input type="hidden" value="${orderItemSize[i.index] }" class="saveItemSize">
								<input type="hidden" value="${orderItemSizeSummary[i.index]}" class="saveitemSizeSummary">
								<input type="hidden" value="<fmt:formatNumber value="${orderItemSizePriceSub[i.index] }" pattern="#,###" />" class="savePriceSub">
								<input type="hidden" value="1" class="saveDisposable">
								<input type="hidden" value="1" class="saveitemQuantity">
							</div>
						</c:forEach>
					</div>
					<input type="hidden" value="${realQuantity }" id="realQuantity">
					<input type="hidden" value="${realPrice }" id="realPrice">
					<input type="hidden" value="${realPriceSub }" id="realPriceSub">
					<input type="hidden" value="${fn:length(orderItem)}" id="oldQuantity">
					<input type="hidden" value="${oldPrice }" id="oldPrice">
					<input type="hidden" value="${fn:length(orderItem)}" id="latelyQuantity">
					<input type="hidden" value="${oldPrice }" id="latelyPrice">
					<input type="hidden" value="0" id="checkCalendar">
					<input type="hidden" value="0" id="firstModalCheck">
					<input type="hidden" value="0" id="secondModalCheck">
					<input type="hidden" value="0" id="thirdModalCheck">
					<input type="hidden" value="0" id="addressModalCheck">
					<input type="hidden" value="n" id="defaultBesongjiCheck">
					<input type="hidden" value="0" id="deliveryType">
					
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
					<div class="order-container" style="flew-wrap: wrap;"
						data-v-064d23aa="" data-v-1739428d="">
						<div class="order" data-v-064d23aa="">
							<div class="order-wrap" data-v-064d23aa="">
								<div class="order-type-wrap" data-v-064d23aa="">
									<nav class="nav-tab" data-v-4b8c16c4="" data-v-064d23aa="">
										<div class="nav-tab__wrap" data-v-4b8c16c4="">
											<div class="on" data-v-4b8c16c4="">
												<button type="button" class="general" data-v-4b8c16c4="">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">일반배송 주문</span>
												</button>
											</div>
											<div data-v-4b8c16c4="" class="">
												<button type="button" class="sub" data-v-4b8c16c4="">
													<!---->
													<!---->
													<span data-v-4b8c16c4="">정기배송 주문</span>
												</button>
											</div>
										</div>
									</nav>
								</div>
								<div class="order-delivery-wrap" data-v-064d23aa="">
									<div class="order-delivery-header" data-v-064d23aa="">
										<p class="header-title" data-v-064d23aa="">배송지 선택</p>
										<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_information-green%403x.png"
											alt="배송 설명 버튼" class="delivery-desc-btn" data-v-064d23aa="">
									</div>
									<div class="order-delivery-radio-wrap" data-v-064d23aa="">
										<div class="order-delivery-wrap" data-v-064d23aa=""> <input
												id="delivery-morning" type="radio" name="delivery"
												value="morning" data-v-064d23aa=""><label
												for="delivery-morning" data-v-064d23aa="" class="delivery-morning"> 새벽배송 </label> <input
												id="delivery-parcel" type="radio" name="delivery"
												value="parcel" data-v-064d23aa=""><label
												for="delivery-parcel" data-v-064d23aa="" class="delivery-parcel"> 택배배송 </label>
										</div>
									</div>
									<div class="order-address-wrap" data-v-064d23aa="">
										<button type="button" data-v-064d23aa="">
											<span class="row--v-center row--h-between" data-v-064d23aa="">
												<c:if test="${fn:length(list) == 0}">
													<span class="col ta-left" data-v-064d23aa="">서울, 경기, 인천 일부 새벽배송지 선택</span>
													<input type="hidden" value="0" id="addressCheck">
												</c:if>
												<c:if test="${fn:length(list) > 0}">
													<c:forEach var="memberZipcode" items="${list }">
														<c:if test="${memberZipcode.member_default_address == 'y' }">
															<span data-v-064d23aa="" class="col ta-left">
																<b data-v-064d23aa="" class="subject">
																	<span data-v-064d23aa="">${memberZipcode.member_shipping_address }</span>
																</b> 
																<span data-v-064d23aa="" class="description">${memberZipcode.member_address } ${memberZipcode.member_detail_address }</span>
																<input type="hidden" value="${memberZipcode.member_zipcode_code }">
																<input type="hidden" value="1" id="addressCheck">
															</span>
														</c:if>
													</c:forEach>
												</c:if>
												<i class="ico" data-v-064d23aa="">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-labelledby="arrow-right-1"
															role="presentation" class="icon" data-v-064d23aa="">
														<g fill="none" fill-rule="evenodd"> 
															<path stroke="currentColor" stroke-linecap="round"
																stroke-linejoin="round" d="M10 6l5.964 5.964-5.964 6">
															</path>
														</g>
													</svg>
												</i>
											</span>
										</button>
									</div>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<div data-v-064d23aa="" class="morning-parcel-desc-text">
										오후 5시 전까지 주문하면 다음 날 새벽에 도착합니다.</div>
								</div>
								<div class="order-selected-item-wrap" data-v-064d23aa="">
								
								
									<c:if test="${fn:length(orderItem) == 0}">
										<div data-v-064d23aa="" class="order-selected-item-header">
											<p data-v-064d23aa="" class="header-title">상품 선택</p>
										</div>
										<div data-v-064d23aa="" class="header-description">주문하실
											상품을 선택해 주세요.</div>
										<div class="order-selected-item" data-v-064d23aa="">
											<button data-v-064d23aa="" type="button" class="add">
												<div data-v-064d23aa="">
													<span data-v-064d23aa="">전체 메뉴 보기</span>
													<div data-v-064d23aa="" class="v-spinner"
														style="display: none; left: 50%; position: absolute;">
														<div class="v-clip"
															style="height: 18px; width: 18px; border-width: 2px; border-style: solid; border-color: rgb(201, 238, 222) rgb(201, 238, 222) transparent; border-radius: 100%; background: transparent;"></div>
													</div>
												</div>
											</button>
										</div>
									</c:if>
									
									<c:if test="${fn:length(orderItem) > 0}">
										<div class="order-selected-item-list" data-v-064d23aa="">
											<div data-v-064d23aa="" class="order-selected-item-list-header">
												<div data-v-064d23aa="" class="order-selected-item-list-header-left">
													<p data-v-064d23aa="" class="header-title">상품 선택</p>
												</div>
												<div data-v-064d23aa="" class="header-btn">전체 삭제</div>
											</div>
											<div data-v-064d23aa="" style="display: flex; flex-wrap: wrap; width: 100%;">
												
												<c:forEach var="orderItemCode" items="${orderItemCode }" varStatus="i">
													<section data-v-003a3d21="" data-v-064d23aa="" class="selected-item">
														<header data-v-003a3d21="" class="row--wrap selected-item-header">
															<div data-v-003a3d21="" class="row row--h-between col-12">
																<div data-v-003a3d21="">
																	<h3 data-v-003a3d21="">${orderItem[i.index].item_name } / ${orderItemSize[i.index] }</h3>
																	<p data-v-003a3d21="" class="content-info">
																		<!---->
																	</p>
																</div>
																<div data-v-003a3d21="">
																	<input type="hidden" value="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
																	<button data-v-003a3d21="" type="button" class="delete-menu-btn">
																		삭제</button>
																</div>
															</div>
															<div data-v-003a3d21="" class="selected-item-header__body">
																<nav data-v-003a3d21="">
																	<nav data-v-4ba0dee4="" data-v-003a3d21=""
																		class="form-number quantity">
																		<input type="hidden" value="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
																		<input type="hidden" value="${orderItemSizePrice[i.index]}">
																		<input type="hidden" value="${orderItemSizePriceSub[i.index]}">
																		<button data-v-4ba0dee4="" type="button"
																			class="form-number__control">
																			<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
																				viewBox="0 0 24 24">
																				<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																				<path data-v-4ba0dee4="" fill="currentColor"
																					d="M7 11.5h10v1H7z"></path></g></svg>
																		</button>
																		<span data-v-4ba0dee4="" class="form-number__input">
																			<input data-v-4ba0dee4="" type="number" min="1" max="100" step="1" value="${orderQuantity[i.index] }">
																		</span>
																		<button data-v-4ba0dee4="" type="button"
																			class="form-number__control">
																			<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
																				viewBox="0 0 24 24">
																				<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																				<path data-v-4ba0dee4="" fill="currentColor"
																					d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
																		</button>
																	</nav>
																</nav>
																<div data-v-003a3d21=""
																	class="selected-item-price-wrap row row--v-end">
																	<c:if test="${orderItemSizePriceSub[i.index] == 0 }"> <!-- todo -->
																		<p data-v-003a3d21="" class="selected-item-price">
																			<em data-v-003a3d21=""><fmt:formatNumber value="${orderItemSizePrice[i.index] * orderQuantity[i.index] }" pattern="#,###" />원</em>
																		</p>
																	</c:if>
																	<c:if test="${orderItemSizePriceSub[i.index] != 0}">
																		<div data-v-003a3d21="" class="selected-item-discount">
																			<fmt:formatNumber value="${orderItemSizePriceSub[i.index] * orderQuantity[i.index] }" pattern="#,###" /></div>
																		<p data-v-003a3d21="" class="selected-item-price">
																			<em data-v-003a3d21=""><fmt:formatNumber value="${orderItemSizePrice[i.index] * orderQuantity[i.index] }" pattern="#,###" />원</em>
																		</p>
																	</c:if>
																	
																</div>
															</div>
														</header>
														<div data-v-003a3d21="" class="selected-item-options">
															<dl data-v-003a3d21="" class="row--v-center">
																<label data-v-003a3d21="" class="row--v-center">
																	<div data-v-7e133ddb="" data-v-003a3d21="">
																		<div data-v-7e133ddb="" class="checkbox-wrap basic">
																			<label data-v-7e133ddb="" class="">
																			<input data-v-7e133ddb="" id="" type="checkbox" name="" value="1">
																				<div data-v-7e133ddb="" class="check-svg default">
																				<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-on.svg">
																				<img data-v-7e133ddb="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_order-checkbox-off.svg">
																				</div> <span data-v-7e133ddb="" class="checkbox-label"></span></label>
																		</div>
																	</div> 
																	<span data-v-003a3d21="" style="color: rgb(61, 61, 61); font-size: 14px;">일회용품(포크+물티슈)</span></label>
															</dl>
														</div>
														
														<div data-v-003a3d21="" class="selected-item-selected-options">
															<div data-v-003a3d21=""
																class="row--v-end row--h-between selected-item-selected-options__price">
																<div data-v-003a3d21="" style="width: 130px;">
																	<nav data-v-4ba0dee4="" data-v-003a3d21=""
																		class="form-number quantity">
																		<input type="hidden" value="${orderTagMain[i.index]}/${orderItemCode }/${orderItemSizeSummary[i.index]}">
																		<input type="hidden" value="${orderItemSizePrice[i.index]}">
																		<input type="hidden" value="${orderItemSizePriceSub[i.index]}">
																		<button data-v-4ba0dee4="" type="button"
																			class="form-number__control">
																			<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
																				viewBox="0 0 24 24">
																				<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																				<path data-v-4ba0dee4="" fill="currentColor"
																					d="M7 11.5h10v1H7z"></path></g></svg>
																		</button>
																		<span data-v-4ba0dee4="" class="form-number__input">
																				<input data-v-4ba0dee4="" type="number" min="1" max="100" step="1" value="${orderQuantity[i.index] }">
																		</span>
																		<button data-v-4ba0dee4="" type="button"
																			class="form-number__control">
																			<svg data-v-4ba0dee4="" xmlns="http://www.w3.org/2000/svg"
																				viewBox="0 0 24 24">
																				<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																				<path data-v-4ba0dee4="" fill="currentColor"
																					d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
																		</button>
																	</nav>
																</div>
																<p data-v-003a3d21="">
																	<em data-v-003a3d21="" style="font-style: normal;"><fmt:formatNumber value="${orderQuantity[i.index] * 100 }" pattern="#,###" />원</em>
																</p>
															</div>
														</div>

														
													</section>
												</c:forEach>
												
											</div>
											<div data-v-064d23aa="" class="order-selected-item" style="flex-basis: 50%;">
												<button data-v-064d23aa="" type="button" class="add">
													<div data-v-064d23aa="">
														<span data-v-064d23aa="" style="white-space: nowrap;">추가하기</span>
													</div>
												</button>
											</div>
										</div>
									</c:if>
									
									
									
								</div>
								<!---->
								<div class="order-delivery-date-wrap" data-v-064d23aa="">
									<div data-v-064d23aa="" class="order-delivery-date-header">
										<p data-v-064d23aa="" class="header-title">배송일 선택</p>
									</div>
									<div data-v-064d23aa="" class="header-description">상품
										수령날짜를 선택해 주세요.</div>
									<!---->
									<div class="order-delivery-date-body" data-v-064d23aa="">
										<div data-v-7322b8a8="" data-v-064d23aa=""
											class="date-picker-with-icon">
											<span data-v-56ae83be="" data-v-7322b8a8=""
												class="v-date-custom"><input data-v-7322b8a8=""
												data-v-56ae83be="" id="date" placeholder="배송일 선택"
												readonly="readonly" class="date-picker-input">
											<div data-v-7605e1b2="" data-v-56ae83be=""
													class="vc-popover-content-wrapper" style="">
													<!---->
												</div></span>
										</div>
										<!---->
										<!---->
									</div>
									<!---->
								</div>
								<div class="order-result-info-wrap" data-v-064d23aa="">
									<div class="order-result-info-header" data-v-064d23aa="">
										<p class="header-title" data-v-064d23aa="">결제예상금액</p>
									</div>
									<div class="order-result-info-body" data-v-064d23aa="">
										<div class="row--v-center row--h-center order-result-content"
											data-v-064d23aa="">
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="">상품
														수 / 금액</div>
													<div data-v-064d23aa="">${realQuantity }개 / <fmt:formatNumber value="${realPrice }" pattern="#,###" />원</div>
													<input type="hidden" value="0">
													<!---->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="">배송횟수
														/ 배송비</div>
													<div data-v-064d23aa="">0회 / 3,500원</div>
													<input type="hidden" value="0">
													<!---->
												</div>
											</div>
											<div data-v-064d23aa="">
												<div class="info-content" data-v-064d23aa="">
													<div class="info-content-title" data-v-064d23aa="" style="">
														할인금액</div>
													<div style="color: rgb(31, 95, 64); font-weight: bold;"
														data-v-064d23aa="">- <fmt:formatNumber value="${realPriceSub }" pattern="#,###" />원</div>
														<input type="hidden" value="0">
												</div>
											</div>
											<div class="order-result-info-total" data-v-064d23aa="">
												<div data-v-064d23aa="">
													<b data-v-064d23aa="">총 금액</b>
												</div>
												<div data-v-064d23aa="">
													<em data-v-064d23aa="">0원</em>
												</div>
												<input type="hidden" value="0">
											</div>
										</div>
									</div>
								</div>
								<div class="order-result-payment" data-v-064d23aa="">
									<div class="row--v-center " style="flex-basis: 100%;"
										data-v-064d23aa="">
										<div class="col" data-v-064d23aa="">
											<button type="button" title="" disabled="disabled"
												class="button button--size-large button--disabled"
												style="width: 100%; height: 50px; margin: 0 auto; border-radius: 2px; font-size: 16px; font-weight: 400; background-color: #b8d4c6;"
												data-v-a1c889e0="" data-v-064d23aa="">
												<span class="button__wrap" data-v-a1c889e0=""> 구매하기 </span>
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
<a class="custom-ch-btn" style="display:none">문의하기</a>
</body>
</html>