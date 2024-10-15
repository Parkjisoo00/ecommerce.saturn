<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/popup/ars.jsp" %>
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
<form id="frmMain" method="POST">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<br>
	<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">ARS 전화 주문</h6>

	<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
		<img src="/img/popup/ARS1.png" style="width: 100%; height: auto;">
	</div>
	<br>
	<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
		<img src="/img/popup/ARS2.png" style="width: 100%; height: auto;">
	</div>
	<br>
	<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
		<img src="/img/popup/ARS3.png" style="width: 100%; height: auto;">
	</div>
	<!-- Blog Section End -->

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