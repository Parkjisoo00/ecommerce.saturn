<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/manager/registerForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style></style>
	<script>
		
		// 이메일 중복 여부
		var isDuplicate = false;  // 이메일 중복 여부를 저장하는 변수

		$(document).ready(function () {
    // 중복 체크 버튼 클릭 이벤트 처리
    /*
    $("#checkDuplicate").on("click", function (e) {
        e.preventDefault();  // 기본 이벤트를 막음

        var myData = { email: $("#email").val() };

        $.ajax({
			type: "POST",
			async: false,
			url: "/console/manager/checkDuplicate.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function (res) {
				// alert(JSON.stringify(res));
				// var jsonData = JSON.parse(res);
				// 중복이 안 될 경우
				if (res != true) {
					isDuplicate = false;
					$("#email").attr("readonly", true);
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

		/*
		var isDuplicate = true;

		$(function () {

			var $frm = $("#frmMain");

			$("#checkRegister").on("click", function (e) {
				alert("ajax");
				var myData = { email: $("#email").val() };

				$.ajax({
					type: "POST",
					async: false,
					url: "/console/manager/checkEmail.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success: function (res) {
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
*/
			$("#btnId").on("click", function (e) {

				// 이메일이 7자리 이하 또는 @가 없으면
				if ($("#email").val().length <= 7 || $("#email").val().indexOf("@") <= 0) {
					alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
					return false;
				}

				// var myData = $frm.serialize();
				// var myData = "email=" + $("#email").val();

				// var myData = {email: "plutomsw@gmail.com", passwd: "123456"};
				var myData = { email: $("#email").val() };
				//alert(JSON.stringify(myData));

				
				var myData = "{\"email\": \"plutomsw@gmail.com\", \"passwd\": \"12345678\"}";
				
				

				$.ajax({
					type: "POST",
					async: false,
					url: "/console/manager/checkDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success: function (res) {
						// alert(JSON.stringify(res));
						// var jsonData = JSON.parse(res);
						// 중복이 안 될 경우
						if (res != true) {
							isDuplicate = false;
							$("#email").attr("readonly", true);
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
		
		 function execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {
						document.getElementById('post').value = data.zonecode;  // 우편번호
						document.getElementById('addr1').value = data.roadAddress;  // 도로명 주소
					}
				}).open();
			}
		
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form action= "/console/manager/registerProc.web"id="frmMain" method="POST" >
	
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
	<%@ include file="/include/backoffice/mainSide.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        회원가입
        <small>Preview</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
     
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
          
            <!-- /.box-header -->
            <!-- form start -->
              
              
                <div class="form-group">
                <div class="box-body">
						<label>이메일 *</label>
						<input type="text" id="email" name="email" required
							style="flex: 1; min-width: 250px;" autocomplete="off"/>
							<button type="submit" class="btn btn-primary" id="btnId">중복 찾기</button>
					</div>
					
					<div class="form-group">
					<div class="box-body">
						<label>비밀번호 * (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력)</label>
						<input type="password" id="passwd" name="passwd" required autocomplete="off" />
					</div>
					<div class="form-group">
					<div class="box-body">
						<label>비밀번호 * (확인을 위해 새 비밀번호를 다시 입력해주세요.)</label>
						<input type="password" id="passwd_" name="passwd_" required autocomplete="off" />
					</div>
					<div class="form-group">
					<div class="box-body">
						<label>성명 * </label>
						<input type="text" id="mng_nm" name="mng_nm" required
											style="width: 100%;" autocomplete="off"/>
            
		             <label>연락처 * </label>
		              <div class="row">
		               <div class="box-body">
							<input type="text" id="phone1" name="phone1"
								maxlength="3" required style="height: 33px;"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
							-
							<input type="text" id="phone2" name="phone2"
								maxlength="4" required style="height: 33px;"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
							-
							<input type="text" id="phone3" name="phone3"
								maxlength="4" required style="height: 33px;"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
						</div>
		              </div>
		              <input type="hidden" id="phone" name="phone" value="010-2025-5589"/>
		              
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		          <div class="box-body">
					<p>주소 <span>*</span></p>
					<input type="text" id="post" name="post" size="5" autocomplete="off">

						<p><label for="addr1">도로명 <span></span></label></p>
						<input type="text" id="addr1" name="addr1" size="40" autocomplete="off">
						<span id="guide" style="color:#999; display:none"></span>
						
						<p><label for="addr2">상세 <span></span></label></p>
						<input type="text" id="addr2" name="addr2" size="20" placeholder="상세 주소" autocomplete="off">
						<button type="submit" class="btn btn-primary" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>

				<div class="box-footer">
				 <button type="submit" class="btn btn-primary" id="registerId" onClick="checkRegister();">회원가입</button>
             	 </div>


              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@ include file="/include/backoffice/footer.jsp" %>

<%@ include file="/include/backoffice/sideBar.jsp" %>
  <div class="control-sidebar-bg"></div>
<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>