<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/notice/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">
<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
		.gnb li {
		display: inline; /* 수평 배치 */
		margin-right: 15px; /* 메뉴 간격 */
		}
		
		p {
		margin-top: 5px;
		line-height: 1.6; /* 줄 간격 */
		margin: 5px 0; /* 위아래 여백 */
		}
		
		button.accordion {
		background-color: #f3ebe1; /* 기본 버튼 배경색 */
		color: #000; /* 검정 글자 */
		cursor: pointer;
		padding: 10px;
		width: 100%;
		border: none;
		text-align: left;
		outline: none;
		font-size: 16px;
		transition: background-color 0.3s;
		border-radius: 5px; /* 버튼 모서리 둥글게 */
		margin: 5px 0; /* 버튼 간격 */
		}
		
		button.accordion:hover {
		background-color: #c7b199; /* 마우스 호버 시 색상 */
		}
		
		button.accordion.active {
		background-color: #e7d5bf; /* 클릭 시 연한 베이지색 */
		}
		
		.accordion2 {
		background-color: #FFF; /* 텍스트 박스 배경색 */
		color: #000; /* 검정 글자 */
		cursor: text;
		padding: 20px;
		width: 1100px;
		border: 1px solid #ddd; /* 테두리 */
		border-radius: 5px; /* 둥근 모서리 */
		margin: 5px 0; /* 여백 */
		resize: none; /* 크기 조절 비활성화 */
		overflow: auto; /* 스크롤바 활성화 */
		height: auto; /* 자동 높이 */
		}
		
		.panel {
		padding: 1px 1px;
		background-color: white;
		overflow: hidden;
		display: none; /* 기본적으로 숨김 */
		height: auto;
		}
		
		.contact-info {
		margin-top: 20px; /* 상단 여백 */
		padding: 10px;
		background-color: #F9F3EC; /* 부드러운 배경색 */
		border-radius: 8px; /* 모서리 둥글게 */
		}
		
		.contact-info h3 {
		margin-bottom: 10px; /* 하단 여백 */
		}
</style>
<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	window.onload = function() {
		var acc = document.getElementsByClassName("accordion");
		for (var i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var panel = this.nextElementSibling;
		if (panel.style.display === "block") {
		panel.style.display = "none";
		} else {
		panel.style.display = "block";
		}
		});
		}
		}
	
	<!--
	function toggleAnswer(element) {
        var askDiv = element.querySelector('.ask'); // .ask 요소를 찾음
        
        if (element.classList.contains('open')) {
            // 'open' 클래스가 있으면, 닫기
            element.classList.remove('open');
            askDiv.style.height = '0px';
        } else {
            // 'open' 클래스가 없으면, 열기
            element.classList.add('open');
            askDiv.style.height = '144px'; // 필요한 높이로 설정
        }
    }
	-->
	<!--
	function toggleContent() {
	    var reviewForm = document.getElementById('reviewForm');
	    
	    // 요소가 존재하는지 확인
	    if (reviewForm) {
	        if (reviewForm.classList.contains('visible')) {
	            reviewForm.classList.remove('visible');
	        } else {
	            reviewForm.classList.add('visible');
	        }
	    } else {
	        alert("reviewForm 요소를 찾을 수 없습니다.");
	    }
	}
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	<!--
	function toggleContent(seq_bbs) {
	// 공지글 내용을 담은 tr 요소를 가져옴
		var contentRow = document.getElementById("content_" + seq_bbs);

	// 현재 display 상태에 따라 토글
		if (contentRow.style.display === "none") {
			contentRow.style.display = "table-row"; // 내용을 보여줌
		}else{
			contentRow.style.display = "none"; // 내용을 숨김
			}
		}
	-->
	<!-- 
	function download(type, sequence) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", type);
		frmMain.sequence.setAttribute("value", sequence);
		frmMain.action = "/front/center/board/download.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	-->
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
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
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
			<article class="txtCenter">
			<div class="col-lg-12" style="padding: 0 !important;">
				<div class="checkout__form__input">
		<div>
			<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">공지사항</h6>
			<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
					<c:if test="${paging.cd_bbs_type == 1}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>

					<c:if test="${paging.cd_bbs_type == 2}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>
					<c:if test="${paging.cd_bbs_type == 3}">
					<a href="javascript:goList(1);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
					<a href="javascript:goList(2);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
					<a href="javascript:goList(3);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
					</c:if>
		</h6>
		</div>
			</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<div style="display: flex; justify-content: flex-end;margin-bottom: 10px;">
				<select name="searchKey">
					<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
					<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
					<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> 
				<input type="submit" value="검색"/>
			</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
				<br/>
					<!-- 공지사항 리스트를 반복문으로 출력 -->
			            <c:forEach items="${list}" var="list">
						<button class="accordion" type="button">[공지]${list.title}</button>
							<div class="panel">
								<div class="accordion2">
									${list.content}
								</div>
							</div>
						</c:forEach>
						
					<div class="row">
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
						<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
					</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		</article>
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