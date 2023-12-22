<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html data-wf-page="5baf791a7a16ad127cda1ebc" data-wf-site="5badda2935e11303a89a461e">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>Busan Tour</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/> 
        <style type="text/css">
         #tag-wrap{
           margin-top:50px;
           text-align:center; 
         }
         a.tag{
            border: 1px solid #dbeeff;
            display: inline-block;
            border-radius: 25px;
            padding: 5px 18px;
            margin: 0px auto;
         }
         a.tag:hover{
         color: #2b75d5;
         text-decoration: none;
         }
         a.tag:focus{
         color: white;
         text-decoration: none;
         }
         a {
         transition: color 0.2s; /* 모든 링크에 대한 트랜지션 추가 */
         }
         span{
         	display: inline-block;
         }
         .selected-link {
         background-color: #2b75d5;
         color: white;
         }
         img{
           height: 100%;
           object-fit: cover;
         }
         .product-card-image-wrapper{
           padding:0px;
           height: 260px;
         }
         .product-card {
         overflow: hidden;
         }
         .product-card-wrapper{
	     height: 360px;
         }
         img{
	 	 width: 100%;
	     height: 100%;
	     object-fit: cover;
         }
         .product-card{
	     padding: 0px 0px 0px;
         }
         .subscribe-form{
         margin-top: 130px;
         }
         .search .button{
         background-color: #2b75d5;
         }
         .list h6{
         margin-top: 20px;
         font-size: 16px;
         }
         .product-card-price{
         background-color: #2b75d5;
         }
        </style>
        <script type="text/javascript">
            /* !function(o, c) {
                var n = c.documentElement
                  , t = " w-mod-";
                n.className += t + "js",
                ("ontouchstart"in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
            }(window, document); */
            
         // 초기에 선택된 링크
            document.addEventListener('DOMContentLoaded', function() {
              var initialLink = document.getElementById('link1'); // 링크의 ID에 따라 변경
              selectLink(initialLink);
            });

            // 링크 클릭시 호출되는 함수
            function selectLink(link) {
              // 현재 선택된 링크에 대한 스타일 적용
              link.classList.add('selected-link');
              
              // 현재 선택된 링크 이외의 다른 링크에 대한 스타일 제거
              var allLinks = document.querySelectorAll('a');
              for (var i = 0; i < allLinks.length; i++) {
                if (allLinks[i] !== link) {
                  allLinks[i].classList.remove('selected-link');
                }
              }
            }
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
        <!--  <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd83035e7345f2f22c0bece_favicon.png" rel="shortcut icon" type="image/x-icon"/>
        <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd8303816e1ea6c375be6cb_webclip.png" rel="apple-touch-icon"/> -->
    </head>
    
    <body>
            <div style="margin-top:100px">
                <div>
                    <div class="search">
                        <div>
                            <form name="Search-Form" method="get" class="subscribe-form">
                                <input type="text" class="input subscribe-input w-input" name="Search" placeholder="검색어를 입력하세요" 
                                id="" required style="width:500px"/>
                                <input type="submit" value="Search" class="button w-button"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
<!--             <div id="tag-wrap">
                <a class="tag" id="link1" href="#" onclick="selectLink(this)"><span>#전체</span></a>
                <a class="tag" id="link2" href="#" onclick="selectLink(this)"><span>#한식</span></a>
                <a class="tag" id="link3" href="#" onclick="selectLink(this)"><span>#중식</span></a>
                <a class="tag" id="link4" href="#" onclick="selectLink(this)"><span>#일식</span></a>
                <a class="tag" id="link5" href="#" onclick="selectLink(this)"><span>#아세안요리</span></a>
                <a class="tag" id="link6" href="#" onclick="selectLink(this)"><span>#양식</span></a>             
                <a class="tag" id="link7" href="#" onclick="selectLink(this)"><span>#카페&베이커리</span></a>
                <a class="tag" id="link8" href="#" onclick="selectLink(this)"><span>#해산물</span></a>
                <a class="tag" id="link9" href="#" onclick="selectLink(this)"><span>#그릴</span></a>
                
            </div> -->
            
            
            <div class="section list">
                <div class="wrapper">
                    <div class="shop-header">
                        <h3 class="no-margin w-hidden-small w-hidden-tiny">특산물</h3>
                        <div class="shop-categories-wrapper">
                            <a href="/catalog" aria-current="page" class="shop-category-link w--current">최신순</a>
                            <div class="w-dyn-list">
                                <div role="list" class="shop-categories w-dyn-items">
                                    <div role="listitem" class="w-dyn-item">
                                        <a href="/category/wooden-toys" class="shop-category-link">조회순</a>
                                    </div>
                                    <div role="listitem" class="w-dyn-item">
                                        <a href="/category/stuffed-animals" class="shop-category-link">좋아요순</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shop-header-line">
                            <div class="shop-header-color green w-hidden-small w-hidden-tiny"></div>
                        </div>
                    </div>

					<!-- list -->
                    <div class="full-width w-dyn-list list2">
                        <div role="list" class="products w-dyn-items">
                            <c:forEach var="vo" items="${list}">
                            <div role="listitem" class="product-card-wrapper w-dyn-item">
                                <a href="../busan/goods_detail.do?gno=${vo.gno}" class="product-card w-inline-block">
                                    <div class="product-card-image-wrapper">
                                        <img src="${vo.poster}" alt="" sizes="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw"/>
                                    </div>
                                    <h6 class="product-card-heading">${vo.gname}</h6>
                                    <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-card-price">$ 30.00 USD</div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="text-center">
                    <ul class="pagination">
                        <%--
                            <!ENTITY lt "<">
                            <!ENTITY gt ">">
                            => &lt;
                        --%>
                        <c:if test="${startPage>1}">
                            <li><a href="goods.do?page=${startPage-1}">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="goods.do?page=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="goods.do?page=${endPage+1}">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <!-- <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5badda2935e11303a89a461e" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
        <script src="https://assets.website-files.com/5badda2935e11303a89a461e/js/webflow.9828d3d6a.js" type="text/javascript"></script>
    </body>
</html>
