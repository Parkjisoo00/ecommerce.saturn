	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/introduce/introduce.jsp" %>
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

	<section class="banner1 set-bg" data-setbg="/img/20170724511045.jpg"></section>
		<div class="container">
			<div class="row">
			<div class="overlay-content1 col-lg-8 ">
			 <div class="tab-content1">
					<div class="tab-pane active" >
						<h1 style = "text-align: center">소개(임시)</h1>
						<section class="image-container"></section>
						<p style = "font-size: 22px; text-align: center ;line-height: 1.5; ">행정안전부가 2023년 1월 발표한<br>
							‘2022년 우리나라 주민등록 인구 통계’에 따르면,<br>
							우리나라 65세 이상 고령 인구는 927만 명으로 전체 인구의 18%를 넘어섰다.<br>
							이 추세라면 2025년 대한민국은 초고령사회로 진입하고,<br>
							2070년이면 2명 중 1명이 65세 이상 고령자가 될 것으로 전망된다.<br>
						</p>
					</div>
					<section class="image-container2"></section>
						<p style = "font-size: 22px; text-align: center ;line-height: 1.5; ">
							이른바 100세 시대를 살고있는 사람들에게 가장 큰 관심은 무엇보다 건강일 것이다. <br>
							그중에서도 대한민국은 통계청의 조사에 따르면 25년을 기점으로 <br>
							전체 인구의 20.6%가 65세 이상인 초고령화 사회로 진입하게 된다. <br>
							이와같이 건강에 대한 관심이 커지는 만큼 노령층이 빠르게 증가하는 사회 구조속에서 <br>
							노령층을 속여 허가 받지 않은 사업자들이 각종 불법 건강기능식품을 <br>
							허위 광고로 강매하는 사기가 횡횡해 황금빛 노후를 <br>
							그리는 수 없이 많은 꿈을 좌절시키고 있다. <br>
							이러한 세태의 주요 원인은 중장년층과 달리 키오스크와 같은 복잡한 기능 및 온라인에 <br>
							익숙하지 않은 노령층의 불법 건강기능식품을 판별하는 능력 부족이 가장 큰 것으로 분석된다.<br>
						</p>
					<section class="image-container3"></section>
					<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	
	<!-- Footer Section End -->
			</div>
			</div>
			</div>
	</div>
	

	
	

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>