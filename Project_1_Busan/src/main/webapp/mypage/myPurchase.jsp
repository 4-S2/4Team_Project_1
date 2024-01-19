<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.titbox .total_num_txt {
    color: grey; 
}
.thumbnail7 {
        width: 43px;
        height: 40px;
    }
.r-button {
        padding: 3px 5px; 
        /* 또는 */
        /* margin: 5px; 
    }
</style>
<script type="text/javascript">
function reviewInsert(no) {
    let x=(document.body.offsetWidth/2) - (640/2);
    let y=(window.screen.height/2) - (480/2) - 50;
    window.open("../busan/review_insert.do?no="+no, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
	} 
</script>
</head>
<body>
  <div class="myInquiry">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">나의<strong>구매내역</strong></h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${total }</strong>개의 구매내역이 있습니다.</span></p>
   	  </div>
		<div id="divBoardList2" >
		<!--TABLE-->
		<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
		    <thead>
		    <tr>
		        <th class="dp_pc num2" scope="col">번호</th>
		        <th class="title double ta_txt_center" scope="col" style="text-align: center;">상품명</th>
		        <th class="dp_pc reserve_date" scope="col">단가</th>
		        <th class="dp_pc num2" scope="col">수량</th>
		        <th class="write_date" scope="col">결제금액</th>
		        <th class="dp_pc reserve_date" scope="col">결제일</th>
		        <th class="dp_pc reserve_date" scope="col">리뷰</th>
		    </tr>
		    </thead>
		    <tbody>
				<c:choose>
				    <c:when test="${empty list}">
				        <tr>
				            <td colspan="4" class="empty">
				                구매 내역이 없습니다.
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
 				        <c:forEach var="vo" items="${list}">
				            <tr>
				                <td class="dp_pc num2">${vo.num}</td>
								<td class="title double ta_px20">
								    <a href="../store/goods_detail.do?gno=${vo.gno}" class="ellipsis">
								        <div style="float: left; margin-right: 10px;">
								            <img src="${vo.gvo.poster }" class="thumbnail7" style="border-radius: 10px;">
								        </div>
								        ${vo.gvo.gname}
								    </a>
								</td>
				                <td class="dp_pc writer"><fmt:formatNumber value="${vo.gvo.price}" pattern="#,###" />원</td>
				                <td class="dp_pc num2">${vo.amount}</td>
				                <td class="category px_20 ta_px10"><fmt:formatNumber value="${vo.amount * vo.gvo.price}" pattern="#,###" />원</td>
				                <td class="category px_20 ta_px10">${vo.regdate }</td>
				                	<td class="dp_pc writer">
										<input type="button" value="리뷰작성" onclick="reviewInsert(${vo.gno})" class="r-button">
									 </td>	
				            </tr>
				        </c:forEach> 
				    </c:otherwise>
				</c:choose>
		    </tbody>
		</table>
		<!--//TABLE-->
		
		<!--PAGING-->
			 <div class="row">
                <div class="text-center">
                    <ul class="pagination">
                        <c:if test="${startPage>1}">
                            <li><a href="../mypage/myPurchase.do?page=${startPage-1}">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="../mypage/myPurchase.do?page=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="../mypage/myPurchase.do?page=${endPage+1}">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>	
		<!--//PAGING-->
		</div>  
	</div>
</body>
</html>