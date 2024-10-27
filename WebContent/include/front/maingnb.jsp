<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		<ul class="offcanvas__widget">
			<li><span class="icon_search search-switch"></span></li>
		</ul>
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="/img/logo/logo3.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap" style="text-align:left; margin-left: -60px;"></div>
		<div class="offcanvas__auth" style="text-align: left;">
			<a href="/front/login/loginForm.web">로그인</a>
			<a href="/front/member/registerForm.web">회원가입</a>
		</div>
	</div>
<header class="header" style="background-color: #341d08; height: 160px; position: relative;">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-3 col-lg-2">
		</div>
	</div>
</div>
<div class="header__logo" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<a href="/"><img src="/img/logo/logo3.png" alt=""></a>
</div>
<div class="header__right" style="position: absolute; bottom: -10px; right: 19%;">
<div class="header__right__auth" style="display: flex; align-items: center; gap: 5px;">
	<c:if test="${not empty sessionScope.SEQ_MBR}">
		<a href="/front/myPage/" title="${sessionScope.NAME}" style="color: white; font-size: 15px;">
			마이페이지
		</a>
		<a href="/front/login/logout.web" style="color: white; font-size: 15px;">
			로그아웃
		</a>
		<a href="/front/basket/main.web" style="color: white; font-size: 15px;">
			장바구니
		</a>
		<ul class="header__right__widget" style="list-style: none; margin: 0; padding: 0; display: flex; align-items: center;">
			<li style="position: relative; display: inline-block; padding-bottom: 2px;">
				<span class="icon_bag_alt" 
					style="font-size: 20px; display: inline-block; position: relative; width: 20px; height: 20px;">
				</span>
				<div id="basket-count" class="tip" style="position: absolute; top: -12px; right: -12px; font-size: 15px; width: 12px; height: 12px; display: flex; transform: translate(-30%, -30%);">
					2
				</div>
			</li>
		</ul>
	</c:if>	 
	<c:if test="${empty sessionScope.SEQ_MBR}">
		<a href="/front/login/loginForm.web" style="color: white; font-size: 15px;">로그인</a>
		<a href="/front/member/registerForm.web" style="color: white; font-size: 15px;">회원가입</a>
	</c:if>
</header>
<!-- "javascript:location.href='front/sale/gender_list.web';" -->
	<!-- 임시 주석 돋보기 위치 변경
	</div>
		<ul class="header__right__widget">
			<li><span class="icon_search search-switch"></span></li>
		</ul>
	</div>
	 -->
<div class="col-xl-12 col-lg-12" style="margin: 0 auto; float: none; width: 90%;">
	<nav class="header__menu" >
		<ul style="display: inline-block; width: 90%; list-style: none;">
			<li class="active" style="display: inline-block; margin: 0 57px;">
				<a href="javascript:goTypeT('', '', '', '', '', '');">
					<img src="/img/icon/ctg.png" alt="전체 상품" style="width: 24px; height: 24px;">
				</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('', '', '', '', '', '');">기능별</a></li>
					<li><a href="javascript:goTypeI('', '', '', '', '', '');">성분별</a></li>
					<li><a href="javascript:goTypeG('', '', '', '', '', '');">대상별</a></li>
					<li><a href="/front/center/board/personalHealth/index.web">맞춤 건강 관리</a></li>
					<li><a href="#">고객 센터</a></li>
					<li><a href="#">소개</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeF('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">기능별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');">혈당/혈행/혈압</a></li>
					<li><a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');">항산화/면역력</a></li>
					<li><a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');">염증/항염</a></li>
					<li><a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');">관절/뼈/치아</a></li>
					<li><a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');">피로회복</a></li>
					<li><a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');">눈 건강</a></li>
					<li><a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');">장 건강</a></li>
					<li><a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');">두뇌/기억력</a></li>
					<li><a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');">위/간/갑상선</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeI('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">성분별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');">폴리코사놀</a></li>
					<li><a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');">오메가-3</a></li>
					<li><a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');">비타민/미네랄</a></li>
					<li><a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');">유산균</a></li>
					<li><a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');">글루코사민/MSM</a></li>
					<li><a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');">루테인</a></li>
					<li><a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');">코큐텐</a></li>
					<li><a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');">아르기닌</a></li>
					<li><a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');">밀크씨슬</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeG('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">대상별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeG('M', '', '', '', '${paging.cd_ctg_m}', '');">남성</a></li>
					<li><a href="javascript:goTypeG('F', '', '', '', '${paging.cd_ctg_m}', '');">여성</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="/front/center/board/personalHealth/index.web" style="font-size: 18px; font-weight: bold;">맞춤 건강 관리</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="#">맞춤 건강 추천</a></li>
					<li><a href="#">안심 조회 서비스</a></li>
					<li><a href="#">건강 정보</a></li>
					<li><a href="javascript:goList(4)">새소식</a></li>
					<li><a href="/front/center/board/ingred/list.web">성분 사전</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goList(1);" style="font-size: 18px; font-weight: bold;">고객 센터</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goList(1);" >공지사항</a></li>
					<li><a href="javascript:goList(2);" >자주 묻는 질문</a></li>
					<li><a href="javascript:goList(3);" >1대1 문의 사항</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px;">
				<a href="/front/center/board/introduce/.web" 
				style="font-size: 18px; font-weight: bold;">소개</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:consolegoList(1);" >공지사항</a></li>
					<li><a href="javascript:consolegoList(2);" >자주 묻는 질문</a></li>
					<li><a href="javascript:consolegoList(3);" >1대1 문의 사항</a></li>
					<li><a href="javascript:consolegoList(4);" >새소식</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<div class="canvas__open">
			<i class="fa fa-bars"></i>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function () {
	
	function basketData() {
		
		$.ajax({
			type: "POST",
			url: "/front/member/currentBasket.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function (res) {
				
				if (res.memberDto) {
					
					$("#basket-count").text(res.memberDto.current_basket);
				} else {
					
					$("#basket-count").text(0);
				}
			},
		});
	}
	basketData();
});
</script>