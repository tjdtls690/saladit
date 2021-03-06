<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/detail"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
   <!-- for slide -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>   
   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <link rel="stylesheet" href="${path }/style.css">
   <link rel="stylesheet" href="${path }/hmm2.css">
   <link rel="stylesheet" href="${path }/style2.css?ver=6">
   
   
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   <script type="text/javascript">
   function page_move(tagNum){
	   var f = document.paging; //??? name
	   f.tagMain01.value = tagNum; //POST???????????? ????????? ?????? ???
	   f.action="tapPage.do";//????????? ?????????
	   f.method="post";//POST??????
	   f.submit();
	}
      $(function() { 
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
    	  
// ?????? ??????
         var lastScrollTop = 0,
         delta = 100;
         $(window).scroll(function(event){
         var st = $(this).scrollTop();
         if(Math.abs(lastScrollTop - st) > delta) return;
         if((st > lastScrollTop) && (lastScrollTop > 0)){
        	 if(window.innerWidth > 1023){
               $(".header").css("top","-130px");
        	 }else{
        		 $(".header").css("top","0px");
        	 }
         }else{
            $(".header").css("top","0px");
         }
         lastScrollTop = st;
       	});
         
// ????????? ???????????? ????????? ????????? ?????????????????? ??????         
         $(document).on('click', '.swiper-slide', function(){ 
     		var f = document.paging;
     		var code = $(this).children('#itemCode').attr('value');
     		var tag = $(this).children('#tagMain').attr('value');
     		var tagSub =$(this).children('#tagSub').attr('value');
     		f.tagSub01.value = tagSub
     		f.tagMain01.value = tag;
     		f.itemCode01.value = code;
     		f.action="detail.do"; 
     		f.method="post";
     		f.submit();
     	})
         
// ?????? ?????? ?????? ?????????       
		$('.menu-info-content-wrap').hide();  
     	$(document).on('click','.menu__tab-info-title.menu-info:odd',function(){  
    		//alert("?????? ?????? ?????????");
    	    if($("#item_nut_show").css("display") == "none"){   
    	        $('#item_nut_show').show(); 
    	    } else {  
    	        $('#item_nut_show').hide();  
    	    }  
    	}); 
// ?????? ?????? ?????? ?????????
     	$(document).on('click','.menu__tab-info-title.menu-info:even',function(){  
    		//alert("?????? ?????? ?????????");
    	    if($("#item_info_show").css("display") == "none"){   
    	        $('#item_info_show').show(); 
    	    } else {  
    	        $('#item_info_show').hide();  
    	    }  
    	});
// -------------------------------------------------------------------------------------------------------------------   	
// -------------------------------------------------------------------------------------------------------------------   	
// ???????????? ??????
		$(document).on('click','#mobCart',function(){
			//alert("???????????? ??????");
		// ???????????? ???????????? ???????????? ???????????? ??????.
			if($('.selected-detail-list').children().hasClass('selected-detail-wrap')){
				//alert("??????");
				var itemCode = [], data = {};
				var tagMain = [];
				var price = [];
				var priceSub = [];
				var itemName = [];
				var itemSize = [];
				var itemImage = [];
				var tagSub = [];
				var itemQuantity = [];   
				var htmlOut="";
			// ?????? ??????
				var Length = $('.selected-detail-list').children().length;
				if(Length == 2){
					Length = 1;
				}else if(Length == 4){
					Length = 2;
				}

				for(var i = 0; i < Length; i++){
					itemCode[i] = $('.selected-detail-wrap').eq(i).children().eq(0).attr('value')
					tagMain[i] = $('.selected-detail-wrap').eq(i).children().eq(1).attr('value')
					price[i] = $('.selected-detail-wrap'). eq(i).children().eq(2).attr('value')
					priceSub[i] = $('.selected-detail-wrap').eq(i).children().eq(3).attr('value')
					itemName[i] = $('.selected-detail-wrap').eq(i).children().eq(4).attr('value')
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
					itemImage[i] = $('.selected-detail-wrap').eq(i).children().eq(6).attr('value')
					tagSub[i] = $('.selected-detail-wrap').eq(i).children().eq(7).attr('value')
					itemQuantity[i] = Number($('.form-number__input').eq(i).children().val())
				}

			    data.itemCode = itemCode;
			    data.tagMain = tagMain;
			    data.price = price;
			    data.priceSub = priceSub;
			    data.itemName = itemName;
			    data.itemSize = itemSize;
			    data.tagSub = tagSub;
			    data.itemImage = itemImage;
			    data.itemQuantity = itemQuantity;
			    jQuery.ajaxSettings.traditional = true;
			    
			    $.ajax({
		 			url : 'detaillLginCheck.do',
		 			success : function(data1){
		 				if(data1 == 1){
		 					$.ajax({ // ???????????? ?????? ?????? ??????
		 				    	url : "test.do",
		 				    	type : 'post',
		 				    	dataType : 'html',
		 				    	data : data,
		 				    	success : function(html){
		 				    		$('body').append(html);
		 				    		setTimeout(function() {
		 								$('.swal2-container').detach();
		 							}, 2000);
		 				   
		 				    		
		 				    	}
		 				    }) //ajax ???
		 				    
		 				    var thisItemImage =  $('.selected-detail-wrap').eq(0).children().eq(6).attr('value');
		 				    var thisItemName = $('.selected-detail-wrap').eq(0).children().eq(4).attr('value')
		 				 	var thisItemSize =  $('.selected-detail-wrap').eq(0).children().eq(5).attr('value')

		 				    $.ajax({ // ???????????? ????????? ??????
		 				    	url : "addCart.do",
		 				    	type : 'post',
		 				    	dataType : 'html',
		 				    	data : {
		 				    		"image" : thisItemImage,
		 				    		"name" : thisItemName,
		 				    		"size" : thisItemSize  		
		 				    	},
		 				    	success:function(html){
		 				    		$('.cart-logo-wrap').append(html);
		 				    		setTimeout(function() {
		 								$('.add-cart-modal').detach();
		 							}, 2000);
		 				    		
		 				    	}
		 				    }) // ajax ???
		 				}else{
		 					$(location).attr("href", "login.do");
		 				}
		 			}
		 		})
		 		
			    
			}else{	// ???????????? ??????????????? ????????? ?????? ??????????????? ??????
				$.ajax({
					url : "plzSelect.do",
					success : function(html){
						$('body').append(html);
						
					}
				})// ajax ???

			}
		})
		
// ???????????? ????????? ????????? ?????? ?????????
	$(document).on('click','.swal2-confirm.swal2-styled',function(){
		$('.swal2-container.swal2-center.swal2-backdrop-show').detach();
	})
	
// --------------------------------------------------------------------------------	
// --------------------------------------------------------------------------------	
// ??????????????????
	$(document).on('click','#goOrder',function(){
		//alert("???????????? ??????");
		if($('.selected-detail-list').children().hasClass('selected-detail-wrap')){
			var itemCode = [];
			var tagMain = [];
			var price = [];
			var priceSub = [];
			var itemName = [];
			var itemSize = [];
			var itemImage = [];
			var tagSub = [];
			var itemQuantity = [];   
			var htmlOut="";
			
			// ?????? ??????
			var Length = $('.selected-detail-list').children().length;
			if(Length == 2){
				Length = 1;
			}else if(Length == 4){
				Length = 2;
			}
			

			var o = document.order;	
			for(var i = 0; i < Length; i++){
//				alert(i+" ?????? ???");			
				itemCode[i] = $('.selected-detail-wrap').eq(i).children().eq(0).attr('value')
				o.orderItemCode[i].value = itemCode[i];		
				tagMain[i] = $('.selected-detail-wrap').eq(i).children().eq(1).attr('value')
				o.orderTagMain[i].value = tagMain[i];				
				price[i] = $('.selected-detail-wrap'). eq(i).children().eq(2).attr('value')
				o.orderItemPrice[i].value = price[i];
				priceSub[i] = $('.selected-detail-wrap').eq(i).children().eq(3).attr('value')
				o.orderItemPriceSub[i].value = priceSub[i];
				itemName[i] = $('.selected-detail-wrap').eq(i).children().eq(4).attr('value')
				o.orderItemName[i].value = itemName[i];
//				itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				if($('.selected-detail-wrap').eq(i).children().eq(5).attr('value')=="?????????"){
					$('.selected-detail-wrap').eq(i).children().eq(5).val('m');
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				}
				if($('.selected-detail-wrap').eq(i).children().eq(5).attr('value')=="??????"){
					$('.selected-detail-wrap').eq(i).children().eq(5).val('l');
					itemSize[i] = $('.selected-detail-wrap').eq(i).children().eq(5).attr('value')
				}
				o.orderItemSizeSummary[i].value = itemSize[i];
				itemImage[i] = $('.selected-detail-wrap').eq(i).children().eq(6).attr('value')
				o.orderItemImage[i].value = itemImage[i];
				tagSub[i] = $('.selected-detail-wrap').eq(i).children().eq(7).attr('value')
				o.orderItemTagSub[i].value = tagSub[i];
				itemQuantity[i] = Number($('.form-number__input').eq(i).children().val())
				o.orderQuantity [i].value = itemQuantity[i];

			}

			o.action="order.do";
			o.method="post";
			o.submit();			
			
		}else{
			$.ajax({	// ???????????? ??????????????? ????????? ?????? ??????????????? ??????
				url : "plzSelect.do",
				success : function(html){
					$('body').append(html);
				}
			})// ajax ???
		}
		
		
	})
	
	
	

// ??????, faq ?????? ?????????
      $(function(){
          $(document).on('click', '.review-item__head', function(){
	            $(this).toggleClass("border-bottom-desktop-show");
	            $(this).siblings('.review-desktop-toggle').toggleClass("review-hide");
          });
          
          $(document).on('click', '.menu-info-table-opener', function(){
              $(this).toggleClass("border-bottom-desktop-show");
              $(this).siblings('.menu-info-table-content-wrap').toggleClass("review-hide");
           });
       });
// ????????? ??????
		$(document).on('click','.fa.pageNum',function(){
			var pageNum = $(this).children('#PageNumValue').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'paging.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				}
			});
		});
		// ????????? ?????? ?????????
		$(document).on('click','.fa.pageNum.Mobile',function(){
			var pageNum = $(this).children('#PageNumValueMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'paging.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				}
			});
		});
		// ?????? ??????
		$(document).on('click','.fa.fa-chevron-left',function(){
			var pageNum = $(this).children('#PageNumValuePrev').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
		
			$.ajax({
				url : 'pagingPrev.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-left').children('#PageNumValuePrev').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
			
					
					$.ajax({
						url : 'bottomPrev.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// ?????? ?????? ?????????
		$(document).on('click','.fa.fa-chevron-left.Mobile',function(){
			var pageNum = $(this).children('#PageNumValuePrevMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
		
			$.ajax({
				url : 'pagingPrev.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-left.Mobile').children('#PageNumValuePrevMobile').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
			
					
					$.ajax({
						url : 'bottomPrev.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// ????????? ??????
		$(document).on('click','.fa.fa-chevron-right',function(){
			var pageNum = $(this).children('#PageNumValueNext').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'pagingNext.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-right').children('#PageNumValueNext').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
										
					$.ajax({
						url : 'bottomNext.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
		// ????????? ?????? ?????????
		$(document).on('click','.fa.fa-chevron-right.Mobile',function(){
			var pageNum = $(this).children('#PageNumValueNextMobile').val();
			var itemCode = $('.menu-review__index').children('#ItemCodeValueTest').val();
			var tagMain = $('.menu-review__index').children('#TagMainValueTest').val();
			
			$.ajax({
				url : 'pagingNext.do',
				type : 'post',
				datatype : 'html',
				data : {
					"pageNum" : pageNum,
					"itemCode" : itemCode,
					"tagMain" : tagMain
				},
				success : function(data) {
					$('.johntest').html(data);
				},
				complete : function() {
					var pageNum2 = $('.fa.fa-chevron-right.Mobile').children('#PageNumValueNextMobile').val();
					var itemCode2 = $('.menu-review__index').children('#ItemCodeValueTest').val();
					var tagMain2 = $('.menu-review__index').children('#TagMainValueTest').val();
										
					$.ajax({
						url : 'bottomNext.do',
						type : 'post',
						datatype : 'html',
						data : {
							"pageNum2" : pageNum2,
							"itemCode2" : itemCode2,
							"tagMain2" : tagMain2
						},
						success : function(data2) {
							$('.nav-paginate-wrap').html(data2);
						}
					});
				}
			});
		});
// ?????? ??????
		$(document).on('click','.button.dropdown',function(event){	
			// ?????? ???????????? ????????? ????????? ????????? ( ??????????????? ?????? ?????? )
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var str ="";
			if($('.dropdown-btn').hasClass('dropdown-open')){
				$('ul').remove('.toggle-drop-down');
			}else{
				$.ajax({
					url : 'dropDown.do',
					type : 'post',
					datatype : 'html',
					data : {
						"codeNum" : code ,
						"tagNum"  : tag
					},
					success : function(htmlOut){
						str += "<ul data-v-5b7f52e9='' class='toggle-drop-down'>";
						str += htmlOut;
						str += "</ul>";
						$('.dropdown-btn').append(str);
						
					}
				}); // ajax ???								
			} //else ???
			$('.dropdown-btn').toggleClass('dropdown-open');
		}); // ?????? ?????? ???

// ?????? ?????? ????????? ??????
		$(document).on('click','.detail-wrap',function(){
			// ?????????(M) / ??????(L) / ??????????????? ????????? ?????????
			var size = $(this).children().first().children().first().attr('id');
			// ????????? ?????????
			var priceM = $(this).children().last().children().last().text();
			// ?????? ?????? '???',','??? ?????? ?????????
			priceM = Number(priceM.replace('???', '').replace(',', ''));
			// ???????????? ???????????? ????????? ?????????.
			var name = $('.menu__name').text();
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var priceM_Sub ="0";
			// ?????? ??? ??????
			if($(this).children().last().children().length==2){
				priceM_Sub = $(this).children().last().children().first().text();
				priceM_Sub = Number(priceM_Sub.replace('???', '').replace(',', ''));
// 				alert("??? ?????? : "+priceM_Sub);
			}
			var image = $('.menu__body').children().first().val();
			var tagSub = $('#tagSub').val();
			

			// ????????? ???????????? ????????? ????????? ?????????	
			var test = $(this).children().last().children().last().attr('id');
			var testM = $('.1001').val();
 			var testL = $('.1002').val();
			// ajax??? ?????? ???????????????.
			$.ajax({
				url : 'test3.do',
				type : 'post',
				datatype : 'html',
				data :{
					"test" : test,
					"size" : size,
					"price" : priceM,
					"price_sub" : priceM_Sub,
					"name" : name,
					"code" : code,
					"tag" : tag,
					"image" : image,
					"tagSub" : tagSub
				},
				success : function(htmlOut){  // 531??? 827??? ??? ???????????????
//				test = ???????????? id .. testM/testL = ?????? M/L ??? class
					if(testM ==null && testL ==null){
// 						alert("M / L ?????? ??????");
	 					$('.selected-detail-list').append(htmlOut);					
	 					var price = $('.menu__price-current-price__wrapper').children().first().text();
	 					price = Number(price.replace('???', '').replace(',', ''));
//	 					price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
	 					price += priceM; 
//	 					price= price.toLocaleString('ko-KR');   --> , ??????
	 					$('.menu__price-current-price__wrapper').children().text(price.toLocaleString('en')+"???");
	 					
					}
					else if(testM != null && testL == null){
					    if( test == '1001'){
					    // ????????? ???????????? ?????? ?????????
// 					    alert("M??? ?????? L??? ????????? M??? ????????????.");
							$('.1001:eq(0)').parent().next().trigger('click');
					    }else{
// 						alert("M??? ?????? L??? ????????? L??? ????????????.");
		 					$('.selected-detail-list').append(htmlOut);				
		 					var price = $('.menu__price-current-price__wrapper').children().first().text();
		 					price = Number(price.replace('???', '').replace(',', ''));
//		 					price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
		 					price += priceM;  
//		 					price= price.toLocaleString('ko-KR');   --> , ??????
		 					$('.menu__price-current-price__wrapper').children().text(price.toLocaleString('en')+"???");
					    }
					}
					else if(testM == null && testL !=null){
					    if( test == '1001'){
// 							alert("L??? ?????? M???????????? M??? ????????????.");
		 					$('.selected-detail-list').append(htmlOut);
		 					var price = $('.menu__price-current-price__wrapper').children().first().text();
		 					price = Number(price.replace('???', '').replace(',', ''));
//		 					price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
		 					price += priceM;  
//		 					price= price.toLocaleString('ko-KR');   --> , ??????
		 					$('.menu__price-current-price__wrapper').children().text(price.toLocaleString('en')+"???");
		 					
					    }else{
// 							alert("L??? ?????? L??? ????????????");
							$('.1002:eq(0)').parent().next().trigger('click');

					    }
					}
					else if(testM != null && testL !=null){
					    if( test == '1001'){
// 					    	alert("??????????????? M??? ??????");
					    	$('.1001:eq(0)').parent().next().trigger('click');
					    	 
					    }else{
// 					    	alert("??????????????? L??? ??????")
					    	$('.1002:eq(0)').parent().next().trigger('click');
					    	
					    }
					} 				
					
				} // success ???	
			}); // ajax ???

			
			// ????????? ?????? ?????? ????????? ?????????
			$('ul').detach('.toggle-drop-down');						
			$('.dropdown-btn').toggleClass('dropdown-open');
			
		}); // ?????? ?????? ????????? ???
// ??????????????? ???????????? ????????? ?????? ????????? ?????????/?????? ??? +.-??? ???????????????
// ??????,????????? ??????????????? ( ????????? ???????????? ????????? ??????????????? ???????????? ????????? ???????????? ??????????????? ) ???????????????
// ex if(val2 =='????????? ' or val3 == '?????????')
		//  - ?????? ??????
			$(document).on('click','#minus-button',function(){
				// val?????? ???????????? val??? -??? val??? ??????
				var val = Number($(this).next().children().val());
				var val2 = $(this).next().children().attr('class');
				var price = Number($(this).next().children().attr('id'));
				var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				var realPrice = Number(strPrice.replace('???', '').replace(',', ''));

				if(val >1){
					if(val2== 1001){
						val -=1;
						$('.1001:eq(0)').val(val);
						$('.1001:eq(1)').val(val);
						// ?????? ?????? ??????.
//						price = Number(price.slice(0, -1));
//						price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
						realPrice -= price;  
						$('.menu__price-current-price__wrapper').children().text(realPrice.toLocaleString('en')+"???");
						
					}else{
						val -=1;
						$('.1002:eq(0)').val(val);
						$('.1002:eq(1)').val(val);
						// ?????? ?????? ??????.
//						price = Number(price.slice(0, -1));
//						price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
						realPrice -= price;  
						$('.menu__price-current-price__wrapper').children().text(realPrice.toLocaleString('en')+"???");
					}
					
				}else{
					val = 1;
				}

 			});	 // - ?????? ?????? ???	

		//  + ?????? ??????		
			$(document).on('click','#plus-button',function(){
				// val?????? ???????????? val??? +??? val??? ??????  
				var val = Number($(this).prev().children().val());
				var val2 = $(this).prev().children().attr('class');
				var price = Number($(this).prev().children().attr('id'));
				var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				var realPrice = Number(strPrice.replace('???', '').replace(',', ''));

				if(val2== 1001){
					val +=1;
					$('.1001:eq(0)').val(val);
					$('.1001:eq(1)').val(val);
	
				}else{
					val +=1;
					$('.1002:eq(0)').val(val);
					$('.1002:eq(1)').val(val);
				}

				// ?????? ?????? ??????.
				// .menu__price-current-price__wrapper ??? 2???????????? ?????? ????????? ????????? ??????  first()????????? ????????? ???????????????..
//				var price = $('.menu__price-current-price__wrapper').children().first().text();
//				price = Number(price.slice(0, -1));
//				price = price.replace( , , ''); //--> ???????????? ????????? ''??? ??????????????? ???????????????.
				realPrice += price;  
				$('.menu__price-current-price__wrapper').children().text(realPrice.toLocaleString('en')+"???");
				
			});	// + ?????? ?????? ???
			
// ?????? ????????? ?????????
		$(document).on('click','.more-btn',function(){
			$(this).prev().children().toggleClass('img-wrapper');
					
		});
			
// ?????? ????????? ????????? ????????? ??????
		$(document).on('click','.selected-detail__close',function(){
			//alert("??????");
			var val = Number($(this).next().next().children().children().eq(1).children().val());
				// ????????????
 			var val2 = $(this).next().next().children().children().eq(1).children().attr('class'); 
				// ??????????????? ?????????( M or L )
			var strPrice = $('.menu__price-current-price__wrapper:eq(0)').children().text();
				// ?????? ??????
			var numPrice = Number(strPrice.replace('???', '').replace(',', ''));
				// ?????? ?????? ?????????


			if(val2==1001){ //????????? ??????
				var price = Number($('.1001:eq(0)').attr('id'));
				// ?????? ??????
				numPrice -= price*val;
				//alert("numPrice : " + numPrice);

				// ????????? ??????
				$('.1001:eq(0)').parent().parent().parent().parent().parent().detach();
				$('.1001:eq(0)').parent().parent().parent().parent().parent().detach();
				
				$('.menu__price-current-price__wrapper').children().text(numPrice.toLocaleString('en')+"???");
				
			}else{ // ?????? ??????
				var price = Number($('.1002:eq(0)').attr('id'));
				// ?????? ??????
				numPrice -= price*val;
				//alert("numPrice : " + numPrice);
				
				$('.1002:eq(0)').parent().parent().parent().parent().parent().detach();
				$('.1002:eq(0)').parent().parent().parent().parent().parent().detach();
				
				$('.menu__price-current-price__wrapper').children().text(numPrice.toLocaleString('en')+"???");
				
			}					
		});
		
// nav??? ????????? ???????????????
		$(document).on('click','.menu-tab-btn-wrap',function(){
			var text = $(this).children().children().text();
			if(text =="????????????"){
				var location = document.querySelector(".menu-description-container").offsetTop;
				window.scrollTo({top:location-150, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text =="????????????"){  
				var location = document.querySelector("#product-info").offsetTop;
				window.scrollTo({top:location-180, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "FAQ"){
				var location = document.querySelector("#faq").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}else if(text == "????????????"){
				var location = document.querySelector("#ClientReview").offsetTop;
				window.scrollTo({top:location-220, behavior:'smooth'});
				$(this).siblings().removeClass('on');
				$(this).addClass('on');
			}
		})
		
// ????????? ????????? nav ??? ??????
	   $(document).ready(function(){
			var menu =$('.menu-tab-btn-wrap');
			var contents = $('.navBar');
			$(window).scroll(function(){
				var scltop = $(window).scrollTop();
				$.each(contents, function(idx,item){
					var target = contents.eq(idx);
					var i = target.index();
					var targetTop = target.offset().top;
					if (targetTop-265 <= scltop) {
			  			menu.removeClass('on');
			  			menu.eq(idx).addClass('on');
			  		}
			  		if (!(600 <= scltop)) {
			  			menu.removeClass('on');
			  		}
				})		
			})
		});

// ?????? ??????
		$(document).ready(function(){
			var starCount = $('.review-count').attr('id');
			//var star = $("<img src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>");
			var halfStart = starCount.substring(2);
			
			for(var i=1; i<starCount; i++){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>").insertAfter('#front');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png' class='review-stars-star'>").insertAfter('#front2');
		
			} // ??? ??????
			if(halfStart ==0){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png'>").insertAfter('#front');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png' class='review-stars-star'>").insertAfter('#front2');
			}
			if(halfStart > 2){
				$("<img data-v-32a18372 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(half).png'>").insertBefore('#rear');
				$("<img data-v-f8b893b0 src='https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(half).png' class='review-stars-star'>").insertBefore('#rear2');
			}
		
		})
		
		// ????????? ?????? (????????? ?????? ?????????)
		$(document).on('click', '.review-item__photo', function(){
			var image = $(this).siblings('input').val();
			
			$.ajax({
				url : 'detailReviewImageModal.do',
				dataType : 'html',
				type : 'post',
				data : {
					'image' : image
				},
				success : function(htmlOut){
					$('html').attr('class', 'mode-popup');
					$('.menu-review').append(htmlOut);
				}
			})
		})
		
		// ?????? ????????? ????????? ??????
		$(document).on('click', '.menu-review .modal', function(){
			$(this).detach();
			$('html').attr('class', '');
		})
		
		
     }); //function ???
  

    </script>

<!--     for slide   -->
    <style type="text/css">

	.swiper-container {
		height:420px;
	
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* ????????? ???????????? ???????????? flex ?????? */
		align-items:center; /* ????????? ?????? ???????????? */
		justify-content:center; /* ?????? ?????? ???????????? */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
		max-width:100%; /* ????????? ??????????????? ??????, ??????????????? ???????????? ???????????? ???????????? ?????? */
		/* ??? ???????????? ???????????? ??????????????????. ??????????????? ?????? ??? ????????????. */
	}

	</style>
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
    <title>Saladit!</title>
</head>
<body>
	<div id="__nuxt">
	<div id="__layout">
	<main class="viewport" data-v-67c7ff33="">
	<header data-v-7aa1f9b4="" data-v-1739428d="" id="header-area"
					class="header">
					<div data-v-7aa1f9b4="" class="header-banner-wrap">
						<!---->
					</div>
					<div data-v-7aa1f9b4="" id="header__body" class="header__body">
						<div data-v-7aa1f9b4="" class="header__top">
							<a data-v-7aa1f9b44="" href="#" class="header__top-left"></a>
							<div data-v-7aa1f9b4="" class="header__top-right">
							
								<c:choose>
										<c:when test="${empty member.gender}">
											<a href="signup.do" data-v-30697495="">????????????</a>
											<a data-v-30697495="" href="login.do">?????????</a>
										</c:when>
										<c:otherwise>
											<a href="myPayInfo.do" id="nickname" data-v-30697495>${member.name } <span data-v-30697495>???</span></a>
										</c:otherwise>
									</c:choose>
							</div>
						</div>
						<!---->
						<div data-v-7aa1f9b4="" class="header__logo">
							<a data-v-7aa1f9b4="" href="main.do" class="nuxt-link-active"></a>
							<!---->
						</div>
<!--                form?????? -->
<!--                form?????? -->
<!--                form?????? -->
			 	<form name="paging">
					<input type="hidden" name="tagMain01" value="">
					<input type="hidden" name="itemCode01" value="">
					<input type="hidden" name="tagSub01" value="">
				</form>
				<form name="order">
<!-- 					????????? ??????????????? ?????? M/L ???????????? ???????????? ??????????????? ?????????????????? if?????? ?????? ""?????? 1?????? ???????????????... -->		
					<input type="hidden" name="orderItemCode" value="" id="a">
					<input type="hidden" name="orderItemCode" value="0" >
					<input type="hidden" name="orderTagMain" value=""  >
					<input type="hidden" name="orderTagMain" value="0"  >								
					<input type="hidden" name="orderItemPrice"  value="" >
					<input type="hidden" name="orderItemPrice"  value="0" >				
					<input type="hidden" name="orderItemPriceSub" value="">
					<input type="hidden" name="orderItemPriceSub" value="0">
					<input type="hidden" name="orderItemName" value="" >
					<input type="hidden" name="orderItemName" value="0" >
					<input type="hidden" name="orderItemSizeSummary" value=""  id="a">
					<input type="hidden" name="orderItemSizeSummary" value="0" id="b">
					<input type="hidden" name="orderItemImage" value="" >
					<input type="hidden" name="orderItemImage" value="0" >
					<input type="hidden" name="orderItemTagSub" value="" >
					<input type="hidden" name="orderItemTagSub" value="0" >
					<input type="hidden" name="orderQuantity"  value="">
					<input type="hidden" name="orderQuantity"  value="0">

				</form>
				
				
               <nav data-v-7aa1f9b4="" class="header__menus">
							<div data-v-7aa1f9b4="">
								<div data-v-7aa1f9b4="" class="dropdown">
									<span data-v-7aa1f9b4="" class="item">?????? ????????????</span>
									<div data-v-7aa1f9b4="" class="dropdown">
										<ul data-v-7aa1f9b4="">
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(0);" class=""> ???????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(200);" class=""> ????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(100);" class="new"> ???????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(300);" class="new"> ????????????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(400);" class="new"> ???????????????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(500);" class=""> ??????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(600);" class="new"> ???????????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(700);" class="new"> ?????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(800);" class="new"> ?????? </a></li>
											<li data-v-7aa1f9b4=""><a data-v-7aa1f9b4=""
												href="javascript:page_move(1);" class="new"> ?????????????????? </a></li>
										</ul>
									</div>
								</div>
								<a data-v-7aa1f9b4="" href="javascript:page_move(100);" class="item">????????????
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(200);" class="item">????????? </a><a
									data-v-7aa1f9b4="" href="javascript:page_move(300);" class="item">?????????????????
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(1);" class="item">??????????????????
								</a><a data-v-7aa1f9b4="" href="javascript:page_move(600);" class="item">???????????? </a>
									<a data-v-7aa1f9b4="" href="event.do" class="item">????????? </a>
							</div>
							<div data-v-7aa1f9b4="" class="header__menus-side">
								<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
									data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
									alt="?????? ??????" class="search-logo-img"
									style="width: 30px; height: 30px;">
									<div data-v-7aa1f9b4="">??????</div></a> <a data-v-7aa1f9b4=""
									href="basket.do" class="cart-logo-wrap item"><div
										data-v-7aa1f9b4="" alt="??????????????? ????????????" class="cart-logo empty">
										<!---->
									</div> <!----> ???????????? </a> <a data-v-7aa1f9b4="" href="order.do" class="item"><div
										data-v-7aa1f9b4="" class="icon-order"></div> ???????????? </a>
							</div>
						</nav>
						<div data-v-7aa1f9b4="" class="header__side">
							<a data-v-7aa1f9b4="" href="search.do" class="search-logo"><img
								data-v-7aa1f9b4="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_search_gray.PNG"
								alt="?????? ??????" class="search-logo-img"
								style="width: 30px; height: 30px;"></a> <a data-v-7aa1f9b4=""
								href="basket.do" class="cart-logo-wrap item"><div style="width: 24px; height: 24px;"
									data-v-7aa1f9b4="" alt="??????????????? ????????????" class="cart-logo empty">
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
					<div class="mobile-nav js-mobile-nav" data-v-7aa1f9b4="">
						<div class="mobile-nav-wrap" data-v-7aa1f9b4="">
							<div class="mobile-nav-scroll" data-v-7aa1f9b4="">
								<ul class="mobile-nav-contents" data-v-7aa1f9b4="">
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(0);" class=""
										data-v-7aa1f9b4=""> ?????? ?????? </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(100);" class="" data-v-7aa1f9b4="">
											???????????? </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(1);" data-v-7aa1f9b4="" class=""> ?????????????????? </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(200);" data-v-7aa1f9b4="" class=""> ????????? </a></li>
									<li class="mobile-nav-contents-item" data-v-7aa1f9b4=""><a
										href="javascript:page_move(300);" data-v-7aa1f9b4="" class=""> ????????????????? </a></li>
								</ul>
							</div>
						</div>
					</div>

					<!---->
					<!---->
					<!---->
					<!---->
				</header>
    <div id="container">
        <div id="home">
            <!--?????? container??? padding-top:182px ?????? ??????:
            ????????? ???????????? ?????? ???????????? ??? ?????? container??? ???????????? ????????? ??? ?????????-->
            <div class="menu__container">
                <article class="menu">
                    <div id="menu__head" class="menu__head">
                        <figure class="menu__image">
                            <div class="menu-badge">
                            </div>
                                <img src="${detail.item_image }" alt="?????? ?????????" >
                        </figure>
                        <div data-v-32a18372 class="menu__body" >
                        	<input type="hidden" value=${detail.item_image }>
                            <header data-v-32a18372 class="menu__header">
                                <h2 data-v-32a18372 class="menu__name">${detail.item_name }</h2>
                                <div data-v-32a18372 class="menu__summary">${detail.item_summary }</div>
                                <div data-v-32a18372 class="review">
                                    <div data-v-32a18372 class="row--v-center review-wrap">
                                    
                                    
                                        <div data-v-32a18372 class="review-stars">
											<input type="hidden" id="front"></input>
											<input type="hidden" id="rear"></input>
                                        </div>
                                        
                                        
                                        <div>
                                            <span class="review-count" id ="${avgCount.starAvg }">
                                                ${avgCount.starAvg }(?????? ${avgCount.reviewCount})
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="price-wrap">
                                    <b>${detail.item_price_m }??? </b>
                                    <c:if test= "${detail.item_price_m_sub !='' }">
                                    <b>~</b>
                                    <del>${detail.item_price_m_sub }???</del>
                                    </c:if> 
                                </div>
                                <ul data-v-32a18372 class="menu-detail">
                                    ${detail.item_explain }
                                </ul>
	                                <div data-v-2706028c class="menu-select-panel">
	                                    <div data-v-2706028c class="menu__select-size">
	                                        <ul data-v-2706028c class="menu__select-size-list">
	                                            <li data-v-2706028c>
	                                                <label data-v-2706028c class="menu__label only-desktop">????????????</label>
	 <!--  ????????? ?????? -->                                 <div data-v-2706028c class="dropdown-btn-wrap">
	                                                    <div data-v-5b7f52e9 data-v-2706028c>
	                                                        <div data-v-5b7f52e9 class="dropdown-btn">
	                                                            <div data-v-5b7f52e9 class="button dropdown">
	                                                                <div data-v-5b7f52e9 class="dropdown-content">
	                                                                    <span data-v-5b7f52e9>??????</span>
	                                                                </div>
	                                                                <div data-v-5b7f52e9 class="dropdown-icon">
	                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="dropdown-icon">
	                                                                </div>
	                                                            </div>
	<!--  ????????? ?????? ?????? ??????????????? selectitem.jsp ??? ?????? -->
	 
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </li>
	                                            <!--li class="menu-option" ????????? -->
	                                        </ul>
											 <ul class="selected-detail-list" data-v-2706028c="" id="aaa">
	<!--  ????????? ????????? ???????????? ??? -->
											 </ul>
			
	                                    </div>
	                                    <div data-v-2706028c class="menu__price">
	                                        <label data-v-2706028c class="menu__label menu__price-label"> ?????? ?????? </label>
	                                        <div data-v-2706028c class="menu__price-right">
	                                            <div data-v-2706028c class="menu__price-current-price__wrapper">
	                                                <div data-v-2706028c class="menu__price-current-price">0???</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                                                 
                            </header>
                            <nav data-v-32a18372 class="menu__button-order-body">
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
											<input type="hidden" value="${tagSub}" id="tagSub">
                                            <span data-v-a1c889e0 class="button__wrap">???????????? ??????</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" id="goOrder">
                                            <span data-v-a1c889e0 class="button__wrap">????????????</span>
                                        </button>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <article data-v-3ebe8eb0 data-v-32a18372 class="reco-index">
                        <header data-v-3ebe8eb0 class="row--v-center reco-index__header">
                            <div data-v-3ebe8eb0 class="col reco-title-wrap">
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_like.png"  class="reco-title-img">
                                <h2 data-v-3ebe8eb0>?????? ???????????? ?????? ??? ??????</h2>
                            </div>
                            <nav data-v-3ebe8eb0>
                                <!--??? nav ?????? ?????? ???????????? ??????????????? ??????..-->
                            </nav>
                        </header>
                   <!--  -->
                   <!--  -->
                   <!--  -->
                   <!--?????? ???????????? ?????? ??? ??????-->
						<div class="swiper-container">
							<div class="swiper-wrapper">
	
								<c:forEach var="item" items="${random }">
									<div class="swiper-slide">
										<input type="hidden" value="${item.itemCode }" id="itemCode">
										<input type="hidden" value="${item.tagMain }" id="tagMain">
										<input type="hidden" value="${tagSub}" id="tagSub">
										<ul>
											<li data-v-4c9a9e82="" class="col-6 col--lg-3">
												<article
													data-v-15082832="" data-v-4c9a9e82=""
													class="item for-loop-cloned-item-244">

													<div data-v-15082832="" class="for-loop-cloned-item-244">
														<figure data-v-15082832=""
															class="item__image for-loop-cloned-item-244">
															<div data-v-15082832=""
																class="item-badge for-loop-cloned-item-244">
																<!---->
															</div>
															<img data-v-15082832=""
																src="${item.itemImage }"
																alt="${item.itemName } " title="${item.itemName } "
																class="for-loop-cloned-item-244">
														</figure>
														<div data-v-15082832=""
															class="item__body for-loop-cloned-item-244">
															<!---->
															<strong data-v-15082832=""
																class="for-loop-cloned-item-244">${item.itemName }</strong>
															<div data-v-15082832=""
																class="for-loop-cloned-item-244 options">
																<dl data-v-15082832=""
																	class="for-loop-cloned-item-244 row--v">
																	<dd data-v-15082832="" class="for-loop-cloned-item-244">
																		<em data-v-15082832=""
																			class="for-loop-cloned-item-244"><b>${item.itemPriceM }???</b></em>~ <span
																			data-v-15082832="" class="for-loop-cloned-item-244">
																			<c:if test="${item.itemPriceMSub ne ''}">
																					${item.itemPriceMSub }
																			</c:if>
																			</span>
																	</dd>
																</dl>
															</div>
															<span data-v-15082832="" class="for-loop-cloned-item-244">${item.itemSummary }</span>
															<div data-v-15082832=""
																class="item-bottom for-loop-cloned-item-244 row--v-center row--h-between">
																<div data-v-15082832=""
																	class="for-loop-cloned-item-244 info-wrap">
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-244 star-info">${item.starAvg }</span>
																	<span data-v-15082832=""
																		class="for-loop-cloned-item-244 review-info">${item.reviewCount }</span>
																</div>
																<div data-v-15082832=""
																	class="row--v-center for-loop-cloned-item-244 tag-wrap">
																	<div data-v-15082832=""
																		class="for-loop-cloned-item-244 row--v-center">
											<!-- 																		<div data-v-15082832="" -->
											<!-- 																			class="for-loop-cloned-item-244 vegi-tag md-item-vegi-tag"> -->
											<!-- 																			?????????????????????</div> -->
																</div>
															</div>
														</div>
													</div>
												</div>
											</article>
										</li>
									</ul>
								</div>
							</c:forEach>

						</div>
					
						<!-- ??????????????? -->
						<div class="swiper-button-next"></div><!-- ?????? ?????? (???????????? ?????? ??????) -->
						<div class="swiper-button-prev"></div><!-- ?????? ?????? -->
					
						<!-- ????????? -->
						<div class="swiper-pagination"></div>
					</div>   
					<!--  -->             
					<!--  -->             
					<!--  -->                        
                    </article>
                    <div data-v-32a18372 class="menu__tab">
                        <nav data-v-61e19c34 data-v-32a18372 class="menu-tab unit">
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap on">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>FAQ</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="desktop-tab-blank">
                            </div>
                        </nav>
                    </div>
                    <div data-v-32a18372 class="menu-description-container navBar">
                        <div data-v-32a18372 class="menu-description">
                            <div data-v-32a18372 class="menu-description-left">
                                <div data-v-32a18372 id="menu-detail" class="menu__tab-info">
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9 class="detail-wrapper">
                                            <div data-v-79f00ef9 id="bundle-detail" class="detail">
                                                <div data-v-79f00ef9 class="img-wrapper">
                                                <c:forEach var="showImage" items="${showImage }">
                                                    <div data-v-79f00ef9 id>
                                                        <img data-v-79f00ef9 src="${showImage }" class="img-fade">
                                                    </div>
                                                </c:forEach>
                                        
                                                    
                                                    <div data-v-79f00ef9 class="shadow"></div>
                                                </div>
                                            </div>
                                            <div data-v-79f00ef9 class="more-btn">
                                                <span data-v-79f00ef9 class="more-btn-text">?????? ?????? ?????????</span>
                                                <img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down(green).png"  class="more-btn-arrow">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="menu__tab-info delivery">
                                    <h1 data-v-32a18372 class="menu__tab-info-title delivery">
                                        ????????????
                                    </h1>
                                    <div data-v-79f00ef9 data-v-32a18372 class="menu-info">
                                        <div data-v-79f00ef9>
                                            <img data-v-79f00ef9 src="https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/content/origin/7946_20210707161730" class="img-fade">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-v-32a18372 class="menu-select-panel-desktop">
                                <h4 data-v-32a18372>?????? ??????</h4>
                                <div data-v-2706028c data-v-32a18372 class="menu-select-panel floating-panel-default">
                                    <div data-v-2706028c class="menu__select-size" style="border-bottom: 0px;">
                                        <ul data-v-2706028c class="menu__select-size-list">
                                            <li data-v-2706028c>
                                                <div data-v-2706028c class="dropdown-btn-wrap" style="width: 100%;">
                                                    <div data-v-5b7f52e9 data-v-2706028c>
                                                        <div data-v-5b7f52e9 class="dropdown-btn">
                                                            <div data-v-5b7f52e9 class="button dropdown">
                                                                <div data-v-5b7f52e9 class="dropdown-content">
                                                                    <span data-v-5b7f52e9>??????</span>
                                                                </div>
                                                                <div data-v-5b7f52e9 class="dropdown-icon">
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="dropdown-icon">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
<!--                                             <li data-v-2706028c class="menu-option"> -->
<!--                                                 <div data-v-2706028c class="menu-option-wrap"> -->
<!--                                                     <label data-v-2706028c class="menu__label">?????? ????????? ?????? MD ?????? ??????</label> -->
<!--                                                     <div data-v-2706028c class="menu-option-item isDesktop"> -->
<!--                                                         <div data-v-2706028c class="menu-option-left"> -->
<!--                                                             <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508"> -->
<!--                                                             <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label"> -->
<!--                                                                 <span data-v-2706028c class="menu-option-text">[????????????] ????????? ????????? 1???</span> -->
<!--                                                             </label> -->
<!--                                                         </div> -->
<!--                                                         <div data-v-2706028c class="meni-option-right"> -->
<!--                                                             3,000??? -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div data-v-2706028c class="menu-option-item isDesktop"> -->
<!--                                                         <div data-v-2706028c class="menu-option-left"> -->
<!--                                                             <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508"> -->
<!--                                                             <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label"> -->
<!--                                                                 <span data-v-2706028c class="menu-option-text">[??????????????????] ????????? ????????? 4??? ??????</span> -->
<!--                                                             </label> -->
<!--                                                         </div> -->
<!--                                                         <div data-v-2706028c class="menu-option-right"> -->
<!--                                                             3,600??? -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                     <div data-v-2706028c class="menu-option-item isDesktop"> -->
<!--                                                         <div data-v-2706028c class="menu-option-left"> -->
<!--                                                             <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508"> -->
<!--                                                             <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label"> -->
<!--                                                                 <span data-v-2706028c class="menu-option-text">[????????????] ??????????????? 2??? ???????????? 1???</span> -->
<!--                                                             </label> -->
<!--                                                         </div> -->
<!--                                                         <div data-v-2706028c class="menu-option-right"> -->
<!--                                                             3,300??? -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </li> -->
                                        </ul>
                                        <ul data-v-2706028c class="selected-detail-list isDesktop" id='abcd'>
  <!--  ????????? ??????????????????  -->                                      
                                        
                                        
                                        
                                        </ul>
                                    </div>
                                    <div data-v-2706028c class="menu__price isDesktop">
                                        <label data-v-2706028c class="menu__label menu__price-label" style="width: 108px;">?????? ??????</label>
                                        <div data-v-2706028c class="menu__price-right">
                                            <div data-v-2706028c class="menu__price-current-price__wrapper">
                                                <div data-v-2706028c class="menu__price-current-price">0???</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap:nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px; height: 52px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
												<input type="hidden" value="${tagSub}" id="tagSub">
                                            <span data-v-a1c889e0 class="button__wrap">???????????? ??????</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" style="height: 52px;" id="goOrder">
                                            <span data-v-a1c889e0 class="button__wrap">????????????</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-v-32a18372 id="product-info" class="navBar">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372 id="info">?????? ?????? ??????</span>
<!--                            <div data-v-32a18372 class="info-title-img" > -->
                                	<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" style="width:25px; height:25px;">
<!--                            </div> -->
                            </h3>
						<!-- <div>~~~ ????????????. -->
							<div data-v-32a18372="" class="menu-info-content-wrap" id="item_info_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="???????????? ?????? ?????? ??????" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">?????? ?????? ??????</h3>
								</section>
								<section data-v-32a18372="" class="menu-info-content-body">

									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="detailInfo" items="${detailInfo }">
			                      			${detailInfo }
			                      		</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailInfo2" items="${detailInfo2}">
		                      				${detailInfo2}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
							</div>
						<!-- </div> -->
                        </div>
                        <div data-v-32a18372 id="nutrition-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372 id="nut">?????? ?????? ??????</span>
<!--                                 <div data-v-32a18372 class="info-title-img"></div> -->
								<img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png" style="width:25px; height:25px;">
                            </h3>
                            
                         <!--<div>~~~ ????????????.  --> 
	                        <div data-v-32a18372="" class="menu-info-content-wrap" id="item_nut_show">
								<section data-v-32a18372="" class="menu-info-content-header">
									<img data-v-32a18372="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/Logo_close.png"
										alt="?????? ?????? ?????? ?????? ??????" class="content-header-close">
									<h3 data-v-32a18372="" class="content-header-title">?????? ??????
										??????</h3>
								</section>
								
								<section data-v-32a18372="" class="menu-info-content-body">
									<c:if test="${detail.item_tag_main ne 100 && detail.item_tag_main ne 600 }">
										<c:forEach var="itemNut" items="${itemNut}">
		                      				${itemNut}
		                      			</c:forEach>
		                      		</c:if>
		                      		<c:if test="${detail.item_tag_main eq 100 || detail.item_tag_main eq 600 }">
		                      			<c:forEach var="detailNut" items="${detailNut}">
		                      				${detailNut}
		                      			</c:forEach>
		                      		</c:if>
	                      		</section>
	                        </div>
                        <!-- <div>-->  
                        
                        </div>
                        <div data-v-32a18372 id="faq" class="menu__tab-info tab_menu_detail navBar">
                            <p data-v-32a18372 class="menu__tab-info-title faq">FAQ</p>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
								<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">??? ??????????????????<br>
												???????????????????????? ????????????, PAYCO, ????????????, kakaopay,toss,??????????????? ???????????????. 
												GS25 ????????? ???????????? ?????? ???, toss??????????????? ????????? ??? ????????? ????????? ?????? ?????? ????????????.</div>
										</div>
									</div>
								</div>
							</div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[???????????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">??? ???????????? ?????? ?????? ??????<br>
                                             1. ????????? ?????? ??????.
                                             2. ???????????? ???????????? ??????.
                                             (????????????/???/????????????/????????????)
                                             3.??????????????? ?????? ?????? ??? ?????? ??????.
                                             4. ?????? ????????? ???????????? ???????????? ???/??? ??????.
                                             5. ?????? ?????? ?????? ??????.
                                             6. ?????? ????????? ?????? ??????
                                             7. ????????? ?????? ?????? ??? ??????.</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??? ?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
                                    <div data-v-e3f957fc class="answer-wrapper">
                                       <div data-v-e3f957fc class="answer-column left">
                                          <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"  class="menu-info-table-img answer">
                                       </div>
                                       <div data-v-e3f957fc class="answer-column right">
                                          <div data-v-e3f957fc class="menu-info-table-content-description">??? ???????????? ?????? ?????? ??????<br>
                                             ??? ??????/??????????????? ?????? ????????? D-1??? ?????? 3????????? ??????????????? ?????? ?????? ?????? ?????? 
                                             ??? ???????????? ?????? ??? ?????????????????? ??? ?????? ??? ?????? ???????????????.

                                             ??? ???????????? ?????? ??????/???????????? ???????????? ?????? ?????? ???, ?????? ???????????? ????????? ??? ?????????????????? ?????? ????????? ?????? ????????? ????????? ?????? ??? ???????????? ?????? ?????????.


                                             ??? ?????? ????????? ?????????, ???????????? ??? ?????? ????????? ?????? ????????? ????????? ??? ??????????????? ?????? ???????????????
                                             ??? ??????????????? ?????? ??? ???????????? ???????????????. ???????????? ?????? ?????? ?????? ??????????????? ?????? ?????? ????????? ?????? ???????????? ????????? ???????????????.
                                             ??? ????????? ????????? ?????? ????????? ?????????????????? ?????? ?????? ????????? ?????? ??? ????????? ???????????????.</div>
                                       </div>
                                    </div>
                                 </div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description"> ??? ???????????? <br>
                                             ??????????????? 00??? ~ 07??? ?????? ???????????? ????????? ????????? ??????
                                             ???????????? ?????? ??? ???????????? ?????? ?????? ??????, ??????????????? ?????? ????????? ????????? ?????? ?????? ????????? ????????????.
                                             
                                             ????????? ????????? ?????? ?????? ?????? ????????? ????????? ????????? ?????? ???????????? ??????
                                             ???????????? ????????? ??????????????? ??????/?????????/?????????/??????/?????????/???????????? ?????? ????????? ????????? ????????????
                                             ?????????????????? ?????? 6??? ????????? ???????????? 1?????? ??????????????? ?????? ????????????.
                                             (?????? ??? ??????????????? ????????? ???????????? ?????? ????????? ????????? ???????????? ???????????? ????????? ???????????????.)
                                             
                                             ?????? ???????????? 1?????? ??????, ???????????? 3500????????? 35,000??? ?????? ?????? ???, ???????????? ?????????.
                                             
                                             ???????????????
                                             ?????????, ??????????????? ????????? ?????? ????????? ????????? ???????????? CJ ??????????????? ?????? ????????? ?????????.
                                             ?????? ?????? ?????? 1?????? ?????? ???????????? 3500????????? 35,000??? ?????? ??? , ?????? ???????????????.
                                             CJ??????????????? ?????? ????????? ?????? ?????????, ??? ????????? ???????????? ????????? ?????? ??????????????? ????????? ????????? ??????????????? ????????? CJ???????????? ??????????????? ?????? ?????? ????????????. (CJ???????????? ???????????? : 1588-1255)
												</div>
										</div>
									</div>
								</div>
                            </div>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_question.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????(?????? ?????? ??????)]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_down_s.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_answer.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description">??? ????????? ????????? ????????????????<br>
                                             ??? ????????????/???????????? ????????? ?????? ?????? 7????????? ?????????????????? ?????? ????????? ???????????????.
                                             ??? ????????????/??????????????? ?????? ?????? ????????? D-1??? ?????? 3?????????  ?????????????????? ?????? ????????? ???????????????.


                                             ??? ???????????? ?????? ???????????? ????????? ????????????????
                                             ??? ????????????/???????????? ?????? ????????? ?????? ?????? 7????????? ??????????????? ?????? ??????????????? ?????? ?????? ????????? ?????? ??? ????????? ???????????? ?????????.
                                             ??? ????????????/??????????????? ?????? ?????? ????????? D-1??? ?????? 3????????? ??????????????? ?????? ??????????????? ?????? ?????? ????????? ?????? ??? ????????? ???????????? ?????????.

                                             ??????????????? ????????? ????????? ????????? ?????? ????????????????
                                             ???  ???????????? ?????????????????? ??????, ?????? ????????? ????????? ????????? ???????????????.

                                             ??? ??????????????? ???????????? ???????????? ??????????
                                             ??? ??????????????? ???????????? ????????? ???????????? ????????????, ?????? ???????????? ????????? ?????? ?????????????????? ????????? ???????????? ?????? ?????????.
												</div>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                    <div data-v-32a18372 class="menu__tab-review" id="review"
                    data-gtm-vis-first-on-screen-7693391_542="15381"
                    data-gtm-vis-total-visible-time-7693391_542="3000"
                    data-gtm-vis-has-fired-7693391_542="1">
                        <div data-v-f8b893b0="" data-v-32a18372="" class="menu-review">
<!--                             <section data-v-f8b893b0="" class="menu-review__album"> -->
<!--                                 <h3 data-v-f8b893b0="" class="menu-review__album-title"> -->
<!--                                   ?????? ?????? ?????? (13) -->
<!--                                 </h3> -->
<!--                                 <div data-v-f8b893b0="" class="images"> -->
<!--                                   <div data-v-f8b893b0=""> -->
<!--                                      <span id="carousel_prev_nj8u0ztnu9d" style=""></span> -->
<!--                                      <div id="carousel_ola7225lcr9" -->
<!--                                         class="owl-carousel owl-theme owl-loaded"> -->
<!--                                         <div class="owl-stage-outer"> -->
<!--                                            <div class="owl-stage" -->
<!--                                               style="transform: translate3d(-1224px, 0px, 0px); transition: all 0s ease 0s; width: 5100px;"> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="7" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="8" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="9" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="10" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="11" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="12" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="0" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="1" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="2" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="3" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="4" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item active" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="5" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="6" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44194_20220120145825&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="7" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44177_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="8" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44178_20220120123659&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="9" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44144_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="10" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44145_20220120071145&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="11" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44112_20220119135334&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="12" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44090_20220119113045&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="0" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="1" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="2" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="3" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44276_20220121141048&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="4" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44231_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                               <div class="owl-item cloned" -->
<!--                                                  style="width: 180px; margin-right: 24px;"> -->
<!--                                                  <div data-v-f8b893b0="" class="images__image"> -->
<!--                                                     <a data-v-f8b893b0="" href="#"><i -->
<!--                                                        data-v-f8b893b0="" id="5" -->
<!--                                                        style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44232_20220121072316&quot;);"></i></a> -->
<!--                                                  </div> -->
<!--                                               </div> -->
<!--                                            </div> -->
<!--                                         </div> -->
<!--                                         <div class="owl-nav"> -->
<!--                                            <div class="owl-prev">next</div> -->
<!--                                            <div class="owl-next">prev</div> -->
<!--                                         </div> -->
<!--                                         <div class="owl-dots disabled"></div> -->
<!--                                      </div> -->
<!--                                      <span id="carousel_next_tc5wlekmakl"></span> -->
<!--                                   </div> -->
<!--                                </div> -->
<!--                             </section> -->
                            <section data-v-f8b893b0="" class="menu-review__rating">
                               <div data-v-f8b893b0="" class="wrap">
                                  <h3 data-v-f8b893b0="" id="ClientReview" class="navBar">?????? ??????</h3>
                                  <div data-v-f8b893b0=""
                                     class="row--v-center review-box-wrapper">
                                     <div data-v-f8b893b0="" class="review-stars">
                                        <input type="hidden" id="front2"></input>
										<input type="hidden" id="rear2"></input>
                                     </div>
                                     <div data-v-f8b893b0="" class="review-rating-counts">
                                        ${avgCount.starAvg }(?????? ${avgCount.reviewCount})</div>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__index">
                            	<input type="hidden" value="${detail.item_code}" id="ItemCodeValueTest" >
                            	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueTest" >
                               <ul data-v-f8b893b0="" class="johntest">
                               
                               
	                               	  <c:forEach var="board" items="${boardList }" varStatus="i">
		                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
		                                     <div data-v-22105fb8="" class="review-item__head">
		                                        <div data-v-22105fb8="" class="head-rating">
		                                           <img data-v-22105fb8=""
		                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_star(full).png" 
		                                              class="rating-img">
		                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-summary">
		                                           <div data-v-22105fb8="" class="head-summary-left">
		                                           <c:if test="${!empty board.image }">
		                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_pics.png"
		                                                  class="summary-photo">
													</c:if>
		                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
		                                           </div>
		                                           <c:forEach var="reviewReply" items="${reviewReply }">
			                                           <c:if test="${reviewReply.seq == board.seq}">
			                                           		<img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_reply%402x.png" alt="????????? ??????" class="summary-answer">
		                                           		</c:if>
		                                           </c:forEach>
		                                           <!---->
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-text">
		                                           <div data-v-22105fb8="" class="text-name">${board.user_name }</div>
		                                           <div data-v-22105fb8="" class="text-date">${fn:substring(board.write_date, 0, 10)}</div>
		                                        </div>
		                                     </div>
		                                     <div data-v-22105fb8=""
		                                        class="review-desktop-toggle review-hide">
		                                        <div data-v-22105fb8="" class="review-item__body">
		                                           <div data-v-22105fb8="" class="review-item__comment">${board.content }</div>
		                                           <div data-v-22105fb8="" class="review-item__photos">
		                                           
			                                           <c:forEach var="reviewImage" items="${reviewImage[i.index] }" varStatus="j">
				                                           <c:if test="${reviewImage != '0' }">
				                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
				                                                 <div data-v-22105fb8="" class="review-item__photo"
				                                                    style="background-image: url(&quot;${reviewImage}&quot;);"></div>
				                                                 <input type="hidden" value="${reviewImage }">
				                                              </div>
				                                           </c:if>
		                                              </c:forEach>
													</div>
		                                        </div>
		                                        <c:forEach var="reviewReply" items="${reviewReply }">
				                                           <c:if test="${reviewReply.seq == board.seq}">
																<div data-v-22105fb8="" class="review-item__reply">
																	<p data-v-22105fb8="" class="review-item__admin-name">
																		?????????_?????????</p>
																	<p data-v-22105fb8=""
																		class="review-item__admin-comment">???????????????.
																		?????????????????? (?????? ?????????)??? ????????? ????????? ????????? ???????????? ?????? ????????? ?????? ???????????????.
		
																		${reviewReply.replycontents }</p>
																	<p data-v-22105fb8="" class="review-item__date">
																		${reviewReply.replydate }</p>
																</div>
															</c:if>
														</c:forEach>
		                                        <!---->
		                                     </div>
		                                  </li>
	                                  </c:forEach>
                                     <!-- ?????? ?????? ??? ??? ?????? ????????? ??? ????????? ?????? :  review-item__head ????????? border-bottom-desktop-show -->
                                     <!-- ?????? ?????? ??? ??? ???????????? ??? ????????? ?????? : review-desktop-toggle ????????? review-hide -->
                                     <!-- ?????? ?????? ?????? ??? ???????????? ??? ????????? ?????? :  review-item__head ????????? border-bottom-desktop-show -->
                                     <!-- ?????? ?????? ?????? ??? ?????? ????????? ??? ????????? ?????? : review-desktop-toggle ????????? review-hide -->
                                   
                               </ul>
                               <div data-v-20ad18c6="" data-v-f8b893b0=""
                                  class="nav-paginate-wrap">
                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
                                        <ul class="btn-group pagination">
										     <c:if test="${pageMaker.prev }">
											    <li>
											    	<button>
											        	<i class="fa fa-chevron-left Mobile">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrevMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button >
											        	<i class="fa pageNum Mobile">
												        	<input type="hidden" value="${pageNum}" id="PageNumValueMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValueMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueMobile" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										     <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button>
											        	<i class="fa fa-chevron-right Mobile">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNextMobile" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNextMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNextMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
<!--                                         <a data-v-43f58a9c href="#" class="nav-paginate__dir nav-paginate-dir-prev" style="opacity: 0.2;"> -->
<!--                                             <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png"  class="nav-arrow arrow-left"> -->
<!--                                         </a> -->
										<ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
											    	<button style="cursor: pointer">
											        	<i class="fa fa-chevron-left">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrev" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrev" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrev" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button style="cursor: pointer" >
											        	<i class="fa pageNum">
												        	<input type="hidden" value="${pageNum}" id="PageNumValue" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValue" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValue" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button style="cursor: pointer">
											        	<i class="fa fa-chevron-right">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNext" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNext" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNext" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
<!--                                         <a data-v-43f58a9c="" href="#" class="nav-paginate__dir nav-paginate-dir-next" style="opacity: 1;"> -->
<!--                                            <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png"  class="nav-arrow arrow-right"> -->
<!--                                         </a> -->
                                     </nav>
                                  </div>
                               </div>
                            </section>
                            <!---->
                         </div>
                    </div>
                </article>
            </div>
        </div>
        <footer class="footer" data-v-438b4fe4="" data-v-0f5971ec="">
					<div class="footer__wrap" data-v-438b4fe4="">
						<h2 class="footer---logo" data-v-438b4fe4="">
							<img class="footer--logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/banner/logo.PNG" alt="SALAD:IT" data-v-438b4fe4=""> 
							<div data-v-438b4fe4=""></div>
						</h2> 
						<div class="footer__body" data-v-438b4fe4="">
							<address class="footer__cs" data-v-438b4fe4="">
								<h3 data-v-438b4fe4="">?????????????????????</h3> 
								<div class="cs-time" data-v-438b4fe4="">
									<div class="btn-channel-talk" data-v-438b4fe4="">1:1 ????????????</div> 
									<div class="cs-time__inner" data-v-438b4fe4="">
										<div data-v-438b4fe4="">
											<div id="sa04" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">??????</b> 
												<p data-v-438b4fe4="">9:00 - 18:00 (???????????? 13:00 - 14:00)</p>
											</div> 
											<div id="sa03" class="cs-time-text" data-v-438b4fe4="">
												<b data-v-438b4fe4="">?????????</b> 
												<p data-v-438b4fe4="">9:00 - 13:00
		                  							<span data-v-438b4fe4=""> (???????????? ??????????????? ??????)</span>
		                  						</p>
		                  					</div>
		                  				</div> 
		                  				<div data-v-438b4fe4="">
		                  					<div class="cs-time-text" data-v-438b4fe4="">
		                  						<b data-v-438b4fe4="">?????????</b> 
		                  						<p data-v-438b4fe4="">??????</p>
		                  					</div> 
		                  					<div class="cs-time-text" data-v-438b4fe4="">
		                  						<b data-v-438b4fe4="">????????????</b> 
		                  						<p data-v-438b4fe4="">1644-4559</p>
		                  					</div>
		                  				</div>
		                  			</div>
		                  		</div>
		                  	</address> 
		                  	<address class="footer__address hide" data-v-438b4fe4="">
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">??????</b>?????????</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">??????</b> <span data-v-438b4fe4="">??????????????? ????????? ???????????? 115, ?????????????????? ???????????? 7???</span></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">?????????????????????</b>883-81-00307</p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">?????????????????????</b>??? 2016-????????????-00657</p>
		                  	</address> 
		                  	<address class="footer__address help hide" data-v-438b4fe4="">
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">????????????</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4="">biz@saladit.me</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">?????????ID</b><a href="#" data-v-438b4fe4="">@?????????-saladit</a></p> 
		                  		<p data-v-438b4fe4=""><b data-v-438b4fe4="">??????????????????</b><a href="mailto:order@freshcode.me" data-v-438b4fe4="">order@saladit.me</a></p>
		                  	</address> 
		                  	<aside class="footer__side" data-v-438b4fe4="">
		                  		<p class="footer__copyright hide" data-v-438b4fe4="">
						          ??? 2020. Saladit, Inc. All Rights Reserved<br data-v-438b4fe4="">????????????
						          ???????????? UI/UX, ????????????, ?????????, ????????? ?????? ?????????, ????????????,
						          ????????????????????? ?????? ?????? ?????? ?????? ????????????.<br data-v-438b4fe4="">?????? ??????, ?????????
						          ??????, ?????? ?????? ???????????? ?????? ????????? ????????? ??????????????????.
						        </p> 
						    </aside>
						</div>
					</div>
				</footer>
         
    </div>
    </main>
    </div>
    </div>
    	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
// ???????????? ????????? ???
	new Swiper('.swiper-container', {
	
		slidesPerView : 4, // ????????? ????????? ???????????? ??????
		spaceBetween : 30, // ??????????????? ??????
		slidesPerGroup : 4, // ???????????? ?????? ???, slidesPerView ??? ?????? ?????? ??????????????? ??????
	
		// ???????????? ?????? ?????? ?????? ???????????? ?????????
		// 3?????? ????????? ????????? 1?????? ????????? 2?????? ???????????? ????????? 3?????? ??????
		loopFillGroupWithBlank : true,
	
		loop : true, // ?????? ??????
	
		pagination : { // ?????????
			el : '.swiper-pagination',
			clickable : true, // ???????????? ???????????? ?????? ???????????? ??????, ????????? ????????? ?????? ?????? ??????
		},
		navigation : { // ???????????????
			nextEl : '.swiper-button-next', // ?????? ?????? ????????????
			prevEl : '.swiper-button-prev', // ?????? ?????? ????????????
		},
	});
	</script>
    
</body>
</html>