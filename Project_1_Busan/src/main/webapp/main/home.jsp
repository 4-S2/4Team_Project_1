<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<main>
<div id="mainVisual">
    <div class="swiper tourSlide">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide1">
                <h2>푸른 낭만이 있는<br>광안대교</h2>
                <p>푸른 낭만이 있는 광안대교로 오세요</p>
            </div>
            <div class="swiper-slide slide2">
                <h2>푸른 낭만이 있는<br>광안대교</h2>
                <p>푸른 낭만이 있는 광안대교로 오세요</p>
            </div>
            <div class="swiper-slide slide3">
                <h2>푸른 낭만이 있는<br>광안대교</h2>
                <p>푸른 낭만이 있는 광안대교로 오세요</p>
            </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="tour swiper-pagination"></div>
    </div>
</div>

<div id="foodShop" class="section">
    <div id="food">
        <div class="wrapper">
            <div class="shop-header">
                <h3 class="no-margin">추천 맛집</h3>
                <a href="../busan/food.do" class="link arrow-link">전체보기</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <div class="full-width w-dyn-list">
                <div role="list" class="products w-dyn-items">
                    <c:forEach var="vo" items="${fdtoplist}" varStatus="f">
                    <div data-w-id="86c7c915-bcbe-c30c-93c0-5bed50ef155d" style="opacity:0" role="listitem" class="product-card-wrapper w-dyn-item">
                        <a href="../busan/food_detail.do?no=${vo.no}" class="product-card w-inline-block">
                        <img alt="" src="${vo.poster}"/>
                        <h6 class="product-card-heading">${vo.title}</h6>
                            <%-- <div class="product-card-image-wrapper">
                                <img alt="" src="${vo.poster}"/>
                            </div> --%>
                            <%--
                            <h6 class="product-card-heading">${vo.title}</h6>
                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price">${vo.title}</div>
                            
                             --%>
                            <!-- div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price">$ 30.00 USD</div> -->
                        </a>
                    </div> 
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div id="shop">
        <div class="shop-header">
            <h3 class="no-margin">추천 특산물</h3>
            <a href="../store/goods.do" class="link arrow-link">전체보기</a>
            <div class="shop-header-line">
                <div class="shop-header-color"></div>
            </div>
        </div>
        <div class="swiper shopSlide">
            <div class="swiper-wrapper">
            	<c:forEach var="vo" items="${gtoplist}" >
	                <div class="swiper-slide">
	                  <a href="../store/goods_detail.do?no=${vo.gno}">
	                    <img src="${vo.poster}" width="80px" height="80px">
	                	<div class="text">
	                		<span class="badge">HOT</span>
	                		<h5>${vo.gname}</h5>
	                   		<p>${vo.price}</p>
	                	</div>
	                </div>
	                </a>
                </c:forEach>
<!--                 <div class="swiper-slide">
                    <img src="">
                	<div class="text">
                		<h5>추천 특산물2</h5>
                   		<p>추천 특산물2</p>
                	</div>
                </div>
                <div class="swiper-slide">
                    <img src="">
                	<div class="text">
                		<h5>추천 특산물3</h5>
                   		<p>추천 특산물3</p>
                	</div>
                </div> -->
            </div>
            <!-- <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="shop swiper-pagination"></div> -->
        </div>
    </div>
</div>            

<div id="Scroll-Section" class="section no-padding-top">
    <div class="wrapper">
        <div id="festival_activity" class="home-categories">
<!--             <div data-w-id="79f09a57-05ab-ed81-c059-4d50244b2341" style="opacity:0" class="home-category-card">
                <div class="home-category-info-1">
                    <a href="/catalog" class="button small white w-button">Button</a>
                </div>
            </div> -->
            <div class="swiper festivalSlide">
	            <div class="swiper-wrapper">
	                <c:forEach var="vo" items="${ftoplist}" >
		                <div class="swiper-slide">
		                    <img class="img" src="${vo.poster}">
		                    <span class="badge">축제</span>
		                	<div class="text">
		                		<h3>${vo.title}</h3>
	                    		<a href="../busan/festival_detail.do?no=${vo.no}">더보기</a>
		                	</div>
		                </div>
		             </c:forEach>
	            </div>
	            <!-- <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
	            <div class="shop swiper-pagination"></div> -->
	        </div>

            <!-- <div data-w-id="b498480a-a03d-afff-8227-912980ab2a0a" style="opacity:0" class="home-category-card red">
                <div class="home-category-info-2">
                    <a href="/catalog" class="button small white w-button">Button</a>
                </div>
            </div> -->
            <div class="swiper activitySlide">
	            <div class="swiper-wrapper">
	                <c:forEach var="vo" items="${atoplist}" >
		                <div class="swiper-slide">
		                    <img class="img "src="${vo.poster}">
		                    <span class="badge">체험</span>
		                	<div class="text">
		                		<h3>${vo.title}</h3>
	                    		<a href="../busan/activity_detail.do?no=${vo.no}">더보기</a>
		                	</div>
		                </div>
		             </c:forEach>
	            </div>
	            <!-- <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
	            <div class="shop swiper-pagination"></div> -->
	        </div>
        </div>
    </div>
