<!DOCTYPE html>
<html lang="kor">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

	<head>
		<%@ include file="/include/front/header.jsp" %>
		<!-- Css Styles -->
		<%@ include file="/include/front/css.jsp" %>

			<!-- Google Font -->
			<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript" src="/js/front.js"></script>
			<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
			<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
			<script type="text/javascript" src="/js/package/tinymce.js"></script>

				<script>
				
				$(function() {
					$('#age').datepicker({
						dateFormat: 'yy-mm-dd',
						changeMonth: true,
						changeYear: true,
						yearRange: "1900:" + new Date().getFullYear(),
						onClose: function() {
							$(this).focus();
						},
						onSelect: function(dateText) {
							//alert("선택된 생년월일: " + dateText); // 날짜 선택 시 자동 처리
						}
					});

					$('#age').on('input', function() {
						// 숫자만 남기고 자릿수 제한
						var value = $(this).val().replace(/[^0-9]/g, '').slice(0, 8);
						$(this).val(value);

						if (value.length === 8) {
							var formattedDate = value.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
							$(this).val(formattedDate);
							//alert("입력된 생년월일: " + $(this).val()); // 자동 처리
						}
					});
				});
					
					// 이메일 중복 여부
					var isDuplicate = true;

					$(function () {

						var $frm = $("#frmMain");


						$("#btnConfirm").on("click", function (e) {

							var myData = { email: $("#email").val() };

							$.ajax({
								type: "POST",
								url: "/front/member/checkEmail.json",
								dataType: "json",
								contentType: "application/json; charset=UTF-8",
								data: JSON.stringify(myData),
								success: function (res) {
									if (res == true) {
										alert("정상적으로 " + $("#email").val()
											+ "로 인증 URL이 전송되었습니다.\n반드시 가입 후 10분 이내에 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
										// + "로 인증 URL이 전송되었습니다.\n반드시 가입 후 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
									}
									else {
										alert("인증 이메일이 발송이 실패되었습니다!\n시스템 관리자에게 문의하세요!");
									}
								}
							});

						});


						$("#btnId").on("click", function (e) {

							// 이메일이 7자리 이하 또는 @가 없으면
							if ($("#email").val().length <= 7 || $("#email").val().indexOf("@") <= 0) {
								alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
								return false;
							}

							// var myData = $frm.serialize();
							// var myData = "email=" + $("#email").val();

							// var myData = {email: "plutomsw@gmail.com", passwd: "123456"};
							var myData = { email: $("#email").val() };
							//alert(JSON.stringify(myData));

							/*
							var myData = "{\"email\": \"plutomsw@gmail.com\", \"passwd\": \"12345678\"}";
							alert(myData);
							*/

							$.ajax({
								type: "POST",
								// async: false,
								url: "/front/member/checkDuplicate.json",
								dataType: "json",
								contentType: "application/json; charset=UTF-8",
								data: JSON.stringify(myData),
								success: function (res) {
									// alert(JSON.stringify(res));
									// var jsonData = JSON.parse(res);
									// 중복이 안 될 경우
									if (res != true) {
										isDuplicate = false;
										$("#email").attr("readonly", true);
										alert($("#email").val() + "는 사용 가능하며 변경할 수 없습니다.");
										// $("#btnConfirm").attr("disabled", false);
									}
									else {
										alert($("#email").val() + "는 중복됩니다! 다른 이메일을 입력하세요!");
										$("#email").val("");
										$("#email").focus();
									}
								}
							});
						});
					});
					 function execDaumPostcode() {
							new daum.Postcode({
								oncomplete: function(data) {
									document.getElementById('postcode').value = data.zonecode;  // 우편번호
									document.getElementById('addr1').value = data.roadAddress;  // 도로명 주소
								}
							}).open();
						}
				</script>
	</head>

	<body>
	<input type="hidden" name="phone" id="phone" />
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
						<form action="/front/member/registerProc.web" class="checkout__form" id="frmMain" method="POST">
							<div class="row2">
									<h5>회원가입</h5>

									<div class="row">
										<!-- 이메일 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>이메일 <span>*</span></p>
												<div style="display: flex; align-items: center; gap: 10px;">
													<input type="text" id="email" name="email" required
														style="flex: 1; min-width: 250px;" />
													<input type="button" value="중복 찾기" style="width: 120px;"
														id="btnId" />
													<input type="button" value="이메일 인증" style="width: 120px;"
														id="btnConfirm" />
												</div>
											</div>
										</div>

										<!-- 비밀번호 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>비밀번호 (영문 대/소문자, 숫자, 특수문자 포함 8~16자 필수 입력) <span>*</span></p>
												<input value = "12345678!a" type="password" id="passwd" name="passwd" required>
													<!-- pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}"
													required style="width: 100%;" /> -->
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>비밀번호 확인 <span>*</span></p>
												<input value = "12345678!a" type="password" id="passwd_conFirm" name="passwd_conFirm" required>
													<!-- pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}"
													required style="width: 100%;" /> -->
											</div>
										</div>

										<!-- 성명 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>성명 <span>*</span></p>
												<input type="text" id="mbr_nm" name="mbr_nm" required
													style="width: 100%;" />
											</div>
										</div>

										<!-- 생년월일 -->
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>생년월일 <span>*</span></p>
												<input type="text" id="age" name="age" placeholder="생년월일" maxlength="10" style="width: 100%;" required/>
											</div>
										</div>

										<!-- 성별 -->
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="gender-option">
												<p>성별 <span>*</span></p>
												<div class="checkbox_container" style="display: flex; gap: 10px;">
													<label><input type="radio" name="gender" value="M" checked />
														남</label>
													<label><input type="radio" name="gender" value="F" /> 여</label>
												</div>
											</div>
										</div>

										<!-- 연락처 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>연락처 <span>*</span></p>
												<div style="display: flex; gap: 5px;">
													<input value="010" type="text" id="phone1" name="phone1"
														maxlength="3" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" />
													-
													<input value="1111" type="text" id="phone2" name="phone2"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" />
													-
													<input value="2222" type="text" id="phone3" name="phone3"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" />
												</div>
											</div>
										</div>

										<!-- 주소 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>주소 <span>*</span></p>
												<input type="text" id="postcode" name="postcode" size="5" />
						
													<label for="addr1">도로명</label>
													<input type="text"		id="addr1"			name="addr1" size="40" />
													<input type="hidden"	id="roadAddr"		name="roadAddr" />
													
													<span id="guide" style="color:#999; display:none"></span>
													
													<label for="addr2">상세</label>
													<input type="text"		id="addr2"			name="addr2" size="20" placeholder="상세 주소" >
													<input type="hidden"	id="extraAddress"	name="extraAddress" />
													
													<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>

										<!-- 마케팅 수신 동의 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox" >
												<p>마케팅 수신 동의</p>
													<br>
														<input type = "checkbox" id="flg_sms" name="flg_sms">
														SMS
														<input type = "checkbox" id="flg_email" name="flg_email">
														EMAIL
											</div>
										</div>

										<!-- 약관 동의 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox">
												<input type="checkbox" id="term_1" name="term_1">
												[필수] '브라보 마이 라이프' 이용 약관 동의
												<div class="terms-container"
													style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
													제1장 총칙<br>제 1 조 (목적)<br>이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는
													서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox">
												<input type="checkbox" id="term_2" name="term_2">
												[필수] 개인정보 수집 및 이용동의
												<div class="terms-container"
													style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
													제1장 총칙<br>제 1 조 (목적)<br>이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는
													서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox">
												<input type="checkbox" id="term_3" name="term_3">
												[선택] 개인정보 제3자 제공 동의
												<div class="terms-container"
													style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
													제1장 총칙<br>제 1 조 (목적)<br>이 약관은 쿠팡 주식회사(이하 “회사”)가 운영하는 사이버몰에서 제공하는
													서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
												</div>
											</div>
										</div>

										<!-- 회원가입 버튼 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<input type="button" value="회원가입"
													style="width: 100%; text-align: center;" id="registerId" onClick="checkRegister();"/>
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
										<a href="./index.html">
											<img src="/img/logo.png" alt="Logo">

										</a>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt
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
									<p>Copyright &copy;
										<script>document.write(new Date().getFullYear());</script> All rights reserved |
										This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
											href="https://colorlib.com" target="_blank">Colorlib</a>
									</p>
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