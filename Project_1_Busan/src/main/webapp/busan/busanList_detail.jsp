<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript">
/* //JavaScript
// 이벤트 리스너를 이용하여 탭 버튼에 클릭 이벤트 추가
document.addEventListener('DOMContentLoaded', function() {
// 각 탭 버튼(li 요소)를 가져와서 클릭 이벤트를 추가
 var tabButtons = document.querySelectorAll('.tab-menu li');
 for (var i = 0; i < tabButtons.length; i++) {
     tabButtons[i].addEventListener('click', function(event) {
         // 클릭된 탭 버튼의 id를 추출하여 해당하는 탭을 보여줌
         var tabId = event.target.id;
         showTab(tabId);
     });
 }
});

function showTab(tabName) {
 // 모든 탭 컨텐츠를 숨김
 var tabContents = document.getElementsByClassName('tab-content');
 for (var i = 0; i < tabContents.length; i++) {
     tabContents[i].style.display = 'none';
 }

 // 선택한 탭에 해당하는 컨텐츠만 보여줌
 var selectedTab = document.getElementById(tabName + 'Cont');
 if (selectedTab) {
     selectedTab.style.display = 'block';
 }
} */
// JavaScript 코드
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

<div id="busan" class="detail">   
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
	                    <h1>${vo.title}</h1>
	                    <div class="heart">
	                    	<span>좋아요 수</span>
	                    	<button>좋아요</button>
	                    </div>
	                    <div class="jjim">
	                    	<span>찜하기 수</span>
	                    	<button>찜하기</button>
	                    </div>
	                </div>
            	</div>

                <!-- 탭 메뉴 -->
                <div class="product-detail">
               		<ul class="tab-menu">
               			<li id="detail">상세 설명</li>
               			<li id="map">지도/주변 추천</li>
               			<li id="review">리뷰</li>
               			<li id="reserve">예약하기</li>
               		</ul>
               		
               		<!-- <div class="shop-header-line">
	                    <div class="shop-header-color"></div>
	                </div> -->
	                
               		<div id="detailCont" class="tab-content">
	               		<div class="detail-info">              		
	               			<!-- 상세 이미지 -->
							<c:forEach var="dimg" items="${vo.deimage}" varStatus="d">
							    <c:if test="${d.index < fn:length(vo.deimage) - 1}">
							        <img class="deimage" src="${dimg}" alt="상세 이미지"> 
							    </c:if>
							</c:forEach>
	                    	
	                    	<!-- 상세 설명 -->
	                    	<p class="cont">${vo.cont}</p>
	                    	
	                    	<!-- 테이블 -->
		                    <div class="detail-table">
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
		                    </div>
	
		                    <!-- 해시 태그 -->
		                    <div class="tag-list">
		                    	<h5>연관 태그</h5>
			                    <c:forEach var="tag" items="${vo.tag}">
			                    	<a href="#"><span>${tag}</span></a>
			                    </c:forEach>
		                    </div>
		                </div>
               		</div>
               		
             		<div id="mapCont" class="tab-content" style="display: none;">
				        <!-- 지도/주변 추천 내용 -->
				        지도/주변 추천 내용을 입력하세요.
				    </div>
				    <div id="reviewCont" class="tab-content" style="display: none;">
				        <!-- 리뷰 내용 -->
				        리뷰 내용을 입력하세요.
				    </div>
				    <div id="reserveCont" class="tab-content" style="display: none;">
				        <!-- 예약하기 내용 -->
				        예약하기 내용을 입력하세요.
				    </div>
				    
                </div>
            </div>
        </div>
    </div>
    
    <div class="section">
        <div class="wrapper">
            <div class="shop-header">
                <h3>추천</h3>
                <a href="#" class="link arrow-link">전체보기</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <div class="full-width w-dyn-list">
                <div role="list" class="products w-dyn-items">
                    <div data-w-id="df75c36d-8d89-3a15-6c0d-6078372525bd" style="opacity:0" role="listitem" class="product-card-wrapper w-dyn-item">
                        <a href="#" class="product-card w-inline-block">
                            <div class="product-card-image-wrapper">
                                <img alt="썸네일 이미지" src="https://assets.website-files.com/5baddb6a35e113da0e9a4802/5baf5171ace69cb064b33d42_33388-1-wooden-toy-photos-min.png" data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_main_image_4dr%22%2C%22to%22%3A%22src%22%7D%5D" sizes="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw" srcset="https://assets.website-files.com/5baddb6a35e113da0e9a4802/5baf5171ace69cb064b33d42_33388-1-wooden-toy-photos-min-p-500.png 500w, https://assets.website-files.com/5baddb6a35e113da0e9a4802/5baf5171ace69cb064b33d42_33388-1-wooden-toy-photos-min.png 1200w"/>
                            </div>
                            <h6 class="product-card-heading">Happy Dog</h6>
                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price">$ 30.00 USD</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
