<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
</head>
<body>
  <div class="myInquiry">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox"><strong>회원</strong>관리</h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${mSize}</strong>명의 회원이 있습니다.</span></p>
   	  </div>
		<div id="divBoardList2" >
		<!--TABLE-->
		<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
		    <thead>
		    <tr>
		        <th class="dp_pc num2" scope="col">번호</th>
<!-- 		        <th class="title double ta_txt_center" scope="col" style="text-align: center;">제목</th> -->
				<th class="dp_pc reserve_date" scope="col">아이디</th>
		        <th class="dp_pc reserve_date" scope="col">이름</th>
		        <th class="dp_pc reserve_date" scope="col">전화번호</th>
		        <th class="dp_pc reserve_date" scope="col">이메일</th>
		        <th class="title double ta_txt_center" scope="col" style="text-align: center;">주소</th>
<!-- 		        <th class="write_date" scope="col">처리상태</th> -->
		    </tr>
		    </thead>
		    <tbody>
				<c:choose>
				    <c:when test="${empty mlist}">
				        <tr>
				            <td colspan="6" class="empty">
				                등록된 회원이 없습니다.
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <c:forEach var="vo" items="${mlist} " varStatus="m">
				            <!-- <a href=#" class="ellipsis"> --><tr>
 				                <td class="dp_pc num2">${m.count}</td>
				                	<td class="category px_20 ta_px10">${vo.id}</td>
				                	<td class="category px_20 ta_px10">${vo.name}</td>
				                	<td class="category px_20 ta_px10">${vo.phone}</td>	
				                	<td class="category px_20 ta_px10">${vo.email}</td>			                
				                <td class="title double ta_px20">
				                	${vo.addr} 
				                    <%-- <a href="../board/qnaboard_detail.do?qno=${vo.qno}" class="ellipsis">${vo.subject}</a> --%>
			                	</td> 
<%-- 				                <td class="dp_pc writer">${vo.regdate}</td>  --%>
				            </tr><!-- </a> -->
				        </c:forEach>
				    </c:otherwise>
				</c:choose>
		    </tbody>
		</table>
		<!--//TABLE-->
		
		<!--PAGING-->
<!-- 		<div class="pc_mt30 pc_pb80 paging_area">
		<script>
			var pagingExecutor= {
				pagingSubmit : function(page) {
					var paging = {
						 start: page
						,length: 15
					}
		 			doMyQnaPage(paging);
				}
			}
		</script> -->
		</div>
		<!--//PAGING-->
		</div>   	  
  </div>
</body>
</html>