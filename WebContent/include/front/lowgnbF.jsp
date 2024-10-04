<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<div class="col-lg-12" style="padding: 0 !important;">
	<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px;">
		<ul>
			<li><a href="javascript:goTypeFs('LowP', ${paging.cd_ctg_m});" style="font-size: 13px !important;">낮은 가격순</a></li>
			<li><a href="javascript:goTypeFs('HighP', ${paging.cd_ctg_m});" style="font-size: 13px !important;">높은 가격순</a></li>
			<li><a href="javascript:goTypeFs('DtReg', ${paging.cd_ctg_m});" style="font-size: 13px !important;">등록일 순</a></li>
			<li><a style="font-size: 13px !important;">브랜드</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeFn('YS에코비팜', ${paging.cd_ctg_m});">YS에코비팜</a></li>
					<li><a href="javascript:goTypeFn('나우푸드', ${paging.cd_ctg_m});">나우푸드</a></li>
					<li><a href="javascript:goTypeFn('나트롤', ${paging.cd_ctg_m});">나트롤</a></li>
					<li><a href="javascript:goTypeFn('네오셀', ${paging.cd_ctg_m});">네오셀</a></li>
					<li><a href="javascript:goTypeFn('네이처스웨이', ${paging.cd_ctg_m});">네이처스웨이</a></li>
					<li><a href="javascript:goTypeFn('노르딕내추럴스', ${paging.cd_ctg_m});">노르딕내추럴스</a></li>
					<li><a href="javascript:goTypeFn('뉴트렉스', ${paging.cd_ctg_m});">뉴트렉스</a></li>
					<li><a href="javascript:goTypeFn('블루보넷', ${paging.cd_ctg_m});">블루보넷</a></li>
					<li><a href="javascript:goTypeFn('뉴트리콜로지', ${paging.cd_ctg_m});">뉴트리콜로지</a></li>
					<li><a href="javascript:goTypeFn('닥터스베스트', ${paging.cd_ctg_m});">닥터스베스트</a></li>
				</ul>
			</li>
			<li><a style="font-size: 13px !important;">제품 타입</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeFt('1', ${paging.cd_ctg_m});">액상</a></li>
					<li><a href="javascript:goTypeFt('2', ${paging.cd_ctg_m});">정</a></li>
					<li><a href="javascript:goTypeFt('3', ${paging.cd_ctg_m});">캡슐</a></li>
					<li><a href="javascript:goTypeFt('4', ${paging.cd_ctg_m});">베지 켑슐</a></li>
					<li><a href="javascript:goTypeFt('5', ${paging.cd_ctg_m});">젤리</a></li>
					<li><a href="javascript:goTypeFt('6', ${paging.cd_ctg_m});">분말</a></li>
					<li><a href="javascript:goTypeFt('7', ${paging.cd_ctg_m});">츄어볼</a></li>
				</ul>
			</li>
		</ul>
	</h6>
</div>