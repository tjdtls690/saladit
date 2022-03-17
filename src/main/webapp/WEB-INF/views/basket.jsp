<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/basket"/>
<!DOCTYPE html>
<html class="">
<head>
<style>
input[type="checkbox"] {
    -webkit-appearance: none;
    position: relative;
    width: 21px;
    height: 21px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #eeeeee;
    border-radius: 2px;
    background: #eee;
}
input[type="checkbox"]:checked {
    -webkit-appearance: none;
    position: relative;
    width: 21px;
    height: 21px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #eeeeee;
    border-radius: 2px;
    background: #35AD73;
    background-image : url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_check.png);
    background-position: 50%;
    background-size: 12px 8px;
    background-repeat: no-repeat;
}
</style>
<title>프레시코드 - 프리미엄 샐러드 배달 서비스</title>
<meta data-n-head="ssr" charset="utf-8">
<meta data-n-head="ssr" name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimal-ui, viewport-fit=cover, user-scalable=no">
<meta data-n-head="ssr" data-hid="subject" name="subject"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="author" name="author"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:type" property="og:type"
	content="website">
<meta data-n-head="ssr" data-hid="og:site_name" property="og:site_name"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="fb:app_id" property="fb:app_id"
	content="323001348061168">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-16.png" sizes="16x16">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-24.png" sizes="24x24">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-32.png" sizes="32x32">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-57.png" sizes="57x57">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-120.png" sizes="120x120">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-152.png" sizes="152x152">
<link data-n-head="ssr" rel="icon" type="image/x-icon"
	href="/fc-favicon-196.png" sizes="196x196">
<meta data-n-head="ssr" data-hid="title" name="title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="description" name="description"
	content="프코스팟은 무료배송. 오늘 주문하면 내일 아침 새벽배송. 맛있는 샐러드 도시락을 신선>하게 배달합니다. 다이어트 샐러드도 역시 프레시코드.">
<meta data-n-head="ssr" data-hid="keywords" name="keywords"
	content="프레시코드, 새벽배송, 샐러드, 신선배달">
<meta data-n-head="ssr" data-hid="og:title" property="og:title"
	content="프레시코드 - 프리미엄 샐러드 배달 서비스">
<meta data-n-head="ssr" data-hid="og:description"
	property="og:description" content="undefined">
<meta data-n-head="ssr" data-hid="og:url" property="og:url"
	content="https://www.freshcode.me">
<meta data-n-head="ssr" data-hid="og:image" property="og:image"
	content="https://s3.ap-northeast-2.amazonaws.com/freshcode/img/seo/main.png">
<link href="${path}/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
	$(document).on('click','.form-number__control.desk_minusbtn', function(){

		var amt = Number($(this).next().children().first().val());
		var formData = $(this).children('#itemCode').val();
		var formData2 = $(this).children('#price').val();
		var formData3 = $(this).children('#memberCode').val();
		
		if(amt <= 1){
			alert("수량을 확인해주세요")
			return false;
		}
			
		$.ajax({
			url : 'deskMinus.do',
			type : 'post',
			datatype : 'html',
			data : {
				"amt" : amt,
				"itemCode" : formData,
				"price" : formData2,
				"memberCode" : formData3
			},
			success : function(data){
				 $('.desktop-body-table-list').html(data);
			},
			complete : function() {
				var sum =0;
				var subtotal = 0;
				var dctotal = 0;
				
				var count = $('.desktop-body-table-item-total-price').length; 
				

				for (var i =0; i< count; i++) {

					if (parseInt($('.desktop-body-table-item-price')[i].innerHTML) != 0) {
						dctotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML)-parseInt($('.desktop-body-table-item-discounted-price')[i].innerHTML)) * parseInt($('.abcd')[i].value);
					}
					
					if(parseInt($('.desktop-body-table-item-price')[i].innerHTML) == 0){
						subtotal += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);
					}else {
						subtotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML) * parseInt($('.abcd')[i].value));
				 	}
					
					sum += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);

				}
				$('.desktop-body-table-footer-price').html(sum +"원");
				$('.desktop-footer-price-bottom.discounted').html(sum +"원");
				$('.desktop-footer-price-bottom.price').html(subtotal+"원");
				$('.desktop-footer-price-bottom.dc').html(dctotal+"원");
				
				
			}
		});
	});
});

	$(window).resize(function(){
		if($(window).width() > 1023) {
			document.location.reload();
		}else if ($(window).width < 1023) {
			document.location.reload();
		}
	});

$(function(){
	$(document).on('click','.form-number__control.desk_plusbtn', function(){

		var amt = Number($(this).prev().children().val());
		var formData = $(this).children('#itemCode').val();
		var formData2 = $(this).children('#price').val();
		var formData3 = $(this).children('#memberCode').val();

		$.ajax({
			url : 'deskPlus.do',
			type : 'post',
			datatype : 'html',
			data : {
				"amt" : amt,
				"itemCode" : formData,
				"price" : formData2,
				"memberCode" : formData3
			},
			success : function(data){
				 $('.desktop-body-table-list').html(data);
			},
			complete : function() {
				var sum =0;
				var subtotal = 0;
				var dctotal = 0;
				
				var count = $('.desktop-body-table-item-total-price').length; 
				

				for (var i =0; i< count; i++) {

					if (parseInt($('.desktop-body-table-item-price')[i].innerHTML) != 0) {
						dctotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML)-parseInt($('.desktop-body-table-item-discounted-price')[i].innerHTML)) * parseInt($('.abcd')[i].value);
					}
					
					if(parseInt($('.desktop-body-table-item-price')[i].innerHTML) == 0){
						subtotal += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);
					}else {
						subtotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML) * parseInt($('.abcd')[i].value));
				 	}
					
					sum += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);

				}
				$('.desktop-body-table-footer-price').html(sum +"원");
				$('.desktop-footer-price-bottom.discounted').html(sum +"원");
				$('.desktop-footer-price-bottom.price').html(subtotal+"원");
				$('.desktop-footer-price-bottom.dc').html(dctotal+"원");
				
				
			}
		});
	});
});

