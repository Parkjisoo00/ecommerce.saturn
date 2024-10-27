	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/personalHealth/index.jsp" %>
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
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="shop__sidebar">
						<div class="sidebar__categories">
							<div class="section-title">
								<h4><a href="#" style= "font-size: 25px;">맞춤 건강 관리</a></h4>
							</div>
							<div class="categories__accordion">
								<div class="accordion" id="accordionExample">
									<div class="card">
										<div>
											<a href="#" style="display: block; margin-bottom: 20px; font-size: 20px;">- 맞춤 건강 추천</a>
										</div>
										<div>
											<a href="/front/center/board/personalHealth/searchForm.web" style="display: block; margin-bottom: 20px; font-size: 20px;">- 안심 조회 서비스</a>
										</div>
										<div>
											<a href="#" style="display: block; margin-bottom: 20px; font-size: 20px;">- 건강 정보</a>
										</div>
										<div>
											<a href="#" style="display: block; margin-bottom: 20px; font-size: 20px;">- 새소식</a>
										</div>
										<div>
											<a href="#" style="display: block; margin-bottom: 20px; font-size: 20px;">- 성분 사전</a>
										</div>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
					<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
						<img src="/img/popup/personalized health.png" alt="Local Image" style="width: 100%; height: auto;">
					</div>
			</div>
		</div>
	</section>	
	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>