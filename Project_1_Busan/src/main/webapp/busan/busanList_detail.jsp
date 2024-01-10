<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Include Kakao Maps API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fce1f2ebd7aeec53bebf70c1f38c36c7&libraries=services"></script>

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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
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
                    showMap('${vo.addr}');
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

/*     $(function(){
        $('.reUp').click(function(){
        	$(this).text('취소'); 
        	$('.update').show();
        });
    }); */
    /* let storedJjimState = localStorage.getItem('jjimState');
    let storedJjimNo = localStorage.getItem('no');
    let jjimno = $('.jjimBtn').attr("data-no");
    if (storedJjimState === 'ok'&&storedJjimNo===jjimno) {
        $('.jjim_img').attr('src', '../busan/jjim.png');
    } else if (storedJjimState === 'no') {
        $('.jjim_img').attr('src', '../busan/jjim_none.png');
    } */
    $(document).ready(function() {
        let count = parseInt($('.jjim').attr('data-count'), 10); // 문자열을 숫자로 변환

        if (count === 1) {
            $('.jjim_img').attr('src', '../busan/jjim.png');
        } else if (count === 0) {
            $('.jjim_img').attr('src', '../busan/jjim_none.png');
        }
    });

    
    
    $(function(){
    	
    	$('.reUp').click(function(){
            var buttonText = $(this).text();
            
            if(buttonText === '취소') {
                // '취소'일 때의 동작
                $(this).text('수정');
                $('.update').hide();
            } else {
                // '취소'가 아닐 때의 동작
                $(this).text('취소');
                $('.update').show();
            }
        });
        
        $('.replyBtn').click(function(){
            var buttonText = $(this).text();
            
            if(buttonText === '취소') {
                // '취소'일 때의 동작
                $(this).text('답글쓰기');
                $('.reply').hide();
            } else {
                // '취소'가 아닐 때의 동작
                $(this).text('취소');
                $('.reply').show();
            }
        });
        
        $('.jjimBtn').click(function() {
            let no = $(this).attr("data-no");            
            let cateno = $(this).attr("data-cateno");

            $.ajax({
                type: 'post',
                url: '../busan/jjim.do',
                data: {'no': no, 'cateno': cateno},
                success: function(result) {
                    if (result === 'ok') {
                        alert("찜하기가 완료되었습니다");
                        $('.jjim_img').attr('src', '../busan/jjim.png');
                        localStorage.setItem('jjimState', 'ok');  // 찜 상태를 Local Storage에 저장
                        localStorage.setItem('no', no);
                    } else if (result === 'no') {
                        alert("찜하기가 취소되었습니다");
                        $('.jjim_img').attr('src', '../busan/jjim_none.png');
                        localStorage.setItem('jjimState', 'no');  // 찜 상태를 Local Storage에 저장
                        localStorage.setItem('no', no);
                    }
                }
            });
        });
        $('.heartBtn').click(function() {
            let no = $(this).attr("data-no");            
            let cateno = $(this).attr("data-cateno");

            $.ajax({
                type: 'post',
                url: '../busan/heart.do',
                data: {'no': no, 'cateno': cateno},
                success: function(result) {
                    if (result === 'ok') {
                        alert("좋아요가 완료되었습니다");
                        localStorage.setItem('jjimState', 'ok');  // 찜 상태를 Local Storage에 저장
                        localStorage.setItem('no', no);
                    } else if (result === 'no') {
                        alert("좋아요가 취소되었습니다");
                        localStorage.setItem('jjimState', 'no');  // 찜 상태를 Local Storage에 저장
                        localStorage.setItem('no', no);
                    }
                }
            });
        });

    });
    /* let bCheck=false;
    $(function(){
    	$('.reUp').click(function(){
    		if(bCheck===false)
    		{
    			bCheck=true;
    			$('.update').show();
    			$(this).text('취소');
    			
    		}
    		else{
    			bCheck=false;
    			$('.update').show();
    			$(this).text('수정'); 
    			
    		}
    	}); */
</script>

<style>
.jjim_img{
  width: 20px;
}

#mapCont {
	display: none;
	width: 100%;
}

#kkomap {
	width: 100%;
	height: 350px;
}

