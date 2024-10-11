<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/index.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag" uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	.categories__item {
	position: relative;
	background-size: cover;
	background-position: center;
	}
	
	.categories__item::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(255, 255, 255, 0.3); /* 반투명 흰색 덧씌우기 */
		z-index: 1;
	}
	
	.categories__text {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
		
	
	</style>
	<script>
		function goTypeT(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
		
		function goTypeF(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/function_list.web";
			frmMain.submit();
		}
		
		function goTypeI(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/ingredient_list.web";
			frmMain.submit();
		}
		
		function goTypeG(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/gender_list.web";
			frmMain.submit();
		}
				
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/front/center/board/list.web";
			frmMain.submit();
		}
		
		function consolegoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/console/center/board/list.web";
			frmMain.submit();
		}
		
		function hpSurgoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/front/hpSur/ingredient.web";
			frmMain.submit();
		}
	</script>
<!-- Google Font -->
<%@ include file="/include/common/webfont.jsp" %>

<!-- Css Styles -->
<%@ include file="/include/common/css.jsp" %>

<style>
/*
	.categories__text.special-background {
	background-color: rgba(255, 255, 255, 0.5);
	padding: 10px;
	display: inline-block;
}

.categories__text.special-background h1,
.categories__text.special-background p {
	color: black;
}
*/
</style>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="corp_nm"		name="corp_nm" />
<input type="hidden" id="prd_type"		name="prd_type" />
<input type="hidden" id="filter"		name="filter" />
<input type="hidden" id="cd_ctg_m"		name="cd_ctg_m" />
<input type="hidden" id="type"			name="type" />
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Banner Section Begin -->
	<section class="banner set-bg" data-setbg="img/banner/banner7.jpg">
		<div class="container">
			<div class="row">
				<div class="col-xl-7 col-lg-8 ">
					<div class="banner__slider owl-carousel">
						<div class="banner__item">
							<div class="banner__text">
								<span>겨울맞이 특별 할인 - 최대 50% OFF! </span>
								<h1>이벤트</h1>
								<a href="#">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>건강 목표 달성! 나만의 맞춤 영양제로 건강을 지키세요</span>
								<h1>맞춤 건강 관리</h1>
								<a href="#">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>인터넷 주문이 어려우시다면? <br> ※휴대폰에서만 주문가능※</span>
								<h1>ARS 전화주문</h1>
								<a href="#">바로가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="categories__item categories__large__item set-bg"
						data-setbg="img/categories/home9.jpg">
						<div class="categories__text" style="text-align: left;">
						<div class="categories__text special-background">
							<h1 style="font-weight: bold; color: black;">나만의 맞춤 <br> 건강 추천</h1>
							<p style="font-weight: bold; font-size: 20px; ">건강 설문을 진행하고 나에게 맞는 영양제를 추천받아 보세요!</p>
							<a href="#" style="font-size: 20px;">바로가기</a>
						</div>
					</div>
				</div>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg"
								data-setbg="img/categories/home4.jpg">
								<div class="categories__text">
								<div class="categories__text special-background">
									<h4 style="font-weight: bold;">안심 조회 서비스</h4>
									<p style="font-weight: bold;">구매하고 싶은 영양제가 인증 허가를 받은 <br> 안심상품인지 확인하세요</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item"
								style="background-color: #dfd3c3;">
								<div class="categories__text">
									<h4>기능별 건강기능식품 조회</h4>
									<p>지금 당신에게 필요한 건강 솔루션은?</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item"
								style="background-color: #c7b199;">
								<div class="categories__text">
									<h4>성분별 건강기능식품 조회</h4>
									<p>필요한 영양소를 한눈에! 성분별 영양제 가이드</p>
									<a href="#">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 p-0">
							<div class="categories__item"
								style="background-color: #9f8473;">
								<div class="categories__text">
									<h4>대상별 건강기능식품 조회</h4>
									<p>남성과 여성, 당신의 몸에 맞춘 영양제 건강의 시작</p>
									<a href="#">바로가기</a>
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
	<section class="product" style="width: 70%; margin-left: auto; margin-right: auto;">
		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="section-title">
						<h4>추천 상품</h4>
					</div>
				</div>
			</div>
			<div class="row property__gallery">
				<div class="col-lg-3 col-md-4 col-sm-6 mix women">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-1.jpg">
							<div class="label new">New</div>
							<ul class="product__hover">
								<li><a href="img/product/product-1.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-2.jpg">
							<ul class="product__hover">
								<li><a href="img/product/product-2.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-3.jpg">
							<div class="label stockout">out of stock</div>
							<ul class="product__hover">
								<li><a href="img/product/product-3.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-4.jpg">
							<ul class="product__hover">
								<li><a href="img/product/product-4.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-5.jpg">
							<ul class="product__hover">
								<li><a href="img/product/product-5.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
					<div class="product__item sale">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-6.jpg">
							<div class="label sale">Sale</div>
							<ul class="product__hover">
								<li><a href="img/product/product-6.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-7.jpg">
							<ul class="product__hover">
								<li><a href="img/product/product-7.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix women men kid accessories cosmetic">
					<div class="product__item sale">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-8.jpg">
							<div class="label">Sale</div>
							<ul class="product__hover">
								<li><a href="img/product/product-8.jpg"
										class="image-popup"><span
											class="arrow_expand"></span></a></li>
								<li><a href="#"><span class="icon_heart_alt"></span></a>
								</li>
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