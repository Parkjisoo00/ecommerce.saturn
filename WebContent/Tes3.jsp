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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
				<div class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<h2 id="qTitle" class="ha on" style="text-align: center; font-size: 20px; font-weight: 700;">해당하는 식습관을 모두 선택하세요</h2>
						<br>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food1" style="display:none" onclick= "
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							 <label for="food1" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-seedling"></i>
								<span style="display: block;">곡물류를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food2" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							 <label for="food2" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-fish"></i>
								<span style="display: block;">생선을 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food3" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food3" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-leaf"></i>
								<span style="display: block;">브로콜리를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food4" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food4" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-glass-martini"></i>
								<span style="display: block;">요거트를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food5" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food5" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-anchor"></i>
								<span style="display: block;">조개류를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food6" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food6" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-leaf"></i>
								<span style="display: block;">시금치를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food7" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food7" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-drumstick-bite"></i>
								<span style="display: block;">소고기를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food8" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food8" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-seedling"></i>
								<span style="display: block;">호두를 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food9" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food9" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-capsules"></i>
								<span style="display: block;">밀크씨슬 씨앗을 자주 먹어요</span>
								<span style="display: block;">주 3회 이상</span>
							</label>
						</div>
						<br>
						<br>
						<div>
							<button id="btnNext" class="btn btn-radius btn-dark">
								<span class="text">다음</span>
							</button>
						</div>
					</div>
				</div>
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