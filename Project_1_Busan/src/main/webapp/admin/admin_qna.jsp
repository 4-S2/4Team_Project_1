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
.cancel-button {
        padding: 3px 5px;
    }
</style>
<script type="text/javascript">
function qnaAnswer(qno) {
	let x=(document.body.offsetWidth/2)-(750/2)
	let y=(window.screen.height/2)-(500/2)-50
	window.open("../admin/admin_qna_detail.do?qno="+qno,"",'width=650, height=500, left='+x+', top='+y)
}
</script>
</head>
<body>
  <div class="myInquiry">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">회원<strong>문의내역</strong></h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${inqSize}</strong>개의 미답변된 문의가 있습니다.</span></p>
   	  </div>
		<div id="divBoardList2" >
		<!--TABLE-->
		<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
		    <thead>
		    <tr>
		        <th class="dp_pc num2" scope="col">번호</th>
		        <th class="title double ta_txt_center" scope="col" style="text-align: center;">제목</th>
		        <th class="dp_pc reserve_date" scope="col">아이디</th>
		        <th class="dp_pc reserve_date" scope="col">이름</th>
		        <th class="dp_pc reserve_date" scope="col">등록일</th>
		        <th class="write_date" scope="col">처리상태</th>
		    </tr>
		    </thead>
		    <tbody>
				<c:choose>
				    <c:when test="${empty list}">
				        <tr>
				            <td colspan="4" class="empty">
				                등록된 내용이 없습니다.
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <c:forEach var="vo" items="${list}">
				            <tr>
				                <td class="dp_pc num2">${vo.num}</td>
				                <td class="title double ta_px20">
				                    <a href="../board/qnaboard_detail.do?qno=${vo.qno}" class="ellipsis">${vo.subject}</a>
				                </td>
				                <c:if test="${vo.id == null }">
				                	<td class="dp_pc writer" style="color: gray;">비회원</td>
				                </c:if>
				                <c:if test="${vo.id != null }">
				                	<td class="dp_pc writer">${vo.id}</td>
				                </c:if>	
				                <td class="dp_pc writer">${vo.name}</td>
			                
				                <td class="dp_pc writer">${vo.regdate}</td>
				                <c:if test="${vo.status == 0 }">
				                    <td class="dp_pc writer">
				                	<input type="button" value="답변하기" onclick="qnaAnswer(${vo.qno })" class="cancel-button">
				                	</td>
				                </c:if>
				                <c:if test="${vo.status == 1 }">
				                	<td class="category px_20 ta_px10">답변완료</td>
				                </c:if>				                
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
                            <li><a href="admin_qna.do?page=${startPage-1}">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="admin_qna.do?page=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="admin_qna.do?page=${endPage+1}">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>	
		<!--//PAGING-->
		</div>   	  
  </div>
</body>
</html>