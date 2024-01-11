<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html data-wf-page="5badda2935e11305319a461d" data-wf-site="5badda2935e11303a89a461e">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>Busan Tour</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <!-- <link rel="stylesheet" type="text/css" href="../css/reset.css" /> -->
        <link rel="stylesheet" type="text/css" href="../css/pc.css" />
        <!-- <link href="../css/mainlist.css" rel="stylesheet" type="text/css"/> -->
        
        <style type="text/stylesheet">
            .nav-bar .navbar-user{
                float: right;
                list-style: none;
            }
            .nav-bar .navbar-user li{
                display: inline-block;
                color: #9d9d9d;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            !function(o, c) {
                var n = c.documentElement
                  , t = " w-mod-";
                n.className += t + "js",
                ("ontouchstart"in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
            }(window, document);
        </script>
        <!-- <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd83035e7345f2f22c0bece_favicon.png" rel="shortcut icon" type="image/x-icon"/>
        <link href="https://assets.website-files.com/5badda2935e11303a89a461e/5bd8303816e1ea6c375be6cb_webclip.png" rel="apple-touch-icon"/> -->
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
    	<!-- header -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <div class="page-wrapper">
			<!-- home -->
			<jsp:include page="${main_jsp }"></jsp:include>
        </div>
        
        <!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
		
        <!-- <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5badda2935e11303a89a461e" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
        <script src="https://assets.website-files.com/5badda2935e11303a89a461e/js/webflow.9828d3d6a.js" type="text/javascript"></script>

        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                var tourSlide = new Swiper(".tourSlide", {
                    spaceBetween: 0,
                    centeredSlides: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    loop: true,
                    pagination: {
                        el: ".tourSlide .swiper-pagination",
                        clickable: true,
                    },
                    navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    },
                });
                
                var festivalSlide = new Swiper(".festivalSlide", {
                    spaceBetween: 0,
                    centeredSlides: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    loop: true,
                    pagination: {
                        el: ".festivalSlide .swiper-pagination",
                        clickable: true,
                    },
                    /* navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    }, */
                });
                
                var activitySlide = new Swiper(".activitySlide", {
                    spaceBetween: 0,
                    centeredSlides: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    loop: true,
                    pagination: {
                        el: ".activitySlide .swiper-pagination",
                        clickable: true,
                    },
                    /* navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    }, */
                });
            });

            /* var shopSlide = new Swiper(".shopSlide", {
                direction: "vertical",
                spaceBetween: 10,
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                loop: true,
            }); */
        </script>
        
        <script>
		    document.addEventListener('DOMContentLoaded', function () {
		        var topButton = document.getElementById('topBtn');
		
		        // Show/hide the button based on scroll position
		        /* window.addEventListener('scroll', function () {
		            if (window.scrollY > 300) {
		                topButton.style.display = 'block';
		            } else {
		                topButton.style.display = 'none';
		            }
		        }); */
		
		        // Smooth scroll to the top when the button is clicked
		        topButton.addEventListener('click', function () {
		            window.scrollTo({
		                top: 0,
		                behavior: 'smooth'
		            });
		        });
		    });
		</script>
    </body>
</html>
