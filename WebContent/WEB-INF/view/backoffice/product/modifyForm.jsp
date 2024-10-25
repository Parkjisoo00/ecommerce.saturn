<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/modifyForm.jsp" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.10.2/tinymce.min.js"></script>
	<script>
		window.onload = function () {
			updateCategory();
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
		
		$(function(){
			$('#dt_sale_start').datepicker({dateFormat:'yy-mm-dd'});
		})
		
			$(function(){
		$('#dt_sale_end').datepicker({dateFormat:'yy-mm-dd'});
		})
		
		function updateCategory() {
			var cd_ctg_b = document.getElementById("cd_ctg_b").options[document.getElementById("cd_ctg_b").selectedIndex].value;
			var cd_ctg_m = document.getElementById("cd_ctg_m");
		
			// 기존 옵션 삭제
			cd_ctg_m.innerHTML = '';
		
			// 대분류에 따라 중분류 옵션 추가
			if (cd_ctg_b == '1') {
				cd_ctg_m.innerHTML = `
					<option value="1" ${productDto.cd_ctg_m == '1' ? 'selected' : ''}>혈당/혈행/혈압</option>
					<option value="2" ${productDto.cd_ctg_m == '2' ? 'selected' : ''}>항산화/면역력</option>
					<option value="3" ${productDto.cd_ctg_m == '3' ? 'selected' : ''}>염증/항염</option>
					<option value="4" ${productDto.cd_ctg_m == '4' ? 'selected' : ''}>관절/뼈/치아</option>
					<option value="5" ${productDto.cd_ctg_m == '5' ? 'selected' : ''}>피로회복</option>
					<option value="6" ${productDto.cd_ctg_m == '6' ? 'selected' : ''}>눈 건강</option>
					<option value="7" ${productDto.cd_ctg_m == '7' ? 'selected' : ''}>장 건강</option>
					<option value="8" ${productDto.cd_ctg_m == '8' ? 'selected' : ''}>두뇌/기억력</option>
					<option value="9" ${productDto.cd_ctg_m == '9' ? 'selected' : ''}>위/간/갑상선</option>
				`;
			} else if (cd_ctg_b == '2') {
				cd_ctg_m.innerHTML = `
					<option value="1" ${productDto.cd_ctg_m == '1' ? 'selected' : ''}>폴리코사놀</option>
					<option value="2" ${productDto.cd_ctg_m == '2' ? 'selected' : ''}>오메가-3</option>
					<option value="3" ${productDto.cd_ctg_m == '3' ? 'selected' : ''}>비타민/미네랄</option>
					<option value="4" ${productDto.cd_ctg_m == '4' ? 'selected' : ''}>유산균</option>
					<option value="5" ${productDto.cd_ctg_m == '5' ? 'selected' : ''}>글루코사민/MSM</option>
					<option value="6" ${productDto.cd_ctg_m == '6' ? 'selected' : ''}>루테인</option>
					<option value="7" ${productDto.cd_ctg_m == '7' ? 'selected' : ''}>코큐텐</option>
					<option value="8" ${productDto.cd_ctg_m == '8' ? 'selected' : ''}>아르기닌</option>
					<option value="9" ${productDto.cd_ctg_m == '9' ? 'selected' : ''}>밀크씨슬</option>
				`;
			} else if (cd_ctg_b == '3') {
				cd_ctg_m.innerHTML = `
					<option value="1" ${productDto.cd_ctg_m == '1' ? 'selected' : ''}>남성</option>
					<option value="2" ${productDto.cd_ctg_m == '2' ? 'selected' : ''}>여성</option>
				`;
			}
		}
		
		function modifyProc(value) {
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("sle_nm").value == ""
					|| document.getElementById("price_sale").value == "0"
					|| document.getElementById("cd_ctg_b").value == ""
					|| document.getElementById("cd_ctg_m").value == ""
					|| document.getElementById("cd_state_sale").value == ""
					|| document.getElementById("flg_delete").value == ""
					|| document.getElementById("dt_sale_start").value == ""
					|| document.getElementById("dt_sale_end").value == "") {
				alert("필수 항목을 입력하세요!");
				return;
			}
			document.getElementById("price_sale").value = document.getElementById("price_sale").value.replaceAll(",", "");
			
			frmMain.action="/console/product/modifyProc.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" id="seq_sle"		name="seq_sle"			value="${productDto.seq_sle}"/>

	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<section class="content" >
		<div class="row" style="display: flex; justify-content: center; align-items: center;">
			<div class="col-md-9" style="display: flex; justify-content: center; align-items: center; margin-right: -230px;">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">상품 정보 수정</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
								<tr>
									<th style="width: 150px;" >판매 상품명</th>
									<td>
										<input type="text" name="sle_nm" id="sle_nm" value="${productDto.sle_nm}" required/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >상품 상세 이미지</th>
									<td>
										<img src="/img/product/${productDto.desces}" height="200"/>
										<input type="file" id="desces" name="files[1]" />
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >상품 이미지</th>
									<td>
										<img src="/img/product/${productDto.img}" height="200"/>
										<input type="file" id="img" name="files[0]" />
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >판매 가격</th>
									<td>
										<input type="text" id="price_sale" name="price_sale" value="<fmt:formatNumber value="${productDto.price_sale}" type="number" />" style="width:100px; text-align:right" onkeyup="commaValue(this);" required/>원
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >카테고리 대분류</th>
									<td>
										<select id="cd_ctg_b" name="cd_ctg_b" onchange="updateCategory()">
											<option value="1"<c:if test="${productDto.cd_ctg_b == '1'}"> selected</c:if>>기능별</option>
											<option value="2"<c:if test="${productDto.cd_ctg_b == '2'}"> selected</c:if>>성분별</option>
											<option value="3"<c:if test="${productDto.cd_ctg_b == '3'}"> selected</c:if>>대상별</option>
										</select>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;">카테고리 중분류</th>
									<td>
										<select id="cd_ctg_m" name="cd_ctg_m">
											<option value="0">선택</option>
										</select>
									</td>
								</tr>
								<tr>
								<th>판매 상태</th>
									<td>
										<select id="cd_state_sale" name="cd_state_sale">
											<option value="1"<c:if test="${productDto.cd_state_sale == '1'}"> selected</c:if>>대기</option>
											<option value="2"<c:if test="${productDto.cd_state_sale == '2'}"> selected</c:if>>판매</option>
											<option value="3"<c:if test="${productDto.cd_state_sale == '3'}"> selected</c:if>>중지</option>
											<option value="9"<c:if test="${productDto.cd_state_sale == '9'}"> selected</c:if>>품절</option>
										</select>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >판매 상품 재고</th>
									<td>
										<input type="text" id="count_stock" name="count_stock" value="<fmt:formatNumber value="${productDto.count_stock}" type="number" />" style="width:100px; text-align:right" onkeyup="commaValue(this);" required/>개
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >포인트 적립률</th>
									<td>
										<input type="text" name="point_stack" id="point_stack" value="${productDto.point_stack}" style="width:100px; text-align:right" required/>%
								</tr>
								<tr>
									<th style="width: 150px;" >삭제 처리 여부</th>
									<td>
										<input type="text" name="flg_delete" id="flg_delete" value="${productDto.flg_delete}" style="width:100px; text-align:right" required/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >판매 시작 일시</th>
									<td>
										<input type="text" id="dt_sale_start" name="dt_sale_start" value="${productDto.dt_sale_start}" style="width:100px; text-align:right" required/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >판매 종료 일시</th>
									<td>
										<input type="text" id="dt_sale_end" name="dt_sale_end" value="${productDto.dt_sale_end}" style="width:100px; text-align:right" required/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" >할인율</th>
									<td>
										<input type="text" id="discount" name="discount" value="${productDto.discount}" style="width:100px; text-align:right" required/>%
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="mailbox-controls">
						<div class="btn-group" style="display: flex; justify-content: center; gap: 10px;">
							<input type="button" value="수정" class="btn btn-default" style="width: 150px" onclick="javascript:modifyProc();" />
							<input type="button" value="목록" class="btn btn-default" style="width: 150px" onclick="javascript:location.href='/console/product/list.web';"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
