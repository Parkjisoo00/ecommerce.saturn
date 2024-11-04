	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
	<%@ include file="/include/front/bannergnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad" >
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
			<!-- 고정 -->
				<div class="survey">
					<div class="gnb">
						<div class="survey-div">
							<a href="#" style="display: inline-block; line-height: 32px;"><span style="position: relative;">이전</span></a>
						</div>
						<div class="survey-div">
							<h1 style="text-align: center; font-size: 30px; font-weight: 700; margin-top: -15px; font-family: 'Noto Sans KR', sans-serif !important;">맞춤 건강 설문</h1>
						</div>
						<div class="survey-div" style="text-align: right;">
							<a href="#" onclick="closeSurvey(); return false;" style="display: inline-block; line-height: 32px;"><span style="position: relative;">X</span></a>
						</div>
					</div>
					<div class="survey-progress">
						<div class="progress-sub">
							<div id="progressCurrent" style="width: 10%;"></div>
						</div>
					</div>
			</div>
			<!-- 고정 -->
			
			
			
			<!-- 각자 담당하는 부분 화면 1개씩 -->
				<div id="A1" class="row"style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						내용1
					</div>
				</div>
			<!-- 각자 담당하는 부분 화면 1개씩 -->
				
			</form>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</body>
</html>