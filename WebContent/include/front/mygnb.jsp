<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="my-custom-ul" >
	<li><a style="font-size :30px" href="/front/myPage/" class="menuLnb">마이 페이지</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 확인/수정</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/passwd/modifyForm.web" class="menuLnb">비밀번호 수정</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goMyList(3);" class="menuLnb">문의 내역</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/pointHistory.web" class="menuLnb">포인트</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/surveyModifyForm.web" class="menuLnb">맞춤 건강 결과 조회</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/myLike.web" class="menuLnb">찜한 상품</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/reviewListPage.web" class="menuLnb">상품후기 관리</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/history.web" class="menuLnb">주문목록/배송조회</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/buy/cancelhistory.web" class="menuLnb">취소/교환/환불내역</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyDelivery.web" class="menuLnb">배송지 관리</a></li>
</ul>
<script>
	function goTypeT(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/total_list.web";
		frmMain.submit();
	}
	
	function goTypeF(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goTypeI(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goTypeG(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}
		
	function goTypeTx(value) {
		
		var first_cd_ctgDesktop		= document.getElementById("first_cd_ctg").value;
		var second_cd_ctgDesktop	= document.getElementById("second_cd_ctg").value;
		
		var first_cd_ctgAndroid		= document.getElementById("first_cd_ctg_android").value;
		var second_cd_ctgAndroid	= document.getElementById("second_cd_ctg_android").value;
		
		var first_cd_ctg;
		var second_cd_ctg
		
		if (value == 'pc') {
			
			first_cd_ctg	= 	first_cd_ctgDesktop
			second_cd_ctg	= 	second_cd_ctgDesktop
		}
		else if (value == 'mobile') {	
			first_cd_ctg	= 	first_cd_ctgAndroid
			second_cd_ctg	= 	second_cd_ctgAndroid
		}	
		
		var searchWordDesktop = document.getElementById("_searchWord_desktop").value;
		var searchWordAndroid = document.getElementById("_searchWord_android").value;
		
		var _searchWord;
		
		if (value == 'pc') {
			_searchWord = searchWordDesktop;
		}
		else if (value == 'mobile') {
			_searchWord = searchWordAndroid;
		}
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_ctg_b.setAttribute("value", first_cd_ctg);
		frmMain.cd_ctg_m.setAttribute("value", second_cd_ctg);
		frmMain.searchWord.setAttribute("value", _searchWord);
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/total_list.web";
		frmMain.submit();
	}
</script>