</div>

<div id="exhibition" class="section no-padding-top">
    <div class="wrapper">
        <div class="shop-header">
            <h3 class="no-margin">추천 전시</h3>
            <a href="../busan/ex.do" class="link arrow-link">전체보기</a>
            <div class="shop-header-line">
                <div class="shop-header-color"></div>
            </div>
        </div>
        <div class="full-width w-dyn-list">
            <div role="list" class="products w-dyn-items">
                <c:forEach var="vo" items="${exToplist}">
                <div data-w-id="a677a252-157c-7121-064d-fe101c861b40" style="opacity:0" role="listitem" class="product-card-wrapper w-dyn-item">
                    <a href="../busan/ex_detail.do?eno=${vo.eno }" class="product-card w-inline-block">
                        <div class="product-card-image-wrapper">
                            <img alt="" src="${vo.poster}" data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_main_image_4dr%22%2C%22to%22%3A%22src%22%7D%5D" sizes="100vw" srcset=""/>
                        </div>
                        <%-- <h6 class="product-card-heading">${vo.ename}</h6> --%>
                        <div class="product-card-price">${vo.s_date}~${vo.e_date}</div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 공지사항, 문의하기, 고객센터 -->
<div id="bottom" class="section no-padding-top">
    <div class="wrapper">
        <div class="notice con-box">
            <div class="shop-header">
                <h4>공지사항</h4>
                <a href="../board/notice.do" class="link arrow-link">+</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <ul>
            	<c:forEach var="vo" items="${nlist}">
                	<li>
                		<a href="#" >${vo.ntitle}</a>
                	</li>
                </c:forEach>
            </ul>
        </div>
        <div class="inquiry con-box">
            <div class="shop-header">
                <h4>Q&A 게시판</h4>
                <a href="../board/qnaboard.do" class="link arrow-link">+</a>
                <div class="shop-header-line">
                    <div class="shop-header-color"></div>
                </div>
            </div>
            <ul>
            	<c:forEach var="vo" items="${qlist}">
                	<li>
                		<a href="#" >${vo.subject}</a>
                	</li>
                </c:forEach>
            </ul>
        </div>
        <div class="service con-box">
            <h4>고객센터</h4>
            <div class="shop-header-line">
                <div class="shop-header-color"></div>
            </div>
			<h2>관광문의 : 1330</h2>
			<p>민원대표 전화 : 051-120<br>
			운영시간 : 평일 08:30 ~ 18:30<br>
			야간/공휴일 등 근무시간외는 당직실로 전환<br>
			email : busantour@gmail.com</p>
        </div>
    </div>
</div>
</main>

<!-- <div class="section haze">
    <div class="wrapper">
        <div class="intro">
            <div class="title">@ElasticThemes</div>
            <h2 class="no-margin-bottom">We &#x27;re on Instagram!</h2>
        </div>
        <div data-w-id="6e1d3527-5090-7380-17f7-30bf0f5a58b4" class="instagram">
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf79395558fbeb88a49_instagram-01.jpg" alt="" class="full-width"/>
            </a>
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf735e113f8679a57e6_instagram-02.jpg" alt="" class="full-width"/>
            </a>
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf735e11327b99a57e7_instagram-03.jpg" alt="" class="full-width"/>
            </a>
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf7939555df08b88a48_instagram-04.jpg" alt="" class="full-width"/>
            </a>
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf7939555514eb88a4a_instagram-05.jpg" alt="" class="full-width"/>
            </a>
            <a href="https://instagram.com" target="_blank" class="instagram-link w-inline-block">
                <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5badecf71f2da2228d17155f_instagram-06.jpg" alt="" class="full-width"/>
            </a>
        </div>
        <a href="https://instagram.com" target="_blank" class="button w-button">See More Photos</a>
    </div>
</div> -->