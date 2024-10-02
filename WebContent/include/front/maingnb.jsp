<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-2">
					<div class="header__logo">
						<a href="#"><img src="/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-xl-6 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="/front/sale/total_list.web">전체 상품</a></li>
							<li><a href="/front/sale/function_list.web">기능별</a></li>
							<li><a href="/front/sale/ingredient_list.web">성분별</a></li>
							<li><a href="/front/sale/gender_list.web">대상별</a></li>
							<li><a href="#">맞춤 건강 관리</a>
								<ul class="dropdown">
									<li><a href="/front/buy/writeForm.web">Product Details</a></li>
									<li><a href="/front/basket/setBasketIframe.web">Shop Cart</a></li>
									<li><a href="/front/pay/index.web">Checkout</a></li>
									<li><a href="#">Blog Details</a></li>
								</ul>
							</li>
							<li><a href="#">고객 센터</a></li>
							<li><a href="#">소개</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right">
						<div class="header__right__auth">
							<a href="/front/login/loginForm.web">Login</a>
							<a href="/front/member/registerForm.web">Register</a>
						</div>
						<ul class="header__right__widget">
							<li><span class="icon_search search-switch"></span></li>
							<li><a href="#"><span class="icon_heart_alt"></span>
								<div class="tip">2</div>
							</a></li>
							<li><a href="#"><span class="icon_bag_alt"></span>
								<div class="tip">2</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>