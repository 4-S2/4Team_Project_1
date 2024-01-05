<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tab_area.tab2 button {
    width: 50%;
}
.tab_area.sub4 button {
    height: 70px;
}
.tab_area button:last-child {
    border-radius: 0 10px 10px 0;
    border-right: 1px solid #e7e7e7;
}
.tab_area button {
    overflow: hidden;
    position: relative;
    display: inline-block;
    height: 66px;
    border: 1px solid #e7e7e7;
    border-left: none;
    border-right: none;
    cursor: pointer;
}
.div{
    margin: 0;
    padding: 0;
    border: 0;
    font-family: 'notosans', 'Dotum', sans-serif;
    box-sizing: border-box;
    border-collapse: separate;
    letter-spacing: -0.6px;
    word-break: keep-all;
}
.tab_area.mypage button span {
    font-size: 16px;
}
.tab_area.sub4 button span {
    font-size: 16px;
    line-height: 68px;
}
.tab_area button.on span {
    color: #ffffff;
}

.tab_area button span {
    position: relative;
    display: block;
    color: #00548b;
    font-size: 18px;
    text-align: center;
    line-height: 66px;
    z-index: 20;
}
.tab_area {
    height: 68px;
    font-size: 0;
}
.pc_mt30 {
    margin-top: 30px;
}

.titbox .total_num_txt {
    color: grey; 
}

/* Hidden 클래스 정의 */
.hidden {
    display: none;
}

/* 활성화된 탭의 스타일 */
.on {
    background-color: blue; /* 활성화된 탭의 배경색을 파란색으로 설정 */
    color: white; /* 글자색을 흰색으로 설정 */
}


</style>
<script type="text/javascript">
function toggleTab(tabIndex) {
    // 모든 테이블 숨기기
    document.getElementById('table1').classList.add('hidden');
    document.getElementById('table2').classList.add('hidden');

    // 모든 탭의 활성화 클래스 제거
    var buttons = document.querySelectorAll('.tab_box button');
    buttons.forEach(function(button) {
        button.classList.remove('on');
    });

    // 선택한 탭의 테이블 표시 및 해당 탭 활성화
    if (tabIndex === 0) {
        document.getElementById('table1').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    } else if (tabIndex === 1) {
        document.getElementById('table2').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    }
}

</script>
</head>
<body>
  <div class="myReserv">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">나의<strong>예약내역</strong></h4>
   	  </div>
    	<div style="height: 30px"></div>
		<div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab2 sub4 mypage">
                <div class="tab_box">
                    <button onclick="javascript:" class="h40  on"><span>맛집</span></button>
                    <button onclick="javascript:" class="h40 "><span>전시회</span></button>
                </div>
        </div>
        
        <div id="table1" class="hidden">맛집 테이블</div>
		<div id="table2" class="hidden">전시회 테이블</div>
<!-- 		<div id="divBoardList2" >
		TABLE
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
				<c:choose>
				    <c:when test="">
				        <tr>
				            <td colspan="4" class="empty">
				                등록된 내용이 없습니다.
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <c:forEach var="vo" items="">
				            <tr>
				                <td class="dp_pc num2"></td>
				                <td class="title double ta_px20">
				                    <a href="../board/qnaboard_detail.do?qno=" class="ellipsis"></a>
				                </td>
				                <td class="dp_pc writer"></td>
				                <c:if test="">
				                	<td class="category px_20 ta_px10">답변대기</td>
				                </c:if>
				                <c:if test="">
				                	<td class="category px_20 ta_px10"><strong>답변완료</strong></td>
				                </c:if>				                
				            </tr>
				        </c:forEach>
				    </c:otherwise>
				</c:choose>
		    </tbody>
		</table>
		//TABLE
  </div> -->
</body>
</html>