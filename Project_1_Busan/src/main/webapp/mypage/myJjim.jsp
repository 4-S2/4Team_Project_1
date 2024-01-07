<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tab_area.tab5 button {
    width: 20%;
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
    document.getElementById('table3').classList.add('hidden');
    document.getElementById('table4').classList.add('hidden');
    document.getElementById('table5').classList.add('hidden');

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
    }else if (tabIndex === 2) {
        document.getElementById('table3').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    }else if (tabIndex === 3) {
        document.getElementById('table4').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    }else if (tabIndex === 4) {
        document.getElementById('table5').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    }
}

</script>
</head>
<body>
  <div class="myJjim">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">나의<strong>찜목록</strong></h4>
   	  </div>
   	 <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${totalJjim}</strong>개의 찜 내역이 있습니다.</span></p>
   	  </div>
		<div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab5 sub4 mypage">
		    <div class="tab_box">
		        <button onclick="toggleTab(0)" class="h40 on"><span>명소</span></button>
		        <button onclick="toggleTab(1)" class="h40"><span>맛집</span></button>
		        <button onclick="toggleTab(2)" class="h40"><span>축제</span></button>
		        <button onclick="toggleTab(3)" class="h40"><span>체험</span></button>
		        <button onclick="toggleTab(4)" class="h40"><span>전시회</span></button>
		    </div>
		</div>

        <!--  명소 찜 목록 -->
        <div id="table1" class="">
		   <c:choose>
			 <c:when test="${empty tlist}">
			 		<!--TABLE-->
			  <table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
				    <tbody>
						        <tr>
						            <td colspan="4" class="empty">
						                등록된 찜 목록이 없습니다.
						            </td>
						        </tr>
					 </tbody>
				 </table>
			 </c:when>
			<c:otherwise>        
        	<div class="col-sm-8 col-md-12">
				<div class="row">
					<c:forEach var="vo" items="${tlist }">
						<div class="col-md-4">
							<div class="single-blog">
								<div class="content fix">
									<a class="image fix" href="../busan/tour_detail.do?no=${vo.no}"><img
										src="${vo.bvo.poster }" width="100%" height="220px" /></a>
									<div class="metammm" style="position: relative">
										<div style="display: inline-block">
											<h2>
												<a style="text-decoration: none"
													href="#">${vo.jno}</a>
											</h2>
											<a class="title" href="../busan/tour_detail.do?no=${vo.no}">${vo.bvo.title}</a>
										</div>
										<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="">
											<img src="" style="width: 30px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
        </div>
        
		<!--  맛집 찜목록 -->
		<div id="table2" class="hidden">
		   <c:choose>
			 <c:when test="${empty fdlist}">
			 		<!--TABLE-->
		<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
		    <tbody>
				        <tr>
				            <td colspan="4" class="empty">
				                등록된 찜 목록이 없습니다.
				            </td>
				        </tr>
			 </tbody>
			 </table>
			 </c:when>
			<c:otherwise>   		
        	<div class="col-sm-8 col-md-12">
				<div class="row">
					<c:forEach var="vo" items="${fdlist }">
						<div class="col-md-4">
							<div class="single-blog">
								<div class="content fix">
									<a class="image fix" href="../busan/food_detail.do?no=${vo.no}"><img
										src="${vo.bvo.poster }" width="100%" height="220px" /></a>
									<div class="metammm" style="position: relative">
										<div style="display: inline-block">
											<h2>
												<a style="text-decoration: none"
													href="#">${vo.jno}</a>
											</h2>
											<a class="title" href="../busan/food_detail.do?no=${vo.no}">${vo.bvo.title}</a>
										</div>
										<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="">
											<img src="" style="width: 30px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
       </div>
       
        <!--  축제 찜 목록 -->
        <div id="table3" class="hidden">
		   <c:choose>
			 <c:when test="${empty flist}">
			 <!--TABLE-->
			  <table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
				    <tbody>
						        <tr>
						            <td colspan="4" class="empty">
						                등록된 찜 목록이 없습니다.
						            </td>
						        </tr>
					 </tbody>
				 </table>
			 </c:when>
			<c:otherwise>        
        	<div class="col-sm-8 col-md-12">
				<div class="row">
					<c:forEach var="vo" items="${flist }">
						<div class="col-md-4">
							<div class="single-blog">
								<div class="content fix">
									<a class="image fix" href="../busan/festival_detail.do?no=${vo.no}"><img
										src="${vo.bvo.poster }" width="100%" height="220px" /></a>
									<div class="metammm" style="position: relative">
										<div style="display: inline-block">
											<h2>
												<a style="text-decoration: none"
													href="#">${vo.jno}</a>
											</h2>
											<a class="title" href="../busan/festival_detail.do?no=${vo.no}">${vo.bvo.title}</a>
										</div>
										<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="">
											<img src="" style="width: 30px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
        </div>
        
        <!--  체험 찜 목록 -->
        <div id="table4" class="hidden">
		   <c:choose>
			 <c:when test="${empty alist}">
			 <!--TABLE-->
			  <table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
				    <tbody>
						        <tr>
						            <td colspan="4" class="empty">
						                등록된 찜 목록이 없습니다.
						            </td>
						        </tr>
					 </tbody>
				 </table>
			 </c:when>
			<c:otherwise>          
        	<div class="col-sm-8 col-md-12">
				<div class="row">
					<c:forEach var="vo" items="${alist }">
						<div class="col-md-4">
							<div class="single-blog">
								<div class="content fix">
									<a class="image fix" href="../busan/activity_detail.do?no=${vo.no}"><img
										src="${vo.bvo.poster }" width="100%" height="220px" /></a>
									<div class="metammm" style="position: relative">
										<div style="display: inline-block">
											<h2>
												<a style="text-decoration: none"
													href="#">${vo.jno}</a>
											</h2>
											<a class="title" href="../busan/activity_detail.do?no=${vo.no}">${vo.bvo.title}</a>
										</div>
										<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="">
											<img src="" style="width: 30px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
        </div>
        
        <!--  전시회 찜 목록 -->
        <div id="table5" class="hidden">
		   <c:choose>
			 <c:when test="${empty elist}">
			 <!--TABLE-->
			  <table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
				    <tbody>
						        <tr>
						            <td colspan="4" class="empty">
						                등록된 찜 목록이 없습니다.
						            </td>
						        </tr>
					 </tbody>
				 </table>
			 </c:when>
			<c:otherwise>          
        	<div class="col-sm-8 col-md-12">
				<div class="row">
					<c:forEach var="vo" items="${elist }">
						<div class="col-md-4">
							<div class="single-blog">
								<div class="content fix">
									<a class="image fix" href="../busan/ex_detail.do?eno=${vo.no}"><img
										src="${vo.evo.poster }" width="100%" height="220px" /></a>
									<div class="metammm" style="position: relative">
										<div style="display: inline-block">
											<h2>
												<a style="text-decoration: none"
													href="#">${vo.jno}</a>
											</h2>
											<a class="title" href="../busan/ex_detail.do?eno=${vo.no}">${vo.evo.ename}</a>
										</div>
										<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="">
											<img src="" style="width: 30px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
        </div>
        </div>

</body>
</html>