<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	
	<header class="main-header">
	<a href="index2.html" class="logo">
	<span class="logo-mini"><b>관</b>리자</span>
	<span class="logo-lg"><b>관리자</b></span>
	</a>
	<nav class="navbar navbar-static-top">
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
		<span class="sr-only">Toggle navigation</span>
	</a>

	<%@ include file="/include/backoffice/top.jsp" %>
	
	</nav>
	</header>

<!-- mainSide Section Begin -->
	<%@ include file="/include/backoffice/mainSide.jsp" %>
<!-- mainSide Section End -->

<!-- Main content -->
	<div class="content-wrapper">
		<section class="content">
		로그인
		</section>
	</div>
<!-- /Maincontent -->

<%@ include file="/include/backoffice/footer.jsp" %>

<%@ include file="/include/backoffice/sideBar.jsp" %>

<div class="control-sidebar-bg"></div>

<%@ include file="/include/backoffice/js.jsp" %>
</body>
</html>
