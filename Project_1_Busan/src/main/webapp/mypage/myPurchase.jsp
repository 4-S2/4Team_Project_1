<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.titbox .total_num_txt {
    color: grey; 
}

</style>
</head>
<body>
  <div class="myInquiry">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">나의<strong>구매내역</strong></h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>0</strong>개의 구매내역이 있습니다.</span></p>
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
		        <th class="dp_pc reserve_date" scope="col">결제일시</th>
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
<%-- 				        <c:forEach var="vo" items="${list}">
				            <tr>
				                <td class="dp_pc num2">${vo.qno}</td>
				                <td class="title double ta_px20">
				                    <a href="../board/qnaboard_detail.do?qno=${vo.qno}" class="ellipsis">${vo.subject}</a>
				                </td>
				                <td class="dp_pc writer">${vo.regdate}</td>
				                <c:if test="${vo.status == 0 }">
				                	<td class="category px_20 ta_px10">답변대기</td>
				                </c:if>
				                <c:if test="${vo.status == 1 }">
				                	<td class="category px_20 ta_px10"><strong>답변완료</strong></td>
				                </c:if>				                
				            </tr>
				        </c:forEach> --%>
				    </c:otherwise>
				</c:choose>
		    </tbody>
		</table>
		<!--//TABLE-->
		
		<!--PAGING-->
		<div class="pc_mt30 pc_pb80 paging_area">

		</div>
		<!--//PAGING-->
		</div>  
	</div>
</body>
</html>