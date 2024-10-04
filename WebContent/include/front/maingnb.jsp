<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
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
<div class="header__right" style="position: absolute; bottom: -10px; right: 395px;">
	<div class="header__right__auth">
	<c:if test="${not empty sessionScope.SEQ_MBR}">
		<a href="/front/myPage/" title="${sessionScope.NAME}" style="color: white; font-size: 15px;">마이페이지</a>
		 <a href="/front/login/logout.web" style="color: white; font-size: 15px;">로그아웃</a>
	</c:if>	 
	<c:if test="${empty sessionScope.SEQ_MBR}">
		<a href="/front/login/loginForm.web" style="color: white; font-size: 15px;">로그인</a>
		<a href="/front/member/registerForm.web" style="color: white; font-size: 15px;">회원가입</a>
	</c:if>	
	</div>
		<ul class="header__right__widget">
			<li><span class="icon_search search-switch"></span></li>
			<li><a href="#"><span class="icon_heart_alt"></span>
				<div class="tip">2</div>
			</a></li>
			<li><a href="#"><span class="icon_bag_alt"></span>
				<div class="tip">2</div>
			</a></li>
		</ul>
	</div>
</header>