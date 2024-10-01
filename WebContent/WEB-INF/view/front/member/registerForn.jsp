<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/registerForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style></style>
	<script>
		// 이메일 중복 여부
		var isDuplicate = true;
		
		$(function() {
			
			var $frm = $("#frmMain");
			
			
			$("#btnConfirm").on("click", function(e) {
				
				var myData = {email: $("#email").val()};
				
				$.ajax({
					type: "POST",
					url: "/front/member/checkEmail.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success:function(res) {
						if (res == true) {
							alert("정상적으로 " + $("#email").val()
									+ "로 인증 URL이 전송되었습니다.\n반드시 가입 후 10분 이내에 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
									// + "로 인증 URL이 전송되었습니다.\n반드시 가입 후 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
						}
						else {
							alert("인증 이메일이 발송이 실패되었습니다!\n시스템 관리자에게 문의하세요!");
						}
					}
				});
				
			});
			
			
			$("#btnId").on("click", function(e) {
				
				// 이메일이 7자리 이하 또는 @가 없으면
				if ($("#email").val().length <=7 || $("#email").val().indexOf("@") <= 0) {
					alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
					return false;
				}
				
				// var myData = $frm.serialize();
				// var myData = "email=" + $("#email").val();
				
				// var myData = {email: "plutomsw@gmail.com", passwd: "123456"};
				var myData = {email: $("#email").val()};
				//alert(JSON.stringify(myData));
				
				/*
				var myData = "{\"email\": \"plutomsw@gmail.com\", \"passwd\": \"12345678\"}";
				alert(myData);
				*/
				
				$.ajax({
					type: "POST",
					// async: false,
					url: "/front/member/checkDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success:function(res) {
						// alert(JSON.stringify(res));
						// var jsonData = JSON.parse(res);
						// 중복이 안 될 경우
						if (res != true) {
							isDuplicate = false;
							$("#email").attr("readonly",true);
							alert($("#email").val() + "는 사용 가능하며 변경할 수 없습니다.");
							// $("#btnConfirm").attr("disabled", false);
						}
						else {
							alert($("#email").val() + "는 중복됩니다! 다른 이메일을 입력하세요!");
							$("#email").val("");
							$("#email").focus();
						}
					}
				});
			});
		});
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="phone" id="phone" />
<div class="container">
	<header>
		<%@ include file="/include/front/leftgnb.jsp" %>
	</header>
	<nav>
		<%@ include file="/include/front/maingnb.jsp" %>
	</nav>
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
			
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">이메일(아이디*)</th>
					<td>
						<input value="plutomsw@gmail.com" type="text" id="email" name="email" required />
						 <input type="button" value="중복 찾기" style="width:100px" id="btnId" />
						 <input type="hidden" value="인증 하기" style="width:100px" id="btnConfirm" disabled />
					</td>
				</tr>
				<tr>
					<th>비밀번호(*)</th>
					<td><input value="12345678!a" type="password" id="passwd" name="passwd" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인(*)</th>
					<td><input value="12345678!a" type="password" id="passwd_" name="passwd_" required /></td>
				</tr>
				<tr>
					<th>성명(*)</th>
					<td>
						<input value="명성완" type="text" id="mbr_nm" name="mbr_nm" required />
						 <input type="radio" name="gender" value="M" checked /> 남
						 <input type="radio" name="gender" value="F" /> 여
					</td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td>
						<input value="010" type="text" id="phone1" name="phone1" maxlength="3"     style="text-align:center;width:30px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="9947" type="text" id="phone2" name="phone2" maxlength="4" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="1973" type="text" id="phone3" name="phone3" maxlength="4" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th>주소(*)</th>
					<td>
						<input type="text" maxlength="5" style="text-align:center;width:50px;background-color:#F0F0F0" id="post" name="post" required readonly />
						 도로명 <input type="text" size="40" required id="addr1" name="addr1" style="background-color:#F0F0F0" readonly />
						 <input type="hidden" id="jibunAdd" />
						 <input type="hidden" id="extraAddress" />
						 <span id="guide" style="color:#999; display:none"></span>
						 상세 <input value="주소2" type="text" placeholder="상세 주소" required id="addr2" name="addr2" />
						 <input type="button" value="우편번호 찾기" style="width:100px" onClick="execDaumPostcode();" /></td>
				</tr>
				<tr>
					<td>생년월일(*)</td>
					<td>
						<input type="date" id="birthDate" name="birthDate" />
					</td>
				</tr>
				<tr>
					<th>마케팅 수신 동의</th>
					<td>
						SMS <input type="checkbox" name="flg_sms" value="Y" />
						 Email <input type="checkbox" name="flg_email" value="Y" /></td>
				</tr>
			</table>
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">서비스 약관</th>
					<td>
						<input type="checkbox" id="term_1" name="term_1" value="Y" required /> [필수]브라보 마이 라이프 이용 약관 동의(*)
						<input type="checkbox" id="term_2" name="term_2" value="Y" /> [필수]개인정보 수집 및 이용 동의(*)
						<input type="checkbox" id="term_3" name="term_3" value="Y"  /> [선택]제 3자 개인 정보 제공 동의
					</td>
				</tr>
			</table>
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						 <input type="button" value="회원가입" style="width:100px" onClick="checkRegister();"/>
					</td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
	</footer>
</div>
</form>
</body>
</html>