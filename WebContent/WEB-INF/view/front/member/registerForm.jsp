<!DOCTYPE html>
<html lang="kor">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<head>
	<%@ include file="/include/front/header.jsp" %>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

	<!-- Css Styles -->
	<%@ include file="/include/front/css.jsp" %>
</head>

<body>
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
						<span>회원가입</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<form action="#" class="checkout__form">
				<div class="row">
					<div class="col-lg-8">
						<h5>회원가입</h5>
						<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>이메일 <span>*</span></p>
												<input type="text" id="email" name="email" required />
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>중복 확인<span>*</span></p>
												<input type="button" value="중복 찾기" style="width:120px" id="btnId" />
												 <input type="hidden" value="인증 하기" id="btnConfirm" style="width:100px" disabled />
											</div>
										</div>
										<div class="col-lg-12">
											<div class="checkout__form__input">
												<p>비밀번호 (영문 대/소문자, 숫자, 특수문자 포함 8~16자 필수 입력)<span>*</span></p>
												<input type="password" id="passwd" name="passwd"
													pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}"
													required />
											</div>
											<div class="checkout__form__input">
												<p>비밀번호 확인 <span>*</span></p>
												<input type="password" id="passwd_confirm" name="passwd_confirm"
													pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}"
													required />
											</div>
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="checkout__form__input">
														<p>성명 <span>*</span></p>
														<input type="text" id="mbr_nm" name="mbr_nm" required />
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="gender-option">
														<p>성별<span>*</span></p>
														<div class="checkbox_container">
															<label><input type="radio" name="gender" value="M"
																	checked /> 남</label>
															<label><input type="radio" name="gender" value="F" />
																여</label>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="checkout__form__input">
														<p>생년월일 <span>*</span></p>
														<input type="date" id="birthDate" name="birthDate" />
													</div>
												</div>
												
												<div class="col-lg-6 col-md-6 col-sm-6">
													<div class="checkout__form__input">
														<p>연락처 <span>*</span></p>
														<input value="010" type="text" id="phone1" name="phone1"
															maxlength="3" style="text-align:center;width:50px" required
															oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
														- <input value="1111" type="text" id="phone2" name="phone2"
															maxlength="4" style="text-align:center;width:60px" required
															oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
														- <input value="2222" type="text" id="phone3" name="phone3"
															maxlength="4" style="text-align:center;width:60px" required
															oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
													</div>
												</div>
												<div class="col-lg-12">
													<div class="checkout__form__input">
														<p>주소 <span>*</span></p>
														<input value="우편번호" type="text" maxlength="5"
															style="text-align:center;width:100px;" id="post" name="post"
															required readonly />
														도로명 <input value="주소1" type="text" size="40" required id="addr1"
															name="addr1" readonly />
														<input type="hidden" id="jibunAdd" />
														<input type="hidden" id="extraAddress" />
														<span id="guide" style="color:#999; display:none"></span>
														상세 <input value="주소2" type="text" placeholder="상세 주소" required
															id="addr2" name="addr2" />
														<input type="button" value="우편번호 찾기" style="width:120px"
															onClick="execDaumPostcode();" />
													</div>
												</div>
												<div class="col-lg-6">
						                            <div class="checkout__form__input">
						                                <p>마케팅 수신 동의</p>
						                                SMS <input type="checkbox" name="flg_sms" value="Y" />
						                                Email <input type="checkbox" name="flg_email" value="Y" />
						                            </div>
						                        </div>
												<div class="col-lg-12">
													<div class="checkout__form__checkbox">
														<input type="checkbox" id="term_1" name="term_1">
														[필수]'브라보 마이 라이프' 이용 약관 동의
														<div class="terms-container">
															제1장 총칙<br>
															제 1 조 (목적)<br>
															이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는 서비스와 이를 이용하는 회원의
															권리·의무 및 책임사항을 규정함을 목적으로 합니다.
														</div>
													</div>
												</div>
												<div class="col-lg-12">
													<div class="checkout__form__checkbox">
														<input type="checkbox" id="term_2" name="term_2">
														[필수]개인정보 수집 및 이용동의
														<div class="terms-container">
															제1장 총칙<br>
															제 1 조 (목적)<br>
															이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는 서비스와 이를 이용하는 회원의
															권리·의무 및 책임사항을 규정함을 목적으로 합니다.
															제1장 총칙<br>
															제 1 조 (목적)<br>
															이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는 서비스와 이를 이용하는 회원의
															권리·의무 및 책임사항을 규정함을 목적으로
															제1장 총칙<br>
															제 1 조 (목적)<br>
															이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는 서비스와 이를 이용하는 회원의
															권리·의무 및 책임사항을 규정함을 목적으로
														</div>
													</div>
												</div>
												<div class="col-lg-12">
													<div class="checkout__form__checkbox">
														<input type="checkbox" id="term_3" name="term_3">
														[선택]개인정보 제3자 제공 동의
														<div class="terms-container">
															제1장 총칙<br>
															제 1 조 (목적)<br>
															이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는 서비스와 이를 이용하는 회원의
															권리·의무 및 책임사항을 규정함을 목적으로 합니다.
														</div>
													</div>
												</div>
												
												
												<div class="col-lg-12">
													<div class="checkout__form__input">
														<input type="button" value="회원가입"
															style="width:800px;text-align: center;" id="registerId" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>


		<!-- Instagram Begin -->
		<div class="instagram">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-1.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-2.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-3.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-4.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-5.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 p-0">
						<div class="instagram__item set-bg" data-setbg="/img/instagram/insta-6.jpg">
							<div class="instagram__text">
								<i class="fa fa-instagram"></i>
								<a href="#">@ ashion_shop</a>
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
					<div class="col-lg-4 col-md-6 col-sm-7">
						<div class="footer__about">
							<div class="footer__logo">
								<a href="./index.html"><img ="/img/logo.png" alt=""></a>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
							cilisis.</p>
							<div class="footer__payment">
								<a href="#"><img src="/img/payment/payment-1.png" alt=""></a>
								<a href="#"><img src="/img/payment/payment-2.png" alt=""></a>
								<a href="#"><img src="/img/payment/payment-3.png" alt=""></a>
								<a href="#"><img src="/img/payment/payment-4.png" alt=""></a>
								<a href="#"><img src="/img/payment/payment-5.png" alt=""></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-5">
						<div class="footer__widget">
							<h6>Quick links</h6>
							<ul>
								<li><a href="#">About</a></li>
								<li><a href="#">Blogs</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-4">
						<div class="footer__widget">
							<h6>Account</h6>
							<ul>
								<li><a href="#">My Account</a></li>
								<li><a href="#">Orders Tracking</a></li>
								<li><a href="#">Checkout</a></li>
								<li><a href="#">Wishlist</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-8 col-sm-8">
						<div class="footer__newslatter">
							<h6>NEWSLETTER</h6>
							<form action="#">
								<input type="text" placeholder="Email">
								<button type="submit" class="site-btn">Subscribe</button>
							</form>
							<div class="footer__social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-youtube-play"></i></a>
								<a href="#"><i class="fa fa-instagram"></i></a>
								<a href="#"><i class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<div class="footer__copyright__text">
							<p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
						</div>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</footer>
		<!-- Footer Section End -->

		<!-- Search Begin -->
		<div class="search-model">
			<div class="h-100 d-flex align-items-center justify-content-center">
				<div class="search-close-switch">+</div>
				<form class="search-model-form">
					<input type="text" id="search-input" placeholder="Search here.....">
				</form>
			</div>
		</div>
		<!-- Search End -->

		<!-- Js Plugins -->
		<%@ include file="/include/front/js.jsp" %>
		
	</body>

	</html>