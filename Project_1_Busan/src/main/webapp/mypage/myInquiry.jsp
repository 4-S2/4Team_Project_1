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
                <h4 class="titbox">나의<strong>문의내역</strong></h4>
   	  </div>
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>0</strong>개의 질문이 있습니다.</span></p>
   	  </div>
		<div id="divBoardList2" ><!--TABLE-->
		<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
		    <thead>
		    <tr>
		        <th class="dp_pc num2" scope="col">번호</th>
		        <th class="title double ta_txt_center" scope="col" style="text-align: center;">제목</th>
		        <th class="dp_pc reserve_date" scope="col">등록일</th>
		        <th class="write_date" scope="col">처리 상태</th>
		    </tr>
		    </thead>
		    <tbody>
<!-- 		    <tr>
		                <td colspan="4" class="empty">
		                    등록된 내용이 없습니다.</td>
		        </tr> -->
		        
		    <tr>
                <td class="dp_pc num2">1</td>
                <td class="title double ta_px20">
                    <a href="#" class="ellipsis">SNS 마케팅 마스터하기 - 블로그, 인스타그램</a><br>
                    2023.12.28 ~ 2024.1.26
                </td>
                <td class="dp_pc writer">7%</td>
                <td class="category px_20 ta_px10">
                        -
                </td>
            </tr>
		    </tbody>
		</table>
		<!--//TABLE-->
		
		<!--PAGING-->
		<div class="pc_mt30 pc_pb80 paging_area">
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
		</script>
		</div>
		<!--//PAGING-->
		</div>   	  
  </div>
</body>
</html>