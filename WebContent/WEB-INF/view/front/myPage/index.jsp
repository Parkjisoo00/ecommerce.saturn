<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		// document.getElementById("searchWord").value = "";
		// document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action="/front/center/board/myPageNotice/list.web";
		frmMain.submit();}
	</script>
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
	<ul class="my-custom-ul" >
				<li><img src="/img/mypage/mypage1.png"><a style="font-size :30px" href="/front/myPage/" class="menuLnb">	마이 페이지</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goList(3);" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/review.web" class="menuLnb">리뷰관리</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

				<!-- Checkout Section Begin -->
				<section class="checkout spad">
					<div class="container">
						<form id="frmMain" method="POST" class="checkout__form">
						<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" 	/>
							<div class="row2">
									<h5 >개인 정보</h5>
									<div class="row">
										<!-- 이메일 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>이메일 <span>*</span></p>
												<div style="display: flex; align-items: center; gap: 10px;">
													<input type="text" id="email" name="email" required
														style="flex: 1; min-width: 250px;" autocomplete="off"/>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>비밀번호 (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력) <span>*</span></p>
												<input type="password" id="passwd" name="passwd" required autocomplete="off" />
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>비밀번호 (확인을 위해 새 비밀번호를 다시 입력해주세요.) <span>*</span></p>
												<input type="password" id="passwd_" name="passwd_" required autocomplete="off" />
											</div>
										</div>

										<!-- 성명 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>성명 <span>*</span></p>
												<input type="text" id="mbr_nm" name="mbr_nm" required
													style="width: 100%;" autocomplete="off"/>
											</div>
										</div>

										<!-- 생년월일 -->
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>생년월일 <span>*</span></p>
												<input type="text" id="age" name="age" placeholder="생년월일" maxlength="10" style="width: 100%;" required autocomplete="off"/>
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
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
													-
													<input value="1111" type="text" id="phone2" name="phone2"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
													-
													<input value="2222" type="text" id="phone3" name="phone3"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
												</div>
											</div>
										</div>

										<!-- 주소 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>주소 <span>*</span></p>
												<input type="text" id="postcode" name="postcode" size="5" autocomplete="off"/>

													<label for="addr1">도로명</label>
													<input type="text"		id="addr1"			name="addr1" size="40" autocomplete="off"/>
													<input type="hidden"	id="roadAddr"		name="roadAddr" />
													
													<span id="guide" style="color:#999; display:none"></span>
													
													<label for="addr2">상세</label>
													<input type="text"		id="addr2"			name="addr2" size="20" placeholder="상세 주소" autocomplete="off"/>
													<input type="hidden"	id="extraAddress"	name="extraAddress" />
													
													<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>

										<!-- 마케팅 수신 동의 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox" >
												<p>마케팅 수신 동의</p>
													<br>
														<input type = "checkbox" id="flg_sms" name="flg_sms" value="Y">
														SMS
														<input type = "checkbox" id="flg_email" name="flg_email" value="Y">
														EMAIL
											</div>
										</div>

										<!-- 약관 동의 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox">
												<input type="checkbox" id="term_1" name="term_1" value="Y">
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
												<input type="checkbox" id="term_2" name="term_2" value="Y">
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
												<input type="checkbox" id="term_3" name="term_3" value="Y">
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
							</form>
						</div>
			</section>

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