.product-card-price {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 70%;
}
.comment{
    display: inline-block;
    min-width: 60%;
}
.reUpBtn, .replyInsertBtn{
    height: 60px;
    width: 9.6%;
    padding: 20px;
}
.upBox, .replyBox{
    min-width: 90%;
    height: 60px;
}
.reUp, .reUpBtn, .reDel, .reInBtn, .reBack, .replyBtn, .replyInsertBtn {
    background-color: #2546F4;
    color: #fff;
}
.btn.focus, .btn:focus, .btn:hover{
color: #fff;
}
.reUp, .reDel {
    width:49px;
}
.btnTo{
    display: inline-block;
    float: right;
    margin-top: 7px;
}
.joa{
    display: flex;
    align-items: center;
    gap: 30px;
    /* margin-top: 120px; */
    width: 100%;
    justify-content: flex-start;
    margin-bottom: 5px;

}
.detail .product-top{
    align-items: end;
}
.detail .product-info .heart{
    margin: 0px;
}
</style>

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
						<img alt="대표 이미지" src="${vo.poster}"
							sizes="(max-width: 479px) 83vw, (max-width: 767px) 75vw, (max-width: 991px) 76vw, 32vw" />
					</div>
					<div class="product-info">
						<h1 style="margin-bottom: 140px">${vo.title}</h1>
						<div class="joa">
					    <div class="heart" data-count="${count }">
							<span><img src="../busan/like.png" class="heart_img"></span>
							<button class="heartBtn" data-cateno="${cateno}" data-no="${vo.no }">좋아요</button>
						</div>
						<div class="jjim" data-count="${count }">
							<span><img src="../busan/jjim_none.png" class="jjim_img"></span>
							<button class="jjimBtn" data-cateno="${cateno}" data-no="${vo.no }">찜하기</button>
						</div>
						</div>
					</div>
				</div>

				<!-- 탭 메뉴 -->
				<div class="product-detail">
					<ul class="tab-menu">
						<li id="detail">상세 설명</li>
						<li id="map">지도/주변 추천</li>
						<li id="review">리뷰</li>
						<c:if test="${cate=='맛집' && sessionScope.id != null}">
						<li id="reserve">예약하기</li>
						</c:if>
					</ul>

					<!-- <div class="shop-header-line">
	                    <div class="shop-header-color"></div>
	                </div> -->

					<div id="detailCont" class="tab-content">
						<div class="detail-info">
							<!-- 상세 이미지 -->
							<div class="deimage-wrapper">
								<c:forEach var="dimg" items="${vo.deimage}" varStatus="d">
									<c:if test="${d.index < fn:length(vo.deimage) - 1}">
										<img class="deimage" src="${dimg}" alt="상세 이미지">
									</c:if>
								</c:forEach>
							</div>

							<!-- 상세 설명 -->
							<p class="cont">${vo.cont}</p>

							<!-- 테이블 -->
							<div class="detail-table">
								<div class="product-table">
									<div class="product-table-cell">
										<div>주소</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.addr}</div>
										</div>
									</div>
									<div class="product-table-cell">
										<div>전화번호</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_height_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.phone}</div>
										</div>
									</div>
									<div class="product-table-cell">
										<div>운영시간</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.bhour}</div>
										</div>
									</div>
									<c:if test="${cate!='맛집' }">
										<div class="product-table-cell no-border-bottom">
											<div>요금</div>
											<div class="product-table-info">
												<div
													data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.rate}</div>
											</div>
										</div>
									</c:if>
									<c:if test="${cate=='맛집' }">
										<div class="product-table-cell no-border-bottom">
											<div>메뉴</div>
											<div class="product-table-info">
												<div
													data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.menu}</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>

							<!-- 해시 태그 -->
							<c:if test="${cate!='맛집' }">
								<div class="tag-list">
									<h5>연관 태그</h5>
									<c:forEach var="tag" items="${vo.tag}">
										<a href="#"><span>${tag}</span></a>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
					<div id="mapCont" class="tab-content" style="display: none;">
						지도 표시
						<div id="kkomap" style="width: 100%; height: 350px;"></div>
					</div>
					<div id="reviewCont" class="tab-content" style="">
						<!-- 리뷰 내용 -->
						<button value="리뷰 작성" class="btn" id="reviewInsertBtn">리뷰
							작성</button>
						<div class="review-list">
							<div class="review-profile">
								<div class="profile">
									<div class="profile-icon">
										<img src="../images/icon_user.png" alt="프로필 이미지">
									</div>
									<h4>
										kim1234<br> <span class="regdate">2024.01.05</span>
									</h4>
								</div>
								<span class="score">★★★★★</span>
							</div>

							<div class="review-item">
								<img src="../images/visual3.jpg" class="review-img" alt="후기 이미지">
								<p class="cont">9월에 별바다부산 나이트페스타에 가봤어요! 다대포의 해변공원에서 나이트뮤직캠크닉
									공연이 있었어요 ㅎㅎ 저는 미리 예약하고 티켓이랑 매트, 맥주, 간식도 받았어요~ 사람들이 매트를 가지고 와서
									가족과 친구들과 소풍을 하면서 공연을 봤어요~너무 좋았어요! 분위기 좋았고 노래를 들면서 저녁을 먹고 좋은 시간을
									보냈어요~ 나이트뮤직캠크닉이 다음 달도 있을거니까 안 가봤으면 추천합니다!</p>
							</div>

							<button value="댓글" class="btn" id="reviewCommentBtn">댓글</button>

							
							  <div class="review-comment">
							       <h5>lee5678<span class="regdate">&nbsp;(2024.01.05)</span></h5>
							       <div class="review-comment-list" style="border-top: 1px solid #eee">
							         <p class="comment" style="border-top: 0px">답글 내용 답글 내용 답글 내용 답글 내용 답글 내용 답글 내용</p>
							         <div class="btnTo">
							         <button class="btn btn-sm reUp">수정</button>
							         <a href="" class="btn btn-sm reDel">삭제</a>
							         <button class="btn btn-sm replyBtn">답글달기</button>
							         </div>
							       </div>
							       <div class="update" style="display: none">
							         <input type=text class="upBox">
							         <a href="" class="btn btn-sm reUpBtn">수정</a>
							       </div>
							       <div class="reply" style="display: none">
							         <h5>아이디</h5>
							         <input type=text class="replyBox">
							         <a href="" class="btn btn-sm replyInsertBtn">등록</a>
							       </div>
							  </div>
							  
							  <div class="reply-insert">
						<form method="post" action="">
								<table class="table">
							        
									<tr>
										
										<td style="position: relative; max-width: 100%; padding: 10px 0">
										<h5>lee5678</h5>
										<textarea rows="4" cols="60" name=content
												required style="resize: none"></textarea><br>
											<div class="reply-btn-wrapper">
												<button class="btn-sm btn reInBtn" value="등록"
												id="replyInsert">등록</button>
												<button class="btn-sm btn reBack" value="취소"
												id="replyCancel" onclick="javascript:history.back()">취소</button>
											</div>
												</td>		
									</tr>
									
								</table>
							</form>
						</div>
							  
							</div>
						</div>
						
					
						
					</div>
					<!-- <div id="reserveCont" class="tab-content"> -->
					<c:if test="${cate=='맛집'}">
					<div id="reserveCont" class="tab-content" style="display: none">
						<!-- 예약하기 내용 -->
						<jsp:include page="../reserve/foodreserve_main.jsp">
						  <jsp:param name="no" value="${vo.no }"/>
						  <jsp:param name="poster" value="${vo.poster }"/>
						  <jsp:param name="title" value="${URLEncoder.encode(vo.title, 'UTF-8')}"/>
						</jsp:include>
					</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="wrapper">
			<div class="shop-header">
				<h3>추천 ${cate }</h3>
				<a href="../store/goods.do" class="link arrow-link">전체보기</a>
				<div class="shop-header-line">
					<div class="shop-header-color"></div>
				</div>
			</div>
			<div class="full-width w-dyn-list">
				<div role="list" class="products w-dyn-items">
					<c:forEach var="vo" items="${list}" begin="0" end="7">
						<div role="listitem" class="product-card-wrapper w-dyn-item"
							style="height: 330px">
							<a href="../busan/${tab}_detail.do?no=${vo.no}"
								class="product-card w-inline-block">
								<div class="product-card-image-wrapper" style="height: 250px">
									<img alt="" src="${vo.poster}"
										size="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw" />
								</div>
								<div
									data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D"
									class="product-card-price"
									style="margin-top: 25px; font-size: 15px">${vo.title}</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>