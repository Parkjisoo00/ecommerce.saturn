<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/hpSur/ingredient.jsp" %>
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
	
	function goView(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/front/center/board/view.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action="/front/center/board/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/front/center/board/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function showIngredient() {
		var reviewForm = document.getElementById('reviewForm');
		
		if (reviewForm.classList.contains('visible')) {
			reviewForm.classList.remove('visible');
		} else {
			reviewForm.classList.add('visible');
		}
	}
	
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" name="seq_bbs"		id="seq_bbs" />
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
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
			<div class="col-lg-12" style="padding: 0 !important;">
		<div>
			<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">성분사전</h6>
			<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
					<a href="#" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">맞춤 건강 추천</a>
					<a href="#" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">안심 조회 서비스</a>
					<a href="#" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">건강정보</a>
					<a href="#" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">세소식</a>
					<a href="/front/hpSur/ingredient.web" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">성분사전</a>
		</h6>
		</div>
			</div>
			<div class="brdSearchArea">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="brdInfo">전체 9 개 [1/1 페이지]</div>
					</div>
					<table class="headTop_01" style=" margin-left: auto; margin-right: auto; width: 100%">
				<tr>
					<th style="width: 20%">번호</th>
					<th style="text-align: left;">제목</th>
					<th style="width: 20%">작성자</th>
				</tr>
					</table>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;"onclick="showIngredient()">
					<span class="styled-span" >1</span>
					<span class="styled-span" style ="margin-left: 0;">폴리코사놀</span>
					<span class="styled-span1" >Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >2</span>
					<span class="styled-span" style ="margin-left: 0;">오메가-3</span>
					<span class="styled-span1" style="margin-left: 626px;margin-right: 42px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >3</span>
					<span class="styled-span" style ="margin-left: 0;">비타민/미네랄</span>
					<span class="styled-span1" style="margin-left: 582px;margin-right: 41px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >4</span>
					<span class="styled-span" style ="margin-left: 0;">유산균</span>
					<span class="styled-span1" style="margin-left: 645px;margin-right: 41px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >5</span>
					<span class="styled-span" style ="margin-left: 0;">글루코사민/MSM</span>
					<span class="styled-span1" style="margin-left: 560px;margin-right: 37px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >6</span>
					<span class="styled-span" style ="margin-left: 0;">루테인</span>
					<span class="styled-span1" style="margin-left: 650px;margin-right: 36px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >7</span>
					<span class="styled-span" style ="margin-left: 0;">코큐텐</span>
					<span class="styled-span1" style="margin-left: 650px;margin-right: 36px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >8</span>
					<span class="styled-span" style ="margin-left: 0;">아르기닌</span>
					<span class="styled-span1" style="margin-left: 635px;margin-right: 32px;">Bravo My Life</span>
				</div>
				<div style="border-bottom: 1px solid #e0e0e0; padding-bottom: 10px;margin-top: 10px;">
					<span class="styled-span" >9</span>
					<span class="styled-span" style ="margin-left: 0;">밀크씨슬</span>
					<span class="styled-span1" style="margin-left: 635px;margin-right: 32px;">Bravo My Life</span>
				</div>
					<div class="row">
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

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