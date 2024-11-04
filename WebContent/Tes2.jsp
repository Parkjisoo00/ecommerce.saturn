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
	
	<style>

	
	</style>
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
				
				<div class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<h2 id="qTitle" class="ha on" style="text-align: center; font-size: 20px; font-weight: 700;">불편하거나 걱정되는 것을 선택하세요</h2>
						<span id="qContent" class="ha bubble on" style="display: inline-block;">
						        우선 관리가 필요한 것을 선택하세요
						    </span>
						<br>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food1" style="display:none" onclick= "
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							 <label for="food1" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-heart"></i>
								<span style="display: block;">혈관 · 혈액 순환</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food2" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							 <label for="food2" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-apple-alt"></i>
								<span style="display: block;">소화 · 장</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food3" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food3" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-smile"></i>
								<span style="display: block;">피부</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food4" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food4" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-eye"></i> 
								<span style="display: block;">눈</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food5" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food5" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-brain"></i>
								<span style="display: block;">두뇌 활동</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food6" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food6" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-bed"></i>
								<span style="display: block;">피로감</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food7" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food7" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-bone"></i>
								<span style="display: block;">뼈 · 관절</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food8" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food8" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-virus"></i>
								<span style="display: block;">면역</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food9" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food9" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-user"></i>
								<span style="display: block;">모발</span>
								
							</label>
						</div>
						<br>
						<div style="width: 100%; max-width: 600px;">
							<input type="checkbox" class="customCheckbox" id="food8" style="display:none" onclick="
								this.nextElementSibling.style.backgroundColor = this.checked ? '#F77202' : '#FFFFFF';
								this.nextElementSibling.style.color = this.checked ? '#FFFFFF' : '#000000';">
							<label for="food8" style="display: block; left:20px; position: relative; padding: 10px 20px; margin: 5px; background-color: #FFFFFF; border: 2px solid #ccc; border-radius: 5px; cursor: pointer; user-select: none; color: #000000;">
								<i class="fas fa-times"></i> 
								<span style="display: block;">선택할 것이 없어요</span>
								
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



					
					
					
					
			
			<!-- 각자 담당하는 부분 화면 1개씩 -->
				
			</form>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
	
	<script>
		$(document).ready(function() {
			$('.customCheckbox').on('click', function() {
				// 현재 체크박스의 체크 상태를 저장
				var isChecked = $(this).prop('checked');
		
				// 모든 체크박스의 체크를 해제
				$('.customCheckbox').prop('checked', false);
		
				// 현재 체크박스만 다시 체크 상태로 설정
				$(this).prop('checked', isChecked);
		
				// 모든 레이블의 배경색과 글자색을 초기화
				$('.customCheckbox').next().css({
					'background-color': '#FFFFFF',
					'color': '#000000'
				});
		
				// 선택된 체크박스에 대해 스타일 적용
				if (isChecked) {
					$(this).next().css({
						'background-color': '#F77202',
						'color': '#FFFFFF'
					});
				}
			});
		});
</script>
</body>
</html>