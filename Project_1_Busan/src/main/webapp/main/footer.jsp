<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="section color no-padding-vertical">
	<div class="wrapper text-white">
	    <div class="footer">
	        <div class="footer-left">
	            <a href="/" aria-current="page" class="footer-brand w-nav-brand w--current">
	                <div>Busan Tour</div>
	            </a>
	        </div>
	        <!-- <div class="footer-nav">
	            <a href="/" aria-current="page" class="footer-link w--current">Home</a>
	            <a href="/catalog" class="footer-link">Catalog</a>
	            <a href="/delivery" class="footer-link">Delivery</a>
	            <a href="/about" class="footer-link">About</a>
	            <a href="/contacts" class="footer-link">Contacts</a>
	        </div> -->
            <div class="footer-social">
                <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block">
                    <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5bae5eec5227792568635e37_twitter-icon-white.svg" alt=""/>
                </a>
                <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block">
                    <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5bae5eec3cb36463d4cf4661_facebook-icon-white.svg" alt=""/>
                </a>
                <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block">
                    <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5bae5eec7fe624275552217c_instagram-icon-white.svg" alt=""/>
                </a>
                <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block">
                    <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5bae5eec6e93377c0bbdba8a_pinterest-icon-white.svg" alt=""/>
                </a>
                <a href="https://elasticthemes.com" target="_blank" class="footer-social-link w-inline-block">
                    <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5bae5eecfff242b7c309e311_youtube-icon.svg" alt=""/>
                </a>
            </div>
            <div class="footer-bottom">
                <div class="footer-bottom-left">
                    <div>
                        Created with love by <a href="https://elasticthemes.com" target="_blank" class="link-white">Elastic Themes</a>
                    </div>
                </div>
                <div class="footer-bottom-right">
                    <div>
                        Powered by <a href="https://webflow.com/" target="_blank" class="link-white">Webflow</a>
                    </div>
                    <div class="footer-bottom-divider"></div>
                    <a href="/template/style-guide" class="link-white">Style Guide</a>
                    <div class="footer-bottom-divider"></div>
                    <a href="/template/licensing" class="link-white">Licensing</a>
                </div>
            </div>
        </div>
    </div>
</div>
	
<div id="cookieBar">
	<c:if test="${rcntList.size() > 0 }">	
	<h6>최근 본 목록</h6>
	<ul>
		<c:forEach var="vo" items="${rcntList }" begin="1" end="5" >
			<c:choose>
				 <c:when test="${vo.cate == 1 }"> 
				 	<li><a href="../busan/tour_detail.do?no=${vo.no }"><img src="${vo.poster }"></a></li>
				 </c:when>
				 <c:when test="${vo.cate == 2 }"> 
				 	<li><a href="../busan/festival_detail.do?no=${vo.no }"><img src="${vo.poster }"></a></li>
				 </c:when>
				 <c:when test="${vo.cate == 3 }"> 
				 	<li><a href="../busan/activity_detail.do?no=${vo.no }"><img src="${vo.poster }"></a></li>
				 </c:when>
				 <c:when test="${vo.cate == 4 }"> 
				 	<li><a href="../busan/food_detail.do?no=${vo.no }"><img src="${vo.poster }"></a></li>
				 </c:when>
				 <c:when test="${vo.cate == 5 }"> 
				 	<li><a href="../busan/exhibition_detail.do?no=${vo.no }"><img src="${vo.poster }"></a></li>
				 </c:when>
			</c:choose>
			
		</c:forEach>
	</ul>
	</c:if>	
</div>

<a href="#" id="contactBtn" class="fixed-btn">
	<img class="icon icon-contact" src="../images/icon_contact.png">
</a>

<a href="#" id="topBtn" class="fixed-btn">
	<img class="icon icon-top" src="../images/icon_top.png">
</a>

