<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<img src="${vo.poster }" style="width:300px;height: 450px">

${vo.title }

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html data-wf-page="5baddb6a35e11306e19a4806" data-wf-site="5badda2935e11303a89a461e">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>Busan Tour | 명소 | ${vo.title}</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/> 
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
        <!-- <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd83035e7345f2f22c0bece_favicon.png" rel="shortcut icon" type="image/x-icon"/>
        <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd8303816e1ea6c375be6cb_webclip.png" rel="apple-touch-icon"/> -->
    </head>
    <body>

        <div class="page-wrapper">   
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
                        <div class="product-info">
                            <h1>${vo.title }</h1>
                            <%-- <p class="text-grey">${vo.cont}</p> --%>
                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D" class="product-price">$ 30.00 USD</div>
                            <div class="full-width">
                            
                                <form data-node-type="commerce-add-to-cart-form" data-commerce-sku-id="5bae129d35e11310a69a82d2" data-loading-text="Adding to cart..." data-commerce-product-id="5bae129d1c68cc806025c48d" class="w-commerce-commerceaddtocartform add-to-cart">
                                    <input type="number" pattern="^[0-9]+$" inputMode="numeric" id="quantity-652131f9f904302b3296412795400fe8" name="commerce-add-to-cart-quantity-input" min="1" class="w-commerce-commerceaddtocartquantityinput input quantity-input" value="1"/>
                                    <div class="buy-buttons">
                                        <input type="submit" data-node-type="commerce-add-to-cart-button" data-loading-text="Adding to cart..." value="예약하기" aria-busy="false" aria-haspopup="dialog" class="w-commerce-commerceaddtocartbutton button add-to-cart-button"/>
                                        <a data-node-type="commerce-buy-now-button" data-default-text="Buy now" data-subscription-text="Subscribe now" aria-busy="false" aria-haspopup="false" class="w-commerce-commercebuynowbutton button buy-now-button" href="/checkout">Buy now</a>
                                    </div>
                                </form>
                                
                                <div style="display:none" class="w-commerce-commerceaddtocartoutofstock out-of-stock" tabindex="0">
                                    <div>This product is out of stock.</div>
                                </div>
                                <div aria-live="" data-node-type="commerce-add-to-cart-error" style="display:none" class="w-commerce-commerceaddtocarterror form-error">
                                    <div data-node-type="commerce-add-to-cart-error" data-w-add-to-cart-quantity-error="Product is not available in this quantity." data-w-add-to-cart-general-error="Something went wrong when adding this item to the cart." data-w-add-to-cart-mixed-cart-error="You can’t purchase another product with a subscription." data-w-add-to-cart-buy-now-error="Something went wrong when trying to purchase this item." data-w-add-to-cart-checkout-disabled-error="Checkout is disabled on this site." data-w-add-to-cart-select-all-options-error="Please select an option in each set.">Product is not available in this quantity.</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="product-image-wrapper">
                            <img alt="대표 이미지" src="${vo.poster }" sizes="(max-width: 479px) 83vw, (max-width: 767px) 75vw, (max-width: 991px) 76vw, 32vw" />
                        </div>
                        
                        <!-- 상세 설명 -->
                        <div class="product-details-wrapper">
                            <div class="shop-header">
                                <h5 class="no-margin">${vo.cont}</h5>
                                <!-- <div class="sku">
                                    <div>SKU: </div>
                                    <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_sku_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">35009</div>
                                </div> -->
                                <div class="shop-header-line">
                                    <div class="shop-header-color green"></div>
                                </div>
                            </div>
                            
                            <div class="product-details w-richtext">
                            	<c:forEach var="dimg" items="${vo.deimage}">
                            		<img src="${dimg }" alt="상세 이미지"> 
                            	</c:forEach>
                           	
<!--  		   vo.setNo(rs.getInt(1));
	       vo.setTitle(rs.getString(2));
		   vo.setPoster(rs.getString(3));
		   vo.setHit(rs.getInt(4));
		   vo.setCont(rs.getString(5));
		   vo.setAddr(rs.getString(6));
		   vo.setPhone(rs.getString(7));
		   vo.setRate(rs.getString(8));
		   vo.setBhour(rs.getString(9));
		   vo.setJjim(rs.getString(10));
		   vo.setHeart(rs.getInt(11));
		   vo.setDeimage(rs.getString(12));
		   vo.setTag(rs.getString(13));  -->                          	
		   
<!--                                 <h4>Add Your Product Description</h4>
                                <p>The rich text element allows you to create and format headings, paragraphs, blockquotes, images, and video all in one place instead of having to add and format them individually. Just double-click and easily create content. A rich text element can be used with static or dynamic content. For static content, just drop it into any page and begin editing. For dynamic content, add a rich text field to any collection and then connect a rich text element to that field in the settings panel. Voila!</p>
                                <h4>Simple &amp;Elegant Template</h4>
                                <p>Headings, paragraphs, blockquotes, figures, images, and figure captions can all be styled after a class is added to the rich text element using the "When inside of" nested selector system.</p>
                                <p>A successful marketing plan relies heavily on the pulling-power of advertising copy. Writing result-oriented ad copy is difficult, as it must appeal to, entice, and convince consumers to take action.</p>
                                <h5>Perfect Choice for Your Business</h5>
                                <p>Grabbing the consumer’s attention isn’t enough; you have to keep that attention for at least a few seconds. This is where your benefits come into play or a product description that sets your offer apart from the others.</p>
                                <p>‍</p> -->
                            </div>
                            
                            <!-- 해시 태그 -->
                           
                                                   
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
                                    <div>메뉴</div>
                                    <div class="product-table-info">
                                        <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_weight_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.menu}</div>
                                        <!-- <div>oz</div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="wrapper">
                    <div class="shop-header">
                        <h3>추천 전시</h3>
                        <a href="/catalog" class="link arrow-link">전체보기</a>
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
