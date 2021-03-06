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
   <link rel="stylesheet" href="${path }/style2.css?ver=2">
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   <script type="text/javascript">
   

	 
$(function() { 
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
     		f.tagMain01.value = tag;
     		f.itemCode01.value = code;
//      		alert(code);
     		f.action="detail.do"; 
     		f.method="post";
     		f.submit();
     	})
         
// ?????? ?????? ?????? ?????????       
		$('.menu-info-content-wrap').hide();  
     	$(document).on('click','.menu__tab-info-title.menu-info:odd',function(){  
//     		alert("?????? ?????? ?????????");
    	    if($("#item_nut_show").css("display") == "none"){   
    	        $('#item_nut_show').show(); 
    	    } else {  
    	        $('#item_nut_show').hide();  
    	    }  
    	}); 
     	
// ?????? ?????? ?????? ?????????
     	$(document).on('click','.menu__tab-info-title.menu-info:even',function(){  
//     		alert("?????? ?????? ?????????");
    	    if($("#item_info_show").css("display") == "none"){   
    	        $('#item_info_show').show(); 
    	    } else {  
    	        $('#item_info_show').hide();  
    	    }  
    	});
    	
// ???????????? ??????
		$(document).on('click','#mobCart',function(){
			var p = document.passNum;
			var code = $(this).children('#itemCode').attr('value');
			var tag = $(this).children('#tagMain').attr('value');
// 			alert("code??? ??? :" +code);
			p.itemCode.value = code;
			p.tagMain.value = tag;
			p.action="test.do";
			p.method="post";
			p.submit();
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
		$(document).on('clik','',function(){

			
		})
		
// ????????? ??????
		$(document).on('click','.form-radio-input',function(){
			var size = $(this).val();
			$('.setSize').val(size);
			// ????????? ????????? Medium / ?????? ????????? Large ??? ????????????.			
		});

// ?????? ??????
		$(document).on('click','.dropdown-btn-flex-wrap',function(event){	
			var code =$('#mobCart').children('#itemCode').attr('value');			
			var tag = $('#mobCart').children('#tagMain').attr('value');
			var str ="";
			if($('.dropdown-btn-flex-wrap').hasClass('dropdown-open')){
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
			$('.dropdown-btn-flex-wrap').toggleClass('dropdown-open');
		}); // ?????? ?????? ???
		
// ?????? ?????? ????????? ??????
		$(document).on('click','.detail-name-and-badge',function(){
			var week = $(this).text();
			var selectedWeek = Number(week.replace('???', '').replace(',', ''));
			$('.setWeek').val(selectedWeek);
			// ????????? ?????? ????????? ??????.
			
			// M ?????? 
			var subPriceM = $('.subPrcieM').val(); 
			subPriceM = Number(subPriceM.replace('???', '').replace(',', ''));
			// L ?????? 
			var subPriceL = $('.subPrcieL').val(); 
			subPriceL = Number(subPriceL.replace('???', '').replace(',', ''));
			// ????????? ????????????
			var size = $('.setSize').val();

	//????????? ????????? ?????? ??????		
			if(size =='Medium'){ 		
				$('.setPrice').val(subPriceM);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
			
// 				alert("?????? ?????? : "+setPrice+" ?????? : "+selectedWeek+" ??? ?????? : "+totalPrice);
			
	// ?????? ????????? ?????? ??????					
			}else if(size =="Large"){							
// 				alert("????????????");
				$('.setPrice').val(subPriceL);
				var setPrice = $('.setPrice').val();
				var totalPrice = setPrice*selectedWeek;
				$('.setTotal').val(totalPrice);
				
// 				alert("?????? ?????? : "+setPrice+" ?????? : "+selectedWeek+" ??? ?????? : "+totalPrice);
				
			}else{
				alert("???????????? ?????? ??????????????????");
			}
			

			
			// ????????? ?????? ?????? ????????? ?????????
			$('ul').detach('.toggle-drop-down');						
//			$('.dropdown-btn-flex-wrap').toggleClass('dropdown-open');
			
			// ?????? ?????? ?????? On
			$('.date-picker-input').removeAttr('disabled');
			
		}); // ?????? ?????? ????????? ???

// ?????? ?????? ?????? ???
		$(document).on('click','.v-date-custom',function(){
			
			// css ????????? ?????? ????????? ????????? ?????????.
			$(".vc-popover-content-wrapper").css({
				'position': 'absolute',
				'transform': 'translate3d(0px, -279px, 0px)', 
				'top': '0px', 
				'left': '0px', 
				'will-change': 'transform'
			    });
			
			var test = "test";
			
			if($('.vc-popover-content-wrapper').hasClass('is-interactive')){
				$('div').detach('.vc-popover-content-wrapper:eq(1)'); // ????????? ????????? 2????????? ????????? detach
				$('.vc-popover-content-wrapper').removeAttr('style'); //???????????? ????????????
			}else{	
// 				alert("??????");
				$.ajax({
					url : 'calendar.do',
					type : 'post',
					datatype : 'html',
					data : {
						"test" : test
					},
					success : function(htmlOut){
// 						alert("success");
						$('.v-date-custom').append(htmlOut);
						
					}
				}); // ajax ???		
				
			} // if??? ???
			$('.vc-text-gray-400').attr("disabled", disabled);
			$('.vc-popover-content-wrapper').toggleClass('is-interactive');
			
		});// ?????? ?????? ?????? ???

// ?????? ??????
		$(document).on('click','.vc-day-content.vc-focusable',function(){
			alert("?????? ??????");
			//??????
			var name = $('.menu__name').text();
//			alert("name : "+name);
			//?????????
			var size = $('.setSize').val();
//			alert("size : "+size);
			//??????
			var week = $('.setWeek').val();
//			alert("week : "+week);
			//??????
			var setDate = $(this).attr('aria-label');
			$('.startDate').val(setDate);
			var start = $('.startDate').val();
//			alert("setDate : "+setDate);
			
			$.ajax({
				url : 'selectedSub.do',
				type : 'post',
				datatype : 'html',
				data :{
					"name" : name,
					"size" : size,
					"week" : week,
					"start": start
				},
				success : function(htmlOut){
// 					alert("??????!");
					$('.menu__select-size').append(htmlOut);
					
					
				}// success ???
				
			});// ajax ???

	// disable
			// ???????????? ???????????? ?????????????????? ??? ???????????????????????? ??????????????? ???????????? disabled??? ?????????.
			$('.menu__label').toggleClass('disabled-style');
			$('.menu__label.menu__price-label').toggleClass('disabled-style');
			// M / L ?????? disabled
			$('.row--v-center.radio-label').toggleClass('disabled-style');
			$('.form-radio').toggleClass('form-radio--disabled');
			$('.radio-side-text').toggleClass('disabled-style');
			// ???????????? disable
			$('.dropdown-btn-flex-wrap').toggleClass('disabled');
			// ?????? disabled
			
		
		});
		
// ?????? ???????????? ?????? ??????		
		$(document).on('click','.selected-detail__close',function(){
// 			alert("????????????");
			$('.selected-detail-wrap').detach();
		// ?????? ?????????????????? ??? ?????????.
			var nothing ="";
			$('.setPrice').val(nothing);
			$('.setSize').val(nothing);
			$('.setTotal').val(nothing);
			$('.startDate').val(nothing);
		
			
		})
		
// ???????????? ??? ?????? ??????
		$(document).on('click','.selected-detail__btn',function(){
// 			alert("????????????");
			var test ="";
			$.ajax({
				url : 'modal.do',
				type : 'post',
				datatype : 'html',
				data :{
					'test' : test
				},
				success : function(htmlOut){
// 					alert("ajax?????????");
					$('.menu').append(htmlOut);
// 					alert("??????!");
				}
			}); // ajax ???
			
		})

		
		
			
// ?????? ????????? ?????????
		$(document).on('click','.more-btn',function(){
			$(this).prev().children().toggleClass('img-wrapper');
					
		});
		
		
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
	
    <title>Saladit!</title>
</head>
<body>
    <div id="container">
        <header id="header-area" class="header" data-v-30697495 data-v-0f5971ec>
            <div class="header-banner-wrap" data-v-30697495><!----></div> 
            <div id="header__body" class="header__body" data-v-30697495>
               <div class="header__top" data-v-30697495>
                  <a href="#" class="header__top-left" data-v-30697495></a> 
                  <div class="header__top-right" data-v-30697495>
                     <a href="/mypage/orders" data-v-30697495>????????? <span data-v-30697495>???</span></a> 
                     <span data-v-30697495>1:1??????</span>
                     <a href="https://forms.gle/92o1ctx6U4CYe2yF9" target="_blank" data-v-30697495>B2B ??????</a>
                  </div>
               </div> <!---->
               <div class="header__logo" data-v-30697495>
                  <a href="#">
                     <!--<img id="logoim" src="images/logo.PNG" width="200px">-->
                  </a> <!---->
               </div>
<!--                input hidden ?????? -->
<!--                input hidden ?????? -->
<!--                input hidden ?????? -->
				<input type="hidden" class="setPrice" value="">
				<input type="hidden" class="setSize" value="">
				<input type="hidden" class="setTotal" value="">
				<input type="hidden" class="startDate" value="">
				<input type="hidden" class="setWeek" value="">
			
<!--                input hidden ?????? -->
<!--                input hidden ?????? -->
<!--                input hidden ?????? -->				
               <nav class="header__menus" data-v-30697495>
                  <div data-v-30697495>
                     <div class="dropdown" data-v-30697495>
                        <span class="item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/Icon_Hamberger_Gray%403x.png"  class="search-logo-img" style="width:24px;height:24px;" data-v-30697495>
                           ?????? ????????????
                        </span> 
                        <div class="dropdown" data-v-30697495>
                           <ul data-v-30697495>
                              <li data-v-30697495>
                                 <a href="/menu" data-v-30697495>????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/subscription" data-v-30697495>????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad" data-v-30697495>?????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/salad-wrap" data-v-30697495>?????????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/meal" data-v-30697495>????????????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/set" data-v-30697495>????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/snack" data-v-30697495>??????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/drink" data-v-30697495>??????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/event" data-v-30697495>???????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soon" data-v-30697495>????????????</a>
                              </li>
                              <li data-v-30697495>
                                 <a href="/menu/soup" data-v-30697495>???????????</a>
                              </li>
                           </ul>
                        </div>
                     </div> 
                     <a href="/menu/subscription" class="item" data-v-30697495>????????????</a>
                     <a href="/menu/salad" class="item" data-v-30697495>?????????</a>
                     <a href="/menu/salad-wrap" class="item" data-v-30697495>?????????????????</a>
                     <a href="/menu/event" class="item" data-v-30697495>???????????????</a>
                     <a data-v-7aa1f9b4="" href="javascript:page_move(600);" class="item">???????????? </a>
					 <a data-v-7aa1f9b4="" href="event.do" class="item">????????? </a>
                  </div> 
                  <div class="header__menus-side" data-v-30697495>
                     <a href="/search" class="search-logo" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495> 
                        <div data-v-30697495>??????</div>
                     </a> 
                     <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                        <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                         ????????????
                       </a> 
                       <a href="/order" class="item" data-v-30697495>
                       <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_order.png" class="icon-order" style="width: 24px; height: 24px;" data-v-30697495>
                         ????????????
                       </a>
                   </div>
                  </nav> 
                  <div class="header__side" data-v-30697495>
                        <a href="/search" class="search-logo" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png" class="search-logo-img" style="width: 24px; height: 24px;" data-v-30697495></a>
                        </a> 
                        <a href="/cart" class="cart-logo-wrap item" data-v-30697495>
                           <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/cart-header-icon%403x.png"  class="cart-logo empty" style="width: 24px; height: 24px;" data-v-30697495>
                        </a> 
                        <nav class="header__toggle-button" data-v-30697495>
                           <button type="button" data-v-30697495>
                              <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/ic-navi-search%403x.png"  style="width: 24px; height: 24px;" data-v-30697495>
                           </button>
                        </nav>
                  </div>
            </div> 
            <div class="mobile-nav js-mobile-nav" data-v-30697495>
               <div class="mobile-nav-wrap" data-v-30697495>
                  <div class="mobile-nav-scroll" data-v-30697495>
                     <ul class="mobile-nav-contents" data-v-30697495>
                        <li class="mobile-nav-contents-item" data-v-30697495>
                           <a href="/menu" data-v-30697495>?????? ??????</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/subscription" data-v-30697495>????????????</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/menu/event" data-v-30697495>???????????????</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/info" data-v-30697495>????????????</a>
                          </li>
                          <li class="mobile-nav-contents-item" data-v-30697495>
                             <a href="/fcospot" data-v-30697495>????????????</a>
                          </li>
                      </ul>
                  </div> 
                  <div class="all-menus-container" style="display:none;" data-v-30697495>
                     <div class="all-menus-list-wrap" data-v-30697495>
                        <ul class="all-menus-list js-all-menus-list" data-v-30697495>
                           <li class="all-menus-item" data-v-30697495>
                              <a href="/menu" class="js-all-menus-item-link-0 all-menus-item-link" data-v-30697495>
                                    ????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/subscription" class="js-all-menus-item-link-1 all-menus-item-link" data-v-30697495>
                                    ????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad" class="js-all-menus-item-link-2 all-menus-item-link" data-v-30697495>
                                    ?????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/salad-wrap" class="js-all-menus-item-link-3 all-menus-item-link" data-v-30697495>
                                    ?????????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/meal" class="js-all-menus-item-link-4 all-menus-item-link" data-v-30697495>
                                    ????????????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/set" class="js-all-menus-item-link-5 all-menus-item-link" data-v-30697495>
                                    ????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/snack" class="js-all-menus-item-link-6 all-menus-item-link" data-v-30697495>
                                    ??????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/drink" class="js-all-menus-item-link-7 all-menus-item-link" data-v-30697495>
                                    ??????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/event" class="js-all-menus-item-link-8 all-menus-item-link" data-v-30697495>
                                    ???????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soon" class="js-all-menus-item-link-9 all-menus-item-link" data-v-30697495>
                                    ????????????</a>
                              </li>
                              <li class="all-menus-item" data-v-30697495><a href="/menu/soup" class="js-all-menus-item-link-10 all-menus-item-link" data-v-30697495>
                                    ???????????</a>
                              </li>
                          </ul>
                      </div> 
                      <div class="all-menus-shadow" data-v-30697495></div> 
                      <div class="all-menus-arrow-wrap" data-v-30697495>
                         <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-arrow-down%402x.png"  class="all-menus-arrow" data-v-30697495>
                        </div>
                  </div>
               </div>
            </div> 
            <!----> 
            <!----> 
            <!---->
        </header> 
        <div id="home">
            <!--?????? container??? padding-top:182px ?????? ??????:
            ????????? ???????????? ?????? ???????????? ??? ?????? container??? ???????????? ????????? ??? ?????????-->
            <div class="menu__container">
                <article class="menu">
                    <div id="menu__head" class="menu__head">
                        <figure class="menu__image">
                            <div class="menu-badge">
                            </div>
                                <img src="${detail.item_image }" alt="?????? ?????????">
                        </figure>
                        <div data-v-32a18372 class="menu__body">
                            <header data-v-32a18372 class="menu__header">
                                <h2 data-v-32a18372 class="menu__name">${detail.item_name }</h2>
                                <div data-v-32a18372 class="menu__summary">${detail.item_summary }</div>
                                <div data-v-32a18372 class="review">
                                    <div data-v-32a18372 class="row--v-center review-wrap">
                                    
                                    
                                        <div class="review-stars">

                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png">
                                            <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png">
                                        </div>
                                        
                                        
                                        <div>
                                            <span class="review-count">
                                                ????????????${avgCount.starAvg }(?????? ${avgCount.reviewCount})
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
<!-- ?????? ?????? ?????? -->                 <c:if test="${tagSub == 102}">
                                   		<li data-v-32a18372="" class="menu-detail__deliveryType">
                                   			<div data-v-32a18372="" class="menu-detail__deliveryType-text">
												<label data-v-32a18372="" class="menu__label">?????? ??????</label>
													<div data-v-32a18372="" class="menu-text-wrap">
														<span data-v-32a18372="" class="menu__text" style="color: rgb(74, 144, 226);"> ???????????? 
															<span data-v-32a18372="" class="menu__sub-text"> (?????????????????? ??????) </span>
														</span> 
														<span data-v-32a18372="" class="subs-desc-bold">?????? 8????????? ?????? ??? ?????? ??????</span>
														<span data-v-32a18372="" class="subs-desc">??????????????? ??????????????? ???????????????.</span>
													</div>
											</div>
										</li>
                                    </c:if>
 <!-- ?????? ?????? ?????? -->                <c:if test="${tagSub == 101 }">
                                    	<li data-v-32a18372="" class="menu-detail__deliveryType">
                                    		<div data-v-32a18372="" class="menu-detail__deliveryType-text">
												<label data-v-32a18372="" class="menu__label">?????? ??????</label>
													<div data-v-32a18372="" class="menu-text-wrap">
														<span data-v-32a18372="" class="menu__text" style="color: rgb(46, 58, 130);"> ???????????? 
															<span data-v-32a18372="" class="menu__sub-text"> (?????? ??????, ??????/?????? ??????) </span>
														</span> 
														<span data-v-32a18372="" class="subs-desc-bold">??? 12??? - ?????? 7??? ?????? ??????</span> 
														<span data-v-32a18372="" class="subs-desc">?????????????????????????????? ???????????????.</span>
													</div>
											</div>
										</li>
                                    </c:if>
                                </ul>

									<!-- ?????? -->
								
									<div data-v-2706028c="" data-v-32a18372="" class="menu-select-panel">
										<div data-v-2706028c="" class="menu__select-size">
											<ul data-v-2706028c="" class="menu__select-size-list normal">
												<li data-v-2706028c="" class="menu__options"><label
													data-v-2706028c="" class="menu__label">????????? ??????</label>
													<div data-v-2706028c="" class="row--v-center">
	<!--  -->												
													<c:if test="${ empty detail.item_price_l  }">
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Medium" type="radio" name="menu-sizeboth" class="form-radio-input" value="Medium"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
														</div>
													</c:if>
													<c:if test="${ not empty detail.item_price_l }">
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Medium" type="radio" name="menu-sizeboth" class="form-radio-input" value="Medium"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Medium" class="radio-side-text">Medium</label>
														</div>
														<div data-v-2706028c="" class="row--v-center radio-label">
															<label data-v-3f971378="" data-v-2706028c="" class="form-radio">
																<input data-v-3f971378="" id="Large" type="radio" name="menu-sizeboth" class="form-radio-input" value="Large"> 
																	<span data-v-3f971378="" class="form-radio-circle">
																		<i data-v-3f971378="" class="form-radio-circle-interior"></i>
																	</span>
																Medium 
															</label> 
															<label data-v-2706028c="" for="Large" class="radio-side-text">Large</label>
														</div>
													</c:if>	
														
													</div>
												</li>
												<li data-v-2706028c="" class="menu__period-select">
													<label data-v-2706028c="" class="menu__label only-desktop ">
														?????? ??????
													</label>
													<div data-v-4837bb91="" data-v-2706028c="" class="dropdown-btn-flex-wrap both-style">
														<div data-v-4837bb91="" class="dropdown-btn">
															<div data-v-4837bb91="" class="button dropdown">
																<div data-v-4837bb91="" class="">?????? ??????(????????? ????????? ??? ?????? ???????????????)</div>
															</div>
												<!---->
												<!-- ????????? ????????? ??????-->
												<!---->
														</div>
													</div>
												</li>
												<li data-v-2706028c="" class="menu__date-select">
													<label data-v-2706028c="" class="menu__label only-desktop">
													?????????(?????????) ??????
													</label>
													<div data-v-2706028c="" class="date-picker-with-icon">
														<span data-v-56ae83be="" data-v-2706028c="" disabled="disabled" class="v-date-custom">
															<input data-v-2706028c="" data-v-56ae83be="" disabled="disabled" placeholder="????????? ??????" readonly="readonly" type="input" class="date-picker-input">
	<!---->															
	<!---->															
															
															<div data-v-7605e1b2="" data-v-56ae83be="" class="vc-popover-content-wrapper" style>
																	<!---->
															</div>
	<!---->															
	<!---->															
															
														</span> 
														<img data-v-2706028c="" src="/images/icon-calendar-active@3x.png"  class="date-select-calendar-icon" style="cursor: pointer;">
													</div>
												</li>
											</ul>
											<!---->
										</div>
										<div data-v-2706028c="" class="menu__price">
											<label data-v-2706028c="" class="menu__label menu__price-label">
												?????? ?????? </label>
											<div data-v-2706028c="" class="menu__price-right">
												<!---->
												<div data-v-2706028c="" class="menu__price-current-price__wrapper">
													<!---->
													<div data-v-2706028c="" class="menu__price-current-price">0???
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--  ??? -->	
                                                 
                            </header>
                            <nav data-v-32a18372 class="menu__button-order-body">
                                <div data-v-32a18372 class="row--v-center" style="width: 100%; flex-wrap: nowrap;">
                                    <div data-v-32a18372 class="cart-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button button--outline2" id="mobCart" style="margin-right: 5px;">
                                        	<input type="hidden" value="${detail.item_code }" id="itemCode">
											<input type="hidden" value="${detail.item_tag_main }" id="tagMain">
                                            <span data-v-a1c889e0 class="button__wrap">???????????? ??????</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button">
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
                                <img data-v-3ebe8eb0 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon-like%402x.png"  class="reco-title-img">
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
						<div class="swiper-container" >
							<div class="swiper-wrapper">
	
								<c:forEach var="item" items="${random }">
									<div class="swiper-slide">
										<input type="hidden" value="${item.itemCode }" id="itemCode">
										<input type="hidden" value="${item.tagMain }" id="tagMain">
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
					<!-- ??????????????? div  -->
						<div id="section01"></div>  
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
                            <div data-v-61e19c34 class="menu-tab-btn-wrap on" onclick="location.href='#section01';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#section02';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#product-info';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>FAQ</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="menu-tab-btn-wrap" onclick="location.href='#section03';">
                                <button data-v-61e19c34 type="button">
                                    <span data-v-61e19c34>????????????</span>
                                </button>
                            </div>
                            <div data-v-61e19c34 class="desktop-tab-blank">
                            </div>
                        </nav>
                    </div>
                    <div data-v-32a18372 class="menu-description-container" >
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
                                                    
<!--                                                     <div data-v-79f00ef9 class="shadow"></div> -->
                                                </div>
                                            </div>
                                            <div data-v-79f00ef9 class="more-btn">
                                                <span data-v-79f00ef9 class="more-btn-text">?????? ?????? ?????????</span>
                                                <img data-v-79f00ef9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down-green%402x.png"  class="more-btn-arrow">
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
                                                                    <img data-v-5b7f52e9 src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="dropdown-icon">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li data-v-2706028c class="menu-option">
                                                <div data-v-2706028c class="menu-option-wrap">
                                                    <label data-v-2706028c class="menu__label">?????? ????????? ?????? MD ?????? ??????</label>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[????????????] ????????? ????????? 1???</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="meni-option-right">
                                                            3,000???
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[??????????????????] ????????? ????????? 4??? ??????</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,600???
                                                        </div>
                                                    </div>
                                                    <div data-v-2706028c class="menu-option-item isDesktop">
                                                        <div data-v-2706028c class="menu-option-left">
                                                            <input data-v-2706028c class="menu-option-checkbox-508-desktop" name="menu-option-checkbox-508" type="checkbox" class="menu-option-checkbox" value="508">
                                                            <label data-v-2706028c for="menu-option-checkbox-508" class="menu-option-label">
                                                                <span data-v-2706028c class="menu-option-text">[????????????] ??????????????? 2??? ???????????? 1???</span>
                                                            </label>
                                                        </div>
                                                        <div data-v-2706028c class="menu-option-right">
                                                            3,300???
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul data-v-2706028c class="selected-detail-list isDesktop">
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
                                            <span data-v-a1c889e0 class="button__wrap">???????????? ??????</span>
                                        </button>
                                    </div>
                                    <div data-v-32a18372 class="purchase-btn-wrap">
                                        <button data-v-a1c889e0 data-v-32a18372 type="button" title class="button button" style="height: 52px;">
                                            <span data-v-a1c889e0 class="button__wrap">????????????</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="section02"></div>
                        <div data-v-32a18372 id="product-info">
                            <h3 data-v-32a18372 class="menu__tab-info-title menu-info">
                                <span data-v-32a18372>?????? ?????? ??????</span>
                                <div data-v-32a18372 class="info-title-img"></div>
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
                                <span data-v-32a18372>?????? ?????? ??????</span>
                                <div data-v-32a18372 class="info-title-img"></div>
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
                        <div data-v-32a18372 id="faq" class="menu__tab-info tab_menu_detail" >
                            <p data-v-32a18372 class="menu__tab-info-title faq" >FAQ</p>
                            <div data-v-e3f957fc data-v-32a18372 class="menu-info-table-wrap">
                                <div data-v-e3f957fc class="menu-info-table-opener" id="section03">
                                    <div data-v-e3f957fc class="menu-info-table-title-wrapper">
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
								<div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[???????????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??? ?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc class="menu-info-table-content-wrap review-hide">
                                    <div data-v-e3f957fc class="answer-wrapper">
                                       <div data-v-e3f957fc class="answer-column left">
                                          <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"  class="menu-info-table-img answer">
                                       </div>
                                       <div data-v-e3f957fc class="answer-column right">
                                          <div data-v-e3f957fc class="menu-info-table-content-description">??? ???????????? ?????? ?????? ??????<br>
                                             ???  ??????/?????? ??????,???????????? ?????? ????????? ?????? ?????? 7????????? ??????????????? ?????? ?????? ?????? ??????
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
												 class="menu-info-table-img answer">
										</div>
										<div data-v-e3f957fc="" class="answer-column right">
											<div data-v-e3f957fc=""
												class="menu-info-table-content-description"> ??? ???????????? ?????? <br>
                                             ??????????????? ?????? ????????? ?????? ????????? ?????? ??? ??? ????????????.
                                             ????????? ????????? ????????? ???????????? ??? ??????????????? ?????????????????? ????????????.
                                             
                                             ??? ???????????? ?????? : ????????? ??? ?????? ?????? (??? : ?????? ??? ??????????????????)
                                             ??? ????????? ?????? : ????????? ?????? ????????? ?????? (??? : gs25 ??? ????????????)
                                             
                                             ?????? ???????????? 6?????? ??????, ???????????? ???????????? 
                                             ??????????????? ?????? 11??? ~ ?????? 12??? 30????????? ????????????
                                             ??????????????? ?????? 1??? ~ ??????5??? ?????? ?????? ?????????. 
                                             
                                             
                                             ????????????
                                             ????????? ?????? ????????? ??????????????? ????????? ?????? ????????? ??????/?????? ??? ????????? ???????????????.
                                             ?????? ???????????? 1?????? ??????, ???????????? 4???????????? 4?????? ?????? ?????? ???, ???????????? ?????????.
                                             
                                              ??????????????? 12??? 30??? ???/?????? ?????? ????????????
                                              ??????????????? ?????? 1???~5??? ?????? ?????? ?????????.
                                             
                                             
                                             ???????????????
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
                                        <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-question%402x.png"  class="menu-info-table-img question">
                                        <p data-v-e3f957fc class="menu-info-table-title">[?????? ??????(?????? ?????? ??????)]</p>
                                    </div>
                                    <img data-v-e3f957fc src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-down%402x.png"  class="menu-info-table-opener-arrow">
                                </div>
                                <div data-v-e3f957fc="" class="menu-info-table-content-wrap review-hide"
									style="border-bottom: 1px solid rgb(233, 233, 233);">
									<div data-v-e3f957fc="" class="answer-wrapper">
										<div data-v-e3f957fc="" class="answer-column left">
											<img data-v-e3f957fc="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/fa-answer%402x.png"
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
                            <section data-v-f8b893b0="" class="menu-review__rating">
                               <div data-v-f8b893b0="" class="wrap">
                                  <h3 data-v-f8b893b0="">?????? ??????</h3>
                                  <div data-v-f8b893b0=""
                                     class="row--v-center review-box-wrapper">
                                     <div data-v-f8b893b0="" class="review-stars">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" class="review-stars-star">
                                        <img data-v-f8b893b0="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_half%402x.png" class="review-stars-star">
                                     </div>
                                     <div data-v-f8b893b0="" class="review-rating-counts">
                                        ${avgCount.starAvg }(?????? ${avgCount.reviewCount})</div>
                                  </div>
                               </div>
                            </section>
                            <section data-v-f8b893b0="" class="menu-review__index">
                               <ul data-v-f8b893b0="">
                               
                               
                               
	                               	  <c:forEach var="board" items="${boardList }">
		                               	  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
		                                     <div data-v-22105fb8="" class="review-item__head">
		                                        <div data-v-22105fb8="" class="head-rating">
		                                           <img data-v-22105fb8=""
		                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
		                                              class="rating-img">
		                                           <div data-v-22105fb8="" class="rating-count">${board.star }</div>
		                                        </div>
		                                        <div data-v-22105fb8="" class="head-summary">
		                                           <div data-v-22105fb8="" class="head-summary-left">
		                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
		                                                  class="summary-photo">
		                                              <div data-v-22105fb8="" class="summary-text">${board.content }</div>
		                                           </div>
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
		                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
		                                                 <div data-v-22105fb8="" class="review-item__photo"
		                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
		                                              </div>
		                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
		                                                 <div data-v-22105fb8="" class="review-item__photo"
		                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
		                                              </div>
		                                           </div>
		                                        </div>
		                                        <!---->
		                                     </div>
		                                  </li>
	                                  </c:forEach>
												
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item">
                                     <div data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">?????????
                                                 ????????? ???????????? ???????????? ????????? ????????? ?????? ?????? ???????????? ????????? ??????????????? ?????? ????????????. ?????????
                                                 ????????? ???????????? ??? ?????? ??? ????????? ?????????</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">???*???</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              24.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">?????????
                                              ????????? ???????????? ???????????? ????????? ????????? ?????? ?????? ???????????? ????????? ??????????????? ?????? ????????????. ?????????
                                              ????????? ???????????? ??? ?????? ??? ????????? ?????????</div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44381_20220124003124&quot;);"></div>
                                              </div>
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44382_20220124003124&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div>
                                  </li>
                                  <li data-v-22105fb8="" data-v-f8b893b0="" class="review-item"><div
                                        data-v-22105fb8="" class="review-item__head">
                                        <div data-v-22105fb8="" class="head-rating">
                                           <img data-v-22105fb8=""
                                              src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/icon_star_full%402x.png" 
                                              class="rating-img">
                                           <div data-v-22105fb8="" class="rating-count">5</div>
                                        </div>
                                        <div data-v-22105fb8="" class="head-summary">
                                           <div data-v-22105fb8="" class="head-summary-left">
                                              <img data-v-22105fb8="" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/pics%402x.png"
                                                  class="summary-photo">
                                              <div data-v-22105fb8="" class="summary-text">??????
                                                 ???????????? ????????????????????? ??? ?????????????????? ????????????????????????</div>
                                           </div>
                                           <!---->
                                        </div>
                                        <div data-v-22105fb8="" class="head-text">
                                           <div data-v-22105fb8="" class="text-name">???*???</div>
                                           <div data-v-22105fb8="" class="text-date">2022. 01.
                                              22.</div>
                                        </div>
                                     </div>
                                     <div data-v-22105fb8=""
                                        class="review-desktop-toggle review-hide">
                                        <div data-v-22105fb8="" class="review-item__body">
                                           <div data-v-22105fb8="" class="review-item__comment">
                                              ?????? ????????????<br>????????????????????? ???<br>?????????????????? ????????????????????????
                                           </div>
                                           <div data-v-22105fb8="" class="review-item__photos">
                                              <div data-v-22105fb8="" class="review-item__photo-wrap">
                                                 <div data-v-22105fb8="" class="review-item__photo"
                                                    style="background-image: url(&quot;https://s3.ap-northeast-2.amazonaws.com/freshcode/menu/review/sm/44324_20220122204821&quot;);"></div>
                                              </div>
                                           </div>
                                        </div>
                                        <!---->
                                     </div></li>
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
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-left"><img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
													<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
											        <i class="fa">${pageNum }  </i> 
											        </a>
											    </li>
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-right"><img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
											        </a>
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
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-left"><img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageNum }"/>'> --%>
													<a data-v-43f58a9c="" href="detail.do?page=${pageNum }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}">
											        <i class="fa">${pageNum }  </i> 
											        </a>
											    </li>
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
											<%--         <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'> --%>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-right"><img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
											        </a>
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
                    <div data-v-32a18372="" class="notify-register-modal">
                    <!---->
                    </div>
                </article>
            </div>
        </div>
        <footer class="footer" data-v-438b4fe4 data-v-0f5971ec>
            <div class="footer__wrap" data-v-438b4fe4 >
               <h2 class="footer--logo" data-v-438b4fe4>
                  <img class="footer-logo" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/02.png" alt="SALAD:IT" data-v-438b4fe4> 
                  <div data-v-438b4fe4></div>
               </h2> 
               <div class="footer__body" data-v-438b4fe4>
                  <nav class="footer__menus" data-v-438b4fe4>
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>FAQ</a> 
                        <a href="/terms" data-v-438b4fe4>????????????</a> 
                        <a href="/privacy" data-v-438b4fe4>????????????????????????</a>
                     </div> 
                     <div class="footer__menus-item" data-v-438b4fe4>
                        <a href="#" data-v-438b4fe4>????????????</a> 
                        <a href="#" data-v-438b4fe4>????????????</a> 
                        <a href="#" data-v-438b4fe4>???????????? ??????</a>
                     </div>
                  </nav> 
                  <address class="footer__cs" data-v-438b4fe4>
                     <h3 data-v-438b4fe4>??????????????????</h3> 
                     <div class="cs-time" data-v-438b4fe4>
                        <div class="btn-channel-talk" data-v-438b4fe4>1:1 ????????????</div> 
                        <div class="cs-time__inner" data-v-438b4fe4>
                           <div data-v-438b4fe4>
                              <div id="sa04" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>??????</b> 
                                 <p data-v-438b4fe4>9:00 - 18:00 (???????????? 13:00 - 14:00)</p>
                              </div> 
                              <div id="sa03" class="cs-time-text" data-v-438b4fe4>
                                 <b data-v-438b4fe4>?????????</b> 
                                 <p data-v-438b4fe4>9:00 - 13:00
                                          <span data-v-438b4fe4> (???????????? ??????????????? ??????)</span>
                                       </p>
                                    </div>
                                 </div> 
                                 <div data-v-438b4fe4>
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>?????????</b> 
                                       <p data-v-438b4fe4>??????</p>
                                    </div> 
                                    <div class="cs-time-text" data-v-438b4fe4>
                                       <b data-v-438b4fe4>????????????</b> 
                                       <p data-v-438b4fe4>1644-4559</p>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                        </address> 
                        <address class="footer__address hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>??????</b>?????????</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>??????</b> <span data-v-438b4fe4>??????????????? ????????? ???????????? 115, ?????????????????? ???????????? 7???</span></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>?????????????????????</b>883-81-00307</p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>?????????????????????</b>??? 2016-????????????-00657</p>
                        </address> 
                        <address class="footer__address help hide" data-v-438b4fe4>
                           <p data-v-438b4fe4><b data-v-438b4fe4>????????????</b><a href="mailto:biz@freshcode.me" data-v-438b4fe4>biz@freshcode.me</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>?????????ID</b><a href="#" data-v-438b4fe4>@???????????????-freshcode</a></p> 
                           <p data-v-438b4fe4><b data-v-438b4fe4>??????????????????</b><a href="mailto:order@freshcode.me" data-v-438b4fe4>order@freshcode.me</a></p>
                        </address> 
                        <aside class="footer__side" data-v-438b4fe4>
                           <p class="footer__copyright hide" data-v-438b4fe4>
                         ??? 2020. FreshCode, Inc. All Rights Reserved<br data-v-438b4fe4>??????????????????
                         ???????????? UI/UX, ????????????, ?????????, ????????? ?????? ?????????, ????????????,
                         ????????????????????? ?????? ?????? ?????? ?????? ????????????.<br data-v-438b4fe4>?????? ??????, ?????????
                         ??????, ?????? ?????? ???????????? ?????? ????????? ????????? ??????????????????.
                       </p> 
                       <div class="footer__sns-wrap" data-v-438b4fe4>
                          <nav class="footer__sns" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/instagram%402x.png" title="instagram" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/facebook%402x.png" title="facebook" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/youtube%403x.png" title="youtube" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/group-21%402x.png" title="blog" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/blog-post%402x.png" title="Naver post" data-v-438b4fe4>
                             <img src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/kakao-channel%402x.png" title="kakao channel" data-v-438b4fe4>
                          </nav>
                       </div>
                       
                   </aside>
               </div>
               
            </div>
            
         </footer>
         
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