<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.tab_area button.on::after {
    background-color: #00548b;
}
.tab_area button.on::after {
    z-index: 10;
}

/* 활성화된 탭의 스타일 */
.on {
    background-color: #00548b; /* 활성화된 탭의 배경색을 파란색으로 설정 */
    color: white; /* 글자색을 흰색으로 설정 */
}

.tab_area button::after {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    content: '';
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
   	 <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>0</strong>개의 예약내역이 있습니다.</span></p>
   	  </div>
		<div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab2 sub4 mypage">
		    <div class="tab_box">
		        <button onclick="toggleTab(0)" class="h40 on"><span>맛집</span></button>
		        <button onclick="toggleTab(1)" class="h40"><span>전시회</span></button>
		    </div>
		</div>

        <!--  맛집 예약 -->
        <div id="table1" class="">
	        <!--TABLE-->
			<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
			    <thead>
			    <tr>
			        <th class="dp_pc num2" scope="col">번호</th>
			        <th class="title double ta_txt_center" scope="col" style="text-align: center;">식당명</th>
			        <th class="dp_pc reserve_date" scope="col">예약일시</th>
			        <th class="dp_pc num2" scope="col">인원</th>
			        <th class="write_date" scope="col">승인상태</th>
			    </tr>
			    </thead>
			    <tbody>
<%-- 					<c:choose>
					    <c:when test="${empty list}"> --%>
					        <tr>
					            <td colspan="4" class="empty">
					                예약내역이 없습니다.
					            </td>
					        </tr>
<%-- 					    </c:when>
					    <c:otherwise>
					        <c:forEach var="vo" items="${list}">
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
					        </c:forEach>
					    </c:otherwise> 
 					</c:choose> --%>
			    </tbody>
			</table>
			<!--//TABLE-->
        </div>
        
		<!--  전시회 예약 -->
		<div id="table2" class="hidden">
	        <!--TABLE-->
			<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
			    <thead>
			    <tr>
			        <th class="dp_pc num2" scope="col">번호</th>
			        <th class="title double ta_txt_center" scope="col" style="text-align: center;">전시회명</th>
			        <th class="dp_pc reserve_date" scope="col">예약일시</th>
			        <th class="dp_pc num2" scope="col">인원</th>
			        <th class="dp_pc reserve_date" scope="col">결제상태</th>
			        <th class="write_date" scope="col">승인상태</th>
			    </tr>
			    </thead>
			    <tbody>
<%-- 					<c:choose>
					    <c:when test="${empty list}"> --%>
					        <tr>
					            <td colspan="4" class="empty">
					                예약내역이 없습니다.
					            </td>
					        </tr>
<%-- 					    </c:when>
					    <c:otherwise>
					        <c:forEach var="vo" items="${list}">
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
					        </c:forEach>
					    </c:otherwise> --%>
<!-- 					</c:choose> -->
			    </tbody>
			</table>
			<!--//TABLE-->
        </div>

</body>
</html>