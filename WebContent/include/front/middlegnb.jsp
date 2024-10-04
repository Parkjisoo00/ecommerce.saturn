<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<div class="col-xl-12 col-lg-12" style="margin: 0 auto; float: none; width: 90%;">
	<nav class="header__menu" style="text-align: center;">
		<ul style="display: inline-block; width: 90%; list-style: none;">
			<li class="active" style="display: inline-block; margin: 0 57px;">
				<a href="/front/sale/total_list.web">
					<img src="/img/icon/ctg.png" alt="전체 상품" style="width: 24px; height: 24px;">
				</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('');">기능별</a></li>
					<li><a href="javascript:goTypeI('');">성분별</a></li>
					<li><a href="javascript:goTypeG('');">대상별</a></li>
					<li><a href="#">맞춤 건강 관리</a></li>
					<li><a href="#">고객 센터</a></li>
					<li><a href="#">소개</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeF('');" style="font-size: 18px; font-weight: bold;">기능별</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('bld');">혈당/혈행/혈압</a></li>
					<li><a href="javascript:goTypeF('imu');">항산화/면역력</a></li>
					<li><a href="javascript:goTypeF('inf');">염증/항염</a></li>
					<li><a href="javascript:goTypeF('jnt');">관절/뼈/치아</a></li>
					<li><a href="javascript:goTypeF('rec');">피로회복</a></li>
					<li><a href="javascript:goTypeF('eye');">눈 건강</a></li>
					<li><a href="javascript:goTypeF('col');">장 건강</a></li>
					<li><a href="javascript:goTypeF('brn');">두뇌/기억력</a></li>
					<li><a href="javascript:goTypeF('stm');">위/간/갑상선</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeI('');" style="font-size: 18px; font-weight: bold;">성분별</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeI('pol');">폴리코사놀</a></li>
					<li><a href="javascript:goTypeI('omg');">오메가-3</a></li>
					<li><a href="javascript:goTypeI('min');">비타민/미네랄</a></li>
					<li><a href="javascript:goTypeI('bac');">유산균</a></li>
					<li><a href="javascript:goTypeI('msm');">글루코사민/MSM</a></li>
					<li><a href="javascript:goTypeI('rut');">루테인</a></li>
					<li><a href="javascript:goTypeI('kou');">코큐텐</a></li>
					<li><a href="javascript:goTypeI('arg');">아르기닌</a></li>
					<li><a href="javascript:goTypeI('mik');">밀크씨슬</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeG('');" style="font-size: 18px; font-weight: bold;">대상별</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeG('M');">남성</a></li>
					<li><a href="javascript:goTypeG('F');">여성</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="#" style="font-size: 18px; font-weight: bold;">맞춤 건강 관리</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="#">맞춤 건강 추천</a></li>
					<li><a href="#">안심 조회 서비스</a></li>
					<li><a href="#">건강 정보</a></li>
					<li><a href="#">새소식</a></li>
					<li><a href="#">성분 사전</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="#" style="font-size: 18px; font-weight: bold;">고객 센터</a>
				<ul class="dropdown" style="position: absolute; top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goList(1);" >공지사항</a></li>
					<li><a href="javascript:goList(2);" >자주 묻는 질문</a></li>
					<li><a href="javascript:goList(3);" >1대1 문의 사항</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px;">
				<a href="#" style="font-size: 18px; font-weight: bold;">소개</a>
			</li>
		</ul>
	</nav>
</div>