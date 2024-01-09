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
<script type="text/javascript">
$(function(){../admin/member_detail.do?id=${vo.id}
	  $("#mypage tr").click(function(){
			let x=(document.body.offsetWidth/2)-(750/2)
			let y=(window.screen.height/2)-(500/2)-50
			let id=$(this).attr('data-id')
			window.open("../admin/member_detail.do?id="+id,"",'width=750, height=500, left='+x+', top='+y)
	  })
	});
</script>
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
		        <th class="title double ta_txt_center" style="text-align: center;" scope="col">이메일</th>
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
				        <c:forEach var="vo" items="${mlist}" varStatus="m">
				             <tr data-id="${vo.id}"><%--<a href="#" class="ellipsis">--%>
				                <td class="dp_pc num2"><a href="#"> ${m.index + 1}</a></td>
				                <td class="category px_20 ta_px10"><a href="../admin/member_detail.do?id=${vo.id}">${vo.id}</a></td>
				                <td class="category px_20 ta_px10"><a href="#">${vo.name}</a></td>
				                <td class="category px_20 ta_px10"><a href="#">${vo.phone}</a></td>
				                <td class="category px_20 ta_px10"><a href="#">${vo.email}</a></td>                       
				                <td class="title double ta_px20" style="text-align: center;">
				                    <a href="#">${vo.addr}</a> 
				                     <%-- <a href="../board/qnaboard_detail.do?qno=${vo.qno}" class="ellipsis">${vo.subject}</a> --%>
				                </td> 
<%-- 				                <td class="dp_pc writer">${vo.regdate}</td>  --%>				                
				            </tr>
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
</body>
</html>