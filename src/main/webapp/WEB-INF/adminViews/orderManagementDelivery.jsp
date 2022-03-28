<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Saladit-order</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path }/css/style.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
        $(function(){
    		$(document).on('click', '.paymentCode', function(){

    			var code = $(this).children('#paymentCode').val();
    			var form = document.createElement('form'); // 폼객체 생성
    			var objs1;
    		    objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
    		    objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
    		    objs1.setAttribute('name', 'itemCode'); // 객체이름
    		    objs1.setAttribute('value', code); //객체값
    		    form.appendChild(objs1);
    		    
    		    form.setAttribute('method', 'post'); //get,post 가능
    		    form.setAttribute('action', "orderManagementModal3.mdo"); //보내는 url
    		    document.body.appendChild(form);
    		    form.submit();
    		});
    	}); 
        
        $('input:checkbox[name="point-check"]').prop("checked",true);
		$('input:checkbox[name="point-check"]').prop("checked",false);
		
		// 변경
		$(function (){
			$(document).on('click','.btn.btn-outline-secondary.com', function(){

				var count = $('.paymentCode').length; 
				var deleteItemId = [];
				var data = {};
				var cc = 0;
				
				for (var i=0; i < count; i++) {
					var check = $('input:checkbox[name="point-check"]').eq(i).is(':checked');
					if (check == true) {
						deleteItemId[i] = $('.paymentCode').eq(i).children('#paymentCode').val();
						cc += 1;
					}
				}
				
				if (cc == 0) {
					alert("변경할 항목을 선택해주세요");
					return false;
				}
				
				var newDeleteItemId = deleteItemId.filter(word => {
					return word.length >= 1;
				});

				data.newDeleteItemId = newDeleteItemId;
				jQuery.ajaxSettings.traditional = true;
				
				$.ajax({
		    		url : 'orderManagementDeliveryChange.mdo',
		    		dataType : 'json',
		    		type : 'post',
		    		data : data,
		    		success : function(){
		   			},
		    		complete : function() {
		    			alert("변경되었습니다");
		    			location.reload();
		    		}
				});
			});
		});
		
		
        </script>
    </head>
    
<body class="sb-nav-fixed">
	<div id="ModalDiv"></div>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Saladit - admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
         <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav"> 
                            <a class="nav-link" href="adminMainChart.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Admin
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminCouponTypeManagement.mdo">쿠폰관리</a>
                                    <a class="nav-link" href="userCouponManage.mdo">발급쿠폰관리</a>
                                    <a class="nav-link" href="mdInfo.mdo">MD추천관리</a>
                                    <a class="nav-link" href="bannerManagement.mdo">배너관리</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                상품/판매
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        조회/등록/수정
                                    </a>  
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                주문/배송
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="#">주문목록</a>
                                    <a class="nav-link" href="#">배송중</a>
                                    <a class="nav-link" href="#">배송완료</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionUser">
                                    <a class="nav-link" href="memberManagement.mdo">회원관리</a>
                                    <a class="nav-link" href="#">리뷰관리</a>
                                </nav>
                            </div>
                            
                        </div>
                    </div>
                </nav>
            </div>
         
<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">배송관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">(delivery Management)</li>
                        </ol>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                배송중
                                <button type="button" class="btn btn-outline-secondary com" style="padding:0px 30px; float:right;">배송완료 확정</button>
                                
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                       <tr>
                                       		<th></th>
                                            <th>주문번호</th>
                                            <th>주문날짜</th>
											<th>수령인이름</th>
                                            <th>수령인번호</th>
                                            <th>배송지</th>
                                            <th>주문금액</th>
											<th>상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th></th>
                                            <th>주문번호</th>
                                            <th>주문날짜</th>
											<th>수령인이름</th>
                                            <th>수령인번호</th>
                                            <th>배송지</th>
                                            <th>주문금액</th>
											<th>상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="orderList" items="${orderList }">
	                                        <tr>
												<td align="center"><input type="checkbox" name="point-check" id="point-check" class ="point-check"></td>
	                                            <td>
	                                            	<a class="paymentCode"><input type="hidden" id="paymentCode" value="${orderList.payment_code}" />${orderList.payment_code}</a>
	                                            </td>
	                                            <td>${orderList.payment_date }</td>
	                                            <td>${orderList.payment_recipient }</td>
	                                            <td>${orderList.payment_recipient_phone }</td>
	                                            <td>${orderList.payment_address }</td>
	                                            <td>${orderList.payment_final_price}원</td>
	                                            <td>${orderList.payment_delivery_condition}</td>
	                                        </tr>
										</c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </main>
               
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path }/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path }/assets/demo/chart-area-demo.js"></script>
        <script src="${path }/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path }/js/datatables-simple-demo.js"></script>
    </body>
</html>