$(function(){
		$(document).on('click','.form-number__control.mobile_minusbtn', function(){

			var amt = Number($(this).next().children().first().val());
			var formData = $(this).children('#itemCode').val();
			var formData2 = $(this).children('#price').val();
			var formData3 = $(this).children('#memberCode').val();
			
			if(amt <= 1){
				alert("수량을 확인해주세요")
				return false;
			}

			$.ajax({
				url : 'mobileMinus.do',
				type : 'post',
				datatype : 'html',
				data : {
					"amt" : amt,
					"itemCode" : formData,
					"price" : formData2,
					"memberCode" : formData3
				},
				success : function(data){
					 $('.mobile-body-list').html(data);
				},
				complete : function() {
					var sum =0;
					var subtotal = 0;
					var dctotal = 0;
					
					var count = $('.mobile-body-item-discounted-price').length; 
					

					for (var i =0; i< count; i++) {

						if (parseInt($('.mobile-body-item-price')[i].innerHTML) != 0) {
							dctotal += (parseInt($('.mobile-body-item-price')[i].innerHTML)-parseInt($('.mobile-body-item-discounted-price')[i].innerHTML)) * parseInt($('.haha')[i].value);
						}
						
						if(parseInt($('.mobile-body-item-price')[i].innerHTML) == 0){
							subtotal += parseInt($('.mobile-body-item-bottom-price')[i].innerHTML);
						}else {
							subtotal += (parseInt($('.mobile-body-item-price')[i].innerHTML) * parseInt($('.haha')[i].value));
					 	}
						
						sum += parseInt($('.mobile-body-item-bottom-price')[i].innerHTML);

					}

					$('.mobile-footer-price-right.total-price').html(sum +"원");
					$('.mobile-footer-price-right.sub').html(subtotal+"원");
					$('.ttt').html(dctotal+"원");
				}
	
			});
		});
});

$(function(){
	$(document).on('click','.form-number__control.mobile_plusbtn', function(){

		var amt = Number($(this).prev().children().first().val());
		var formData = $(this).children('#itemCode').val();
		var formData2 = $(this).children('#price').val();
		var formData3 = $(this).children('#memberCode').val();

		alert(amt);
		$.ajax({
			url : 'mobilePlus.do',
			type : 'post',
			datatype : 'html',
			data : {
				"amt" : amt,
				"itemCode" : formData,
				"price" : formData2,
				"memberCode" : formData3
			},
			success : function(data){
					$('.mobile-body-list').html(data);
			},
			complete : function() {
				var sum =0;
				var subtotal = 0;
				var dctotal = 0;
						
				var count = $('.mobile-body-item-discounted-price').length; 
						

				for (var i =0; i< count; i++) {

					if (parseInt($('.mobile-body-item-price')[i].innerHTML) != 0) {
						dctotal += (parseInt($('.mobile-body-item-price')[i].innerHTML)-parseInt($('.mobile-body-item-discounted-price')[i].innerHTML)) * parseInt($('.haha')[i].value);
					}
							
					if(parseInt($('.mobile-body-item-price')[i].innerHTML) == 0){
						subtotal += parseInt($('.mobile-body-item-bottom-price')[i].innerHTML);
					}else {
						subtotal += (parseInt($('.mobile-body-item-price')[i].innerHTML) * parseInt($('.haha')[i].value));
						}
							
					sum += parseInt($('.mobile-body-item-bottom-price')[i].innerHTML);

				}

				$('.mobile-footer-price-right.total-price').html(sum +"원");
				$('.mobile-footer-price-right.sub').html(subtotal+"원");
				$('.ttt').html(dctotal+"원");
			}
		});
	});	
});
		
$('input:checkbox[name="point-check"]').prop("checked",true);
$('input:checkbox[name="point-check"]').prop("checked",false);

$('input:checkbox[name="point-check-all"]').prop("checked",true);
$('input:checkbox[name="point-check-all"]').prop("checked",false);

