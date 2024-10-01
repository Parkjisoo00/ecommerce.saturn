<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/front/header.jsp" %>
	<script>
		function goPages(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.currentPage.setAttribute("value", value);
			frmMain.action="/front/sale/total_list.web";
			frmMain.submit();
		}
	</script>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

	<!-- Css Styles -->
	<%@ include file="/include/front/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
		<%@ include file="/include/front/leftgnb.jsp" %>

	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>

	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a>
						<span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="coupon__link">
						<a href="#" style="margin-left: 150px;margin-right: 150px;">낮은 가격순</a>
						<a href="#" style="margin-right: 150px;">높은 가격순</a>
						<a href="#" style="margin-right: 150px;">등록일 순</a>
					</h6>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="shop__sidebar">
						<div class="sidebar__categories">
							<div class="section-title">
								<h4>전체 상품</h4>
							</div>
							<div class="categories__accordion">
								<div class="accordion" id="accordionExample">
									<div class="card">
										<div>
											<a data-toggle="collapse" data-target="#collapseOne" href="#" style="color : black">기 능 별</a>
										</div>
									</div>
									<div class="card">
										<div>
											<a data-toggle="collapse" data-target="#collapseTwo" href="#" style="color : black">성 분 별</a>
										</div>
									</div>
									<div class="card">
										<div>
											<a data-toggle="collapse" data-target="#collapseThree" href="#" style="color : black">대 상 별</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="row">
						<c:choose>
							<c:when test="${empty list}">
								<div class="col-12 d-flex justify-content-center align-items-center" style="height: 600px;">
									<p>상품이 없습니다.</p>
								</div>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="list" items="${list}">
									<div class="col-lg-4 col-md-6">
										<div class="product__item">
											
											<div class="product__item__pic set-bg" data-setbg="${list.img}">
												<ul class="product__hover">
												
													<li><a href="#" class="image-popup"><span class="arrow_expand"></span></a></li>
													<li><a href="#"><span class="icon_heart_alt"></span></a></li>
													<li><a href="#"><span class="icon_bag_alt"></span></a></li>
												</ul>
											</div>
											<div class="product__item__text">
												<h6><a href="#">${list.sle_nm}</a></h6>
													<div class="rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												<div class="product__price">${list.price_sale}</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				<br/>
				<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
				<br/>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<div class="instagram">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">우리 상품 이미지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<div class="footer__copyright__text">
						<p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
					</div>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/front/js.jsp" %>
</form>
</body>
</html>