<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('#checkall').click(function() {
			if ($('#checkall').is(':checked')) {
				$('.checkbox').prop("checked", true);
				$('#buyBtn').prop("disabled", false);
				$('#agreeMsg').hide();
			} else {
				$('.checkbox').prop("checked", false);
				$('#buyBtn').prop("disabled", true);
				$('#agreeMsg').show();
			}
		});
		$('.checkbox').click(
				function() {
					if ($('#check1').is(':checked')
							&& $('#check2').is(':checked')
							&& $('#check3').is(':checked')) {
						$('#checkall').prop("checked", true);
						$('#reserveBtn').prop("disabled", false);
						$('#agreeMsg').hide();
					} else {
						$('#checkall').prop("checked", false);
						$('#reserveBtn').prop("disabled", true);
						$('#agreeMsg').show();
					}
				})
		$(window).scroll(
				function() {
					$("#yourDiv").css("margin-top",
							Math.max(-450, 0 - $(this).scrollTop()));
				});
	})

	Shadowbox.init({
		players : [ 'iframe' ]
	})

	$(function() {
		$('#agreeBtn1').click(function() {
			Shadowbox.open({
				content : '../activity/agreeBtn1.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 제공 동의 (필수)'
			})
		})

		$('#agreeBtn2').click(function() {
			Shadowbox.open({
				content : '../activity/agreeBtn2.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 수집 및 이용 동의 (필수)'
			})
		})

		$('#agreeBtn3').click(function() {
			Shadowbox.open({
				content : '../activity/agreeBtn3.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 국외 이전 동의 (필수)'
			})
		})

	
		$('#buyBtn').click(function() {
	        // JSP 변수에서 값을 가져와 JavaScript 변수에 할당
	        let erno = $('#buyBtn').attr("data-no"); // erno 값 설정
	        let inwon = $('#inwon').val(); // 인원 수
	        let price = $('#price').val(); // 가격
	        let tprice = $('#total_price').attr('data-total'); // 총 가격
	        let dbday = $('#dbday').val(); // 예약 날짜

	        $.ajax({
	            type : 'post',
	            url : '../mypage/mypage_activity_reserve.do',
	            data : {
	                "erno" : erno,
	                "inwon" : inwon,
	                "price" : price,
	                "tprice" : tprice,
	                "dbday" : dbday
	            },
	            success : function(result) {
	                requestPay()
	            }
	        })
	    })

	})

	var IMP = window.IMP; // 생략 가능
	IMP.init("imp36806187"); // 예: imp00000000
	function requestPay() {
		console.log('clicked');
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			/*
			    'kakao':카카오페이,
			    'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
			    'nice':나이스,
			    'jtnet':jtnet,
			    'uplus':LG유플러스
			 */
			pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $('#name').text(),
			amount : $('#total_price').attr('data-total'),
			buyer_email : $('#email').text(),
			buyer_name : $('#name').text(),
			buyer_tel : $('#phone').text(),
			buyer_addr : $('#addr'+'#detail_addr').val(),
			buyer_postcode : $('#post').val(),
			app_scheme : 'iamporttest' //in app browser결제에서만 사용 
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				location.href = "../mypage/mypage_reserve.do";
			}
		});
	}
</script>
</head>
<body>
	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="top-text header-text"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h3>
					<strong>예약하기</strong>
				</h3>
				<div style="height: 30px"></div>
				<h4>
					<strong>상품정보</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td rowspan="2" width="20%"><img src="${vo.poster }"
							class="reserveImg"></td>
						<td width="80%" style="font-size: 17px; font-weight: bold;"
							id="title">${vo.ename }</td>
					</tr>
					<tr>
						<td style="color: gray">${rdate }</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">인원별 가격</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price }" pattern="#,###" />원</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">인원수</td>
						<td width="80%" class="text-right">${inwon }명</td>
					</tr>
					<tr>
						<td width="20%">총 상품 금액</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price*inwon }" pattern="#,###" />원</td>
					</tr>
				</table>
				<div style="height: 20px"></div>
				<h4>
					<strong>예약자</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td id="name">${name }</td>
					</tr>
					<tr>
						<td id="email">${mvo.email }</td>
					</tr>
					<tr>
						<td id="phone">${mvo.phone }</td>
					</tr>
				</table>

				<div style="height: 20px"></div>
				<h4>
					<strong>결제 방법</strong>
				</h4>
				<hr>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
				  	<label class="form-check-label" for="flexRadioDefault1">
				    신용/체크카드
				  	</label>
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    카카오페이
				 	</label>
				 	<img src="../assets/images/kakao.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    토스페이
				 	</label>
				 	<img src="../assets/images/toss.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    네이버페이
				 	</label>
				 	<img src="../assets/images/naver.png" class="payImg">
				</div>
				<div style="height: 7px;"></div>
				<div class="form-check">
				  	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  	<label class="form-check-label" for="flexRadioDefault2">
				    페이코
				 	</label>
				 	<img src="../assets/images/payco.png" class="payImg">
				</div>
				<div style="height: 100px"></div>
			</div>
			<div class="col-sm-4" style="color: black" id="yourDiv">
				<div class="buyBox">
					<div class="buyBoxContent">
						<table class="table buyBoxAll">
							<tr>
								<td colspan="2">
									<div style="height: 15px;"></div>
									<h4>
										<strong>결제 정보</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr height="60px;"
								style="verticS
								al-align: middle; font-size: 10pt;">
								<td>주문 금액</td>
								<td><fmt:formatNumber value="${vo.price*people }"
										pattern="#,###" />원</td>
							</tr>
							<tr height="60px;"
								style="vertical-align: middle; background-color: rgb(246, 251, 255);">
								<td style="color: rgb(80, 150, 230);"><strong>총 결제
										금액</strong></td>
								<td style="font-size: 20pt; color: rgb(80, 150, 230);"><b>
										<fmt:formatNumber value="${vo.price*people }" pattern="#,###" />원
								</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="height: 20px;"></div>
									<h4>
										<strong>약관 안내</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input class="checkbox" style="zoom: 2.0;"
									type="checkbox" id="checkall"> <label
									style="position: relative; bottom: 6px;">전체 약관 동의</label>
									<table class="table buyBoxAll" style="font-size: 12pt;">
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check1"> <label
												style="position: relative; bottom: 6px;">개인정보 제공 동의
													(필수) </label>
												<button id="agreeBtn1">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check2"> <label
												style="position: relative; bottom: 6px;">개인정보 수집 및
													이용 동의 (필수) </label>
											<button id="agreeBtn2">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check3"> <label
												style="position: relative; bottom: 6px;">개인정보 국외 이전
													동의 (필수) </label>
											<button id="agreeBtn3">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr id="agreeMsg">
											<td style="color: orange; font-size: 10pt;">약관에 동의해주세요.</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td colspan="2" class="center wishTd">
									<div class="d-grid">
										<input type="hidden" id="total_price"
											data-total="${vo.price*people }"> <input
											type="hidden" id="post" value="${mvo.postcode }"> <input
											type="hidden" id="addr1" value="${mvo.addr }"> <input
											type="hidden" id="inwon" value="${inwon }"> <input
											type="hidden" id="price" value="${vo.price }"> <input
											type="hidden" id="dbday" value="${rdate }">
										<button class="btn btn-block btn-primary btn-wish"
											style="height: 50px;" disabled="disabled" id="buyBtn"
											data-no="${vo.erno }">
											<h5>
												<strong> <fmt:formatNumber
														value="${vo.price*inwon }" pattern="#,###" />원 결제하기
												</strong>
											</h5>
										</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>