// 전체 선택 버튼
$(function (){
	$(document).on('click','.point-check-all', function(){
		
		var check = $(this).is(':checked');
		
		var count = $('.desktop-body-table-item-total-price').length; 
		
		if(check == false) {
			for (var i =0; i < count; i++) {
				$('input:checkbox[name="point-check"]').eq(i).prop("checked",false);
				$('input:checkbox[name="point-check-all"]').eq(i).prop("checked", false);
				
			}
			$('.desktop-body-table-footer-price').html(0 +"원");
	 		$('.desktop-footer-price-bottom.discounted').html(0 +"원");
	 		$('.desktop-footer-price-bottom.price').html(0+"원");
	 		$('.desktop-footer-price-bottom.dc').html(0+"원");
		}else if (check == true) {
			for(var i=0; i<count; i++){
				$('input:checkbox[name="point-check"]').eq(i).prop("checked",true);
				$('input:checkbox[name="point-check-all"]').eq(i).prop("checked", true);
			}
			var sum =0;
			var subtotal = 0;
			var dctotal = 0;
			
			var count2 = $('.desktop-body-table-item-total-price').length; 
			

			for (var i =0; i< count2; i++) {

				if (parseInt($('.desktop-body-table-item-price')[i].innerHTML) != 0) {
					dctotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML)-parseInt($('.desktop-body-table-item-discounted-price')[i].innerHTML)) * parseInt($('.abcd')[i].value);
				}
				
				if(parseInt($('.desktop-body-table-item-price')[i].innerHTML) == 0){
					subtotal += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);
				}else {
					subtotal += (parseInt($('.desktop-body-table-item-price')[i].innerHTML) * parseInt($('.abcd')[i].value));
			 	}
				
				sum += parseInt($('.desktop-body-table-item-total-price')[i].innerHTML);

			}
			$('.desktop-body-table-footer-price').html(sum +"원");
			$('.desktop-footer-price-bottom.discounted').html(sum +"원");
			$('.desktop-footer-price-bottom.price').html(subtotal+"원");
			$('.desktop-footer-price-bottom.dc').html(dctotal+"원");
			
		}
	});
});
$(function (){
	$(document).on('change','.point-check', function(){
		
		var check = $(this).is(':checked');
		var count = $('.desktop-body-table-item-total-price').length; 
		var subtotal =0;
		
		for (var i =0; i < count ; i ++) {
			if ($('input:checkbox[name="point-check"]').eq(i).is(':checked') ) {
				subtotal += 1
			}
		}
		
		if (subtotal === count) {
			$('input:checkbox[name="point-check-all"]').eq(0).prop("checked", true);
			$('input:checkbox[name="point-check-all"]').eq(1).prop("checked", true);
		}else {
			$('input:checkbox[name="point-check-all"]').eq(0).prop("checked", false);
			$('input:checkbox[name="point-check-all"]').eq(1).prop("checked", false);
		}
	});
});
// 선택삭제 
$(function (){
	$(document).on('click','.button.desktop-body-table-footer-btn.button--outline2.select', function(){
		var count = $('.desktop-body-table-item-total-price').length; 
		var deleteItemCode = [];
		var deleteItemSize = [];
		var data = {};
		var checkedNum =  $('input:checkbox[name="point-check"]:checked').length;
		
		for (var i=0; i < count; i++) {
			var check = $('input:checkbox[name="point-check"]').eq(i).is(':checked');
			if (check == true) {
				deleteItemCode[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#itemCode').val();
				deleteItemSize[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#itemSize').val();
			}
		}
		
		var newDeleteItemCode = deleteItemCode.filter(number => {
			return number >= 1;
		});
		
		var newDeleteItemSize = deleteItemSize.filter(word => {
			return word.length >= 1;
		});
		
		data.newDeleteItemCode = newDeleteItemCode;
		data.newDeleteItemSize = newDeleteItemSize;
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
    		url : 'basketSelectDelete.do',
    		dataType : 'json',
    		type : 'post',
    		data : data,
    		success : function(){
    			location.reload();
   			},
    		complete : function() {
    			location.reload();
    		}
		});
	});
});
// 전체 삭제
$(function (){
	$(document).on('click','.button.desktop-body-table-footer-btn.button--outline2.all', function(){
		var count = $('.desktop-body-table-item-total-price').length; 
		var deleteItemCode = [];
		var data = {};
		var checkedNum =  $('input:checkbox[name="point-check"]:checked').length;
		
		for (var i=0; i < count; i++) {
				deleteItemCode[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#itemCode').val();
		}
		
		var newDeleteItemCode = deleteItemCode.filter(number => {
			return number >= 1;
		});
		
		data.newDeleteItemCode = newDeleteItemCode;
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
    		url : 'basketSelectDelete.do',
    		dataType : 'json',
    		type : 'post',
    		data : data,
    		success : function(){
    			location.reload();
   			},
    		complete : function() {
    			location.reload();
    		}
		});
	});
});

//모바일 전체 삭제
$(function (){
	$(document).on('click','.mobile-header-delete-all', function(){
		var count = $('.mobile-body-item-discounted-price').length;
		var deleteItemCode = [];
// 		var deleteUserCode = session.getAttribute("userCode"); // 유저코드 추후 완성되면 추가하기
		var data = {};
		
		for(var i =0; i < count; i++) {
			deleteItemCode[i] = $('.form-number__control.mobile_minusbtn').children('#itemCode').val();
		}

		var newDeleteItemCode = deleteItemCode.filter(number => {
			return number >= 1;
		});
		
		data.newDeleteItemCode = newDeleteItemCode;
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
    		url : 'basketSelectDelete.do',
    		dataType : 'json',
    		type : 'post',
    		data : data,
    		success : function(){
   			},
    		complete : function() {
    			location.reload();
    		}
		});
	});
});

