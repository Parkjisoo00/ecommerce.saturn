<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/backoffice/center/board/question/writeForm.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
<head>
	<%@ include file="/include/common/header.jsp" %>
	<style></style>
	<script>
	
	
	window.onload = function () {
		// HTML Editor
		tinymce.init({selector:'textarea'});
	}
	
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/console/center/board/list.web";
		frmMain.submit();
	}
	
	function writeProc(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		
		if (document.getElementById("title").value == ""
				|| tinymce.activeEditor.getContent() == "") {
			alert("필수 항목을 입력하세요!");
			return;
		}
		
		if(document.getElementById("flg_top").checked){
			document.getElementById("flg_top").value = 'Y';
		}else{
			document.getElementById("flg_top").value = 'N';
		}
		
		frmMain.action="/console/center/board/writeProc.web";
		frmMain.submit();
	}
	</script>
<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>	
</head>
<body>

<form id="frmMain" method="POST" enctype="multipart/form-data" >
<input type="hidden" id="cd_bbs_type" name="cd_bbs_type" />

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->
	<section class="shop spad">
		<div class="container">
			<section class="content">
				<article class="txtCenter">
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목(*)</th>
					<td>
						<input type="text" id="title" name="title" style="width: 680px;" required />
						<input type="checkbox" id= "flg_top" name="flg_top" value=""/> 최상위
					</td>
				</tr>
				<tr>
					<th>카테고리(*)</th>
					<td>
						<select id="cd_ctg" name="cd_ctg" required>
							<option value="0">선택</option>
							<option value="1">가입 및 탈퇴</option>
							<option value="2">상품</option>
							<option value="3">구매</option>
							<option value="4">결제</option>
							<option value="5">배송</option>
							<option value="6">환불</option>
							<option value="9">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용(*)</th>
					<td>
						<textarea id="content" name="content" required></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부 파일</th>
					<td>
						
							<input type="file" id="files[0]" name="files[0]" />
						
					</td>
				</tr>
			</table>
			<br>
			<div style="width: 900px; margin-left: 500px; margin-right: auto">
				<input type="button" value="등록" style="width:100px" onclick="javascript:writeProc(1);" />
				 <input type="button" value="목록" style="width:100px" onclick="javascript:goList(1);"/>
			</div>
		</article>
			</section>
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