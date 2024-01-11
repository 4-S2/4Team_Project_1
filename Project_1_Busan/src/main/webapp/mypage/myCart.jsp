<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form-select {
	display: inline;
	width: 70%;
}
textarea {
	border-radius: 10px;
	border-color:rgb(178,86,0);
	padding: 10px;
	width: 100%;
	height: 8em;
	resize: none;
}
.table-review {
	width: 90%;
	height: 150px;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 1px rgb(178,86,0);
	display: none;
}
.reserveImg {
	width: 120px;
	height: 120px;
	border-radius: 8px;
}

.table-reserve {
	width: 750px;
}

tr, td {
	border: none;
}
    .container {
      display: flex;
    }

    .left {
      flex: 1;
      /* 왼쪽 컨텐츠에 필요한 스타일을 추가하세요. */
    }

    .right {
      /* 오른쪽 컨텐츠에 필요한 스타일을 추가하세요. */
    }
    
</style>
<script type="text/javascript">
$(function(){
	let i=0;
	$(document).on('click', '.reviewBtn', function() {
		// 클릭한 reviewBtn에 해당하는 가장 가까운 부모 table-reserve 요소 찾기
		var tableReserve = $(this).closest('.table-reserve');
		
		// 해당 table-reserve 안에서 중첩된 table-review 요소 찾기
		var tableReview = tableReserve.find('.table-review');
		
		// table-review 요소의 가시성 토글하기
		tableReview.toggle();
		
		// reviewBtn 텍스트 토글하기
		$(this).text(function(i, text) {
		  return text === "리뷰작성" ? "작성취소" : "리뷰작성";
		});
    });
	
	$('.rcanBtn').click(function(){
		alert("예약이 취소되었습니다.")
	});
	
})
		
</script>
</head>
<body>
	      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox"> 나의<strong>장바구니</strong></h4>
   	  </div>
	<div class="container">
  		<div class="left">
	<table class="table table-borderless">
		<tr>
			<td><%-- <c:forEach var="vo" items="${list }"> --%>
					<div style="border: solid 1px; border-color: gainsboro; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
<%-- 							<tr>
								<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
								<td>${vo.realDate }</td>
								<c:if test="${ vo.rok=='y' }">
									<td><button class="btn btn-success" disabled>예약완료</button></td>
								</c:if>
								<c:if test="${ vo.rok=='n' }">
									<td><button class="btn btn-outline-success" disabled>예약대기</button></td>
								</c:if>
							</tr> --%>
							<tr>
								<td rowspan="2" width="15%"><img src=""
									class="reserveImg"></td>
								<td width="65%" style="font-size: 17px; font-weight: bold;"
									id="title">제목</td>
								<td width="15%"><a href="../mypage/mypage_reserve_delete.do?jrno=" class="btn btn-outline-danger rcanBtn">예약취소</a></td>
							</tr>
							<tr>
								<td width="65%" style="color: gray;"><p>결제일시</p>
									<p
										style="text-align: right; margin-right: 30px; font-weight: bold; font-size: 18pt">
										<fmt:formatNumber value="1111" pattern="#,###" />
										원
									</p></td>
								<td width="20%">
									<span class="btn btn-outline-secondary reviewBtn"
												data-jrno="특산물번호" data-acino=""
												data-rno="카트번호" data-cid="멤버번호">리뷰작성</span>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<form method="post" action="../mypage/mypage_review_ok.do">
									<table class="table table-review">
										<tr>
											<td width="75%" rowspan="2"><textarea name="content"></textarea></td>
											<td width="25%" style="padding-top:25px;"><span style="display:inline">평점 : </span> 
												<select class="form-select" name="score">
												  <option>1</option>
												  <option>1.5</option>
												  <option>2</option>
												  <option>2.5</option>
												  <option>3</option>
												  <option>3.5</option>
												  <option>4</option>
												  <option>4.5</option>
												  <option selected="selected">5</option>
												</select> 
											</td>
										</tr>
										<tr>
											<td width="25%">
											<input type="hidden" name="jrno" value="특산물번호">
											<input type="submit" class="btn btn-outline-danger inputBtn" style="width:100%" value="작성"></td>
										</tr>
									</table>
									</form>
								</td>
							</tr>
						</table>
					</div>
					<div style="height: 15px;"></div>
				<%-- </c:forEach> --%></td>
		</tr>
	</table>
	</div>
	<div class="right">
<div class="order">
  <div class="box__order-info">
    <strong class="text__title">결제정보</strong>
  </div>
  
  <div class="order_info">
    <ul class="receipt_list_box">
      <li class="list">
        <span class="label">상품수</span>
        <span class="format-amount">
          <strong class="text">5</strong>
          <span class="unit">개</span>
        </span>
      </li>
      <li class="list">
        <span class="label">상품금액</span>
        <span class="format-price">
          <span class="box__format-amount">
            <strong class="text__value">238,600</strong>
            <span class="text__unit">원</span>
          </span>
        </span>
      </li>
      <li class="list">
        <span class="label">배송비</span>
        <span class="format-price">
          <span class="box__format-amount">
            <strong class="text__value">무료</strong>
            <span class="text__unit"></span>
          </span>
        </span>
      </li>
    </ul>
  </div>
  
  <div class="order_summary">
    <strong class="label">총 결제금액</strong>
    <span class="format-price">
      <span class="box__format-amount">
        <strong class="text__value">211,200</strong>
        <span class="text__unit">원</span>
      </span>
    </span>
  </div>
  
  <div class="order_action fixed">
    <div class="flex_wrap">
      <div class="flex add_line">
        <div class="summary">
          <span class="summary__sale--amount">
            <span class="box__sale-amount">
              <span class="text__sale--value">30,400</span>
              <span class="text__unit">원</span>
              <span class="text__sale--summary"> 할인 적용 중</span>
            </span>
          </span>
          <span class="format-price">
            <span class="box__format-amount">
              <strong class="text__value">211,200</strong>
              <span class="text__unit">원</span>
            </span>
          </span>
        </div>
      </div>
      <div class="flex">
        <button class="btn_submit" data-montelena-acode="200002867">
          <span class="text">구매하기</span>
          <span class="item--qty">5<span class="for-a11y">개 상품</span></span>
        </button>
      </div>
    </div>
  </div>
</div>
	</div>
	</div>
	
	
</body>
</html>