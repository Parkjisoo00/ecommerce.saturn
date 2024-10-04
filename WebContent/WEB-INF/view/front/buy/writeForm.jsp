<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
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

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
						<c:choose>
							<c:when test="${empty saleDto}">
								<div class="col-12 d-flex justify-content-center align-items-center" style="height: 600px;">
									<p>상품이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${saleDto}">
				<div class="col-lg-6">
					<div class="product__details__pic">
						<div class="product__details__pic__left product__thumb nice-scroll">
						</div>
						<div class="product__details__slider__content2">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img" data-setbg="${saleDto.img}"alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h3>${saleDto.sle_nm}<span>브랜드: ${saleDto.corp_nm}</span></h3>
						<div class="product__details__widget">
						</div>
						<div class="rating">
							<c:if test="${list.average_rate == 1}">
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 2}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 3}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 4}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 5}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${list.count})
							</c:if>
							<span>( 138 reviews )</span>
						<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
							</ul>
						</div>
						<c:choose>
							<c:when test="${list.discount == null || list.discount == 0}">
							<div class="product__price"><span style="text-decoration: none; font-size: 1.2em; color: black;">${list.price_sale}</span>원</div>
							</c:when>
						<c:otherwise>
							<div class="product__price"><span style="text-decoration: none; font-size: 1.2em; color: black;">${list.discount_sale}</span> 
							<span>${list.price_sale}</span> <span style="text-decoration: none; color : red">-${list.discount}%</span><span style="text-decoration: none; color: black; font-size: 1.3em"></span>원</div>
						</c:otherwise>
						</c:choose>
						<div class="product__details__widget1">
						</div>
						<p>Nemo enim ipsam voluptatem quia aspernatur aut odit aut loret fugit, sed quia consequuntur
						magni lores eos qui ratione voluptatem sequi nesciunt.</p>
						<div class="product__details__button">
							<div class="quantity">
								<div class="pro-qty">	
									<input type="text" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"><span class="icon_cart_alt"></span>&nbsp; 장바구니 담기	</a>
							<a href="#" class="cart-btn"><span class="icon_cart_alt"></span>&nbsp; 바로 구매하기	</a>
							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
								<li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
							</ul>
						</div>
						<div class="product__details__widget">
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품상세</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품평 ( 2 )</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Description</h6>
								
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<h6>상품평</h6>
							<div class="rating">
							<div class="rating">
							<c:if test="${list.average_rate == 1}">
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 2}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 3}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 4}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${saleDto.count})
							</c:if>
							<c:if test="${saleDto.average_rate == 5}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>(${list.count})
							</c:if>
							<span>( 138 reviews )</span>  <a href="#">자세히보기</a>
							</div>	
								<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed
									quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
									Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
									voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
									consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
								consequat massa quis enim.</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
									dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
									nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
								quis, sem.</p>
							</div>
						</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
			
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>함께 비교하면 좋을 상품	</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="/img/product/related/rp-1.jpg">
							<div class="label new">New</div>
							<ul class="product__hover">
								<li><a href="img/product/related/rp-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="/img/product/related/rp-2.jpg">
							<ul class="product__hover">
								<li><a href="img/product/related/rp-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="/img/product/related/rp-3.jpg">
							<div class="label stockout">out of stock</div>
							<ul class="product__hover">
								<li><a href="img/product/related/rp-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="/img/product/related/rp-4.jpg">
							<ul class="product__hover">
								<li><a href="img/product/related/rp-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
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
</body>
</html>