<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html data-wf-page="5baddb6a35e11306e19a4806" data-wf-site="5badda2935e11303a89a461e">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<title>Busan Tour</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href="../css/style.css" rel="stylesheet" type="text/css"/> 
<style type="text/css">
	.tt{
		margin: 0px auto;
	}
	.product-table{
		width:400px;
	}
	.full-width {
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.buy-buttons {
		margin-top: 10px; /* Adjust the margin as needed */
	}
	.w-commerce-commerceaddtocartquantityinput,
	.w-commerce-commerceaddtocartbutton,
	.w-commerce-commercebuynowbutton {
		margin-bottom: 10px; /* Adjust the margin as needed */
	}
	.w-commerce-commerceaddtocartquantityinput {
		width: 50px; /* Adjust the width as needed */
	}
	.w-commerce-commerceaddtocartbutton {
		vertical-align: middle;
	}
</style>
<script type="text/javascript">
    !function(o, c) {
        var n = c.documentElement
          , t = " w-mod-";
        n.className += t + "js",
        ("ontouchstart"in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
    }(window, document);
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
    window.__WEBFLOW_CURRENCY_SETTINGS = {
        "currencyCode": "USD",
        "$init": true,
        "symbol": "$",
        "decimal": ".",
        "fractionDigits": 2,
        "group": ",",
        "template": "{{wf {\"path\":\"symbol\",\"type\":\"PlainText\"} }} {{wf {\"path\":\"amount\",\"type\":\"CommercePrice\"} }} {{wf {\"path\":\"currencyCode\",\"type\":\"PlainText\"} }}",
        "hideDecimalForWholeNumbers": false
    };
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
	                                <input type="submit" value="예약하기" class="w-commerce-commerceaddtocartbutton button add-to-cart-button"/>
	                                <!-- <a class="w-commerce-commercebuynowbutton button buy-now-button" href="/checkout">Buy now</a> -->
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
		               			<%-- <!-- 상세 이미지 -->
								<c:forEach var="dimg" items="${vo.deimage}" varStatus="d">
								    <c:if test="${d.index < fn:length(vo.deimage) - 1}">
								        <img class="deimage" src="${dimg}" alt="상세 이미지"> 
								    </c:if>
								</c:forEach> --%>
		                    	
		                    	<%-- <!-- 상세 설명 -->
		                    	<p class="cont">${vo.cont}</p> --%>
		                    	
		                    	<!-- 테이블 -->
			                    <div class="detail-table">
			                    	<div class="product-table">
				                        <div class="product-table-cell">
				                            <div>전시 기간</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.s_date}~${vo.e_date}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>전시 분야</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_height_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.efield}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>전시 품목</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.eitem}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>요금</div>
				                            <div class="product-table-info">
				                                <c:choose>
											        <c:when test="${vo.price == 0}">
											            <div>무료</div>
											        </c:when>
											        <c:otherwise>
											            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.price} 원</div>
											        </c:otherwise>
											    </c:choose>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>카테고리</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.cate}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>홈페이지</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.homepage}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell">
				                            <div>개최 장소</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.loc}</div>
				                            </div>
				                        </div>
				                        
				                        <div class="product-table-cell no-border-bottom">
				                            <div>주최</div>
				                            <div class="product-table-info">
				                                <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_length_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.host}</div>
				                            </div>
				                        </div>
				                    </div>
			                    </div>
		
			                    <%-- <!-- 해시 태그 -->
			                    <div class="tag-list">
			                    	<h5>연관 태그</h5>
				                    <c:forEach var="tag" items="${vo.tag}">
				                    	<a href="#"><span>${tag}</span></a>
				                    </c:forEach>
			                    </div> --%>
			                </div>
	               		</div>
	               		
	             		<div id="mapCont" class="tab-content" style="display: none;">
					        <!-- 지도/주변 추천 내용 -->
					        
					    </div>
					    <div id="reviewCont" class="tab-content" style="display: none;">
					    
					    	<!-- 리뷰 목록 -->
					    	
					    	
					    	<!-- 리뷰 내용 -->
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
					    <!-- <div id="reserveCont" class="tab-content" style="display: none;">
					        예약하기 내용
					        <div class="form-group">
    <label for="people">인원 선택:</label>
    <select id="people" name="people" class="form-control">
        <%-- Options for number of people --%>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <%-- Add more options as needed --%>
    </select>
</div>

<div class="form-group">
    <label for="date">날짜 선택:</label>
    <input type="date" id="date" name="date" class="form-control"/>
</div>

<c:choose>
    <c:when test="${vo.price == 0}">
        <%-- For free exhibitions --%>
        <a href="#" class="btn btn-primary">예약 완료 페이지로</a>
    </c:when>
    <c:otherwise>
        <%-- For paid exhibitions --%>
        <a href="#" class="btn btn-success">결제 및 예약 완료 페이지로</a>
    </c:otherwise>
</c:choose>
					        
					        예약하기 내용을 입력하세요.
					    </div> -->
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