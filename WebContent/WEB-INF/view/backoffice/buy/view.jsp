<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/view.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	
	<script>
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/buy/view.web">
<input type="hidden" name="seq_buy_dtl" value="${buyDto.seq_buy_dtl}"/>	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" style="display: flex; align-items: center; margin-left: 425px;">

      <h1>
        판매 상품 상세 페이지
        <small></small>
      </h1>
    </section>

        <!-- Main content -->
    <section class="content" style="display: flex; justify-content: center; align-items: center;">
      
        <div class="col-md-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">회원번호 ${buydetailDto.seq_mbr}번 고객님의 상품 상세 목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<table class="table table-bordered">
                <tr>
                  <th>판매 상품명</th>
                  <td>${buydetailDto.sle_nm}</td>
                </tr>
                <tr>
                  <th>판매 상품 개수</th>
                  <td>${buydetailDto.count}</td>
                </tr>
                <tr>
                  <th>판매 상품 가격</th>
                  <td>${buydetailDto.price}</td>
                </tr>
                <tr>
                  <th>개별 포인트</th>
                  <td>${buydetailDto.point}</td>
                </tr>
                <tr>
					<th>리뷰 작성 유무</th>
					<td>
					<c:choose>
						<c:when test="${buydetailDto.flg_review == 'Y'}">YES</c:when>
						<c:otherwise>NO</c:otherwise>
					</c:choose>
					</td>
				</tr>	
				<tr>
                  <th>구매 일자</th>
                  <td>${buydetailDto.dt_reg}</td>
                </tr>
           	</table>
           	<div class="modal-footer" style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
			    <input type="button" value="목록" class="btn btn-primary" onclick="location.href='/console/buy/list.web';" />
			</div>
          	</div>
          </div>
          </div>
         
    </section>
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>