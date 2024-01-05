<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	                    <form>
	                    	<p class="price"><span>가격</span><span class="emph"> ${vo.price}</span></p>
	                    	<!-- 수량 -->
	                    	<div class="number"> </div>
	                    	<!-- 총 가격 -->
	                    	<div class="totalPrice"></div>
	                    	<div class="btnWrap">
	                    		<button value="장바구니" id="cartBtn" class="btn">장바구니</button>
	                    		<button value="구매하기" id="buyBtn" class="btn">구매하기</button>
	                    		<button value="목록" id="listBtn" class="btn">목록</button>
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
               			<li id="reserveBtn">문의하기</li>
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
                	
                	<div id="mapCont" class="tab-content" style="display: none;">
				        <!-- 지도/주변 추천 내용 -->
				        지도/주변 추천 내용을 입력하세요.
				    </div>
				    
				    <div id="reviewCont" class="tab-content" style="">
				        <!-- 리뷰 내용 -->
				        <button value="리뷰 작성" class="btn" id="reviewInsertBtn">리뷰 작성</button>
				        <div class="review-list">
				        	<div class="review-profile">
				        		<div class="profile">
				        			<div class="profile-icon">
				        				<img src="../images/icon_user.png" alt="프로필 이미지">
				        			</div>
					        		<h4>kim1234<br>
					        			<span class="regdate">2024.01.05</span>
					        		</h4>
				        		</div>
				        		<span class="score">★★★★★</span>
				        	</div>
				        	
				        	<div class="review-item">
				        		<img src="../images/visual3.jpg" class="review-img" alt="후기 이미지">
				        		<p class="cont">9월에 별바다부산 나이트페스타에 가봤어요! 다대포의 해변공원에서 나이트뮤직캠크닉 공연이 있었어요 ㅎㅎ 저는 미리 예약하고 티켓이랑 매트, 맥주, 간식도 받았어요~ 사람들이 매트를 가지고 와서 가족과 친구들과 소풍을 하면서 공연을 봤어요~너무 좋았어요! 분위기 좋았고 노래를 들면서 저녁을 먹고 좋은 시간을 보냈어요~   	나이트뮤직캠크닉이 다음 달도 있을거니까 안 가봤으면 추천합니다!</p>
				        	</div>
				        	
				        	<button value="댓글" class="btn" id="reviewCommentBtn">댓글</button>
					        
					        <div class="review-comment">
					        	<ul class="review-comment-list">
					        		<li>
					        			<h5>lee5678<br>
					        				<span class="regdate">2024.01.05</span>
					        			</h5>
					        			<p class="comment">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용</p>
					        			<ul class="review-comment-reply">
					        				<li>
					        					<h5>park0000<br>
					        					<span class="regdate">2024.01.05</span>
							        			</h5>
							        			<p class="comment">답글 내용 답글 내용 답글 내용 답글 내용 답글 내용 답글 내용</p>
					        				</li>
					        			</ul>
					        		</li>
					        	</ul>
					        </div>
				        </div>
				        
				        <div class="review-insert">
					        <form method="post" action="">
								<table class="table">
									<tr>
										<th width=10%>아이디</th>
										<td width=90%>아이디</td>
									</tr>
									<tr>
										<th width=10%>평점</th>
										<td width=90%>
											<input type="text" name="score" required>
										</td>
									</tr>
									<tr>
										<th width=10%>이미지 첨부</th>
										<td width=90%>
											<input type="file" name="img" required>
										</td>
									</tr>
									<tr>
										<th width=10%>내용</th>
										<td width=90%>
											<textarea rows="10" cols="60" name=content required style="resize: none"></textarea>
										</td>
									</tr>
									<tr>
										<th width=10%>비밀번호</th>
										<td width=90%>
											<input type="password" name="pwd" required>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="text-center">
											<button class="btn-sm btn-success" value="취소" id="reviewIsertOkBtn">글쓰기</button>
						           			<button class="btn-sm btn-info" value="취소" id="reviewCancelBtn" onclick="javascript:history.back()">취소</button>
						         		</td>
						       		</tr>
						    	</table>
						    </form>
					    </div>
				    </div>
				    <!-- <div id="reserveCont" class="tab-content" style="display: none;">
				        예약하기 내용
				        예약하기 내용을 입력하세요.
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