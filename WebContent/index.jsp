<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<style>
	.banner {
		margin-bottom: 100px; /* 배너 섹션 아래에 50px의 여백 추가 */
	}

	.instagram {
		margin-top: 100px; /* 인스타그램 섹션 위에 50px의 여백 추가 */
	}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->
	
	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="categories__item categories__large__item set-bg"
					data-setbg="img/categories/category-1.jpg">
					<div class="categories__text">
						<h1>나만의 맞춤 건강 추천</h1>
						<p>건강 설문을 진행하고 나에게 맞는 영양제를 추천받아 보세요!</p>
						<a href="#">Shop now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 p-0">
						<div class="categories__item set-bg" data-setbg="img/categories/category-2.jpg">
							<div class="categories__text">
								<h4>안심 조회 서비스</h4>
								<p>구매하고 싶은 영양제가 인증 허가를 받은 안심상품인지 확인하세요</p>
								<a href="#">Shop now</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 p-0">
						<div class="categories__item set-bg" data-setbg="img/categories/category-3.jpg">
							<div class="categories__text">
								<h4>기능별 건강기능식품 조회</h4>
								<p>273 items</p>
								<a href="#">Shop now</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 p-0">
						<div class="categories__item set-bg" data-setbg="img/categories/category-4.jpg">
							<div class="categories__text">
								<h4>성분별 건강기능식품 조회</h4>
								<p>159 items</p>
								<a href="#">Shop now</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 p-0">
						<div class="categories__item set-bg" data-setbg="img/categories/category-5.jpg">
							<div class="categories__text">
								<h4>대상별 건강기능식품 조회</h4>
								<p>792 items</p>
								<a href="#">Shop now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4">
				<div class="section-title">
					<h4>New product</h4>
				</div>
			</div>
			<div class="col-lg-8 col-md-8">
				<ul class="filter__controls">
					<li class="active" data-filter="*">All</li>
					<li data-filter=".women">Womenâs</li>
					<li data-filter=".men">Menâs</li>
					<li data-filter=".kid">Kidâs</li>
					<li data-filter=".accessories">Accessories</li>
					<li data-filter=".cosmetic">Cosmetics</li>
				</ul>
			</div>
		</div>
		<div class="row property__gallery">
			<div class="col-lg-3 col-md-4 col-sm-6 mix women">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
						<div class="label new">New</div>
						<ul class="product__hover">
							<li><a href="img/product/product-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Buttons tweed blazer</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 59.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix men">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
						<ul class="product__hover">
							<li><a href="img/product/product-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Flowy striped skirt</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 49.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix accessories">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
						<div class="label stockout">out of stock</div>
						<ul class="product__hover">
							<li><a href="img/product/product-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Cotton T-Shirt</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 59.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix cosmetic">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-4.jpg">
						<ul class="product__hover">
							<li><a href="img/product/product-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Slim striped pocket shirt</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 59.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix kid">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-5.jpg">
						<ul class="product__hover">
							<li><a href="img/product/product-5.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Fit micro corduroy shirt</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 59.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
				<div class="product__item sale">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-6.jpg">
						<div class="label sale">Sale</div>
						<ul class="product__hover">
							<li><a href="img/product/product-6.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Tropical Kimono</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 49.0 <span>$ 59.0</span></div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
				<div class="product__item">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
						<ul class="product__hover">
							<li><a href="img/product/product-7.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Contrasting sunglasses</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 59.0</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
				<div class="product__item sale">
					<div class="product__item__pic set-bg" data-setbg="img/product/product-8.jpg">
						<div class="label">Sale</div>
						<ul class="product__hover">
							<li><a href="img/product/product-8.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
							<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							<li><a href="#"><span class="icon_bag_alt"></span></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6><a href="#">Water resistant backpack</a></h6>
						<div class="rating">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product__price">$ 49.0 <span>$ 59.0</span></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->

<!-- Banner Section Begin -->
<section class="banner set-bg" data-setbg="img/banner/banner-1.jpg">
	<div class="container">
		<div class="row">
			<div class="col-xl-7 col-lg-8 m-auto">
				<div class="banner__slider owl-carousel">
					<div class="banner__item">
						<div class="banner__text">
							<span>The Chloe Collection</span>
							<h1>이벤트</h1>
							<a href="#">Shop now</a>
						</div>
					</div>
					<div class="banner__item">
						<div class="banner__text">
							<span>The Chloe Collection</span>
							<h1>맞춤 건강 관리</h1>
							<a href="#">Shop now</a>
						</div>
					</div>
					<div class="banner__item">
						<div class="banner__text">
							<span>The Chloe Collection</span>
							<h1>ARS 전화주문</h1>
							<a href="#">Shop now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Banner Section End -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</body>
</html>