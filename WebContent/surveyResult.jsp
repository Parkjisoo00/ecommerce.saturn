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

<body style="background-color: #f8f8f8;">
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

	<section class="checkout spad" style="padding-top: 0px;">
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
			<div class="survay_notice">
				 본 결과는 의사의 처방을 대신하지 않습니다. 
			</div>
			<!-- 고정 -->
			<div class="row" style="justify-content: center;display:block;background-color: #fff;max-width: 670px !important;width: 100% !important;margin-left: auto;margin-right: auto;">
				<div class="survey"style="gap: 24px;height:400px">
					<div class="gnb" style="margin: 5px auto 0;display: flex; flex-direction: column;">
						<div class="survey-div" style="margin-bottom: 20px;">
							<h1 class="survey-h1-1">xxx 님의
							<br>건강설문 결과표</h1>
							<h1 class="survey-h1-2">
							성별 XX <span>|</span> 나이 XX세</h1>
						</div>
						
						<div class="survay_title_content">
							<h3> 당신에게 이것을 추천합니다.</h3>
							<ul>
							<li>xxxxxx가 필요해요. </li>
							<li>xxxxxxx이 필요해요.</li>
							<!-- 		<li>남성/여성 추천</li>		 -->
							</ul>
						</div>
					</div>
				</div>
				<!-- 	1번째 상품			 -->
				<div class="survey" style="gap: 24px; height: 320px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<div class="survey-div">
							<h1 class="survey-h1-3">
								<br>추천 영양성분 <span style="color:rgb(247, 114, 2);">1</span> - *****(폴리코사놀)</h1>
						</div>
						<div style="display: flex; align-items: flex-start; padding-top: 10px; padding-left: 20px;">
							<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden;">
								<a href="#">
									<img class="cart-img-wrapper" src="${list.img}" alt="Product Image" style="max-width: 100%; max-height: 100%; width: auto; height: auto;">
								</a>
							</div>
							<div class="survey-ingredient-describe" >
								<span><span style="color: #858585;">#</span> 체내 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 지방, 탄수화물, 단백질 대사와 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 단백질 및 아미노산 이용에 필요</span>
							</div>
						</div>
						<span style="display: block; padding-top: 10px;">************(상품이름)</span>
						
						<div class="button-group" style="display: flex; justify-content: space-between;">
						<button class="survey-btnCart" id="btnCart">
							<em class="survey-btnCart-em">장바구니 담기</em>
						</button>
						
						<button class="surver-btnWrite"id="btnWrite">
							<em class="surver-btnWrite-em">제품정보 보기</em>
						</button>
						</div>
					</div>
				</div>
				<!-- 	2번째 상품			 -->
				<div class="survey" style="gap: 24px; height: 320px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<div class="survey-div">
							<h1 class="survey-h1-3">
								<br>추천 영양성분 <span style="color:rgb(247, 114, 2);">2</span> - *****(폴리코사놀)</h1>
						</div>
						<div style="display: flex; align-items: flex-start; padding-top: 10px; padding-left: 20px;">
							<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden;">
								<a href="#">
									<img class="cart-img-wrapper" src="${list.img}" alt="Product Image" style="max-width: 100%; max-height: 100%; width: auto; height: auto;">
								</a>
							</div>
							<div class="survey-ingredient-describe" >
								<span><span style="color: #858585;">#</span> 체내 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 지방, 탄수화물, 단백질 대사와 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 단백질 및 아미노산 이용에 필요</span>
							</div>
						</div>
						<span style="display: block; padding-top: 10px;">************(상품이름)</span>
						
						<div class="button-group" style="display: flex; justify-content: space-between;">
						<button class="survey-btnCart" id="btnCart">
						<em class="survey-btnCart-em">장바구니 담기</em>
						</button>
						
						<button class="surver-btnWrite"id="btnWrite">
						<em class="surver-btnWrite-em">제품정보 보기</em>
						</button>
						</div>
					</div>
				</div>
				<!-- 	3번째 상품			 -->
				<div class="survey" style="gap: 24px; height: 320px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<div class="survey-div">
							<h1 class="survey-h1-3">
								<br>추천 영양성분 <span style="color:rgb(247, 114, 2);">3</span> - *****(폴리코사놀)</h1>
						</div>
						<div style="display: flex; align-items: flex-start; padding-top: 10px; padding-left: 20px;">
							<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden;">
								<a href="#">
									<img class="cart-img-wrapper" src="${list.img}" alt="Product Image" style="max-width: 100%; max-height: 100%; width: auto; height: auto;">
								</a>
							</div>
							<div class="survey-ingredient-describe" >
								<span><span style="color: #858585;">#</span> 체내 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 지방, 탄수화물, 단백질 대사와 에너지 생성에 필요</span>
								<span><span style="color: #858585;">#</span> 단백질 및 아미노산 이용에 필요</span>
							</div>
						</div>
						<span style="display: block; padding-top: 10px;">************(상품이름)</span>
						
						<div class="button-group" style="display: flex; justify-content: space-between;">
						<button class="survey-btnCart" id="btnCart">
						<em class="survey-btnCart-em">장바구니 담기</em>
						</button>
						
						<button class="surver-btnWrite"id="btnWrite">
						<em class="surver-btnWrite-em">제품정보 보기</em>
						</button>
						</div>
					</div>
				</div>
				<!-- 	전체 상품 연결한 부분			 -->
				<div class="survey" style="gap: 24px; height: 1px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
					</div>
				</div>
				<!-- 	전체 상품			 -->
				<div class="survey-sticky" >
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<button class="survey-allBtnCart" id="btnCart">
						<em class="survey-btnCart-em">전체 추천 제품 장바구니 담기</em>
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