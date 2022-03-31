<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path"
   value="${pageContext.request.contextPath}/resources/admin" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Saladit-member management</title>
<link
   href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
   rel="stylesheet" />
<link rel="stylesheet" href="${path }/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<script type="text/javascript">

/*function memberDel(memberCode){
   if(confirm("해당 회원을 삭제하시겠습니까")){
      location.href="./memberDel?memberCode="+memberCode;
   }
}*/

$(function(){
   $(document).on('click','.btn.btn-dark', function(){
      var memberDelete = $(this).attr('id');
      if(confirm('삭제하시겠습니까?')) {
         $.ajax({
            url : 'deleteMember.mdo',
            type : 'post',
            data : {
               "memberDelete" : memberDelete
            },
            success : function(data){
               location.reload();
            }
         })
      }
   })
   $(document).on('click','.dropdown-item',function(){
		var active = $(this).children('#memberActive').val();
		
		
		var code = $(this).children('#memberCode').val();
		
		
		if(confirm('상태를 변경하시겠습니까?')){
			$.ajax({
				url : 'activeMember.mdo',
				type : 'post',
				data : {
					"memberActive" : active,
					"memberCode" : code,
				},
				success : function(data){
					location.reload();
					// 새로운 데이터 html 아웃 하면 완료 htmlout
				}
				
			})
		}
			
		
		})
});

</script>
</head>
<body class="sb-nav-fixed">
   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="adminMainChart.mdo">Saladit - admin</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
         id="sidebarToggle" href="#!">
         <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar Search-->
      <form
         class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
         <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..."
               aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button">
               <i class="fas fa-search"></i>
            </button>
         </div>
      </form>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
         <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
            role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
               class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end"
               aria-labelledby="navbarDropdown">
              
               <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul></li>
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
               <h1 class="mt-4">회원관리</h1>
               <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">(Member Management)</li>
               </ol>

               <div class="card mb-4">
                  <div class="card-header">
                     <i class="fas fa-table me-1"></i> Member List !
                  </div>
                  <div class="card-body">
                     <table id="datatablesSimple">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>이메일</th>
                              <th>이름</th>
                              <th>전화번호</th>
                              <th>생일</th>
                              <th>성별</th>
                              <th>상태</th>
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <th>번호</th>
                              <th>이메일</th>
                              <th>이름</th>
                              <th>전화번호</th>
                              <th>생일</th>
                              <th>성별</th>
                              <th>상태</th>
                           </tr>
                        </tfoot>
                        <tbody>
                           <c:forEach var="adminMember" items="${adminMember }">

                              <tr>
                                 <td class="memberCode">${adminMember.memberCode }</td>
                                 <td>${adminMember.memberEmail }</td>
                                 <td>${adminMember.memberName }</td>
                                 <td>${adminMember.memberPhone }</td>
                                 <td>${adminMember.memberBirthday }</td>
                                 <td>${adminMember.memberGender }</td>
                                 <td>
                                    <div class="btn-group">
                                       <button type="button" class="btn btn-secondary">${adminMember.memberStop }</button>
                                       <button type="button"
                                          class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                          data-bs-toggle="dropdown" aria-expanded="false">
                                          <span class="visually-hidden">Toggle Dropdown</span>
                                       </button>
                                       <ul class="dropdown-menu">
                                          <li value="활성"><a class="dropdown-item" href="#">활성<input type="hidden" value="${adminMember.memberCode }" id="memberCode" /><input type="hidden" value="활성" id="memberActive" /></a></li>
                                          <li value="휴먼"><a class="dropdown-item" href="#">휴면<input type="hidden" value="${adminMember.memberCode }" id="memberCode" /><input type="hidden" value="휴먼" id="memberActive" /></a></li>
                                       </ul>
                                    </div>
                                 </td>
                                 <td>
                                    <button type="button" class="btn btn-dark" id="${adminMember.memberCode }">삭제</button>
                                 </td>
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
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="${path }/js/scripts.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
      crossorigin="anonymous"></script>
   <script src="${path }/assets/demo/chart-area-demo.js"></script>
   <script src="${path }/assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"></script>
   <script src="${path }/js/datatables-simple-demo.js"></script>
</body>
</html>