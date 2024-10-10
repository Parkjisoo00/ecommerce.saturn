<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
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
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shop__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="cart__product__item">
										<img src="/img/shop-cart/cp-1.jpg" alt="">
										<div class="cart__product__item__title">
											<h6>Chain bucket bag</h6>
											<div class="rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
									</td>
									<td class="cart__price">$ 150.0</td>
									<td class="cart__quantity">
										<div class="pro-qty">
											<input type="text" value="1">
										</div>
									</td>
									<td class="cart__total">$ 300.0</td>
									<td class="cart__close"><span class="icon_close"></span></td>
								</tr>
								<tr>
									<td class="cart__product__item">
										<img src="/img/shop-cart/cp-2.jpg" alt="">
										<div class="cart__product__item__title">
											<h6>Zip-pockets pebbled tote briefcase</h6>
											<div class="rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
									</td>
									<td class="cart__price">$ 170.0</td>
									<td class="cart__quantity">
										<div class="pro-qty">
											<input type="text" value="1">
										</div>
									</td>
									<td class="cart__total">$ 170.0</td>
									<td class="cart__close"><span class="icon_close"></span></td>
								</tr>
								<tr>
									<td class="cart__product__item">
										<img src="/img/shop-cart/cp-3.jpg" alt="">
										<div class="cart__product__item__title">
											<h6>Black jean</h6>
											<div class="rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
									</td>
									<td class="cart__price">$ 85.0</td>
									<td class="cart__quantity">
										<div class="pro-qty">
											<input type="text" value="1">
										</div>
									</td>
									<td class="cart__total">$ 170.0</td>
									<td class="cart__close"><span class="icon_close"></span></td>
								</tr>
								<tr>
									<td class="cart__product__item">
										<img src="/img/shop-cart/cp-4.jpg" alt="">
										<div class="cart__product__item__title">
											<h6>Cotton Shirt</h6>
											<div class="rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
									</td>
									<td class="cart__price">$ 55.0</td>
									<td class="cart__quantity">
										<div class="pro-qty">
											<input type="text" value="1">
										</div>
									</td>
									<td class="cart__total">$ 110.0</td>
									<td class="cart__close"><span class="icon_close"></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="border-bottom: none;">
					<div class="cart__btn">
						<a href="/">◃ 쇼핑 계속하기</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div class="cart__total__procced" style="text-align: right;">
						<span style="font-size: 16px;">총 10개의 상품금액 <strong style="font-size: 18px;">10,000</strong>원
						<img src="/img/cartbtn/total.png"><strong style="font-size: 18px;">10,000</strong>원</span>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<a href="#" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 주문</a>
						<a href="#" class="cart-btn" style="background: #2c2c2c; color: white !important;">전체 상품 주문</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Cart Section End -->

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