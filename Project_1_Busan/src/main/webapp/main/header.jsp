<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	
	    <div class="navbar-header">
	    	<a class="navbar-brand" href="../main/main.do">Busan Tour</a>
	    </div>
	    
	    <ul class="nav navbar-nav">
	        <li class="dropdown">
	            <a class="dropdown-toggle" data-toggle="dropdown" href="#">부산 여행<span class="caret"></span></a>
		            <ul class="dropdown-menu">
			            <li><a href="../busan/tour.do">명소</a></li>
			            <li><a href="../busan/food.do">맛집</a></li>
			            <li><a href="../busan/festival.do">축제</a></li>
			            <li><a href="../busan/activity.do">체험</a></li>
			            <li><a href="../busan/ex.do">전시</a></li>
		            </ul>
	        </li>
	        
	        <li><a href="../busan/goods.do">특산물 쇼핑</a></li>
	        
	        <li class="dropdown">
	            <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
	            <ul class="dropdown-menu">
		            <li><a href="#">공지사항</a></li>
		            <li><a href="#">묻고 답하기</a></li>
	            </ul>
	        </li>
	    </ul>
	    
	    <ul class="navbar-user" style="float: right;">
	        <li style="display: inline-block;"><a href="../member/login.do" style="padding: 0 15px; line-height: 50px;">로그인</a></li>
	        <li style="display: inline-block;"><a href="../member/join.do" style="padding: 0 15px; line-height: 50px;">회원가입</a></li>
	        <li style="display: inline-block;"><a href="#"><img class="icon-cart" src="../images/icon_cart.png"></a></li>
        </ul>
    </div>
