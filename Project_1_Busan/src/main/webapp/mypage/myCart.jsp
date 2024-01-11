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
	height: 99px;
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
 .total_num_txt {
    color: #999;
    font-size: 20px;
}
.table>tbody>tr>td{
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 0px solid #ddd; 
} 
    .cancel-button {
        padding: 3px 8px; /* 원하는 패딩 값으로 조절 */
       /*  font-size: 16px; /*  */원하는 글자 크기로 조절 */
    }  
</style>
<script type="text/javascript">
function cancelGoods(cno) {
    let confirmation = confirm("상품을 삭제 하시겠습니까?");
    if (confirmation) {
        location.href = "../mypage/mypage_goods_cancel.do?cno=" + cno;
    }
}
/*$(function(){
	$('#sel').change(function(){
		let price=$('#buyBtn').attr("data-price")
		let count=$(this).val()
		let total=Number(price)*count;
		$('#total').text(total)
	})
})*/
$(function(){
	$(document).ready(function(){
		  $('.amount').on("change",function(){
			  let amount=$(this).val()
			  let cno=$(this).attr("data-cno")
			  location.href="../mypage/mypage_mycart_chg.do?amount="+amount+"&cno="+cno
		  })

	})
});
/*$(function(){
	$(document).ready(function(){
		  $('.amount').on("change",function(){
			  let amount=$(this).val()
			  let cno=$(this).attr("data-cno")
			  location.href="../mypage/mypage_mycart_chg.do?amount="+amount+"&cno="+cno
		  })

	})
});*/
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
<!-- 결제 API -->
var IMP = window.IMP; // 생략 가능
IMP.init("imp80485780"); // 예: imp00000000 
function requestPay() {
	console.log('clicked');
  // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    
	        /*
	            'kakaopay':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	            'nice':나이스,
	            'jtnet':jtnet,
	            'uplus':LG유플러스
	        */
	        
	    // 출력할 내용을 Session에 등록하기
	    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $('#gname').text(), /* $('#title').text(), */
	    amount : $('#buyBtn').attr('total'), /* $('#price').attr('data-price'), */
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    app_scheme : 'iamporttest' // in app browser결제에서만 사용 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;s
	    } else {
	        var msg = '결제에 완료되었습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        /*let price=$('#buyBtn').attr("data-price")
			let count=$('.amount').val()*/
			let cno=$('#buyBtn').attr("data-no")
			
			$.ajax({
				type:'post',
				url:'../mypage/mygoods_buy.do',
				data:{"cno":cno}, 
				success:function(result){
					// 마이페이지 이동
					if(result=='yes'){
						alert("구매에 성공했습니다.")
						location.href="../mypage/myPurchase.do"	
					} else {
						alert("구매에 실패했습니다.")
					}
				}
			})
	    }
	})
}

$(function(){
	$('#buyBtn').click(function(){
		requestPay()
	})
})
</script>
</head>
<body>
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">&nbsp;&nbsp;&nbsp;나의<strong>장바구니</strong></h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 <strong>${total}</strong>개의 상품이 있습니다.</span></p>
   	  </div>
	<div class="container">
  		<div class="left">
	<table class="table table-borderless">
		<tr>
			<td><c:forEach var="vo" items="${list }"> 
					<div style="border: solid 1px; border-color: gainsboro; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
							<tr>
								<td rowspan="2" width="15%"><img src="${vo.gvo.poster }"
									class="reserveImg"></td>
								<td width="65%" style="font-size: 17px; font-weight: bold;"
									id="gname">${vo.gvo.gname }</td>
								<!-- <td width="15%"><a href="../mypage/mypage_reserve_delete.do?jrno=" class="btn btn-outline-danger rcanBtn">예약소취</a></td> -->
									<td>
										<select class="amount" data-cno=${vo.cart_no } >
											<option ${vo.amount=='1'?"selected":"" } value=1>1</option>
											<option ${vo.amount=='2'?"selected":"" } value=2>2</option>
											<option ${vo.amount=='3'?"selected":"" } value=3>3</option>
											<option ${vo.amount=='4'?"selected":"" } value=4>4</option>
											<option ${vo.amount=='5'?"selected":"" } value=5>5</option>
											<option ${vo.amount=='6'?"selected":"" } value=6>6</option>
											<option ${vo.amount=='7'?"selected":"" } value=7>7</option>
											<option ${vo.amount=='8'?"selected":"" } value=8>8</option>
											<option ${vo.amount=='9'?"selected":"" } value=9>9</option>
											<option ${vo.amount=='10'?"selected":"" } value=10>10</option>
										</select>
										<input type="button" value="삭제" onclick="cancelGoods(${vo.cart_no})" class="cancel-button" >
										
									</td> 
							</tr>
							<tr>
								<td width="100%" style="color: #0923a9;">
									<p id="total" 
										style="text-align: right; margin-right: 30px; font-weight: bold; font-size: 18pt" >
										<fmt:formatNumber value="${vo.amount * vo.gvo.price}" pattern="#,###" />
										원
									</p></td>
								<td width="">
									<span>
										<input type="button" class="btn btn-sm btn-info" value="구매" id="buyBtn"
											data-gno="${vo.gno}"
											data-price="${vo.gvo.price}"
											data-no="${vo.cart_no}"
											total="${vo.amount * vo.gvo.price}">
									</span>
								</td> 
							</tr>
						</table>
					</div>
					<div style="height: 15px;"></div>
				</c:forEach> </td>
		</tr>
	</table>
	</div>
	
<%-- 	
         <link rel="stylesheet" type="text/css" href="../css/cart1.css" />
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
          <strong class="text">${total}</strong>
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
	</div> --%>
	</div>
	
	
</body>
</html>