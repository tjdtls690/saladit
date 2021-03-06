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
                <style>
        input[type="checkbox"] {
	   		-webkit-appearance: none;
	   		position: relative;
	   		vertical-align:middle;
	    	width: 30px;
		    height: 22px;
		    cursor: pointer;
		    outline: none !important;
		    border: 1px solid #eeeeee;
		    border-radius: 2px;
		    background: #eee;
		}
		input[type="checkbox"]:checked {
		    -webkit-appearance: none;
		    position: relative;
		    width: 30px;
		    height: 22px;
		    cursor: pointer;
		    vertical-align:middle;
		    outline: none !important;
		    border: 1px solid #eeeeee;
		    border-radius: 2px;
 		    background: #1E90FF;
		    background-image : url(https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_check.png);
		    background-position: 50%;
		    background-size: 12px 8px;
		    background-repeat: no-repeat;
		}
        </style>
        <script type="text/javascript">

		// ?????? ?????? 
		$(function (){
			$(document).on('click','.btn.btn-outline-secondary.del', function(){

				var formData = parseInt($('.payment_code').eq(0).children('#paymentCode').val());

				var form = document.createElement('form'); // ????????? ??????
    			var objs1;
    		    objs1 = document.createElement('input'); // ?????? ???????????? ????????? ??????
    		    objs1.setAttribute('type', 'hidden'); // ?????? ???????????? ????????? type
    		    objs1.setAttribute('name', 'itemCode'); // ????????????
    		    objs1.setAttribute('value', formData); //?????????
    		    form.appendChild(objs1);
    		    
    		    form.setAttribute('method', 'post'); //get,post ??????
    		    form.setAttribute('action', "orderDelivery.mdo"); //????????? url
    		    document.body.appendChild(form);
    		    form.submit();
				
    		    alert("??????????????? ?????????????????????");
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
                                    <a class="nav-link" href="adminCouponTypeManagement.mdo">????????????</a>
                                    <a class="nav-link" href="userCouponManage.mdo">??????????????????</a>
                                    <a class="nav-link" href="mdInfo.mdo">MD????????????</a>
                                    <a class="nav-link" href="bannerManagement.mdo">????????????</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                ??????/??????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        ??????/??????/??????
                                    </a>  
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ??????/??????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="orderManagement.mdo">????????????</a>
                                    <a class="nav-link" href="orderManagementDelivery.mdo">?????????</a>
                                    <a class="nav-link" href="orderManagementDeliveryComplete.mdo">????????????</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ??????
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionUser">
                                    <a class="nav-link" href="memberManagement.mdo">????????????</a>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#UserCollapseAuth" aria-expanded="false" aria-controls="UserCollapseAuth">
                                    ????????????
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="UserCollapseAuth" aria-labelledby="headingFour-four" data-bs-parent="#sidenavAccordionUser">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="reviewListAdmin.mdo">????????????</a>
                                            <a class="nav-link" href="reviewManagementAdmin.mdo">????????????</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSales" aria-expanded="false" aria-controls="collapseSales">
							<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div> 
							??????/??????????????????
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseSales" aria-labelledby="headingFive" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionSales">
                                    <a class="nav-link" href="salesManagement.mdo">??????/????????????</a>
                                    <a class="nav-link" href="pieChart.mdo">??????????????? ??????</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
         
<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">????????????</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">????????????/??????</li>
                        </ol>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ????????????/???????????????
                                 <button type="button" class="btn btn-outline-secondary del" style="padding:0px 30px; float:right;">??????????????????</button>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                       <tr>
                                            <th>????????????</th>
                                            <th>??????????????????</th>
											<th>????????????</th>
                                            <th>????????????/?????????</th>
                                            <th>??????</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>????????????</th>
                                            <th>??????????????????</th>
											<th>????????????</th>
                                            <th>????????????/?????????</th>
                                            <th>??????</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="info" items="${info}">
	                                        <tr>
	                                            <td class="payment_code"><input type="hidden" id="paymentCode" value="${info.payment_code}" />${info.payment_code}</td>
	                                            <td>${info.payment_item_mapping_tag_main }</td>
	                                            <td>${info.payment_item_mapping_item_code }</td>
	                                            <td>${info.payment_item_mapping_item_name_size}</td>
												<td>${info.payment_item_mapping_item_quantity}</td>
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