<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
		    name : $('#title').text(), /* $('#title').text(), */
		    amount : $('#price').attr("data-price"), /* $('#price').attr('data-price'), */
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
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        let price=$('#price').attr("data-price")
				let count=$('#sel').val()
				let no=$('#cart').attr("data-no")
				let type=$('#cart').attr("data-type")
				
				$.ajax({
					type:'post',
					url:'../goods/cart_buy.do',
					data:{"no":no, "count":count, "price":price}, 
					success:function(result){
						// 마이페이지 이동
						if(result=='yes'){
							location.href="../mypage/mypage_buy.do"	
						} else {
							alert("구매에 실패했습니다.")
						}
					}
				})
		    }
		})
	}


	$(function(){
		$('#sel').change(function(){
			let price=$('#price').attr("data-price")
			let count=$(this).val()
			let total=Number(price)*count;
			$('#total').text(total)
		})
		
		$('#cartBtn').click(function(){
			let price=$('#price').attr("data-price")
			let count=$('#sel').val()
			let no=$(this).attr("data-no")
			/* let msg="가격:"+price+"\n"
					+"수량:"+count+"\n"
					+"상품번호:"+no+"\n"
			alert(msg) */
			
			$.ajax({
				type:'post',
				url:'../goods/cart_insert.do',
				data:{"no":no, "count":count, "price":price}, 
				success:function(result){
					// 마이페이지 이동
					if(result=='yes'){
						location.href="../mypage/mypage_cart.do"	
					} else {
						alert("장바구니에 추가가 불가합니다.")
					}
				}
			})
		})
		
		$('#buyBtn').click(function(){
			requestPay()
		})
	})
</script>

<!-- JavaScript 코드 -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var tabButtons = document.querySelectorAll('.tab-menu li');
    for (var i = 0; i < tabButtons.length; i++) {
        tabButtons[i].addEventListener('click', function(event) {
            var tabId = event.target.id + 'Cont';
            showTab(tabId);
        });
    }
});

function showTab(tabName) {
    var tabContents = document.getElementsByClassName('tab-content');
    for (var i = 0; i < tabContents.length; i++) {
        tabContents[i].style.display = 'none';
    }

    var selectedTab = document.getElementById(tabName);
    if (selectedTab) {
        selectedTab.style.display = 'block';
    }
}
</script>




