function execDaumPostcode() {
	
	var width = 500; //팝업의 너비
	var height = 600; //팝업의 높이
	
	new daum.Postcode({
		width: width,
		height: height,
		oncomplete: function(data) {
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress;		// 도로명 주소 변수
			var extraRoadAddr = '';					// 참고 항목 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("postcode").value		= data.zonecode;
			document.getElementById("roadAddr").value		= roadAddr;
			document.getElementById("addr1").value			= data.jibunAddress;
			
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if(roadAddr !== ''){
				document.getElementById("extraAddress").value = extraRoadAddr;
			}
			else {
				document.getElementById("extraAddress").value = '';
			}
			
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';
			
			}
			else if(data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			}
			else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
			}
		}).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2)
	});
}

function checkEmail(email) {
	var isEmail = true;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	if (!regExpEmail.test(email)) return false;
	if (email.length <= 7) return false;
	if (email.indexOf("@") <= 0) return false;

	var arrDomain = [".co.kr", ".com", ".net", ".or.kr", ".go.kr"];
	var isExist = arrDomain.some(function (domain) {
		return email.indexOf(domain) > 0;
	});

	if (!isExist) return false;

	var arrValue = email.split("@");
	var regularExpression = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,16}$/;
	if (!regularExpression.test(arrValue[0])) return false;

	var IRREGULAR_KEYWORD = "super|root|administrator|admin|console"
		+ "|sys|system|sa|owner"
		+ "|document|html|iframe|div|span|img|src|type"
		+ "|javascript|vbscript|script|alert"
		+ "|id|member|customer|www";
	if (IRREGULAR_KEYWORD.indexOf(arrValue[0].toLowerCase()) >= 0) {
		return false;
	}

	return isEmail;
}

function checkRegister() {
	var isSubmit = true;
	var frmMain = document.getElementById("frmMain");

	if (!document.getElementById("term_1").checked) {
		alert("필수 약관에 동의하셔야 합니다!");
		return;
	}
	
	if (!document.getElementById("term_2").checked) {
		alert("필수 약관에 동의하셔야 합니다!");
		return;
	}
	
	var email = document.getElementById("email").value;

	if (!checkEmail(email)) {
		alert("이메일을 확인하세요!");
		document.getElementById("email").focus();
		return;
	}
	
	if (isDuplicate) {
		alert("이메일 중복을 확인하세요!");
		document.getElementById("btnId").focus();
		return;
	}

	if (document.getElementById("passwd").value != document.getElementById("passwd_").value) {
		alert("비밀번호를 확인하세요!");
		isSubmit = false;
		document.getElementById("passwd").focus();
	}
	
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	if (!regExpPasswd.test(document.getElementById("passwd").value)) {
		alert("비밀번호는 영문/숫자/특수기호를 조합하여 8자 이상을 입력하세요!");
		isSubmit = false;
	}

	var regExpName = /^[가-힣]*$/;
	if (!regExpName.test(document.getElementById("mbr_nm").value)) {
		alert("성명은 한글만 입력하세요!");
		isSubmit = false;
	}

	var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
	var phone = document.getElementById("phone1").value + "-" + document.getElementById("phone2").value + "-" + document.getElementById("phone3").value;
	if (!regExpPhone.test(phone)) {
		alert("연락처를 확인해 주세요!");
		isSubmit = false;
	}
	
	if (document.getElementById("mbr_nm").value == ""
		|| document.getElementById("phone1").value == ""
		|| document.getElementById("phone2").value == ""
		|| document.getElementById("phone3").value == ""
		//|| document.getElementById("post").value == ""
		|| document.getElementById("addr1").value == ""
		|| document.getElementById("addr2").value == "") {
		alert("필수 항목을 입력하세요!");
		isSubmit = false;
	}
	
	if (isSubmit) {
		alert("정상적으로 "
			+ email
			+ "로 인증 URL이 전송되었습니다.\n반드시 가입 후 10분 이내에 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
		document.getElementById("phone").value =
			document.getElementById("phone1").value
			+ "-" + document.getElementById("phone2").value
			+ "-" + document.getElementById("phone3").value;

		frmMain.action = "/front/member/registerProc.web";
		frmMain.submit();
	}
}

// 페이지 로드 시 저장된 이메일 불러오기
document.addEventListener("DOMContentLoaded", function() {
	var savedEmail = localStorage.getItem("savedEmail");
	if (savedEmail) {
		document.getElementById("email").value = savedEmail;
		document.getElementById("rememberMe").checked = true; // 체크박스 체크
	}
});

function checkLogin() {
			
	var frmMain = document.getElementById("frmMain");
	
	if (document.getElementById("email").value.length < 6
			|| document.getElementById("email").value.length > 32) {
		alert("이메일(아이디)를 6 ~ 16자 이내로 입력하세요!");
		document.getElementById("email").focus();
		// document.getElementById("email").select();
		return;
	}
	
	if (document.getElementById("passwd").value.length < 8
			|| document.getElementById("passwd").value.length > 16) {
		alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
		document.getElementById("passwd").focus();
		return;
	}
	
	// 아이디 저장 체크 로직
		if (document.getElementById("rememberMe").checked) {
			localStorage.setItem("savedEmail", document.getElementById("email").value);
		} else {
			localStorage.removeItem("savedEmail"); // 체크 해제 시 저장된 아이디 삭제
		}
		
		frmMain.action = "/front/login/loginProc.web";
		frmMain.submit();
}

function goToRegister() {
	window.location.href = "/front/member/registerForm.web"; // 회원가입 페이지 URL
}