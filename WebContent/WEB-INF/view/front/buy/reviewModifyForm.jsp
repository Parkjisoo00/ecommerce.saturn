<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/reviewModifyForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function reviewModifyProc() {
		
		var frmMain = document.getElementById("frmMain");
		var rateStarHiddenInput = document.querySelector("input[name='rate_star']");
		var rateStarValue = rateStarHiddenInput.value;
		
		alert("평점 확인: " + rateStarValue);
		
		if (!rateStarValue || rateStarValue === "") {
			alert("평점을 입력하세요.");
			return;
		}
		
		if (document.getElementById("rate_review").value == "") {
			alert("후기 내용을 입력하세요.");
			return;
		}
		
		frmMain.action = "/front/buy/reviewModifyProc.web";
		frmMain.submit();
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<!-- 
var star = document.querySelector('.fa-star-large');
var value = star.getAttribute('data-value');
alert("평점 확인" + value);
 -->
<body>
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" name="rate_star" id="rate_star" value="">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<ul class="my-custom-ul" >
				<li><img src="/img/mypage/mypage1.png"><a style="font-size :30px" href="/front/myPage/" class="menuLnb">마이 페이지</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goList(3);" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12" >
						<div class="review-form" style="height: 100% !important; display: flex; flex-direction: column;">
						<c:forEach var="reviewList" items="${reviewList}">
							<input type="hidden" name="seq_sle"				id="seq_sle"		value="${reviewList.seq_sle}"/>
							<input type="hidden" name="seq_buy_dtl"			id="seq_buy_dtl"	value="${reviewList.seq_buy_dtl}"/>
							<input type="hidden" name="seq_review"			id="seq_review"		value="${reviewList.seq_review}"/>
							<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important; padding-bottom: 25px !important">

							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="padding: 20px 10px !important;">
									<img src="${reviewList.img}" style="height: 100px !important; ">
								</div>
								<div class="product-name" style="flex-grow: 1; padding-right: 0px !important">
									<div class="product-name" style="padding: 0px !important; padding-top: 20px !important; font-weight: bold !important;">
										${reviewList.sle_nm}, ${reviewList.count}개
									</div>
									<div class="product-name" style="padding: 0px !important;">
										<div class="rating" style="display: flex; align-items: center;">
											<c:if test="${reviewList.rate_star == 1}">
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
											</c:if>
											<c:if test="${reviewList.rate_star == 2}">
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
											</c:if>
											<c:if test="${reviewList.rate_star == 3}">
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
											</c:if>
											<c:if test="${reviewList.rate_star == 4}">
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large" style="color: #e0e0e0;"></i>
											</c:if>
											<c:if test="${reviewList.rate_star == 5}">
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
												<i class="fa fa-star-large"></i>
											</c:if>
										</div>
									</div>
									<div class="product-name" style="padding: 0px !important;">
										${reviewList.dt_reg}
									</div>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="display: flex !important; justify-content: flex-start !important; align-items: center !important;">
									사진첨부
								</div>
							<div class="product-name" style="padding-right: 0px !important">
								<div style="display: flex; align-items: center; height: 100px;">
									<label id="show-input" class="cart-btn-review" style="margin: 0px !important; background: #fff; color: #346aff !important; border: 1px solid #346aff !important; padding: 10px; cursor: pointer;">
										파일 선택
									</label>
									<c:forEach var="imgs" items="${reviewList.imgs}">${imgs}
									<div id="file-inputs" style="display: flex; margin-left: 20px; align-items: center;">
										<div style="display: flex; align-items: center;">
											<img id="img-preview-0" style="display: none; width: 70px; height: 80px; object-fit: cover; cursor: pointer;" src="${imgs}"/>
											<input type="file" id="file-input-0" style="display: none;" />
											<span id="file-name-0" style="margin-left: 10px; cursor: pointer; display: none !important;"></span>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important; height: auto !important; flex-grow: 2 !important; min-height: 250px !important;">
								<div class="photoreview">
									상세후기
								</div>
								<div class="product-name" style="display: flex; justify-content: center; align-items: center; height: 100% !important; padding: 20px 0px 20px 20px !important;">
									<div style="height: 100% !important; display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; width: 100%;">
										<textarea id="rate_review" name="rate_review" class="review-text" placeholder="다른 고객님께 도움이 되도록 후기를 남겨주세요.">${reviewList.rate_review}</textarea>
										<div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px; width: 100%;">
											<a href="#" class="cart-btn" style="background: #fff; color: #111 !important; border: 1px solid #ccc !important; margin: 0; padding: 10px 10px 10px !important;">
												취소하기
											</a>
											<a href="javascript:reviewModifyProc();" class="cart-btn" style="background: #346aff; color: white !important; border: 1px solid #346aff !important; margin: 0 ; padding: 10px 10px 10px !important;">
												수정하기
											</a>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
	</section>
<!-- Checkout Section end -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>	
<script>
	$(document).ready(function() {
		
		var stars = document.querySelectorAll('.fa-star-large');
		var rateStarHiddenInput = document.querySelector("input[name='rate_star']");
		
		stars.forEach(star => {
			
			star.addEventListener('click', function() {
				
				var value = this.getAttribute('data-value');
				
				
				stars.forEach(s => {
					
					if (s.getAttribute('data-value') <= value) {
						
						s.style.setProperty('color', 'gold', 'important');
					} else {
						
						s.style.setProperty('color', '#e0e0e0', 'important');
					}
				});
				
				
				rateStarHiddenInput.value = value;
			});
		});
	});
	
	var currentFileIndex = 0;
	
	var fileInputs = [
		document.getElementById('file-input-0'),
		document.getElementById('file-input-1'),
		document.getElementById('file-input-2')
	];
	
	var fileNames = [
		document.getElementById('file-name-0'),
		document.getElementById('file-name-1'),
		document.getElementById('file-name-2')
	];
	
	var imgPreviews = [
		document.getElementById('img-preview-0'),
		document.getElementById('img-preview-1'),
		document.getElementById('img-preview-2')
	];
	
	var label = document.getElementById('show-input');
	
	label.addEventListener('click', function () {
		
		if (currentFileIndex < fileInputs.length) {
			
			var currentInput = fileInputs[currentFileIndex];
			
			var handleFileChange = (function(index) {
				
				return function () {
					
					if (currentInput.files.length > 0) {
						
						currentInput.setAttribute('name', 'files[' + index + ']');
						
						var file = currentInput.files[0];
						fileNames[index].textContent = file.name;
						
						if (file.type.startsWith('image/')) {
							
							var reader = new FileReader();
							reader.onload = function (e) {
								
								imgPreviews[index].src = e.target.result;
								imgPreviews[index].style.display = 'inline';
							};
							reader.readAsDataURL(file);
						}
						currentFileIndex++;
					}
				}
			})(currentFileIndex);
			currentInput.click();
			currentInput.removeEventListener('change', handleFileChange);
			currentInput.addEventListener('change', handleFileChange);
		}
	});
	imgPreviews.forEach((imgPreview, index) => {
		
		imgPreview.addEventListener('click', function () {
			
			fileInputs[index].click();
		});
	});
	fileNames.forEach((fileName, index) => {
		
		fileName.addEventListener('click', function () {
			
			fileInputs[index].click();
		});
	});
</script>
</form>
</body>
</html>