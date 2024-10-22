<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/productReg.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>

		window.onload = function () {
			// HTML Editor
			tinymce.init({selector:'textarea'});
		}
	
		function commaValue(input) {
			// 입력된 값에서 콤마를 제거
			let value = input.value.replace(/,/g, '');
			
			// 숫자 형식으로 변환
			let formattedValue = Number(value).toLocaleString();
			
			// 포맷된 값을 다시 입력 필드에 설정
			input.value = formattedValue;
		}
		
		$(function() {
			$('#dt_sale_start').datepicker({ dateFormat: 'yy-mm-dd' });
			$('#dt_sale_end').datepicker({ dateFormat: 'yy-mm-dd' });
		});
	
		function productRegProc() {
			
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("sle_nm").value == ""
					|| document.getElementById("img").value == ""
					|| document.getElementById("price_sale").value == ""
					|| document.getElementById("desces").value == ""
					|| document.getElementById("cd_ctg_b").value == "0"
					|| document.getElementById("cd_ctg_m").value == "0"
					|| document.getElementById("cd_state_sale").value == ""
					|| document.getElementById("prd_type").value == ""
					|| document.getElementById("count_stock").value == 0
					|| document.getElementById("corp_nm").value == ""
					|| document.getElementById("dt_sale_start").value == ""
					|| document.getElementById("dt_sale_end").value == ""
					|| document.getElementById("discount").value == 0
					|| document.getElementById("point_stack").value == 0) {
				alert("필수 항목을 입력하세요!");
				return;
			}
			document.getElementById("price_sale").value = document.getElementById("price_sale").value.replaceAll(",", "");
			
			frmMain.action = "/backoffice/product/productRegProc.web";
			frmMain.submit();
			
		}
	
		function updateCategoryMinor() {
			var cd_ctg_b = document.getElementById("cd_ctg_b").value;
			var cd_ctg_m = document.getElementById("cd_ctg_m");
			
			// 기존 옵션 삭제
			cd_ctg_m.innerHTML = "";
	
			let options = [];
	
			if (cd_ctg_b === "1") { // 기능별
				options = [
					{ value: "1", text: "혈당/혈행/혈압" },
					{ value: "2", text: "항산화/면역력" },
					{ value: "3", text: "염증/항염" },
					{ value: "4", text: "관절/뼈/치아" },
					{ value: "5", text: "피로회복" },
					{ value: "6", text: "눈 건강" },
					{ value: "7", text: "장 건강" },
					{ value: "8", text: "두뇌/기억력" },
					{ value: "9", text: "위/간/갑상선" }
				];
			} else if (cd_ctg_b === "2") { // 성분별
				options = [
					{ value: "1", text: "폴리코사놀" },
					{ value: "2", text: "오메가-3" },
					{ value: "3", text: "비타민/미네랄" },
					{ value: "4", text: "유산균" },
					{ value: "5", text: "글루코사민/MSM" },
					{ value: "6", text: "루테인" },
					{ value: "7", text: "코큐텐" },
					{ value: "8", text: "아르기닌" },
					{ value: "9", text: "밀크씨슬" }
				];
			} else if (cd_ctg_b === "3") { // 대상별
				options = [
					{ value: "1", text: "남성" },
					{ value: "2", text: "여성" }
				];
			}
	
			// 새 옵션 추가
			options.forEach(option => {
				const newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.textContent = option.text;
				cd_ctg_m.appendChild(newOption);
			});
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form action= "/backoffice/product/productRegProc.web"id="frmMain" method="POST" enctype="multipart/form-data">
<div class="wrapper">

<header class="main-header">
	<!-- Logo -->
	<a href="../../index2.html" class="logo">
	<!-- mini logo for sidebar mini 50x50 pixels -->
	<span class="logo-mini"><b>A</b>LT</span>
	<!-- logo for regular state and mobile devices -->
	<span class="logo-lg"><b>Admin</b>LTE</span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
	<!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</a>

	
	</nav>
</header>
	<!-- mainSide Section Begin -->
	<%@ include file="/include/backoffice/mainSide.jsp" %>
	<!-- mainSide Section End -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="padding-left: 290px;">
	<h1>
		상품등록
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Forms</a></li>
		<li class="active">General Elements</li>
	</ol>
	</section>
	
<!-- Main content -->
<section class="content">
	<div class="row" style="display: flex; justify-content: center; align-items: center;">
		<div class="col-md-8">
			<div class="box box-warning">
				<div class="box-body">
					<div class="form-group">
						<label>판매 상품명</label>
						<input type="text" id="sle_nm" name="sle_nm" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 원가</label>
						<input type="text" class="form-control" id="price_sale" name="price_sale" onkeyup="commaValue(this);" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 이미지</label>
						<input type="file" id="img" name="files[0]" required>
					</div>

					<div class="form-group">
						<label>판매 상품 상세 이미지</label>
						<input type="file" id="desces" name="files[1]" required>
					</div>

					<div class="form-group">
						<label>카테고리 대분류</label>
						<select class="form-control" id="cd_ctg_b" name="cd_ctg_b" onchange="updateCategoryMinor()" required>
							<option value="0">선택하세요</option>
							<option value="1">기능별</option>
							<option value="2">성분별</option>
							<option value="3">대상별</option>
						</select>
					</div>
					
					<div class="form-group">
						<label>카테고리 중분류</label>
						<select class="form-control" id="cd_ctg_m" name="cd_ctg_m" required>
							<option value="0">먼저 대분류를 선택하세요</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 상태</label>
						<select class="form-control" id="cd_state_sale" name="cd_state_sale" required>
							<option value="1">대기(1)</option>
							<option value="2">판매(2)</option>
							<option value="3">중지(3)</option>
							<option value="9">재고소진(9)</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 섭취 타입</label>
						<select class="form-control" id="prd_type" name="prd_type" required>
							<option value="1">액상(1)</option>
							<option value="2">정(2)</option>
							<option value="3">캡슐(3)</option>
							<option value="4">베지캡슐(4)</option>
							<option value="5">젤리(5)</option>
							<option value="6">분말(6)</option>
							<option value="7">츄어블(7)</option>
						</select>
					</div>

					<div class="form-group">
						<label>판매 상품 재고</label>
						<input type="text" id="count_stock" name="count_stock" class="form-control" onkeyup="commaValue(this);" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>판매 상품 브랜드</label>
						<input type="text" id="corp_nm" name="corp_nm" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>상품 판매 시작일:</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" id="dt_sale_start" name="dt_sale_start" required autocomplete="off">
						</div>
					</div>
					
					<div class="form-group">
						<label>상품 판매 종료일:</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" id="dt_sale_end" name="dt_sale_end" required autocomplete="off">
						</div>
					</div>

					<div class="form-group">
						<label>할인율</label>
						<input type="text" id="discount" name="discount" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<label>포인트 적립률</label>
						<input type="text" id="point_stack" name="point_stack" class="form-control" required autocomplete="off">
					</div>

					<div class="form-group">
						<button type="button" class="btn btn-primary" onclick="javascript:productRegProc();">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Main content End -->
</div>
</div>
</form>
	<!-- Footer Section Begin -->
	<%@ include file="/include/backoffice/footer.jsp" %>
	<!-- Footer Section End -->
	<%@ include file="/include/backoffice/js.jsp" %>
</body>
</html>