</nav>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div data-collapse="medium" data-animation="default" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="nav-bar w-nav">
    
    <!-- 네비게이션 바 -->
    <div class="nav-main">
        <div class="wrapper nav-bar-wrapper">
            <a href="/" aria-current="page" class="brand w-nav-brand w--current">
                <div>Busan Tour</div>
            </a>
            <div class="navigation">
                <nav role="navigation" class="nav-menu w-nav-menu">
                    <a href="../busan/festival.do"nav-link w-nav-link">부산여행</a>
                    <a href="/delivery" class="nav-link w-nav-link">특산물 쇼핑</a>
                    <a href="/about" class="nav-link w-nav-link">커뮤니티</a>
                   <!-- <a href="/contacts" class="nav-link w-nav-link">Contacts</a> -->
                </nav>
                <div class="menu-button w-nav-button">
                    <div class="w-icon-nav-menu"></div>
                </div>

                <div data-node-type="commerce-cart-wrapper" data-open-product="" data-wf-cart-type="modal" data-wf-cart-query="query Dynamo2 {
                    database {
                        id
                        commerceOrder {
                        comment
                        extraItems {
                            name
                            pluginId
                            pluginName
                            price {
                            value
                            unit
                            decimalValue
                            string
                            }
                        }
                        id
                        startedOn
                        statusFlags {
                            hasDownloads
                            hasSubscription
                            isFreeOrder
                            requiresShipping
                        }
                        subtotal {
                            value
                            unit
                            decimalValue
                            string
                        }
                        total {
                            value
                            unit
                            decimalValue
                            string
                        }
                        updatedOn
                        userItems {
                            count
                            id
                            product {
                            id
                            cmsLocaleId
                            f__draft_0ht
                            f__archived_0ht
                            f_name_
                            f_sku_properties_3dr {
                                id
                                name
                                enum {
                                id
                                name
                                slug
                                }
                            }
                            }
                            rowTotal {
                            value
                            unit
                            decimalValue
                            string
                            }
                            sku {
                            cmsLocaleId
                            f__draft_0ht
                            f__archived_0ht
                            f_main_image_4dr {
                                url
                                file {
                                size
                                origFileName
                                createdOn
                                updatedOn
                                mimeType
                                width
                                height
                                variants {
                                    origFileName
                                    quality
                                    height
                                    width
                                    s3Url
                                    error
                                    size
                                }
                                }
                                alt
                            }
                            f_price_ {
                                value
                                unit
                                decimalValue
                                string
                            }
                            f_sku_values_3dr {
                                property {
                                id
                                }
                                value {
                                id
                                }
                            }
                            id
                            }
                            subscriptionFrequency
                            subscriptionInterval
                            subscriptionTrial
                        }
                        userItemsCount
                        }
                    }
                    site {
                        id
                        commerce {
                        businessAddress {
                            country
                        }
                        defaultCountry
                        defaultCurrency
                        quickCheckoutEnabled
                        }
                    }
                    }
                    " data-wf-page-link-href-prefix="" class="w-commerce-commercecartwrapper">

                    <a href="#" data-node-type="commerce-cart-open-link" class="w-commerce-commercecartopenlink cart-button w-inline-block" role="button" aria-haspopup="dialog" aria-label="Open cart">
                        <div class="w-inline-block">Cart</div>
                        <img src="https://assets.website-files.com/5badda2935e11303a89a461e/5baf75c3bf02346640399fec_cart-icon.svg" alt="" class="cart-icon"/>
                        <div data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22Number%22%2C%22filter%22%3A%7B%22type%22%3A%22numberPrecision%22%2C%22params%22%3A%5B%220%22%2C%22numberPrecision%22%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItemsCount%22%7D%7D%5D" class="w-commerce-commercecartopenlinkcount item-count">0</div>
                    </a>
                    <div data-node-type="commerce-cart-container-wrapper" style="display:none" class="w-commerce-commercecartcontainerwrapper w-commerce-commercecartcontainerwrapper--cartType-modal">
                        <div data-node-type="commerce-cart-container" role="dialog" class="w-commerce-commercecartcontainer cart-container">
                            <div class="w-commerce-commercecartheader cart-header">
                                <h4 class="w-commerce-commercecartheading">Your Cart</h4>
                                <a href="#" data-node-type="commerce-cart-close-link" class="w-commerce-commercecartcloselink w-inline-block" role="button" aria-label="Close cart">
                                    <svg width="16px" height="16px" viewBox="0 0 16 16">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g fill-rule="nonzero" fill="#333333">
                                                <polygon points="6.23223305 8 0.616116524 13.6161165 2.38388348 15.3838835 8 9.76776695 13.6161165 15.3838835 15.3838835 13.6161165 9.76776695 8 15.3838835 2.38388348 13.6161165 0.616116524 8 6.23223305 2.38388348 0.616116524 0.616116524 2.38388348 6.23223305 8"></polygon>
                                            </g>
                                        </g>
                                    </svg>
                                </a>
                            </div>
                            <div class="w-commerce-commercecartformwrapper">
                                <form data-node-type="commerce-cart-form" style="display:none" class="w-commerce-commercecartform">
                                    <script type="text/x-wf-template" id="wf-template-9336d8a7-ba52-2880-0c69-78271ccadf80">
                                                    %3Cdiv%20class%3D%22w-commerce-commercecartitem%22%3E%3Cimg%20data-wf-bindings%3D%22%255B%257B%2522src%2522%253A%257B%2522type%2522%253A%2522ImageRef%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.sku.f_main_image_4dr%2522%257D%257D%255D%22%20src%3D%22%22%20alt%3D%22%22%20class%3D%22w-commerce-commercecartitemimage%20w-dyn-bind-empty%22%2F%3E%3Cdiv%20class%3D%22w-commerce-commercecartiteminfo%22%3E%3Cdiv%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522PlainText%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_name_%2522%257D%257D%255D%22%20class%3D%22w-commerce-commercecartproductname%20w-dyn-bind-empty%22%3E%3C%2Fdiv%3E%3Cdiv%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522CommercePrice%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522price%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.sku.f_price_%2522%257D%257D%255D%22%3E%24%C2%A00.00%C2%A0USD%3C%2Fdiv%3E%3Ca%20href%3D%22%23%22%20role%3D%22%22%20data-wf-bindings%3D%22%255B%257B%2522data-commerce-sku-id%2522%253A%257B%2522type%2522%253A%2522ItemRef%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.sku.id%2522%257D%257D%255D%22%20class%3D%22w-inline-block%22%20data-wf-cart-action%3D%22remove-item%22%20data-commerce-sku-id%3D%22%22%20aria-label%3D%22Remove%20item%20from%20cart%22%3E%3Cdiv%20class%3D%22cart-remove-link%22%3ERemove%3C%2Fdiv%3E%3C%2Fa%3E%3Cscript%20type%3D%22text%2Fx-wf-template%22%20id%3D%22wf-template-c45e9499-40b7-87db-1211-9942e2063fb9%22%3E%253Cli%253E%253Cspan%2520data-wf-bindings%253D%2522%25255B%25257B%252522innerHTML%252522%25253A%25257B%252522type%252522%25253A%252522PlainText%252522%25252C%252522filter%252522%25253A%25257B%252522type%252522%25253A%252522identity%252522%25252C%252522params%252522%25253A%25255B%25255D%25257D%25252C%252522dataPath%252522%25253A%252522database.commerceOrder.userItems%25255B%25255D.product.f_sku_properties_3dr%25255B%25255D.name%252522%25257D%25257D%25255D%2522%253E%253C%252Fspan%253E%253Cspan%2520data-wf-bindings%253D%2522%25255B%25257B%252522innerHTML%252522%25253A%25257B%252522type%252522%25253A%252522CommercePropValues%252522%25252C%252522filter%252522%25253A%25257B%252522type%252522%25253A%252522identity%252522%25252C%252522params%252522%25253A%25255B%25255D%25257D%25252C%252522dataPath%252522%25253A%252522database.commerceOrder.userItems%25255B%25255D.product.f_sku_properties_3dr%25255B%25255D%252522%25257D%25257D%25255D%2522%253E%253C%252Fspan%253E%253C%252Fli%253E%3C%2Fscript%3E%3Cul%20data-wf-bindings%3D%22%255B%257B%2522optionSets%2522%253A%257B%2522type%2522%253A%2522CommercePropTable%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%5B%5D%2522%257D%257D%252C%257B%2522optionValues%2522%253A%257B%2522type%2522%253A%2522CommercePropValues%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.sku.f_sku_values_3dr%2522%257D%257D%255D%22%20class%3D%22w-commerce-commercecartoptionlist%22%20data-wf-collection%3D%22database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%22%20data-wf-template-id%3D%22wf-template-c45e9499-40b7-87db-1211-9942e2063fb9%22%3E%3Cli%3E%3Cspan%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522PlainText%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%255B%255D.name%2522%257D%257D%255D%22%3E%3C%2Fspan%3E%3Cspan%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522CommercePropValues%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%255B%255D%2522%257D%257D%255D%22%3E%3C%2Fspan%3E%3C%2Fli%3E%3C%2Ful%3E%3C%2Fdiv%3E%3Cinput%20type%3D%22number%22%20data-wf-bindings%3D%22%255B%257B%2522value%2522%253A%257B%2522type%2522%253A%2522Number%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522numberPrecision%2522%252C%2522params%2522%253A%255B%25220%2522%252C%2522numberPrecision%2522%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.count%2522%257D%257D%252C%257B%2522data-commerce-sku-id%2522%253A%257B%2522type%2522%253A%2522ItemRef%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.sku.id%2522%257D%257D%255D%22%20class%3D%22w-commerce-commercecartquantity%20input%20quantity-input%22%20required%3D%22%22%20pattern%3D%22%5E%5B0-9%5D%2B%24%22%20inputMode%3D%22numeric%22%20name%3D%22quantity%22%20autoComplete%3D%22off%22%20data-wf-cart-action%3D%22update-item-quantity%22%20data-commerce-sku-id%3D%22%22%20value%3D%221%22%2F%3E%3C%2Fdiv%3E
                                                </script>
                                    <div class="w-commerce-commercecartlist cart-list" data-wf-collection="database.commerceOrder.userItems" data-wf-template-id="wf-template-9336d8a7-ba52-2880-0c69-78271ccadf80">
                                        <div class="w-commerce-commercecartitem">
                                            <img data-wf-bindings="%5B%7B%22src%22%3A%7B%22type%22%3A%22ImageRef%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.sku.f_main_image_4dr%22%7D%7D%5D" src="" alt="" class="w-commerce-commercecartitemimage w-dyn-bind-empty"/>
                                            <div class="w-commerce-commercecartiteminfo">
                                                <div data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22PlainText%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.product.f_name_%22%7D%7D%5D" class="w-commerce-commercecartproductname w-dyn-bind-empty"></div>
                                                <div data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22CommercePrice%22%2C%22filter%22%3A%7B%22type%22%3A%22price%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.sku.f_price_%22%7D%7D%5D">$ 0.00 USD</div>
                                                <a href="#" role="" data-wf-bindings="%5B%7B%22data-commerce-sku-id%22%3A%7B%22type%22%3A%22ItemRef%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.sku.id%22%7D%7D%5D" class="w-inline-block" data-wf-cart-action="remove-item" data-commerce-sku-id="" aria-label="Remove item from cart">
                                                    <div class="cart-remove-link">Remove</div>
                                                </a>
                                                <script type="text/x-wf-template" id="wf-template-c45e9499-40b7-87db-1211-9942e2063fb9">
                                                                %3Cli%3E%3Cspan%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522PlainText%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%255B%255D.name%2522%257D%257D%255D%22%3E%3C%2Fspan%3E%3Cspan%20data-wf-bindings%3D%22%255B%257B%2522innerHTML%2522%253A%257B%2522type%2522%253A%2522CommercePropValues%2522%252C%2522filter%2522%253A%257B%2522type%2522%253A%2522identity%2522%252C%2522params%2522%253A%255B%255D%257D%252C%2522dataPath%2522%253A%2522database.commerceOrder.userItems%255B%255D.product.f_sku_properties_3dr%255B%255D%2522%257D%257D%255D%22%3E%3C%2Fspan%3E%3C%2Fli%3E
                                                            </script>
                                                <ul data-wf-bindings="%5B%7B%22optionSets%22%3A%7B%22type%22%3A%22CommercePropTable%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.product.f_sku_properties_3dr[]%22%7D%7D%2C%7B%22optionValues%22%3A%7B%22type%22%3A%22CommercePropValues%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.sku.f_sku_values_3dr%22%7D%7D%5D" class="w-commerce-commercecartoptionlist" data-wf-collection="database.commerceOrder.userItems%5B%5D.product.f_sku_properties_3dr" data-wf-template-id="wf-template-c45e9499-40b7-87db-1211-9942e2063fb9">
                                                    <li>
                                                        <span data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22PlainText%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.product.f_sku_properties_3dr%5B%5D.name%22%7D%7D%5D"></span>
                                                        <span data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22CommercePropValues%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.product.f_sku_properties_3dr%5B%5D%22%7D%7D%5D"></span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <input type="number" data-wf-bindings="%5B%7B%22value%22%3A%7B%22type%22%3A%22Number%22%2C%22filter%22%3A%7B%22type%22%3A%22numberPrecision%22%2C%22params%22%3A%5B%220%22%2C%22numberPrecision%22%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.count%22%7D%7D%2C%7B%22data-commerce-sku-id%22%3A%7B%22type%22%3A%22ItemRef%22%2C%22filter%22%3A%7B%22type%22%3A%22identity%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.userItems%5B%5D.sku.id%22%7D%7D%5D" class="w-commerce-commercecartquantity input quantity-input" required="" pattern="^[0-9]+$" inputMode="numeric" name="quantity" autoComplete="off" data-wf-cart-action="update-item-quantity" data-commerce-sku-id="" value="1"/>
                                        </div>
                                    </div>
                                    <div class="w-commerce-commercecartfooter cart-footer">
                                        <div aria-atomic="false" aria-live="" class="w-commerce-commercecartlineitem">
                                            <div>Subtotal</div>
                                            <div data-wf-bindings="%5B%7B%22innerHTML%22%3A%7B%22type%22%3A%22CommercePrice%22%2C%22filter%22%3A%7B%22type%22%3A%22price%22%2C%22params%22%3A%5B%5D%7D%2C%22dataPath%22%3A%22database.commerceOrder.subtotal%22%7D%7D%5D" class="w-commerce-commercecartordervalue"></div>
                                        </div>
                                        <div>
                                            <div data-node-type="commerce-cart-quick-checkout-actions" style="display:none">
                                                <a data-node-type="commerce-cart-apple-pay-button" role="button" aria-haspopup="dialog" aria-label="Apple Pay" style="background-image:-webkit-named-image(apple-pay-logo-white);background-size:100% 50%;background-position:50% 50%;background-repeat:no-repeat" class="w-commerce-commercecartapplepaybutton cart-pay-button" tabindex="0">
                                                    <div></div>
                                                </a>
                                                <a data-node-type="commerce-cart-quick-checkout-button" role="button" tabindex="0" aria-haspopup="dialog" style="display:none" class="w-commerce-commercecartquickcheckoutbutton cart-pay-button">
                                                    <svg class="w-commerce-commercequickcheckoutgoogleicon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16" height="16" viewBox="0 0 16 16">
                                                        <defs>
                                                            <polygon id="google-mark-a" points="0 .329 3.494 .329 3.494 7.649 0 7.649"></polygon>
                                                            <polygon id="google-mark-c" points=".894 0 13.169 0 13.169 6.443 .894 6.443"></polygon>
                                                        </defs>
                                                        <g fill="none" fill-rule="evenodd">
                                                            <path fill="#4285F4" d="M10.5967,12.0469 L10.5967,14.0649 L13.1167,14.0649 C14.6047,12.6759 15.4577,10.6209 15.4577,8.1779 C15.4577,7.6339 15.4137,7.0889 15.3257,6.5559 L7.8887,6.5559 L7.8887,9.6329 L12.1507,9.6329 C11.9767,10.6119 11.4147,11.4899 10.5967,12.0469"></path>
                                                            <path fill="#34A853" d="M7.8887,16 C10.0137,16 11.8107,15.289 13.1147,14.067 C13.1147,14.066 13.1157,14.065 13.1167,14.064 L10.5967,12.047 C10.5877,12.053 10.5807,12.061 10.5727,12.067 C9.8607,12.556 8.9507,12.833 7.8887,12.833 C5.8577,12.833 4.1387,11.457 3.4937,9.605 L0.8747,9.605 L0.8747,11.648 C2.2197,14.319 4.9287,16 7.8887,16"></path>
                                                            <g transform="translate(0 4)">
                                                                <mask id="google-mark-b" fill="#fff">
                                                                    <use xlink:href="#google-mark-a"></use>
                                                                </mask>
                                                                <path fill="#FBBC04" d="M3.4639,5.5337 C3.1369,4.5477 3.1359,3.4727 3.4609,2.4757 L3.4639,2.4777 C3.4679,2.4657 3.4749,2.4547 3.4789,2.4427 L3.4939,0.3287 L0.8939,0.3287 C0.8799,0.3577 0.8599,0.3827 0.8459,0.4117 C-0.2821,2.6667 -0.2821,5.3337 0.8459,7.5887 L0.8459,7.5997 C0.8549,7.6167 0.8659,7.6317 0.8749,7.6487 L3.4939,5.6057 C3.4849,5.5807 3.4729,5.5587 3.4639,5.5337" mask="url(#google-mark-b)"></path>
                                                            </g>
                                                            <mask id="google-mark-d" fill="#fff">
                                                                <use xlink:href="#google-mark-c"></use>
                                                            </mask>
                                                            <path fill="#EA4335" d="M0.894,4.3291 L3.478,6.4431 C4.113,4.5611 5.843,3.1671 7.889,3.1671 C9.018,3.1451 10.102,3.5781 10.912,4.3671 L13.169,2.0781 C11.733,0.7231 9.85,-0.0219 7.889,0.0001 C4.941,0.0001 2.245,1.6791 0.894,4.3291" mask="url(#google-mark-d)"></path>
                                                        </g>
                                                    </svg>
                                                    <svg class="w-commerce-commercequickcheckoutmicrosofticon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                                                        <g fill="none" fill-rule="evenodd">
                                                            <polygon fill="#F05022" points="7 7 1 7 1 1 7 1"></polygon>
                                                            <polygon fill="#7DB902" points="15 7 9 7 9 1 15 1"></polygon>
                                                            <polygon fill="#00A4EE" points="7 15 1 15 1 9 7 9"></polygon>
                                                            <polygon fill="#FFB700" points="15 15 9 15 9 9 15 9"></polygon>
                                                        </g>
                                                    </svg>
                                                    <div>Pay with browser.</div>
                                                </a>
                                            </div>
                                            <div data-wf-paypal-button="{&quot;layout&quot;:&quot;horizontal&quot;,&quot;color&quot;:&quot;blue&quot;,&quot;shape&quot;:&quot;pill&quot;,&quot;label&quot;:&quot;paypal&quot;,&quot;tagline&quot;:false,&quot;note&quot;:false}" class="cart-pay-button"></div>
                                            <a href="/checkout" value="Continue to Checkout" data-node-type="cart-checkout-button" class="w-commerce-commercecartcheckoutbutton button" data-loading-text="Hang Tight...">Continue to Checkout</a>
                                        </div>
                                    </div>
                                </form>
                                <div class="w-commerce-commercecartemptystate">
                                    <div>No items found.</div>
                                </div>
                                <div aria-live="" style="display:none" data-node-type="commerce-cart-error" class="w-commerce-commercecarterrorstate form-error">
                                    <div class="w-cart-error-msg" data-w-cart-quantity-error="Product is not available in this quantity." data-w-cart-general-error="Something went wrong when adding this item to the cart." data-w-cart-checkout-error="Checkout is disabled on this site." data-w-cart-cart_order_min-error="The order minimum was not met. Add more items to your cart to continue." data-w-cart-subscription_error-error="Before you purchase, please use your email invite to verify your address so we can send order updates.">Product is not available in this quantity.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  --%>