// 모바일 삭제
$(function (){
	$(document).on('click','.mobile-body-item-close', function(){
		var count = $('.mobile-body-item-discounted-price').length;
		var deleteItemCode = [];
		var deleteItemSize = [];
		var data = {};
		
		deleteItemCode[0] = $('.form-number__control.mobile_minusbtn').children('#itemCode').val();
		deleteItemSize[0] = $('.form-number__control.mobile_minusbtn').children('#itemSize').val();

		var newDeleteItemCode = deleteItemCode.filter(number => {
			return number >= 1;
		});
		
		var newDeleteItemSize = deleteItemSize.filter(word => {
			return word.length >= 1;
		});
		
		data.newDeleteItemCode = newDeleteItemCode;
		data.newDeleteItemSize = newDeleteItemSize;
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
    		url : 'basketSelectDelete.do',
    		dataType : 'json',
    		type : 'post',
    		data : data,
    		success : function(){
   			},
    		complete : function() {
    			location.reload();
    		}
		});
	});
});
// mobile 주문하기
$(function(){
	$(document).on('click', '.button.mobile-footer-btn', function(){
	
		var count = $('.mobile-body-item-discounted-price').length;
		
		var BuyItemCode = [];
		var BuyAmount = [];
		var BuyTagMain =[];
		var BuyItemSize = [];
		var data = {};
		var medium = "미디움";
		var large = "라지";
		for (var i=0; i < count; i++) {	
			BuyItemCode[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#itemCode').val();
			BuyTagMain[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#tagMain').val();
			BuyAmount[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#amount').val();
			if($('.form-number__control.desk_minusbtn').eq(i).children('#itemSize').val() === medium){
				BuyItemSize[i] = 'm';
			}else if ($('.form-number__control.desk_minusbtn').eq(i).children('#itemSize').val() === large){
				BuyItemSize[i] = 'l';
			}	
		}
		
		
		var orderItemCode = BuyItemCode.filter(number => {
			return number >= 1;
		});
		var orderTagMain = BuyTagMain.filter(number => {
			return number >= 1;
		});
		var orderQuantity = BuyAmount.filter(number => {
			return number >= 1;
		});
		var orderItemSizeSummary = BuyItemSize.filter(word => {
			return word.length >= 1;
		});
		
		var form = document.createElement('form'); // 폼객체 생성
		for (var i =0; i < orderItemCode.length; i++) {
			var objs1;
	        objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs1.setAttribute('name', 'orderItemCode'); // 객체이름
	        objs1.setAttribute('value', orderItemCode[i]); //객체값
	        form.appendChild(objs1);

	        
	        var objs2;
	        objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs2.setAttribute('name', 'orderTagMain'); // 객체이름
	        objs2.setAttribute('value', orderTagMain[i]); //객체값
	        form.appendChild(objs2);
	
	        
      		var objs3;
      		objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
       		objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
       		objs3.setAttribute('name', 'orderQuantity'); // 객체이름
       		objs3.setAttribute('value', orderQuantity[i]); //객체값
       		form.appendChild(objs3);


       		var objs4;
      		objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
       		objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
      		objs4.setAttribute('name', 'orderItemSizeSummary'); // 객체이름
      		objs4.setAttribute('value', orderItemSizeSummary[i]); //객체값
      		form.appendChild(objs4);
      		
		}
		
		form.setAttribute('method', 'post'); //get,post 가능
		form.setAttribute('action', "order.do"); //보내는 url
		document.body.appendChild(form);
		form.submit();
	});
});


// desk 주문하기 
$(function(){
	$(document).on('click', '.button.desktop-footer-btn', function(){
	
		var count = $('.desktop-body-table-item-total-price').length; 
		
		var BuyItemCode = [];
		var BuyAmount = [];
		var BuyTagMain =[];
		var BuyItemSize = [];
		var data = {};
		var medium = "미디움";
		var large = "라지";
		
		for (var i=0; i < count; i++) {
			var check = $('input:checkbox[name="point-check"]').eq(i).is(':checked');
			if (check == true) {
				BuyItemCode[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#itemCode').val();
				BuyTagMain[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#tagMain').val();
				BuyAmount[i] = $('.form-number__control.desk_minusbtn').eq(i).children('#amount').val();
				if($('.form-number__control.desk_minusbtn').eq(i).children('#itemSize').val() === medium){
					BuyItemSize[i] = 'm';
				}else if ($('.form-number__control.desk_minusbtn').eq(i).children('#itemSize').val() === large){
					BuyItemSize[i] = 'l';
				}	
			}
		}
		
		var orderItemCode = BuyItemCode.filter(number => {
			return number >= 1;
		});
		var orderTagMain = BuyTagMain.filter(number => {
			return number >= 1;
		});
		var orderQuantity = BuyAmount.filter(number => {
			return number >= 1;
		});
		var orderItemSizeSummary = BuyItemSize.filter(word => {
			return word.length >= 1;
		});
		
		var form = document.createElement('form'); // 폼객체 생성
		for (var i =0; i < orderItemCode.length; i++) {
			var objs1;
	        objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs1.setAttribute('name', 'orderItemCode'); // 객체이름
	        objs1.setAttribute('value', orderItemCode[i]); //객체값
	        form.appendChild(objs1);

	        
	        var objs2;
	        objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	        objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	        objs2.setAttribute('name', 'orderTagMain'); // 객체이름
	        objs2.setAttribute('value', orderTagMain[i]); //객체값
	        form.appendChild(objs2);
	
	        
      		var objs3;
      		objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
       		objs3.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
       		objs3.setAttribute('name', 'orderQuantity'); // 객체이름
       		objs3.setAttribute('value', orderQuantity[i]); //객체값
       		form.appendChild(objs3);


       		var objs4;
      		objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
       		objs4.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
      		objs4.setAttribute('name', 'orderItemSizeSummary'); // 객체이름
      		objs4.setAttribute('value', orderItemSizeSummary[i]); //객체값
      		form.appendChild(objs4);
      		
		}
		
		form.setAttribute('method', 'post'); //get,post 가능
		form.setAttribute('action', "order.do"); //보내는 url
		document.body.appendChild(form);
		form.submit();
	});
});

// 좌측 선택
$(function(){
	$(document).on('click','.point-check', function(){

		var check = $(this).is(':checked');
		var idx = parseInt($('input:checkbox[name="point-check"]').index(this)); 

		if (check == false ) {
			var sum = parseInt($('.desktop-body-table-item-total-price')[idx].innerHTML);
			var dctotal = 0;
			var subtotal = 0;
			
			if (parseInt($('.desktop-body-table-item-price')[idx].innerHTML) != 0) {
				dctotal += (parseInt($('.desktop-body-table-item-price')[idx].innerHTML)-parseInt($('.desktop-body-table-item-discounted-price')[idx].innerHTML)) * parseInt($('.abcd')[idx].value);
			}
			
			if(parseInt($('.desktop-body-table-item-price')[idx].innerHTML) == 0){
				subtotal += parseInt($('.desktop-body-table-item-total-price')[idx].innerHTML);
			}else {
				subtotal += (parseInt($('.desktop-body-table-item-price')[idx].innerHTML) * parseInt($('.abcd')[idx].value));
		 	}
			
			var changeSum = parseInt($('.desktop-body-table-footer-price')[0].innerHTML) - sum;
	 		var changeSubtotal = parseInt($('.desktop-footer-price-bottom.price')[0].innerHTML) - subtotal;
	 		var changeDctotal = parseInt($('.desktop-footer-price-bottom.dc')[0].innerHTML) - dctotal;
	
	 		$('.desktop-body-table-footer-price').html(changeSum +"원");
	 		$('.desktop-footer-price-bottom.discounted').html(changeSum +"원");
	 		$('.desktop-footer-price-bottom.price').html(changeSubtotal+"원");
	 		$('.desktop-footer-price-bottom.dc').html(changeDctotal+"원");

		} else {
			var Esum = parseInt($('.desktop-body-table-item-total-price')[idx].innerHTML);
			var Edctotal = 0;
			var Esubtotal = 0;
			
			if (parseInt($('.desktop-body-table-item-price')[idx].innerHTML) != 0) {
				Edctotal += (parseInt($('.desktop-body-table-item-price')[idx].innerHTML)-parseInt($('.desktop-body-table-item-discounted-price')[idx].innerHTML)) * parseInt($('.abcd')[idx].value);
			}
			
			if(parseInt($('.desktop-body-table-item-price')[idx].innerHTML) == 0){
				Esubtotal += parseInt($('.desktop-body-table-item-total-price')[idx].innerHTML);
			}else {
				Esubtotal += (parseInt($('.desktop-body-table-item-price')[idx].innerHTML) * parseInt($('.abcd')[idx].value));
		 	}
			
			var EchangeSum = parseInt($('.desktop-body-table-footer-price')[0].innerHTML) + Esum;
	 		var EchangeSubtotal = parseInt($('.desktop-footer-price-bottom.price')[0].innerHTML) + Esubtotal;
	 		var EchangeDctotal = parseInt($('.desktop-footer-price-bottom.dc')[0].innerHTML) + Edctotal;
	
	 		$('.desktop-body-table-footer-price').html(EchangeSum +"원");
	 		$('.desktop-footer-price-bottom.discounted').html(EchangeSum +"원");
	 		$('.desktop-footer-price-bottom.price').html(EchangeSubtotal+"원");
	 		$('.desktop-footer-price-bottom.dc').html(EchangeDctotal+"원");
		}
		
	}); 
});

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
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b4="" href="/info" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
								<a data-v-7aa1f9b4="" href="/mypage/orders" class="">${member.name}<span
									data-v-7aa1f9b4="">님</span></a> <span data-v-7aa1f9b4="">1:1문의</span>
								<a data-v-7aa1f9b4="" href="https://forms.gle/92o1ctx6U4CYe2yF9"
									target="_blank">B2B 신청</a>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="/" class="nuxt-link-active"></a>
							<!---->
						</div>
						<nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">전체 카테고리</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu" class=""> 전체보기 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad" class=""> 샐러드 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/subscription" class="new"> 정기구독 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/salad-wrap" class="new"> 샌드위치·랩 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/meal" class="new"> 도시락·간편식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soup" class=""> 죽·스프 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/set" class="new"> 세트상품 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/snack" class="new"> 간식 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/drink" class="new"> 음료 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/event" class="new"> 초코베리머치 </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="/menu/soon" class=""> 오픈예정 </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="/menu/subscription" class="item">정기구독
								</a><a data-v-7aa1f9b4="" href="/menu/salad" class="item">샐러드 </a><a
									data-v-7aa1f9b4="" href="/menu/salad-wrap" class="item">샌드위치·랩
								</a><a data-v-7aa1f9b4="" href="/menu/event" class="item">초코베리머치
								</a><a data-v-7aa1f9b4="" href="/event" class="item">이벤트 </a><a
									data-v-7aa1f9b4="" href="/fcospot" class="item">프코스팟 </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="메뉴 검색" class="search-logo-img"
									style="width: 24px; height: 24px;">
									<div data-v-7aa1f9b4="">검색</div></a> <a data-v-7aa1f9b4=""
									href="/basket" aria-current="page"
									class="cart-logo-wrap item nuxt-link-exact-active nuxt-link-active"><div><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_baguni.PNG"
										data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty" >
										<!---->
									</div> <!----> 장바구니 </a> <a data-v-7aa1f9b4="" href="/order" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"><img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pay.PNG" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495=""></div> 바로주문 </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="/search" class="search-logo"><img
								data-v-7aa1f9b4="" src="/images/ic-navi-search@3x.png"
								alt="메뉴 검색" class="search-logo-img"
								style="width: 24px; height: 24px;"></a> <a data-v-7aa1f9b4=""
								href="/cart" aria-current="page"
								class="cart-logo-wrap item nuxt-link-exact-active nuxt-link-active"><div
									data-v-7aa1f9b4="" alt="프레시코드 장바구니" class="cart-logo empty">
									<!---->
								</div></a>
							<nav data-v-7aa1f9b4="" class="header__toggle-button">
								<button data-v-7aa1f9b4="" type="button">
									<img data-v-7aa1f9b4=""
										src="/images/header-img/menu_new@2x.png" alt="user-menu"
										style="width: 24px; height: 24px;">
								</button>
							</nav>
						</div>
					</div>
					<div data-v-7aa1f9b4="" class="mobile-nav js-mobile-nav">
						<div data-v-7aa1f9b4="" class="mobile-nav-wrap">
							<div data-v-7aa1f9b4="" class="mobile-nav-scroll">
								<ul data-v-7aa1f9b4="" class="mobile-nav-contents">
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu" class=""> 전체 메뉴 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/subscription" class="">
											정기구독 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/menu/event" class=""> 초코베리머치 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/info" class=""> 배송안내 </a></li>
									<li data-v-7aa1f9b4="" class="mobile-nav-contents-item"><a
										data-v-7aa1f9b4="" href="/fcospot" class=""> 프코스팟 </a></li>
								</ul>
							</div>
							<div data-v-7aa1f9b4="" class="all-menus-container"
								style="display: none;">
								<div data-v-7aa1f9b4="" class="all-menus-list-wrap">
									<ul data-v-7aa1f9b4="" class="all-menus-list js-all-menus-list">
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu"
											class="js-all-menus-item-link-0 all-menus-item-link">
												전체보기 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad"
											class="js-all-menus-item-link-2 all-menus-item-link"> 샐러드
										</a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/subscription"
											class="js-all-menus-item-link-1 all-menus-item-link new">
												정기구독 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/salad-wrap"
											class="js-all-menus-item-link-3 all-menus-item-link new">
												샌드위치·랩 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/meal"
											class="js-all-menus-item-link-4 all-menus-item-link new">
												도시락·간편식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soup"
											class="js-all-menus-item-link-10 all-menus-item-link">
												죽·스프 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/set"
											class="js-all-menus-item-link-5 all-menus-item-link new">
												세트상품 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/snack"
											class="js-all-menus-item-link-6 all-menus-item-link new">
												간식 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/drink"
											class="js-all-menus-item-link-7 all-menus-item-link new">
												음료 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/event"
											class="js-all-menus-item-link-8 all-menus-item-link new">
												초코베리머치 </a></li>
										<li data-v-7aa1f9b4="" class="all-menus-item"><a
											data-v-7aa1f9b4="" href="/menu/soon"
											class="js-all-menus-item-link-9 all-menus-item-link">
												오픈예정 </a></li>
									</ul>
								</div>
								<div data-v-7aa1f9b4="" class="all-menus-shadow"></div>
								<div data-v-7aa1f9b4="" class="all-menus-arrow-wrap">
									<img data-v-7aa1f9b4="" src="/images/icon-arrow-down@2x.png"
										alt="" class="all-menus-arrow">
								</div>
							</div>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
				</header>
				<!---->
				<div data-v-1739428d="" class="container"
					style="padding-top: 182px;">
					<section data-v-7f39deaa="" data-v-1739428d="" class="cart">
						<section data-v-7f39deaa="" id="cart-mobile-wrap"
							class="mobile-wrap">
							<div data-v-7f39deaa="" class="mobile-scroll-wrap">
								<header class="mobile-header" data-v-7f39deaa="">
									<button data-v-7f39deaa="" class="mobile-header-back-wrap">
										<img data-v-7f39deaa="" src="https://www.freshcode.me/images/arrow-left@2x.png"
											alt="뒤로가기" class="mobile-header-back-img">
									</button>
									<h1 class="mobile-header-title" data-v-7f39deaa="">장바구니</h1>
									<button data-v-7f39deaa="" class="mobile-header-delete-all">
										전체 삭제</button>
								</header>
								<div data-v-7f39deaa="" class="mobile-body-wrap">
									<main data-v-7f39deaa="" class="mobile-body">
										<ul data-v-7f39deaa="" class="mobile-body-list">
										<c:forEach var="basket" items="${Basket}" varStatus="stauts">
											<li data-v-7f39deaa="" class="mobile-body-item"><img
												data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-exit@2x.png"
												alt="장바구니 메뉴 삭제" class="mobile-body-item-close">
												<section data-v-7f39deaa="" class="mobile-body-item-top">
													<div data-v-7f39deaa="" class="mobile-body-item-img-wrap">
														<img data-v-7f39deaa=""
															src="${basket.itemImage}"
															alt="메뉴 이미지" class="mobile-body-item-img">
													</div>
													<div data-v-7f39deaa="" class="mobile-body-item-text-wrap">
														<div data-v-7f39deaa="" class="mobile-body-item-title">
															${basket.itemName} </div>
														<div data-v-7f39deaa=""
															class="mobile-body-item-price-wrap">
															<div data-v-7f39deaa=""
																class="mobile-body-item-discounted-price">${basket.price}</div>
															<div data-v-7f39deaa="" class="mobile-body-item-price">
																${basket.priceSub}</div>
														</div>
													</div>
												</section>
										
												<section data-v-7f39deaa="" class="mobile-body-item-bottom">
													<div data-v-7f39deaa=""
														class="mobile-body-item-form-number-wrap">
														<nav data-v-4ba0dee4="" data-v-7f39deaa=""
															class="form-number">
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control mobile_minusbtn">
																<input type="hidden" value="${basket.itemCode}" id="itemCode" />
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${basket.itemSize}" id="itemSize" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M7 11.5h10v1H7z"></path></g></svg>
															</button>
															
															<span data-v-4ba0dee4="" class="form-number__input mobile"><input
																data-v-4ba0dee4=""  type="number" min="1" class="haha"
																max="9999" step="1" value="${basket.amount}" ></span>
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control mobile_plusbtn">																
																<input type="hidden" value="${basket.itemCode}" id="itemCode" />
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
															</button>
														</nav>
													</div>
													<div data-v-7f39deaa="" 
														class="mobile-body-item-bottom-price">${basket.subTotal } 원</div>
												</section>
											</li>
												<c:set var="mobile_total" value="${mobile_total + basket.subTotal }" />
												<c:choose>
													<c:when test="${basket.priceSub eq 0}"> 
														<c:set var="mobile_subTotal" value="${mobile_subTotal + (basket.price*basket.amount)}" />
													</c:when>
													<c:when test="${basket.priceSub ne 0}">
														<c:set var="mobile_subTotal" value="${mobile_subTotal + (basket.priceSub*basket.amount) }" />
														<c:set var="mobile_dcTotal" value="${mobile_dcTotal + ((basket.priceSub - basket.price) * basket.amount)}" />
													</c:when>
												</c:choose>
											</c:forEach>
										</ul>
										<section data-v-7f39deaa="" class="mobile-footer-price-wrap">
											<section data-v-7f39deaa="" class="mobile-footer-price-top">
												<div data-v-7f39deaa=""
													class="mobile-footer-price-title-wrap">
													<img data-v-7f39deaa=""
														src="https://www.freshcode.me/images/icon-payment-information@3x.png"
														alt="결제 금액 아이콘" class="mobile-footer-price-title-img">
													<h4 data-v-7f39deaa="" class="mobile-footer-price-title">결제
														금액</h4>
												</div>
												<div data-v-7f39deaa="" class="mobile-footer-price-column"
													style="margin-bottom: 8px;">
													<div data-v-7f39deaa="" class="mobile-footer-price-left">
														상품 금액</div>
													<div data-v-7f39deaa="" class="mobile-footer-price-right sub">
														<c:out value="${mobile_subTotal}원"></c:out></div>
												</div>
												<div data-v-7f39deaa="" class="mobile-footer-price-column">
													<div data-v-7f39deaa="" class="mobile-footer-price-left">할인
														금액</div>
													<div data-v-7f39deaa="" class="mobile-footer-price-right dc">
														<span data-v-7f39deaa=""
															class="mobile-footer-price-right-red">(-)</span>
														<span class="ttt"><c:out value="${mobile_dcTotal}원"></c:out></span>
													</div>
												</div>
											</section>
											<section data-v-7f39deaa=""
												class="mobile-footer-price-bottom">
												<div data-v-7f39deaa="" class="mobile-footer-price-column">
													<div data-v-7f39deaa="" class="mobile-footer-price-left">결제
														예상 금액</div>
													<div data-v-7f39deaa=""
														class="mobile-footer-price-right total-price">
														<c:out value="${mobile_total}원"></c:out></div>
												</div>
											</section>
										</section>
									</main>
								</div>
								<footer data-v-7f39deaa="" class="mobile-footer">
									<section data-v-7f39deaa="" class="mobile-footer-btn-wrap">
										<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
											title="" class="button mobile-footer-btn">
											<span data-v-a1c889e0="" class="button__wrap">주문하기</span>
										</button>
									</section>
								</footer>
							</div>
						</section>
						<!-- mobile 끝  -->
						<section data-v-7f39deaa="" class="desktop-wrap">
							<header data-v-7f39deaa="" class="desktop-header">
								<div data-v-7f39deaa="" class="desktop-header-title-wrap">
									<h1 data-v-7f39deaa="" class="desktop-header-title">장바구니</h1>
									<h4 data-v-7f39deaa="" class="desktop-header-subtitle">
										주문하실 상품의 제품명과 수량을 정확히 확인해 주세요.</h4>
								</div>
							</header>
							<main data-v-7f39deaa="" class="desktop-body">
								<section data-v-7f39deaa="" class="desktop-body-title-wrap">
									<div data-v-7f39deaa="" class="desktop-body-title-img-wrap">
										<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-product@3x.png"
											alt="상품정보 아이콘" class="desktop-body-title-img">
									</div>
									<h4 data-v-7f39deaa="" class="desktop-body-title">상품 정보</h4>
								</section>
								<section data-v-7f39deaa="" class="desktop-body-table-wrap">
									<header data-v-7f39deaa="" class="desktop-body-table-header">
										<div data-v-7f39deaa="" class="desktop-body-table-header-left">
											<div data-v-7f39deaa=""
												class="desktop-body-table-check-all-wrap">
												<input type="checkbox" name="point-check-all" id="point-check-all" class ="point-check-all" checked='checked'>
												&nbsp;<span>전체 선택</span>
<!-- 												<input data-v-7f39deaa="" id="header-check-all" -->
<!-- 													type="checkbox" value="check-all" checked="checked" -->
<!-- 													name="check-all" -->
<!-- 													class="desktop-body-table-check-all js-check-all"> -->
<!-- 												<label data-v-7f39deaa="" for="header-check-all" -->
<!-- 													class="desktop-body-table-check-all-label"><span -->
<!-- 													data-v-7f39deaa="" -->
<!-- 													class="desktop-body-table-check-all-text">전체 선택</span></label> -->
											</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column info">상품 정보</div>
										</div>
										<div data-v-7f39deaa=""
											class="desktop-body-table-header-right">
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column quantity">수량</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column price">가격</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-header-column total-price">
												상품 금액</div>
										</div>
									</header>
									<main data-v-7f39deaa="" class="desktop-body-table-body">
										<ul data-v-7f39deaa="" class="desktop-body-table-list">
			
											<c:forEach var="basket" items="${Basket}" varStatus="status">
											<li data-v-7f39deaa="" class="desktop-body-table-item"><section
													data-v-7f39deaa="" class="desktop-body-table-item-left">
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-checkbox-wrap">
														<!-- check box -->
														<input type="checkbox" name="point-check" id="point-check" class ="point-check" checked='checked'>
<!-- 														<input data-v-7f39deaa="" id="table-item-checkbox-0" -->
<!-- 															checked name="selected-item" type="checkbox" -->
<!-- 															class="desktop-body-table-item-checkbox" -->
<!-- 															value="426"> -->
<!-- 															<label data-v-7f39deaa="" -->
<!-- 															for="table-item-checkbox-0" -->
<!-- 															class="desktop-body-table-item-checkbox-label"></label> -->
<%-- 															<input type="hidden" value="${basket.price}" class="check-price"/> --%>
<%-- 															<input type="hidden" value="${basket.priceSub}" class="check-priceSub" /> --%>
<%-- 															<input type="hidden" value="${basket.subTotal}" class="check-subTotal" /> --%>
<%-- 															<input type="hidden" value="${basket.amount}" class="check-amount" /> --%>
													</div>
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-img-wrap">
														<img data-v-7f39deaa=""
															src="${basket.itemImage}"
															alt="데스크탑 장바구니 이미지" class="desktop-body-table-item-img">
													</div>
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-title">${basket.itemName } / ${basket.itemSize}
													</div>
												</section>
												<section data-v-7f39deaa=""
													class="desktop-body-table-item-right">
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-spinner-wrap">
														<nav data-v-4ba0dee4="" data-v-7f39deaa=""
															class="form-number">
															<button data-v-4ba0dee4="" type="button"
																class="form-number__control desk_minusbtn">
																<input type="hidden" value="${basket.itemCode}" id="itemCode"/>
																<input type="hidden" value="${basket.price}" id="price" />
																<input type="hidden" value="${basket.tagMain}" id="tagMain" />
																<input type="hidden" value="${basket.amount}" id="amount" />
																<input type="hidden" value="${basket.itemSize}" id="itemSize" />
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M7 11.5h10v1H7z"></path></g></svg>
															</button>
															<span data-v-4ba0dee4="" class="form-number__input deskAmt"><input
																data-v-4ba0dee4=""  type="number" min="1" class="abcd"
																max="9999" step="1"  value="${basket.amount}"></span>
															<button data-v-4ba0dee4="" type="button" 
																class="form-number__control desk_plusbtn">
																<input type="hidden" value="${basket.itemCode}" id="itemCode">
																<input type="hidden" value="${basket.price}" id="price">
																<input type="hidden" value="${member.memberCode}" id="memberCode" />
																<svg data-v-4ba0dee4=""
																	xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																	<g data-v-4ba0dee4="" fill="none" fill-rule="evenodd">
																	<path data-v-4ba0dee4="" fill="currentColor"
																		d="M11.5 11.5V6h1v5.5H18v1h-5.5V18h-1v-5.5H6v-1h5.5z"></path></g></svg>
															</button>
														</nav>
													</div>
													<div data-v-7f39deaa=""
														class="desktop-body-table-item-price-wrap">
														<div data-v-7f39deaa=""
															class="desktop-body-table-item-price">${basket.priceSub }</div>
														<div data-v-7f39deaa=""
															class="desktop-body-table-item-discounted-price">
															${basket.price }</div>
													</div>
														<div data-v-7f39deaa="" id="desk-subtotal"
														class="desktop-body-table-item-total-price">${basket.subTotal}
														<input type="hidden" value = "${basket.subTotal}" class="bf_subtotal"/></div>
												</section></li>
												<c:set var="desk_total" value="${desk_total + basket.subTotal }" />
												<c:choose>
													<c:when test="${basket.priceSub eq 0}"> 
														<c:set var="desk_subTotal" value="${desk_subTotal + (basket.price*basket.amount)}" />
													</c:when>
													<c:when test="${basket.priceSub ne 0}">
														<c:set var="desk_subTotal" value="${desk_subTotal + (basket.priceSub*basket.amount) }" />
														<c:set var="desk_dcTotal" value="${desk_dcTotal + ((basket.priceSub - basket.price) * basket.amount)}" />
													</c:when>
												</c:choose>
											</c:forEach>
										</ul>
									</main>
									<footer data-v-7f39deaa="" class="desktop-body-table-footer">
										<div data-v-7f39deaa="" class="desktop-body-table-footer-left">
											<div data-v-7f39deaa=""a
												class="desktop-body-table-check-all-wrap">
												<input type="checkbox" name="point-check-all" id="point-check-all" class ="point-check-all" checked='checked'>
												&nbsp;<span>전체 선택</span>
<!-- 												<input data-v-7f39deaa="" id="footer-check-all" -->
<!-- 													checked="checked" name="check-all" type="checkbox" -->
<!-- 													value="check-all" -->
<!-- 													class="desktop-body-table-check-all js-check-all"> -->
<!-- 												<label data-v-7f39deaa="" for="footer-check-all" -->
<!-- 													class="desktop-body-table-check-all-label"><span -->
<!-- 													data-v-7f39deaa="" -->
<!-- 													class="desktop-body-table-check-all-text">전체 선택</span></label> -->
											</div>
											<div data-v-7f39deaa=""
												class="desktop-body-table-footer-btns-wrap">
												<div data-v-7f39deaa=""
													class="desktop-body-table-footer-btn-wrap">
													<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
														title=""
														class="button desktop-body-table-footer-btn button--outline2 select">
														<span data-v-a1c889e0="" class="button__wrap">선택 삭제</span>
													</button>
												</div>
												<div data-v-7f39deaa=""
													class="desktop-body-table-footer-btn-wrap">
													<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
														title=""
														class="button desktop-body-table-footer-btn button--outline2 all">
														<span data-v-a1c889e0="" class="button__wrap">전체 삭제</span>
													</button>
												</div>
											</div>
										</div>
										<div data-v-7f39deaa=""
											class="desktop-body-table-footer-right">
											<span data-v-7f39deaa=""
												class="desktop-body-table-footer-price"><c:out value="${desk_total}원"></c:out>
											</span>
										</div>
									</footer>
								</section>
							</main>
							<footer data-v-7f39deaa="" class="desktop-footer">
								<section data-v-7f39deaa="" class="desktop-footer-price-wrap">
									<div data-v-7f39deaa=""
										class="desktop-footer-price-content-wrap">
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">상품
												금액</div>
											<div data-v-7f39deaa="" class="desktop-footer-price-bottom price">
												<c:out value="${desk_subTotal}원" />
												<input type = "hidden" value ="${desk_subTotal}" id ="check_desk_subtotal"/>
												</div>
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-icon-wrap">
											<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-minus@2x.png"
												alt="뺴기 아이콘" class="desktop-footer-icon">
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">할인
												금액</div>
											<div data-v-7f39deaa="" class="desktop-footer-price-bottom dc">
												<c:out value="${desk_dcTotal}원" />
												<input type="hidden" value="${desk_dcTotal}" id ="check_desk_dctotal"/>	
												</div>
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-icon-wrap">
											<img data-v-7f39deaa="" src="https://www.freshcode.me/images/icon-equal@2x.png"
												alt="등호 아이콘" class="desktop-footer-icon">
										</div>
										<div data-v-7f39deaa="" class="desktop-footer-price-box">
											<div data-v-7f39deaa="" class="desktop-footer-price-top">결제
												예상 금액</div>
											<div data-v-7f39deaa=""
												class="desktop-footer-price-bottom discounted"><c:out value="${desk_total}원" />
												<input type ="hidden" value ="${check_desk_total}" id="check_desk_total"/>
											</div> 
										</div>
									</div>
								</section>
								<section data-v-7f39deaa="" class="desktop-footer-btn-wrap">
									<button data-v-a1c889e0="" data-v-7f39deaa="" type="button"
										title="" class="button desktop-footer-btn">
										<span data-v-a1c889e0="" class="button__wrap">주문하기</span>
									</button>
								</section>
							</footer>
						</section>
					</section>
				</div>

			</main>
		</div>
	</div>
	



	<a class="custom-ch-btn" style="display: none">문의하기</a>
</body>
</html>