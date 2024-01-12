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
<style type="text/css">
#reserveCont
{
  height: 1000px;
}
.jjim_img{
  width: 20px;
}

</style>
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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.ename}</div>'
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

/*     $(function(){
        $('.reUp').click(function(){
        	$(this).text('취소'); 
        	$('.update').show();
        });
    }); */
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
    });
    $(function(){
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
            let eno = $(this).attr("data-eno");            
            let cateno = $(this).attr("data-cateno");
            $.ajax({
            	type: 'post',
                url: '../busan/checklogin.do',
                success: function(loginResult) {
                	if (loginResult === 'no') {
                		alert("로그인 후 찜하기가 가능합니다");
                		window.location.href="../member/login_main.do";
                	}
                	else{
                		$.ajax({
                            type: 'post',
                            url: '../busan/ex_jjim.do',
                            data: {'eno': eno, 'cateno': cateno},
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
                	}
                }
            });
            
        });
        $('.heartBtn').click(function(){
            let eno= $(this).attr("data-eno");
            let cateno= $(this).attr("data-cateno");
            $.ajax({
                type: 'post',
                url: '../busan/ex_heart.do',
                data: {'eno':eno, 'cateno':cateno},
                success: function(result){
                    if(result === 'ok'){
                        alert("좋아요가 완료되었습니다");
                        localStorage.setItem('no', eno);
                    } else if(result === 'no'){
                        alert("좋아요가 취소되었습니다");
                        localStorage.setItem('no', eno);
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
	                  
    						<p>
    						<p>
    						<p>
    						
    						
    							<div class="heart" data-count="${count }">
									<span><img src="../busan/like.png" class="heart_img"></span>
							
									<button class="heartBtn" data-cateno="${cateno }" data-eno="${vo.eno }">좋아요</button>
								</div>
	                    	
	                    	
	                   
	                    	<div class="jjim" data-count="${count }" style="float:left">
							<span><img src="../busan/jjim_none.png" class="jjim_img"></span>
							
							<button class="jjimBtn" data-cateno="${cateno }" data-eno="${vo.eno }">찜하기</button>
						</div>
	                    	
		                     <div class="hit">
	                    	<span>조회수</span>
	                    	<span>${vo.hit } 회</span>
	                    	
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
										          무료
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
				<div id="reserveCont" class="tab-content" style="display: none">
						<!-- 예약하기 내용 -->
						<jsp:include page="../reserve/reserve_main.jsp">
						  <jsp:param name="eno" value="${vo.eno }"/>
						  <jsp:param name="poster" value="${vo.poster }"/>
						  <jsp:param name="ename" value="${URLEncoder.encode(vo.ename, 'UTF-8')}"/>
						</jsp:include>
					</div>
		            
	              <div class="section">
        <div class="wrapper">
            <div class="shop-header">
                <h3>추천 전시</h3>
                <a href="../busan/ex.do" class="link arrow-link">전체보기</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <div class="full-width w-dyn-list">
                <div role="list" class="products w-dyn-items">
                	<c:forEach var="vo1" items="${vo1}" begin="0" end="7">
	                    <div role="listitem" class="product-card-wrapper w-dyn-item" style="height: 330px" > 
	                        <a href="../busan/ex_detail.do?eno=${vo1.eno}" class="product-card w-inline-block">
	                            <div class="product-card-image-wrapper" style="height: 250px">
	                                <img alt="" src="${vo1.poster}" size="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw"/>
	                            </div>
	                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price" style="margin-top: 25px;font-size: 15px">${vo1.ename}</div>
	                        </a>
	                    </div>
                	</c:forEach>
                </div>
            </div>
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