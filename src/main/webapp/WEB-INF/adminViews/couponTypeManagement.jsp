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
        <title>Saladit-coupon</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path }/css/style.css?ver=3">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$(document).on('click','.btn.btn-dark', function(){
		var couponCode = $(this).attr('id');
		if(confirm('쿠폰을 삭제하시겠습니까?')) {
			$.ajax({
				url : 'couponDelete.mdo',
				type : 'post',
				data : {
					"couponCode" : couponCode
				},
				success : function(data){
					location.reload();
				}
			})
		}
	})
	
	$(document).on('click', '.btn.btn-primary', function(){
		var coupon_pack = $('#couponPack').val();
		var coupon_name = document.couponInsert.coupon_name.value
		var coupon_ex = document.couponInsert.coupon_explain.value
		var coupon_type = document.couponInsert.coupon_type.value
		var coupon_sail = document.couponInsert.coupon_sail.value
		$.ajax({
			url : 'couponInsert.mdo',
			type : 'post',
			data : {
				"coupon_pack" : coupon_pack,
				"coupon_name" : coupon_name,
				"coupon_ex" : coupon_ex,
				"coupon_type" : coupon_type,
				"coupon_sail" : coupon_sail
			},
			success : function(data){
				location.reload();
			}
		})
	})
});

$(document).ready(function(){
    function alignModal(){
        var modalDialog = $(this).find(".modal-dialog");
        
        // Applying the top margin on modal dialog to align it vertically center
        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
    }
    // Align modal when it is displayed
    $(".modal").on("shown.bs.modal", alignModal);
    
    // Align modal when user resize the window
    $(window).on("resize", function(){
        $(".modal:visible").each(alignModal);
    });   
});
</script>    
    </head>
    
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="adminMainChart.mdo">Saladit - admin</a>
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
                                	<a class="nav-link" href="adminItemList.mdo">조회/등록/수정</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                주문/배송
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="orderManagement.mdo">주문목록</a>
                                    <a class="nav-link" href="orderManagementDelivery.mdo">배송중</a>
                                    <a class="nav-link" href="orderManagementDeliveryComplete.mdo">배송완료</a>
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
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#UserCollapseAuth" aria-expanded="false" aria-controls="UserCollapseAuth">
                                    리뷰관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="UserCollapseAuth" aria-labelledby="headingFour-four" data-bs-parent="#sidenavAccordionUser">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="reviewListAdmin.mdo">답변대기</a>
                                            <a class="nav-link" href="reviewManagementAdmin.mdo">답변완료</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSales" aria-expanded="false" aria-controls="collapseSales">
							<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div> 
							매출/상품통계관리
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseSales" aria-labelledby="headingFive" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionSales">
                                    <a class="nav-link" href="salesManagement.mdo">매출/상품통계</a>
                                    <a class="nav-link" href="pieChart.mdo">카테고리별 통계</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
         
			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">쿠폰</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">(Coupon Management)</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Coupon List !
                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#myModal" data-toggle="modal" data-target="#exampleModalCenter" style="padding:0px 30px; float:right;">등록</button>
                                  <div class="modal" id="myModal">
                                    <form name="couponInsert" action = "couponInsert.mdo" enctype = "multipart/form-data">
								                      <div class="modal-dialog modal-dialog-centered">
								                        <div class="modal-content">
								                          <div class="modal-header">
								                             <h5 class="modal-title">Coupon</h5>
								                              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								                          </div>
								                          <div class="modal-body">
								                          <!-- form -->
	           							
	           							                  <!-- table -->
	           							               	  <table class = "table table-bordered dataTable" cellspacing = "0" >
				                                            <tr>
				                                              <th scope="row" width=70>
				                                                쿠폰팩번호
				                                              </th>
				                                              <td width=150>
				                                                <div class="row">
				                                                  <div class="col">
				                                                    <select name="coupon_pack" class="form-select" id="couponPack" aria-label="Floating label select example" style="width:50%;">
				                                                    <option selected>---</option>
				                                                    <option value="100">100</option>
				                                                    <option value="200">200</option>
				                                                    <option value="300">300</option>
				                                                  </select>
				                                                  </div>
				                                                </div>
				                                              </td>
				                                            </tr>
				                                            
				                                            <tr>
				                                              <th scope="row" width=70>
				                                                쿠폰타입
				                                              </th>
				                                              <td width=150>
				                                                <div class="form-check form-check-inline">
				                                                  <label class="form-check-label" for="inlineRadio1">쿠폰 할인가격</label>
																  <input class="form-check-input" type="radio" name="coupon_type" id="inlineRadio1" value="0">
																  
																</div>
																<div class="form-check form-check-inline">
																  <label class="form-check-label" for="inlineRadio2">쿠폰 할인율</label>
																  <input class="form-check-input" type="radio" name="coupon_type" id="inlineRadio2" value="1">
																  
																</div>
				                                              </td>
				                                            </tr>
				                                            
				                                            <tr>
				                                              <th scope="row">
				                                                쿠폰이름
				                                              </th>
				                                              <td>
				                                                <input type="text" name="coupon_name"/>
				                                              </td>
				                                            </tr>
				                                            
				                                            <tr>
				                                              <th scope="row">
				                                                쿠폰설명
				                                              </th>
				                                              <td>
				                                                <input type="text" name="coupon_explain"/>
				                                              </td>
				                                            </tr>
				                                            
				                                            <tr>
				                                              <th scope="row">
				                                                할인율 / 할인가격
				                                              </th>
				                                              <td>
				                                                <input type="text" name="coupon_sail"/>
				                                              </td>
				                                            </tr>
				                                            <tr>
	           							                </table>
	           							            	</div>
	           						              
							                        	<div class="modal-footer">
							                        	<button type="button" class="btn btn-primary">등록</button>
							                       		</div>
							                       	</div>
							                       </div>
							                </form>
							      	</div> <!-- modal -->
							</div> <!-- card header -->
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                       <tr>
                                            <th>번호</th>
                                            <th>쿠폰코드</th>
											<th>쿠폰팩번호</th>
                                            <th>쿠폰타입</th>
                                            <th>쿠폰설명</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>쿠폰코드</th>
											<th>쿠폰팩번호</th>
                                            <th>쿠폰타입</th>
                                            <th>쿠폰설명</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="coupon" items="${coupon }" varStatus="i">
	                                        <tr>
	                                            <td>${i.count}</td>
	                                            <td>${coupon.coupon_code }</td>
	                                            <td>${coupon.coupon_pack }</td>
	                                            <td>${coupon.coupon_type }</td>
	                                            <td>${coupon.coupon_explain }</td>
	                                            <td>
	                                            <button type="button" class="btn btn-dark" id="${coupon.coupon_code }">삭제</button>
	                                            </td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                             </div> <!-- card-body -->
                         </div> <!-- card mb-4 -->
                      </div> <!-- container-fluid px-4 -->
                    </main>
                 </div> <!-- layoutSidenav_content -->
            </div> <!-- layoutSidenav -->
                        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path }/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path }/assets/demo/chart-area-demo.js"></script>
        <script src="${path }/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path }/js/datatables-simple-demo.js"></script>
    </body>
</html>