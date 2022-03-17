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
        <title>Saladit-member management</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path }/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    
<body class="sb-nav-fixed">
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
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                상품/판매
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">조회/등록/수정</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                주문/환불
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출/상품통계관리
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시글관리
                            </a>
                        </div>
                    </div>
                </nav>
            </div>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자에서 회원관리를 하는 페이지 입니다.</li>
                        </ol>
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
											<th>전화번호</th>
                                            <th>포인트</th>
                                            <th>총금액</th>
                                            <th>상태</th>
											<th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
											<th>전화번호</th>
                                            <th>포인트</th>
                                            <th>총금액</th>
                                            <th>상태</th>
											<th>수정/삭제</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>mango</td>
                                            <td>조망고</td>
                                            <td>01076563333</td>
                                            <td>3330</td>
                                            <td>45000</td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">탈퇴</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">탈퇴</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
										<tr>
                                            <td>11</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            <div class="btn-group">
											  <button type="button" class="btn btn-secondary">활성</button>
											  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
											    <span class="visually-hidden">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a class="dropdown-item" href="#">활성</a></li>
											    <li><a class="dropdown-item" href="#">탈퇴</a></li>
											  </ul>
											</div>
											</td>
                                            <td>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                            <button type="button" class="btn btn-dark">삭제</button>
											</td>
                                        </tr>
                                        
                                     
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