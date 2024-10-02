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
				<%@ include file="/include/front/lowmenu.jsp" %>
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
											<a href="/front/sale/function_list.web" style="color : black">기 능 별</a>
										</div>
									</div>
									<div class="card">
										<div>
											<a href="/front/sale/ingredient_list.web" style="color : black">성 분 별</a>
										</div>
									</div>
									<div class="card">
										<div>
											<a href="/front/sale/gender_list.web" style="color : black">대 상 별</a>
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
										<input type="hidden" name="cd_ctg_b" id="cd_ctg_b" value="${list.cd_ctg_b}" />
										<input type="hidden" name="cd_ctg_m" id="cd_ctg_m" value="${list.cd_ctg_m}" />
										<input type="hidden" name="prd_type" id="prd_type" value="${list.prd_type}" />
										<input type="hidden" name="corp_nm" id="corp_nm" value="${list.corp_nm}" />
										<div class="product__item">
											<div class="product__item__pic set-bg" data-setbg="${list.img}">
												<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
													<div class="label new">베스트</div>
												</c:if>
												<ul class="product__hover">
													<li><a href="${list.seq_sle}" class="image-popup"><span class="arrow_expand"></span></a></li>
													<li><a href="#"><span class="icon_heart_alt"></span></a></li>
													<li><a href="#"><span class="icon_bag_alt"></span></a></li>
												</ul>
											</div>
											<div class="product__item__text">
												<h6 style="line-height: 1.5em; min-height: 3em;"><a href="#" style="font-size: 15px;">${list.sle_nm}</a></h6>
													<div class="rating">
														<c:if test="${list.average_rate == 1}">
															<i class="fa fa-star"></i>(${list.count})
														</c:if>
														<c:if test="${list.average_rate == 2}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>(${list.count})
														</c:if>
														<c:if test="${list.average_rate == 3}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>(${list.count})
														</c:if>
														<c:if test="${list.average_rate == 4}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>(${list.count})
														</c:if>
														<c:if test="${list.average_rate == 5}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>(${list.count})
														</c:if>
													</div>
												<c:choose>
													<c:when test="${list.discount == null || list.discount == 0}">
														<div class="product__price"><span style="text-decoration: none; font-size: 1.3em; color: black;">${list.price_sale}</span>원</div>
													</c:when>
													<c:otherwise>
														<div class="product__price"><span>${list.price_sale}</span> <span style="text-decoration: none; color : red">-${list.discount}%</span><span style="text-decoration: none; color: black; font-size: 1.3em">${list.discount_sale}</span>원</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
							<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<div class="instagram">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="/image/footerpic/old5.png">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">임시</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="/image/footerpic/old4.png">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">임시</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="/image/footerpic/old3.png">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">임시</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="/image/footerpic/old2.png">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">임시</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg" data-setbg="/image/footerpic/old1.png">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i>
							<a href="#">임시</a>
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