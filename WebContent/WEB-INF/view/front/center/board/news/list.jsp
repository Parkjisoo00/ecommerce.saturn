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

	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 24px;">새소식</h6>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="news" class="cart-table">
								<tbody>
									<tr>
										<td style="text-align: center;">1</td>
										<td>첫 번째 글 제목</td>
										<td style="text-align: center;"><img src="img/Ingredient/MSM.jpg" alt="첫 번째 이미지" style="max-width: 150px; margin-right: -100px;"></td>
									</tr>
									<tr>
										<td style="text-align: center;">2</td>
										<td>두 번째 글 제목</td>
										<td style="text-align: center;"><img src="img/Ingredient/MSM.jpg" alt="두 번째 이미지" style="max-width: 150px; margin-right: -100px;"></td>
									</tr>
									<tr>
										<td style="text-align: center;">3</td>
										<td>세 번째 글 제목</td>
										<td style="text-align: center;"><img src="img/Ingredient/MSM.jpg" alt="세 번째 이미지" style="max-width: 150px; margin-right: -100px;"></td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
				<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
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
</form>
</body>
</html>