<div id="goods" class="detail">
    <!-- <div class="section no-padding-vertical">
        <div class="wrapper side-paddings">
            <div class="breadcrumbs">
                <a href="/" class="link-grey">Home</a>
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5baf79eb570913b9781a96f2_arrow-right-mini-icon.svg" alt="" class="breadcrumbs-arrow"/>
                <a href="/catalog" class="link-grey">Catalog</a>
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5baf79eb570913b9781a96f2_arrow-right-mini-icon.svg" alt="" class="breadcrumbs-arrow"/>
                <div>Teddy Bear</div>
            </div>
        </div>
    </div> -->
    
    <div class="section no-padding-vertical">
        <div class="wrapper side-paddings">
            <div class="product">
            	<div class="product-top">
            		<div class="product-poster">
	                    <img alt="대표 이미지" src="${vo.poster}" sizes="(max-width: 479px) 83vw, (max-width: 767px) 75vw, (max-width: 991px) 76vw, 32vw" />
	                </div>
	            
	                <div class="product-info">
	                    <h1>${vo.gname}</h1>
	                    <p class="origin"><span>원산지 </span><span class="emph"> ${vo.origin}</span></p>
	                    <p class="manufacturer"><span>제조사 </span><span class="emph"> ${vo.manufacturer}</span></p>
	                    <p class="delivery-info"><span>배송</span><span class="emph"> 무료 배송</span></p>
	                    <form>
	                    	<p class="price"><span>가격 </span><span class="emph" id="price" data-price="${vo.price}"> ${vo.price}원</span></p>
	                    	<!-- 수량 -->
	                    	<div class="number">
	                    		<span>수량 </span>
	                    		<span class="emph">
									<select id="sel">
										<option value="1">1개</option>
										<option value="2">2개</option>
									 	<option value="3">3개</option>
									 	<option value="4">4개</option>
									 	<option value="5">5개</option>
									 	<option value="6">6개</option>
									 	<option value="7">7개</option>
										<option value="8">8개</option>
									 	<option value="9">9개</option>
									 	<option value="10">10개</option>
									</select>
								</span>
	                    	</div>
	                    	<!-- 총 금액 -->
	                    	<div class="totalPrice">
	                    		<span>총 금액</span>
	                    		<span id="total" class="emph">${vo.price}</span>원
	                    	</div>
	                    	<div class="btnWrap">
	                    		<button value="장바구니" id="cartBtn" class="btn" data-no="${vo.gno}">장바구니</button>
	                    		<c:if test="${sessionScope!=null}">
	                    			<button value="구매하기" id="buyBtn" class="btn">구매하기</button>
	                    		</c:if>
	                    		<button value="목록" id="listBtn" class="btn" onclick="javascript:history.back()">목록</button>
	                    	</div>
	                    </form>
	                </div>
            	</div>

                <!-- 탭 메뉴 -->
                <div class="product-detail">
               		<ul class="tab-menu">
               			<li id="detailBtn">상세 설명</li>
               			<!-- <li id="mapBtn">지도/주변 추천</li> -->
               			<li id="reviewBtn">리뷰</li>
               			<!-- <li id="inquiryBtn">문의</li> -->
               		</ul>
               		<!-- <div class="shop-header-line">
	                    <div class="shop-header-color"></div>
	                </div> -->
               		<div id="detailCont">
	               		<div class="detail-info">              		
	               			<!-- 상세 이미지 -->
							<img class="deimage" src="${vo.dimage}" alt="상세 이미지"> 
	                    	
	                    	<!-- 상세 설명 -->
	                    	<p class="cont"></p>
	                    	
	                    	<!-- 테이블 -->
		                    <%-- <div class="detail-table">
		                    	<div class="product-table">
			                        <div class="product-table-cell">
			                            <div>주소</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.addr}</div>
			                                <!-- <div>in</div> -->
			                            </div>
			                        </div>
			                        <div class="product-table-cell">
			                            <div>전화번호</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_height_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.phone}</div>
			                                <!-- <div>in</div> -->
			                            </div>
			                        </div>
			                        <div class="product-table-cell">
			                            <div>운영시간</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.bhour}</div>
			                                <!-- <div>in</div> -->
			                            </div>
			                        </div>
			                        <div class="product-table-cell no-border-bottom">
			                            <div>요금</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.rate}</div>
			                                <!-- <div>oz</div> -->
			                            </div>
			                        </div>
			                    </div>
		                    </div> --%>
	
		                    <!-- 해시 태그 -->
		                    <%-- <div class="tag-list">
		                    	<h5>연관 태그</h5>
			                    <c:forEach var="tag" items="${vo.tag}">
			                    	<a href="#"><span>${tag}</span></a>
			                    </c:forEach>
		                    </div> --%>
		                </div>
               		</div>
                	
                	<!-- <div id="mapCont" class="tab-content" style="display: none;">
				        지도/주변 추천 내용
				        지도/주변 추천 내용을 입력하세요.
				    </div> -->
				    
				    <div id="reviewCont" class="tab-content" style="display:none">
				        <!-- 리뷰 내용 -->
				        <jsp:include page="../busan/review.jsp"></jsp:include>
				    </div>
				    <!-- <div id="reserveCont" class="tab-content" style="display: none;">
				        예약하기 내용
				        예약하기 내용을 입력하세요.
				    </div> -->
				    
				    <!-- <div id="inquiryCont" class="tab-content" style="display: none;">
				        문의 내용
				        문의 내용을 입력하세요.
				    </div> -->
                </div>
            </div>
        </div>
    </div>
    
    <div class="section">
        <div class="wrapper">
            <div class="shop-header">
                <h3>추천 상품</h3>
                <a href="../store/goods.do" class="link arrow-link">전체보기</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <div class="full-width w-dyn-list">
                <div role="list" class="products w-dyn-items">
                	<c:forEach var="vo" items="${list}" begin="0" end="7">
	                    <div role="listitem" class="product-card-wrapper w-dyn-item">
	                        <a href="../store/goods_detail.do?gno=${vo.gno}" class="product-card w-inline-block">
	                            <div class="product-card-image-wrapper">
	                                <img alt="" src="${vo.poster}" size="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw"/>
	                            </div>
	                            <h6 class="product-card-heading">${vo.gname}</h6>
	                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price">${vo.price}</div>
	                        </a>
	                    </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>