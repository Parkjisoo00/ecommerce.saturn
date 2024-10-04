<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- 페이지의 상단 로고 바로 밑에 출력되는 전체 상품 / 기능별 / 성분별 / 대상별 / 맞춤 건강 / 고객센터 / 소개 메뉴 -->
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="product__details__pic">
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img" src="img/product/details/product-1.jpg" alt="">
								<img data-hash="product-2" class="product__big__img" src="img/product/details/product-3.jpg" alt="">
								<img data-hash="product-3" class="product__big__img" src="img/product/details/product-2.jpg" alt="">
								<img data-hash="product-4" class="product__big__img" src="img/product/details/product-4.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h3>제품<span>브랜드:</span></h3>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<span>( 리뷰 숫자 )</span>
						</div>
						<div class="product__details__price">$ 75.0 <span>$ 83.0</span></div>
						<p>제품 설명</p>
						<div class="product__details__button">
							<div class="quantity">
								<span>구매 수량:</span>
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"><span class="icon_bag_alt"></span> 장바구니에 담기</a>
							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__details__widget">
							<ul>
								<li>
									<span>재고:</span>
									<div class="stock__checkbox">
										<label for="stockin">
											재고 숫자
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
								<li>
									<span>제품 타입:</span>
									<div class="stock__checkbox">
										<label for="stockin">
											제품 타입
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
								<li>
									<span>등록일</span>
									<div class="stock__checkbox">
										<label for="stockin">
											등록일
											<input type="checkbox" id="stockin">
											
										</label>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews ( 2 )</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Description</h6>
								<p>제품 설명 이미지</p>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<h6>TODO 리뷰 ( 2 )</h6>
								<p>리뷰 작성</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 리스트 형태로 이 페이지의 상품과 같은 대분류의 중분류 상품들을 넣기 -->
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>함께 보면 좋은 상품</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-1.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명r</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-2.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-3.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="img/product/related/rp-4.jpg">
						</div>
						<div class="product__item__text">
							<h6><a href="#">상품명</a></h6>
							<div class="rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product__price">가격</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>