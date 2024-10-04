<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/login/loginForm.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	<script type="text/javascript" src="/js/front.js"></script>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
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
		<%@ include file="/include/front/middlegnb.jsp" %>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
				<div class="row3">
					<div class="col-lg-12">
						<h5>회원 로그인</h5>
						<div class="row3">
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<input type="text" id="email" name="email" placeholder="이메일(아이디)" maxlength="32" required>
								</div>  
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<input type="text" id="passwd" name="passwd" placeholder="비밀번호" maxlength="16" required>
								</div>  
							</div>
							<div class="col-lg-12">
								<div class="checkout__form__checkbox">
									<label for="acc">
										아이디 저장
										<input type="checkbox" id="acc">
										<span class="checkmark"></span>
									</label>
									</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="checkout__form__input">
									<input type="button" value="로그인" id="loginId" onClick="checkLogin();"/>
								</div>
							</div>
							<div class="col-lg-4 col-md-12 col-sm-12">
								<div class="checkout__form__input">
									<input type="button" value="회원가입" id="registerId" onClick="checkRegister();"/>
								</div>
							</div><div class="col-lg-4 col-md-12 col-sm-12">
								<div class="checkout__form__input">
									<input type="button" value="아이디 찾기" id="findId" onClick="checkId();"/>
								</div>
							</div><div class="col-lg-4 col-md-12 col-sm-12">
								<div class="checkout__form__input">
									<input type="button" value="비밀번호 찾기" id="findPasswd" onClick="checkPasswd();"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
		<!-- Checkout Section End -->

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