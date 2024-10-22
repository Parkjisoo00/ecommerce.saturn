/**
 * @author pluto@himedia.co.kr
 * @since 2023-11-02
 *
 * <p>DESCRIPTION: 다음 우편번호 찾기(https://postcode.map.daum.net/guide)</p>
 * <p>IMPORTANT:</p>
 */
function execDaumPostcode() {
	
	var width	= 500; //팝업의 너비
	var height	= 600; //팝업의 높이
	
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
			document.getElementById("post").value		= data.zonecode;
			document.getElementById("addr1").value		= roadAddr;
			document.getElementById("jibunAdd").value	= data.jibunAddress;
			
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

/**
 * @author pluto@himedia.co.kr
 * @since 2024-05-28
 *
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
function checkEmail(email) {
	alert("backoffice");
	
	var isEmail = true;
	
	// 0. 정규식
	//alert(email);
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if (!regExpEmail.test(email)) return false;
	
	// 1. 자리수
	//alert("자리수=" + email.length);
	if (email.length <= 7) return false;
	
	// 2. @
	//alert("@의 인덱스=" + email.indexOf("@"));
	if (email.indexOf("@") <= 0) return false;
	
	// 3. 도메인
	var isExist = false;
	var arrDomain	= [".co.kr", ".com", ".net", ".or.kr", ".go.kr"];
	for (var i = 0; i < arrDomain.length; i++) {
		if (email.indexOf(arrDomain[i]) > 0 ) {
			//alert("도메인=" + arrDomain[i]);
			isExist = true;
			break;
		}
	}
	if (!isExist) return false;
	
	var arrValue = email.split("@");
	//alert("ID=" + arrValue[0].toLowerCase());
	
	// 4. 아이디에 처음시작 1자리는 영문, 5자이상 16자 이하, 영문, 영문+숫자, 특수문자는 '_'만 가능
	var regularExpression = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,16}$/;
	var isExist = regularExpression.test(arrValue[0]) ? false : true;
	//alert("특수문자 여부=" + isExist);
	if (isExist) return false;
	
	// 5. 제외할 아이디(소문자 기준)
	isExist = false;
	var IRREGULAR_KEYWORD = "super|root|administrator|admin|backoffice"
	+ "|sys|system|sa|owner"
	+ "|document|html|iframe|div|span|img|src|type"
	+ "|javascript|vbscript|script|alert"
	+ "|id|member|customer|www";
	if (IRREGULAR_KEYWORD.indexOf(arrValue[0].toLowerCase()) >= 0 ) {
		//alert("제외할 아이디=" + arrValue[0].toLowerCase());
		isExist = true;
	}
	if (isExist) return false;
	
	return isEmail;
}

/**
 * @author pluto@himedia.co.kr
 * @since 2024-05-28
 *
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
function checkRegister() {
    var isSubmit = true;  // 폼 제출 여부 결정 변수
    var frmMain = document.getElementById("frmMain");

    // 이메일, 비밀번호, 성명, 연락처 등의 유효성 검사
    if (!checkEmail(document.getElementById("email").value)) {
        alert("이메일을 확인하세요!");
        isSubmit = false;
        document.getElementById("email").focus();
    }

    if (document.getElementById("passwd").value != document.getElementById("passwd_").value) {
        alert("비밀번호를 확인하세요!");
        isSubmit = false;
        document.getElementById("passwd").focus();
    }

    // 성명 확인
    var regExpName = /^[가-힣]*$/;
    if (!regExpName.test(document.getElementById("mng_nm").value)) {
        alert("성명은 한글만 입력하세요!");
        isSubmit = false;
    }

	// 휴대폰 번호 결합 및 유효성 검사
	       var phone1 = document.getElementById("phone1").value;
	       var phone2 = document.getElementById("phone2").value;
	       var phone3 = document.getElementById("phone3").value;

	       if (phone1 === "" || phone2 === "" || phone3 === "") {
	           alert("전화번호를 모두 입력하세요!");
	           isSubmit = false;
	       } else {
	           var phone = phone1 + "-" + phone2 + "-" + phone3;
	           document.getElementById("phone").value = phone;  // 결합된 전화번호를 hidden 필드에 저장
	       }

		   // 주소 필드 확인
		          if (document.getElementById("post").value === "" || 
		              document.getElementById("addr1").value === "" || 
		              document.getElementById("addr2").value === "") {
		              alert("주소를 모두 입력하세요!");
		              isSubmit = false;
		          }
	
				  $.ajax({
				  					type: "POST",
				  					async: false,
				  					url: "/backoffice/manager/checkEmail.json",
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
}