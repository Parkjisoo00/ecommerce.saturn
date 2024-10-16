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
	
	<div style="width: 100%;">
    <ul class="my-custom-ul" style="list-style-type: none; padding-left: 0; margin-left: 155px;">
        <li><a style="font-size: 30px;" href="#" class="menuLnb">맞춤 건강 관리</a></li>
        <li><a style="font-size: 20px; border-bottom: 2px solid; padding-bottom: 2px;" href="#" class="menuLnb">- 맞춤 건강 추천</a></li>
        <li><a style="font-size: 20px; border-bottom: 2px solid; padding-bottom: 2px;" href="#" class="menuLnb">- 안심 조회 서비스</a></li>
        <li><a style="font-size: 20px; border-bottom: 2px solid; padding-bottom: 2px;" href="#" class="menuLnb">- 건강 정보</a></li>
        <li><a style="font-size: 20px; border-bottom: 2px solid; padding-bottom: 2px;" href="#" class="menuLnb">- 새소식</a></li>
        <li><a style="font-size: 20px; border-bottom: 2px solid; padding-bottom: 2px;" href="#" class="menuLnb">- 성분 사전</a></li>
    </ul>
</div>
	<!-- Breadcrumb End -->
	<br>
	<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
		<img src="/img/popup/personalized health.png" alt="Local Image" style="width: 100%; height: auto;">
		 <div style="position: absolute; top: calc(50% - 2cm); left: 50%; transform: translate(-50%, -50%); background-color: rgba(0, 0, 0, 0.5); padding: 10px 20px; border-radius: 10px;">
		</div>
	</div>

	
	
	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
</body>
</html>