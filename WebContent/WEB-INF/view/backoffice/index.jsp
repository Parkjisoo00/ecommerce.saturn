<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		window.onload = function() {
			var savedEmail = localStorage.getItem("savedEmail");
			if (savedEmail) {
				document.getElementById("email").value = savedEmail;
				document.getElementById("rememberMe").checked = true;
			}
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<header class="main-header">
	<a href="/console/index.web" class="logo">
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
<div class="content-wrapper" >
	<section class="content" style="display: flex; justify-content: center; align-items: center; padding-top: 280px;">
		<div class="col-md-6">
			<div class="box box-info">
				<div class="box-header with-border">
				<h3 class="box-title">로그인</h3>
				</div>
					<form id="frmMain" method="POST" class="form-horizontal" >
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="email" name="email" placeholder="Email">
									</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="passwd" name="passwd" placeholder="Password">
									</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
											<input type="checkbox" id="rememberMe"> 아이디 저장
										</label>
									</div>
								</div>
							</div>
						</div>
							<div class="box-footer">
								<input type="submit" value="로그인" class="btn btn-info pull-right" id="loginId" onClick="checkLogin();"/>
							</div>
					</form>
			</div>
		</div>
	</section>
</div>
<!-- /Maincontent -->

<%@ include file="/include/backoffice/footer.jsp" %>

<%@ include file="/include/backoffice/sideBar.jsp" %>

<div class="control-sidebar-bg"></div>

<%@ include file="/include/backoffice/js.jsp" %>
</body>
</html>
