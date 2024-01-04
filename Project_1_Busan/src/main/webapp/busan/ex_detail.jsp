<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html data-wf-page="5baddb6a35e11306e19a4806" data-wf-site="5badda2935e11303a89a461e">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<title>Busan Tour</title>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Include Kakao Maps API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fce1f2ebd7aeec53bebf70c1f38c36c7&libraries=services"></script>

<script type="text/javascript">
    var mapInitialized = false;
    var map, geocoder;

    function initMap() {
        var container = document.getElementById('kkomap');
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
        };

        map = new kakao.maps.Map(container, options);
        geocoder = new kakao.maps.services.Geocoder();
        mapInitialized = true;
    }

    function showMap(address) {
        if (!mapInitialized) {
            initMap();
        }

        map.relayout();
        map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));

        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.loc}</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(coords);
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        var tabButtons = document.querySelectorAll('.tab-menu li');
        for (var i = 0; i < tabButtons.length; i++) {
            tabButtons[i].addEventListener('click', function(event) {
                var tabId = event.target.id + 'Cont';
                showTab(tabId);
                if (event.target.id === 'map' && !mapInitialized) {
                    showMap('${vo.loc}');
                }
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('#reservationButton').click(function() {
        $.ajax({
            url: '/reserve/date.jsp', // 경로 수정
            type: 'get',
            success: function(response) {
                // 성공적으로 페이지를 불러왔을 때의 처리
                // 예: 모달로 표시하는 경우
                $('#modalContainer').html(response);
                $('#modalContainer').show();
            },
            error: function() {
                alert('예약 페이지를 불러오는데 실패했습니다.');
            }
        });
    });
});

</script>


</head>
<body>
	<div id="ex" class="detail">   
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
		                    <h1>${vo.ename}</h1>
	                    	<h3>${vo.eename}</h3>
	                    	<form>
	                    		<div class="buy-buttons">
	                                <input type="submit" value="예약하기" class="w-commerce-commerceaddtocartbutton button add-to-cart-button" id="reservationButton"/>
	                                
	                            </div>
	                    	</form>
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
	                    	
	                    	
	                    	
	                    	<!-- 테이블 -->
		                    <div class="detail-table">
		                    	<div class="product-table">
			                        <div class="product-table-cell">
			                            <div>전시회명</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.ename}</div>
			                            </div>
			                        </div>
			                        <div class="product-table-cell">
			                            <div>영문명</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_height_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.eename}</div>
			                            </div>
			                        </div>
			                        <div class="product-table-cell">
			                            <div>전시 분야</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.efield}</div>
			                            </div>
			                        </div>
			                         <div class="product-table-cell">
			                            <div>카테고리</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.eitem}</div>
			                            </div>
			                        </div>

			                         <div class="product-table-cell">
			                            <div>홈페이지</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.homepage}</div>
			                            </div>
			                        </div>
			                         <div class="product-table-cell">
			                            <div>전시 기간</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.s_date}~${vo.e_date }</div>
			                            </div>
			                        </div>
			                         <div class="product-table-cell">
			                            <div>개최 장소</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.loc}</div>
			                            </div>
			                        </div>
			                         <div class="product-table-cell">
			                            <div>주관</div>
			                            <div class="product-table-info">
			                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.host}</div>
			                            </div>
			                        </div>
			                       <div class="product-table-cell no-border-bottom">
										  <div>요금</div>
										  <div class="product-table-info">
										    <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">
										      <c:choose>
										        <c:when test="${vo.price == 0}">
										          free
										        </c:when>
										        <c:otherwise>
										          ${vo.price}원
										        </c:otherwise>
										      </c:choose>
										    </div>
										  </div>
										</div>
			                       
			                    </div>
		                    </div>
	
		                   
		                </div>
               		</div>
               		<div id="mapCont" class="tab-content" style="display: none;">
               		지도 표시
                 <div id="kkomap" style="width:100%;height:350px;"></div>
                    </div>
				    <div id="reviewCont" class="tab-content" style="display: none;">
				        <!-- 리뷰 내용 -->
				        리뷰 내용을 입력하세요.
				        <!-- <form method="post" action="insert_ok.do">
							<table class="table">
								<tr>
									<th width=10% class="text-center">이름</th>
									<td width=90%>
										<input type=text name=name size=20 required class="input-sm">
									</td>
								</tr>
								<tr>
									<th width=10% class="text-center">제목</th>
									<td width=90%>
										<input type=text name=subject size=55 required class="input-sm">
									</td>
								</tr>
								<tr>
									<th width=10% class="text-center">내용</th>
									<td width=90%>
										<textarea rows="10" cols="60" name=content required></textarea>
									</td>
								</tr>
								<tr>
									<th width=10% class="text-center">비밀번호</th>
									<td width=90%>
										<input type="password" name=pwd size=10 required class="input-sm">
									</td>
								</tr>
								<tr>
									<td colspan="2" class="text-center">
										<button class="btn-sm btn-success">글쓰기</button>
					           			<input type=button class="btn-sm btn-info" value="취소" onclick="javascript:history.back()">
					         		</td>
					       		</tr>
					    	</table>
					    </form> -->
				    </div>
				    <div id="reserveCont" class="tab-content" style="display: none; id="reservationButton">
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
	                <h3>추천 전시</h3>
	                <a href="#" class="link arrow-link">전체보기</a>
	                <div class="shop-header-line">
	                    <div class="shop-header-color"></div>
	                </div>
	            </div>
	            <div class="full-width w-dyn-list">
	                <div role="list" class="products w-dyn-items">
	                    <div data-w-id="df75c36d-8d89-3a15-6c0d-6078372525bd" style="opacity:0" role="listitem" class="product-card-wrapper w-dyn-item">
	                        <a href="/product/happy-dog" class="product-card w-inline-block">
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
<!-- <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5badda2935e11303a89a461e" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
<script src="https://assets.website-files.com/5badda2935e11303a89a461e/js/webflow.9828d3d6a.js" type="text/javascript"></script>
</body>
</html>