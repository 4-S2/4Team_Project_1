<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
<style>
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
.product {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    width: auto;
    margin-top: 54px;
    padding: 80px;
    -webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    border-radius: 16px;
    background-color: #fff;
    box-shadow: 0 1px 15px 0 rgba(0, 0, 0, 0.15);
}
.product-table {
    width: 350px;
    height: auto; 
    margin-top: 0px; 
    margin-right: 15px;
    margin-left: 54px;
    padding: 15px 30px;
    border: 2px solid #e5e5e5;
    border-radius: 15px;
}
.product-poster {
    /* width: 60%; */
    border-radius: 15px;
    overflow: hidden;
}
</style>

</head>
<body>
	<div class="section no-padding-vertical">
		<div class="wrapper side-paddings">
			<div class="product">
			
				<div class="product-top">
				<div><h1> ${vo.fvo.title }</h1></div>
					<div class="product-poster">
						<img alt="대표 이미지" src="${vo.fvo.poster }" width="300" height="300" />

					</div>
							
							</div>
							<!-- 테이블 -->
							<div class="detail-table">
							
								<div class="product-table">
									<div class="product-table-cell">
										<div>예약일</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">
												${vo.day}
											</div>
										</div>
									</div>	
									<div class="product-table-cell">
										<div>예약시간</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.time }
											</div>
										</div>
									</div>									
									<div class="product-table-cell">
										<div>예약인원</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.inwon}명
											</div>
										</div>
									</div>	
									<div class="product-table-cell">
										<div>예약신청일</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.regdate}
											</div>
										</div>
									</div>									
									<div class="product-table-cell">
										<div>승인상태</div>
										<div class="product-table-info">
	 								<c:if test="${vo.ok == 0 }">
											<div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">
											승인대기
											</div>
					                </c:if>
					                <c:if test="${vo.ok == 1 }">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">
											승인완료
											</div>
					                </c:if>
					                <c:if test="${vo.ok == 2 }">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">
											예약취소
											</div>
					                </c:if>						                				          										
										</div>
									</div>																									
									<div class="product-table-cell">
										<div>주소</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_width_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.fvo.addr}
											</div>
										</div>
									</div>									
									<div class="product-table-cell">
										<div>전화번호</div>
										<div class="product-table-info">
											<div
												data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_height_%22%2C%22to%22%3A%22innerHTML%22%7D%5D">${vo.fvo.phone}</div>
										</div>
									</div>
								</div>
							</div>
						<!-- 	<p class="cont">소개글</p> -->
							</div>
							</div>
							</div>
</body>
</html>