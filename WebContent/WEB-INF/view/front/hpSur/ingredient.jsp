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
	
	
	
	function divClick1() {
		
		var reviewForm = document.getElementById('reviewForm1');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv1');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick2() {
		
		var reviewForm = document.getElementById('reviewForm2');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv2');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick3() {
		
		var reviewForm = document.getElementById('reviewForm3');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv3');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
		
	function divClick4() {
	
		var reviewForm = document.getElementById('reviewForm4');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv4');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick5() {
	
		var reviewForm = document.getElementById('reviewForm5');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv5');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick6() {
	
		var reviewForm = document.getElementById('reviewForm6');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv6');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick7() {
	
		var reviewForm = document.getElementById('reviewForm7');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv7');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick8() {
	
		var reviewForm = document.getElementById('reviewForm8');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv8');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
			}
		}
	
	function divClick9() {
	
		var reviewForm = document.getElementById('reviewForm9');
			
			if (reviewForm.classList.contains('visible')) {
				reviewForm.classList.remove('visible');
			} else {
				reviewForm.classList.add('visible');
			}
		var myDiv = document.getElementById('myDiv9');
			
			if (myDiv.classList.contains('e7d5bf-background')){
				myDiv.classList.remove('e7d5bf-background');
			} else {
				myDiv.classList.add('e7d5bf-background');
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
				<div class="black-line"></div>
				<div class="mydiv" id="myDiv1" onclick="divClick1()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">1</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">폴리코사놀</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm1"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv2" onclick="divClick2()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">2</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">오메가-3</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm2"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv3" onclick="divClick3()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">3</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">비타민/미네랄</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm3"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv4" onclick="divClick4()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">4</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">유산균</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm4"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv5" onclick="divClick5()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">5</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">글루코사민</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm5"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv6" onclick="divClick6()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">6</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">루테인</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm6"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv7" onclick="divClick7()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">7</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">코큐텐</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm7"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv8" onclick="divClick8()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">8</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">아르기닌</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm8"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
				<div class="mydiv" id="myDiv8" onclick="divClick9()" style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
					<span class="styled-span" style="width: 20%; display: flex; justify-content: center; align-items: center;">9</span>
					<span class="styled-span" style="width: 30%; display: flex; justify-content: flex-start; align-items: center;">밀크씨슬</span>
					<span class="styled-span" style="width: 34%; display: flex; justify-content: center; align-items: center;">Bravo My Life</span>
				</div>
				<div class="hidden-review" id="reviewForm9"style="margin-left: auto;margin-right: auto;">
					 <img src="/img/cat.jpg" alt="Local Image">
				</div>
					<div class="row">
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
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