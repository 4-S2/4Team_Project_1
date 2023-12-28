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
         button.tag{
            border: 1px solid #dbeeff;
            display: inline-block;
            border-radius: 25px;
            padding: 5px 18px;
            margin: 0px auto;
         }
         button.tag:hover{
         color: #2b75d5;
         text-decoration: none;
         }
         button.tag:focus{
         color: white;
         text-decoration: none;
         }
         /* a {
         transition: color 0.2s; /* 모든 링크에 대한 트랜지션 추가 */
         } */
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
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        // 초기 로딩 시 localStorage에서 선택된 태그를 읽어옴
        var selectedTag = localStorage.getItem('selectedTag');
        var initialLink = selectedTag ? document.getElementById(selectedTag) : document.getElementById('link1');
        selectLink(initialLink);

        // 검색 버튼 클릭 시
        document.forms['Search-Form'].addEventListener('submit', function () {
            // 현재 선택된 태그를 localStorage에 저장
            var selectedButton = document.querySelector('.selected-link');
            if (selectedButton) {
                localStorage.setItem('selectedTag', selectedButton.id);
            }
        });

        // food.do 페이지로 이동할 때 초기화
        if (window.location.pathname.includes("/busan/food.do")) {
            initializeHeader();
        }
    });

    function initializeHeader() {
        // #전체 버튼을 선택한 상태로 초기화
        var link1Button = document.getElementById('link1');
        selectLink(link1Button);
    }

    function goToTagList(button) {
        window.location.href = '../busan/food_tagList.do';
    }

    function selectLink(button) {
        // 이전에 선택된 태그를 지움
        var prevSelectedTag = localStorage.getItem('selectedTag');
        if (prevSelectedTag) {
            var prevSelectedButton = document.getElementById(prevSelectedTag);
            if (prevSelectedButton) {
                prevSelectedButton.classList.remove('selected-link');
            }
        }

        // 현재 선택된 태그를 설정
        button.classList.add('selected-link');

        var allButtons = document.querySelectorAll('button.tag');
        for (var i = 0; i < allButtons.length; i++) {
            if (allButtons[i] !== button) {
                allButtons[i].classList.remove('selected-link');
            }
        }

        var tagValue = button.textContent.trim().substring(1);
        if(tagValue==='카페&베이커리')
        {
        	tagValue=tagValue.substring(0,2);
        }
        document.forms['Search-Form'].elements['tag'].value = tagValue;
        var searchInput = document.forms['Search-Form'].elements['word'];
    }
    
</script>
        <!--  <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd83035e7345f2f22c0bece_favicon.png" rel="shortcut icon" type="image/x-icon"/>
        <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd8303816e1ea6c375be6cb_webclip.png" rel="apple-touch-icon"/> -->
    </head>
    
    <body>
            <div style="margin-top:100px">
                <div>
                    <div class="search">
                        <div>
                            <form name="Search-Form" method="post" action="../busan/food_find.do" class="subscribe-form">
                            
                                <input type="text" class="input subscribe-input w-input" name="word" placeholder="검색어를 입력하세요" 
                                id="find" required style="width:500px" value="${word }"/>
                                <input type="submit" value="Search" class="button w-button"/>
                                
                                 <!-- 수정된 태그 버튼들 -->
                                
                                <input type="hidden" name="tag" value=""/>
                                <div id="tag-wrap">
                                <button class="tag" id="link1" type="button" onclick="selectLink(this)"><span>#전체</span></button>
                                <button class="tag" id="link2" type="button" onclick="selectLink(this)"><span>#한식</span></button>
                                <button class="tag" id="link3" type="button" onclick="selectLink(this)"><span>#중식</span></button>
                                <button class="tag" id="link4" type="button" onclick="selectLink(this)"><span>#일식</span></button>
                                <button class="tag" id="link5" type="button" onclick="selectLink(this)"><span>#아세안요리</span></button>
                                <button class="tag" id="link6" type="button" onclick="selectLink(this)"><span>#양식</span></button>
                                <button class="tag" id="link7" type="button" onclick="selectLink(this)"><span>#카페&베이커리</span></button>
                                <button class="tag" id="link8" type="button" onclick="selectLink(this)"><span>#해산물</span></button>
                                <button class="tag" id="link9" type="button" onclick="selectLink(this)"><span>#그릴</span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- <div id="tag-wrap">
                <a class="tag" id="link1" href="#" onclick="selectLink(this)"><span>#전체</span></a>
                <a class="tag" id="link2" href="#" onclick="selectLink(this)"><span>#한식</span></a>
                <a class="tag" id="link3" href="#" onclick="selectLink(this)"><span>#중식</span></a>
                <a class="tag" id="link4" href="#" onclick="selectLink(this)"><span>#일식</span></a>
                <a class="tag" id="link5" href="#" onclick="selectLink(this)"><span>#아세안요리</span></a>
                <a class="tag" id="link6" href="#" onclick="selectLink(this)"><span>#양식</span></a>             
                <a class="tag" id="link7" href="#" onclick="selectLink(this)"><span>#카페&베이커리</span></a>
                <a class="tag" id="link8" href="#" onclick="selectLink(this)"><span>#해산물</span></a>
                <a class="tag" id="link9" href="#" onclick="selectLink(this)"><span>#그릴</span></a>
                
                <span class="tag" id="link1">#전체</span>
                <span class="tag" id="link2">#한식</span>
                <span class="tag" id="link3">#중식</span>
                <span class="tag" id="link4">#일식</span>
                <span class="tag" id="link5">#아세안요리</span>
                <span class="tag" id="link6">#양식</span>        
                <span class="tag" id="link7">#카페&베이커리</span>
                <span class="tag" id="link8">#해산물</span>
                <span class="tag" id="link9">#그릴</span>
            </div> -->
            
            
            <div class="section list">
                <div class="wrapper">
                    <div class="shop-header">
                        <h3 class="no-margin w-hidden-small w-hidden-tiny">맛집</h3>
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
                                <a href="../busan/food_detail.do?no=${vo.no}" class="product-card w-inline-block">
                                    <div class="product-card-image-wrapper">
                                        <img src="${vo.poster}" alt="" sizes="(max-width: 479px) 73vw, (max-width: 767px) 34vw, (max-width: 991px) 33vw, 12vw"/>
                                    </div>
                                    <h6 class="product-card-heading">${vo.title}</h6>
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
                            <li><a href="food.do?page=${startPage-1}">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="food.do?page=${i}" class="pages">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="food.do?page=${endPage+1}">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <!-- <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5badda2935e11303a89a461e" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
        <script src="https://assets.website-files.com/5badda2935e11303a89a461e/js/webflow.9828d3d6a.js" type="text/javascript"></script>
    </body>
</html>