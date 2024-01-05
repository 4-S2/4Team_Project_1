<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.active {
    /* background-color: #f0f0f0; /* 변경할 색상을 여기에 추가하세요 */ */
    color: blue; /* 파란색으로 변경할 색상 */
    font-weight: bold; /* 텍스트를 진하게 표시 */
    border-bottom : 2px solid blue;
}
.container {
    margin: 50px auto;
}
    
#myPage.container{
padding:0;
/* width: auto;
max-width: 1280px; */
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const menuItems = document.querySelectorAll('.board_filter_in .filter_box');

    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            menuItems.forEach(item => {
                item.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
});
</script>

</head>
<body>
<body data="mypage"><div id="divLoading"><div class="loading-fixed"><i></i><i></i><i></i><i></i></div></div>
<!-- Contents -->
        <div id="myPage" class="container">
            <!--CONTENTS_AREA-->
            <div class="contents_area">
                <!--FILTER_LIST_BOARD-->
                <div class="max1200 clear list_fliter_board mypage">

                    <!--FILTER_AREA-->
        <div class="board_filter_area">
            <!--TITLE-->
            <div class="board_filter_tit">
                <p class="desc">Busan Tour</p>
                <p class="tit">마이페이지</p>
            </div>
            <!--//TITLE-->
            <!--FILTER-->
            <div class="board_filter_box filter_depth3 mypage">
                <ul class="board_filter_in">
                    <li class="filter_box">
                        <a href="../mypage/../mypage/main.do" class="menu_depth3 single">회원정보수정</a>
                    </li>
                    <li class="filter_box">
                        <a href="../mypage/myReserv.do" class="menu_depth3 single">예약내역</a>
                    </li>
                    <li class="filter_box">
                        <a href="../mypage/myPurchase.do" class="menu_depth3 single ">구매내역</a>
                    </li>                      
                    <li class="filter_box">
                        <a href="../mypage/myCart.do" class="menu_depth3 single ">장바구니</a>
                    </li>  
                    <li class="filter_box">
                        <a href="../mypage/myJjim.do" class="menu_depth3 single ">찜목록</a>
                    </li>
                    <li class="divider"></li>
                    <li class="filter_box">
                        <a href="../mypage/myInquiry.do" class="menu_depth3 single ">문의내역</a>
                    </li>
                    <li class="filter_box">
                        <a href="../mypage/myacc_delete.do" class="menu_depth3 single ">회원탈퇴</a>
                    </li>
                </ul>
            </div>

            <!--//FILTER-->
        </div>
        <!--//FILTER_AREA-->
		
				
		        <div class="thumbnail_list_area" id="areaContainer">
		        <jsp:include page="${mypage_jsp }"></jsp:include>
<%-- 			<h4 class="hidden">온라인학습 현황</h4>

            <div class="max1200 dp_pc contents_titbox">
                <p class="titbox"><strong>온라인학습</strong> 현황</p>
            </div>
            <!--TAB-->
            <div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab3 sub4 mypage">
                <div class="tab_box">
                    <button onclick="doSetTab(0, this, 'O'); return  false;" class="h40  on"><span>학습중</span></button>
                    <button onclick="doSetTab(1, this, 'F'); return  false;" class="h40 "><span>학습완료</span></button>
                    <button onclick="doSetTab(2, this, 'N'); return  false;" class="h40 "><span>미수료</span></button>
                </div>
            </div>
            <!--//TAB-->

            <div class="tab_contents_area">
                <!-- 학습중 -->
                <div class="tab_contents_box  on">
                    <div class="max1200 clear pc_mt30 ta_mt0 ta_mx40 contents_titbox mypage">
                    	<p>※ 강좌의 학습기간 동안에는 수료한 강좌도 모두 목록에 표시됩니다.</p>
                        <h4 class="titbox">&nbsp;<span class="total_num_txt offline ta_px0">총 <span id="spnTotalCountO"><strong>0</strong></span>개의 강좌가 있습니다.</span></h4>
                    </div>
 					<!--NOTICE-->
					<ul class="pc_mt10 ta_mx40 ta_mt10">
					    <li class="bul_red">
					    	<span>수료증 인쇄는 PC 버전에서만 가능합니다.</span>
					    	<br><span id="descpc descPcO">(PC에서 수료증 항목이 안보일 경우 화면비율을 조정(축소/확대) 후 재 확인 바랍니다.)</span>
					    </li>
					</ul>
					<!--//NOTICE-->

               <div id="divCourseList1" style="min-height:300px">
                        <style class="text/css">
					@media screen and (max-width: 414px){  /*mobile.css*/
						.lecture_info_table.tablet_type2.mypage .category {width: 14.8vw;}
						.lecture_info_table.tablet_type2.mypage .category.ta_px10 {width: 14.8vw; padding-left:0.5vw; padding-right:0.5vw;}
				}
				</style>
				<!--[S]201204:클래스추가-->
				<table class="lecture_info_table tablet_type2 mypage pc_mt40"><!--201123:summary삭제-->
				<!--[E]201204:클래스추가-->
				    <caption class="hidden">온라인 학습 [학습중] 강좌의 번호, 강좌명, 진도율, 강좌수강, 학습관리, 수료증을 제공하는 리스트</caption>
				    <thead>
				    <tr>
				        <th class="dp_pc num2" scope="col">번호</th>
				        <th class="title double ta_txt_center" scope="col">강좌명</th>
				        <th class="dp_pc writer" scope="col">진도율</th>
				        <th class="category double" scope="col">강좌수강</th>
				        <th class="category" scope="col" title="<의무교육> 강좌는 수강신청 후 3일이내, 진도율 10%이하 시 수강취소 가능">학습관리</th>
				        <th class="category" scope="col">수료증</th>
				    </tr>
				    </thead>
				    <tbody>
				    <tr>
				            <td colspan="5" class="empty">
				                학습중인 온라인학습이 없습니다.
				            </td>
				        </tr>
				    </tbody>
				</table>
				</div>
				</div>
				</div> --%>
				</div>
				</div>
				</div>
				
<%-- 		<!--THUMBNAIL_LIST-->
        <div class="thumbnail_list_area" id="areaContainer">
			<h4 class="hidden">온라인학습 현황</h4>

            <div class="max1200 dp_pc contents_titbox">
                <p class="titbox"><strong>온라인학습</strong> 현황</p>
            </div>
            <!--TAB-->
            <div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab3 sub4 mypage">
                <div class="tab_box">
                    <button onclick="doSetTab(0, this, 'O'); return  false;" class="h40  on"><span>학습중</span></button>
                    <button onclick="doSetTab(1, this, 'F'); return  false;" class="h40 "><span>학습완료</span></button>
                    <button onclick="doSetTab(2, this, 'N'); return  false;" class="h40 "><span>미수료</span></button>
                </div>
            </div>
            <!--//TAB-->

            <div class="tab_contents_area">
                <!-- 학습중 -->
                <div class="tab_contents_box  on">
                    <div class="max1200 clear pc_mt30 ta_mt0 ta_mx40 contents_titbox mypage">
                    	<p>※ 강좌의 학습기간 동안에는 수료한 강좌도 모두 목록에 표시됩니다.</p>
                        <h4 class="titbox">&nbsp;<span class="total_num_txt offline ta_px0">총 <span id="spnTotalCountO"><strong>0</strong></span>개의 강좌가 있습니다.</span></h4>
                    </div>
 					<!--NOTICE-->
					<ul class="pc_mt10 ta_mx40 ta_mt10">
					    <li class="bul_red">
					    	<span>수료증 인쇄는 PC 버전에서만 가능합니다.</span>
					    	<br><span id="descpc descPcO">(PC에서 수료증 항목이 안보일 경우 화면비율을 조정(축소/확대) 후 재 확인 바랍니다.)</span>
					    </li>
					</ul>
					<!--//NOTICE-->

                    <div id="divCourseList1" style="min-height:300px">
                        <style class="text/css">
	@media screen and (max-width: 414px){  /*mobile.css*/
		.lecture_info_table.tablet_type2.mypage .category {width: 14.8vw;}
		.lecture_info_table.tablet_type2.mypage .category.ta_px10 {width: 14.8vw; padding-left:0.5vw; padding-right:0.5vw;}
}
</style>
<!--[S]201204:클래스추가-->
<table class="lecture_info_table tablet_type2 mypage pc_mt40"><!--201123:summary삭제-->
<!--[E]201204:클래스추가-->
    <caption class="hidden">온라인 학습 [학습중] 강좌의 번호, 강좌명, 진도율, 강좌수강, 학습관리, 수료증을 제공하는 리스트</caption>
    <thead>
    <tr>
        <th class="dp_pc num2" scope="col">번호</th>
        <th class="title double ta_txt_center" scope="col">강좌명</th>
        <th class="dp_pc writer" scope="col">진도율</th>
        <th class="category double" scope="col">강좌수강</th>
        <th class="category" scope="col" title="<의무교육> 강좌는 수강신청 후 3일이내, 진도율 10%이하 시 수강취소 가능">학습관리</th>
        <th class="category" scope="col">수료증</th>
    </tr>
    </thead>
    <tbody>
    <tr>
            <td colspan="5" class="empty">
                학습중인 온라인학습이 없습니다.
            </td>
        </tr>
    </tbody>
</table>

<!--PAGING-->
<div class="pc_mt30 pc_pb80 paging_area">
    <script>
	var pagingExecutor= {
		pagingSubmit : function(page) {
			var paging = {
				 start: page
				,length: 15
			}
 			doMyCurseCsPage(paging);
		}
	}
</script>
</div>
<!--//PAGING-->
<script>
    $("#spnTotalCountO").html("<strong>0</strong>");
</script>

<script type="text/javascript">
function doStudyOnlineLink(courseSeq, courseCsSeq, stuSeq) {
	doGoStudy2(courseSeq, courseCsSeq, stuSeq);
	/*
	if(confirm("현재 학습할 차시는 " + courseCsSeq + "차시입니다.\n해당 차시로 바로 이동하시겠습니까?\n(취소를 선택하시면 1차시로 이동합니다.)")){
		doGoStudy(courseSeq, courseCsSeq, stuSeq);
	} else {
		doGoStudy(courseSeq, 1, 1);
	}
	*/
}

function linkEduReqdFlag(courseSeq, courseCsSeq, stuSeq) {
	var sUrl = "/member/rl/studyRoom/popup/studyRoomEduReqdForm.do";
	var param = {
		courseSeq : courseSeq
		, courseCsSeq : courseCsSeq
		, stuSeq : stuSeq	
	};
	//common.layerPopupParam(sUrl, "divPopEduReqdForm", param);
	common.userLayerPopup(sUrl, "divPopEduReqdForm", param);
}

var doCommentConnet = function(){
	if($("#hidEduReqdApply").val() == $("#eduReqdApply").val()){
		var courseSeq = $("#popupCourseSeq").val();
		var courseCsSeq = $("#popupCourseCsSeq").val();
		var stuSeq = $("#popupStuSeq").val();

		$("#divPopEduReqdForm").remove();

		doGoStudy2(courseSeq, courseCsSeq, stuSeq);
		/*
		if(confirm("현재 학습할 차시는 " + courseCsSeq + "차시입니다.\n해당 차시로 바로 이동하시겠습니까?\n(취소를 선택하시면 1차시로 이동합니다.)")){
			doGoStudy(courseSeq, courseCsSeq, stuSeq);
		} else {
			doGoStudy(courseSeq, 1, 1);
		} 
		*/
	} else {
		//alert(' [확인] 사항을 체크해 주시기 바랍니다. ');
		alert(' 내용확인 후, □안에 체크해 주시기 바랍니다. ');
	}
}

var doCommentClose = function(){
	$("#divPopEduReqdForm").remove();
}

</script>
</div>
                </div>
                <!-- //학습중 -->

                <!-- 학습 완료 -->
                <div class="tab_contents_box " style=""> 

                    <!--TITLE-->
                    <div class="max1200 clear pc_mt30 ta_mt0 ta_mx40 contents_titbox mypage">
                    	 <!--NOTICE-->
						<p>※ 강좌의 학습기간이 종료된 수료 강좌가 목록에 표시됩니다.</p>
						<!--//NOTICE-->
					
                        <h4 class="fl titbox type2">&nbsp;<span class="total_num_txt offline ta_px0">총 <span id="spnTotalCountF"><strong>0</strong></span>개의 강좌가 있습니다.</span></h4>
                    	
					
                        <div class="fr calendar_area">
                            <!--PC-->
                            <div class="dp_pc calendar_box range_calendar">
                                <label for="searchStartDt1">기간 검색</label>
                                <input type="text" id="searchStartDt1" name="searchStartDt1" title="시작 기간 선택 닫힘" class="___picker hasDatepicker">
                                <span>~</span>
                                <input type="text" id="searchEndDt1" name="searchEndDt1" title="종료 기간 선택 닫힘" class="___picker hasDatepicker">
                                <a href="javascript:;" onclick="doMyCurseCsPage(1)">검색하기</a>
                            </div>
                            <!--M-->
                            <a href="javascript:;" class="dp_ta btn_button btn_bg ta_h52 ta_px18 ta_mt70 m_mt57 bg_eee radius50 color_33 ta_fz22" onclick="actionLayer('.filter1'); return false" title="검색하기"><span class="ico_calendar ta_mr10"></span>기간 검색</a>
                        </div>
                    </div>
                    <!--//TITLE-->
                    
                     <!--NOTICE-->
					<ul class="pc_mt10 ta_mx40 ta_mt10">
					    <li class="bul_red"><span>수료증 인쇄는 PC 버전에서만 가능합니다.</span>
					    <br><span id="descpc descPcF">(PC에서 수료증 항목이 안보일 경우 화면비율을 조정(축소/확대) 후 재 확인 바랍니다.)</span>
					    </li>
					</ul>
					<!--//NOTICE-->
					
                    <div id="divCourseList2" style="min-height:400px">
                        <style class="text/css">
	@media screen and (max-width: 414px){  /*mobile.css*/
		.lecture_info_table.tablet_type2.mypage .category {width: 14.8vw;}
		.lecture_info_table.tablet_type2.mypage .category.ta_px20 {width: 14.8vw; padding-left:0.5vw; padding-right:0.5vw;}
}
</style>
<table class="lecture_info_table tablet_type2 mypage pc_mt38"><!--201123:summary삭제-->
    <!--[E]201204:클래스추가-->
    <caption class="hidden">온라인 학습 [학습완료] 강좌의 번호, 강좌명, 학습기간, 진도율, 수료증, 만족도조사, 재수강을 제공하는 리스트</caption>
    <thead>
    <tr>
        <th class="dp_pc num2" scope="col">번호</th>
        <th class="title double ta_txt_center" scope="col">강좌명</th>
        <th class="dp_pc abs_dp_pc date2 double" scope="col">학습기간 </th>
        <th class="dp_pc writer" scope="col">진도율</th>
        <th class="category" scope="col">수료증</th>
        <th class="category" scope="col">만족도조사</th><!--200104:추가-->
        <th class="category" scope="col">재수강</th><!--201123:수정-->
    </tr>
    </thead>
    <tbody>
    <tr>
            <td colspan="6" class="empty">
                학습완료한 온라인학습이 없습니다.
            </td>
        </tr>
    </tbody>
</table>

<!--NOTICE-->
<ul class="pc_mt10 ta_mx40 ta_mt10">
    <li class="bul_red"><span>수료증 인쇄는 PC 버전에서만 가능합니다.</span></li>
</ul>
<!--//NOTICE-->

<!--PAGING-->
<div class="pc_mt30 pc_pb80 paging_area">
    <script>
	var pagingExecutor= {
		pagingSubmit : function(page) {
			var paging = {
				 start: page
				,length: 15
			}
 			doMyCurseCsPage(paging);
		}
	}
</script>
</div>
<!--//PAGING-->
<script>
    $("#spnTotalCountF").html("<strong>0</strong>");
</script>
</div>

                    <!--LAYER_POPUP-->
                    <div class="resize_layer layer_popup_area filter1" style="">
                        <div class="layer_popup_box layer_filter" style="margin-left: -430.5px; margin-top: 0px;">
                            <!--TITLE-->
                            <div class="layer_popup_titbox">
                                <h5 class="title">기간 선택</h5>
                                <a href="javascript:;" class="btn_layer_close" onclick="actionLayer('.filter1'); return false">레이어 팝업 닫기</a>
                            </div>
                            <!--//TITLE-->

                            <!--LAYERCONT-->
                            <div class="layer_popup_conts">
                                <!--content-->
                                <div class="layer_cont mypage">
                                    <!--TAB-->
                                    <div class="tab_area tab2 sub4">
                                        <div class="tab_box">
                                            <button onclick="tabOnly(0, this); return  false;" class="h40 date on"><span>시작일<strong class="calendar_txt1 start"></strong></span></button>
                                            <button onclick="tabOnly(1, this); return  false;" class="h40 date"><span>종료일<strong class="calendar_txt1 end"></strong></span></button>
                                        </div>
                                    </div>
                                    <!--//TAB-->

                                    <div class="tab_contents_area picker_cover">
                                        <!--REPEAT:탭 갯수만큼 반복-->
                                        <div class="tab_contents_box on">
                                            <!--FILTER_BOX-->
                                            <div class="m_scroll ta_mt50 date_filter_select">
                                                <!--CALENDAR-->
                                                <div class="filter_datepicker_area start hasDatepicker" id="dp1703660527095"><div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2023</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption>날짜선택기</caption><thead><tr><th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th><th scope="col"><span title="월">월</span></th><th scope="col"><span title="화">화</span></th><th scope="col"><span title="수">수</span></th><th scope="col"><span title="목">목</span></th><th scope="col"><span title="금">금</span></th><th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#" title="선택됨">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
                                                <!--//CALENDAR-->
                                            </div>
                                            <!--//FILTER_BOX-->
                                        </div>
                                        <div class="tab_contents_box">
                                            <!--FILTER_BOX-->
                                            <div class="m_scroll ta_mt50 date_filter_select">
                                                <!--CALENDAR-->
                                                <div class="filter_datepicker_area end hasDatepicker" id="dp1703660527096"><div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2023</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption>날짜선택기</caption><thead><tr><th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th><th scope="col"><span title="월">월</span></th><th scope="col"><span title="화">화</span></th><th scope="col"><span title="수">수</span></th><th scope="col"><span title="목">목</span></th><th scope="col"><span title="금">금</span></th><th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#" title="선택됨">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
                                                <!--//CALENDAR-->
                                            </div>
                                            <!--//FILTER_BOX-->
                                        </div>
                                    </div>

                                </div>
                                <!--//content-->

                                <div class="select_filter_btn calendar">
                                    <!--button-->
                                    <div class="layer_button btn_double">
                                        <a href="javascript:;" class="btn_darkgray" onclick="actionLayer('.filter1'); return false">취소</a>
                                        <a href="javascript:;" class="btn_blue" onclick="doMobileSearch(1);">검색</a>
                                    </div>
                                    <!--//button-->
                                </div>
                            </div>
                            <!--//LAYERCONT-->

                        </div>
                        <div class="layer_dim"></div>
                    </div>
                    <!--//LAYER_POPUP-->

                </div>
                <!-- //학습 완료 -->

                <!-- 미수료 -->
                <div class="tab_contents_box " style="">
                    <!--TITLE-->
                    <div class="max1200 clear pc_mt30 ta_mt0 ta_mx40 contents_titbox mypage">
                    	<p>※ 강좌의 학습기간이 종료된 미수료 강좌가 목록에 표시됩니다. </p>
                        <h4 class="fl titbox type2">&nbsp;<span class="total_num_txt offline ta_px0">총 <span id="spnTotalCountN"><strong>0</strong></span>개의 강좌가 있습니다.</span></h4>
                        <div class="fr calendar_area">
                            <!--PC-->
                            <div class="dp_pc calendar_box">
                                <label for="searchStartDt2">기간 검색</label>
                                <input type="text" id="searchStartDt2" name="searchStartDt2" title="시작 기간 선택 닫힘" class="___picker hasDatepicker">
                                <span>~</span>
                                <input type="text" id="searchEndDt2" name="searchEndDt2" title="종료 기간 선택 닫힘" class="___picker hasDatepicker">
                                <a href="javascript:;" onclick="doMyCurseCsPage(1)">검색하기</a>
                            </div>
                            <!--M-->
                            <a href="javascript:;" class="dp_ta btn_button btn_bg ta_h52 ta_px18 ta_mt70 m_mt57 bg_eee radius50 color_33 ta_fz22" onclick="actionLayer('.filter2'); return false" title="검색하기"><span class="ico_calendar ta_mr10"></span>기간 검색</a>
                        </div>
                    </div>
                    <!--//TITLE-->

                    <!--LAYER_POPUP-->
                    <div class="resize_layer layer_popup_area filter2" style="">
                        <div class="layer_popup_box layer_filter" style="margin-left: -430.5px; margin-top: 0px;">
                            <!--TITLE-->
                            <div class="layer_popup_titbox">
                                <h5 class="title">기간 선택</h5>
                                <a href="javascript:;" class="btn_layer_close" onclick="actionLayer('.filter2'); return false">레이어 팝업 닫기</a>
                            </div>
                            <!--//TITLE-->

                            <!--LAYERCONT-->
                            <div class="layer_popup_conts">
                                <!--content-->
                                <div class="layer_cont mypage">
                                    <!--TAB-->
                                    <div class="tab_area tab2 sub4">
                                        <div class="tab_box">
                                            <button onclick="tabOnly(0, this); return  false;" class="h40 date on"><span>시작일<strong class="calendar_txt2 start"></strong></span></button>
                                            <button onclick="tabOnly(1, this); return  false;" class="h40 date"><span>종료일<strong class="calendar_txt2 end"></strong></span></button>
                                        </div>
                                    </div>
                                    <!--//TAB-->

                                    <div class="tab_contents_area picker_cover">
                                        <!--REPEAT:탭 갯수만큼 반복-->
                                        <div class="tab_contents_box on">
                                            <!--FILTER_BOX-->
                                            <div class="m_scroll ta_mt50 date_filter_select">
                                                <!--CALENDAR-->
                                                <div class="filter_datepicker_area start hasDatepicker" id="dp1703660527097"><div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2023</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption>날짜선택기</caption><thead><tr><th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th><th scope="col"><span title="월">월</span></th><th scope="col"><span title="화">화</span></th><th scope="col"><span title="수">수</span></th><th scope="col"><span title="목">목</span></th><th scope="col"><span title="금">금</span></th><th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#" title="선택됨">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
                                                <!--//CALENDAR-->
                                            </div>
                                            <!--//FILTER_BOX-->
                                        </div>
                                        <div class="tab_contents_box">
                                            <!--FILTER_BOX-->
                                            <div class="m_scroll ta_mt50 date_filter_select">
                                                <!--CALENDAR-->
                                                <div class="filter_datepicker_area end hasDatepicker" id="dp1703660527098"><div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음 달" href="javascript:;"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2023</span>년&nbsp;<span class="ui-datepicker-month">12월</span></div></div><table class="ui-datepicker-calendar"><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption class="no_show">날짜 선택 레이어팝업</caption><caption>날짜선택기</caption><thead><tr><th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th><th scope="col"><span title="월">월</span></th><th scope="col"><span title="화">화</span></th><th scope="col"><span title="수">수</span></th><th scope="col"><span title="목">목</span></th><th scope="col"><span title="금">금</span></th><th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#" title="선택됨">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
                                                <!--//CALENDAR-->
                                            </div>
                                            <!--//FILTER_BOX-->
                                        </div>
                                    </div>

                                </div>
                                <!--//content-->

                                <div class="select_filter_btn calendar">
                                    <!--button-->
                                    <div class="layer_button btn_double">
                                        <a href="javascript:;" class="btn_darkgray" onclick="actionLayer('.filter2'); return false">취소</a>
                                        <a href="javascript:;" class="btn_blue" onclick="doMobileSearch(2);">검색</a>
                                    </div>
                                    <!--//button-->
                                </div>
                            </div>
                            <!--//LAYERCONT-->

                        </div>
                        <div class="layer_dim"></div>
                    </div>
                    <!--//LAYER_POPUP-->

                    <div id="divCourseList3" style="min-height:350px">
                        <table class="lecture_info_table tablet_type2 mypage pc_mt38"><!--201123:summary삭제-->
    <caption class="hidden">온라인 학습 [미수료] 강좌의 번호, 강좌명, 학습기간, 진도율, 재수강, 학습관리를 제공하는 리스트</caption>
    <thead>
    <tr>
        <th class="dp_pc num2" scope="col">번호</th>
        <th class="title double ta_txt_center" scope="col">강좌명</th>
        <th class="dp_pc date2 double" scope="col">학습기간 </th>
        <th class="dp_pc writer" scope="col">진도율</th>
        <th class="category" scope="col">재수강</th>
        <th class="category" scope="col">학습관리</th>
    </tr>
    </thead>
    <tbody>
    <tr>
            <td colspan="6" class="empty">
                미수료한 온라인학습이 없습니다.
            </td>
        </tr>
    </tbody>
</table>

<!--PAGING-->
<div class="pc_mt30 pc_pb80 paging_area">
    <script>
	var pagingExecutor= {
		pagingSubmit : function(page) {
			var paging = {
				 start: page
				,length: 15
			}
 			doMyCurseCsPage(paging);
		}
	}
</script>
</div>
<!--//PAGING-->
<script>
    $("#spnTotalCountN").html("<strong>0</strong>");
</script>
</div>
                </div>
                <!-- //미수료 -->
            </div>

        </div>
        <!--//THUMBNAIL_LIST--> --%>

<!-- <script>
$(document).ready(function(){
    
		// 쿠키 체크
		//var cookieChkNm = "myPagePopup15";
		var cookieChkNm = "20231222131058";
		if (getCookie(cookieChkNm) != "Y")
		//if(false)
		{
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=534652&utm_source=banner&utm_medium=popup&utm_campaign=6th_event";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=535993&utm_source=banner&utm_medium=popup&utm_campaign=kca_studyevent";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=537220&utm_source=banner&utm_medium=popup&utm_campaign=challenge_event_2022";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=539903&utm_source=banner&utm_medium=popup&utm_campaign=2022_awards_event";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=544036&utm_source=banner&utm_medium=popup&utm_campaign=jan_subscribe_event";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=544443&utm_source=banner&utm_medium=popup&utm_campaign=feb_studyevent";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=552947&utm_source=banner&utm_medium=popup&utm_campaign=subscribe_event2023";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=555297&utm_source=banner&utm_medium=popup&utm_campaign=appevent_2023";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=558364&utm_source=banner&utm_medium=popup&utm_campaign=3million_event";
			// var eventLink = "https://www.gseek.kr/member/rl/board/newsLetterBoard.do?menuId=MO85&menuStep=2&pMenuId=MORE&utm_source=banner&utm_medium=popup&utm_campaign=subscribe_page"
			// var eventLink = "https://vo.la/uVmBP";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardSubSevenTh.do?eventCode=7thBirthDay&utm_source=banner&utm_medium=popup&utm_campaign=7th_event_detail";
			// var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=564934&utm_source=banner&utm_medium=popup&utm_campaign=youtube_event_2023";
			/*
				var eventLink = "https://www.gseek.kr/member/rl/board/eventBoardView.do?menuId=MO51&menuStep=3&pMenuId=MO50&boardMastSeq=6&boardSeq=567907&utm_source=banner&utm_medium=popup&utm_campaign=2023_awards";
				var eventText = "2023 경기도지식 연말대상 이벤트 기간:11월 27일(월)~12월20일(수) | 이벤트 참여하러가기";
				var eventImgPath = "/resources/images/pc/event/"+cookieChkNm+".jpg";
			*/
			
			var eventLink = " https://vo.la/GfkcK  ";
			var eventText = "지식 유튜브를 구독하세요!지식을 편리하게 이용할 수 있는 이용가이드 영상부터 인기강좌 하이라이트 영상까지 빠르게 만나보실 수 있어요! 지금 바로 구독하기  ";
			var eventImgPath = "https://www.gseek.kr/upload/rms/202312/22/30n8judvwl8wb.jpg ";
			
	
			var sUrl = "/member/rl/mypage/popup/onlineEventPageFrom.do";
			var onlineEventParam = {
				eventLink : eventLink
				, eventText : eventText
				, eventImgPath : eventImgPath
				, cookieChkNm : cookieChkNm
			};
	
			common.userLayerPopup(sUrl, "divPopOnlineEventPageFrom", onlineEventParam);
		}
	
	//$(".layer_popup_box").load(window.location.href + ".layer_popup_box");
	
});
</script>
<script type="text/javascript">
var paramMyCourse = {
    eduTypeCode : "0002"
    , searchGbn : "O"
    , length : 15
    , start : 1
}
// 페이지 이동
var doMyCurseCsPage = function(page){
    paramMyCourse.start = (typeof page.start != 'undefined' ? page.start : page);
    paramMyCourse.searchStartDt = "";
    paramMyCourse.searchEndDt = "";

    if(paramMyCourse.searchGbn == "F"){
        paramMyCourse.searchStartDt = $("#searchStartDt1").val();
        paramMyCourse.searchEndDt = $("#searchEndDt1").val();
    } else if(paramMyCourse.searchGbn == "N"){
        paramMyCourse.searchStartDt = $("#searchStartDt2").val();
        paramMyCourse.searchEndDt = $("#searchEndDt2").val();
    }

    common.ajaxCall({
        url: "/member/rl/mypage/ajax/myCourseAjaxList.do"
        , dataType: "html"
        , data: paramMyCourse
        , success: function (data, textStatus, jqXHR) {
            if(paramMyCourse.searchGbn == "O"){
                $("#divCourseList1").html(data);
            } else if(paramMyCourse.searchGbn == "F"){
                $("#divCourseList2").html(data);
            } else if(paramMyCourse.searchGbn == "N"){
                $("#divCourseList3").html(data);
            }
            $('.ellipsis').each(function () {
				var $this = $(this);


				if ($this.data('txt-origin') == undefined) {
					$this.attr('data-txt-origin', $this.text());
				}

				$this.text($this.data('txt-origin'));
				$this.ellipsis();
			});
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("처리도중 오류가 발생하였습니다.");
        }
    });
}
// Tab 설정
var doSetTab = function(ord, obj, searchGbn){
    tabOnly(ord, obj);

    paramMyCourse.searchGbn = searchGbn;
    doMyCurseCsPage(1);
}
// 수강 취소
var doCancelCourse = function(courseSeq, courseCsSeq, stuSeq, eduReqdFlag, searchGbn){
    var sMsg = $.message.get("message_q071");
    if(searchGbn == "N"){
        sMsg = $.message.get("message_q074");
    }
    if(eduReqdFlag == "Y"){
        sMsg = $.message.get("message_q073");
    }
    if(confirm(sMsg)){
        var callbackFunc = function(response){
            if (response.messageMap != undefined) {
                if (response.messageMap.statusCode == 1) {
                    alert(response.messageMap.statusMessage);
                    doMyCurseCsPage(1);
                } else if(response.messageMap.statusCode == -1){
                    alert(response.messageMap.statusMessage);
                    return;
                }
            }
        }
        var params = {
            courseSeq: courseSeq
            , courseCsSeq : courseCsSeq
            , stuSeq : stuSeq
            , eduReqdFlag : eduReqdFlag
        }
        // 수강취소
        common.ajaxCallbackSubmit("/member/rl/mypage/ajax/cancelCourseCs.do", params, callbackFunc);
    }
}
// 재수강
var doRetryCourse = function(courseSeq, courseCsSeq, sgCode, eduReqdFlag, searchGbn){
    if (!confirm($.message.get('message_q070'))){
        return;
    }

    var params = {
        courseSeq : courseSeq
        , courseCsSeq : courseCsSeq
        , sgCode : sgCode
        , retryYn : 'Y'
    };
    var callbackFunc = function(data) {
        var obj = data.result;
        if(obj.chkResult == '0000'){
            if(eduReqdFlag == 'Y'){
                // 의무과정 신청 Step1
                var param = {
                    menuId : "MP10"
                    , menuStep : ""
                    , pMenuId : ""
                    , courseSeq : courseSeq
                    , courseCsSeq : courseCsSeq
                    , courseCateCode : ""
                    , eduTypeCode : ""
                    , stuSeq : obj.stuSeq
                    , moveUrl : "MY"
                    , searchGbn : searchGbn
                }
                postGoto("/member/rl/courseInfo/reqdYnApplyStep1.do", param);
                return;
            } else {
                    // 고용보험 아니고 미승인 과정일 경우 바로 수강승인
                    var param = {
                        courseSeq: courseSeq,
                        courseCsSeq: courseCsSeq,
                        stuSeq: obj.stuSeq,
                        returnMessage: "show"
                    };
                    var url = "/member/rl/courseInfo/ajax/insertCourseCsRegister.do";
                    common.ajaxCallbackSubmit(url, param);
                    // 학습중 탭으로 이동
                    doSetTab(0, $(".thumbnail_list_area .tab_box button:eq(0)"), 'O');
            }
        } else {
            alert(obj.chkResultText);
        }
    };
    common.ajaxCallbackSubmit("/member/rl/courseInfo/ajax/courseCsApplyCheck.do", params, callbackFunc);

}
// 만족도 조사
var doCoursePollPopup = function(courseSeq, courseCsSeq, stuSeq, sgCode){
	/* 23.05.25 by seulki _ 온라인학습 이전 만족도 오픈
    var param = {
        courseSeq : courseSeq
        , courseCsSeq : courseCsSeq
        , stuSeq : stuSeq
        , sgCode : sgCode
    }
    common.userLayerPopup("/member/rl/courseInfo/popup/coursePoll.do", "divPopCoursePoll", param);
	*/
	
		var onlineParam = {
			urlSeq : ""
			, questionType : "AT03"
			, pMenuId : "OTOP"
			, questionSeq : courseSeq
		};
		postGoto("/member/rl/customer/answer/satisfiedQuestion.do", onlineParam, "_blank", "GET");
	
}

var doCoursePollCallback = function(){
    $(".h40.on").click();
    //doSetTab(1, this, 'F');
}
// 수료증 출력
var doPrint = function(courseSeq, courseCsSeq, stuSeq){
	if(false){
		alert("시스템 점검 중 입니다.");
		return;
	}
    var param = {
        courseSeq : courseSeq
        , courseCsSeq : courseCsSeq
        , stuSeq : stuSeq
    }
    var UserAgent = navigator.userAgent;
    if (UserAgent.match(/iPhone|iPod|iPad|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
    	 alert("수료증 출력은 PC에서만 가능하고 수료증 미리보기만 가능합니다.");
    }
   
    
    common.userLayerPopup("/member/rl/mypage/popup/diplomaPreview.do", "divDiplomaPreview", param);
    
    /*
    var UserAgent = navigator.userAgent;
    if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
    	
    	window.open('/member/rl/mypage/popup/diplomaPreview.do?courseSeq='+courseSeq+'&courseCsSeq='+courseCsSeq+'&stuSeq='+stuSeq, 'printPopup', 'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200');
    	
    } else {
    	 common.userLayerPopup("/member/rl/mypage/popup/diplomaPreview.do", "divDiplomaPreview", param);
    }
    */
}
// 다운로드
var doPdfDownload = function(courseSeq, courseCsSeq, stuSeq){
	if(false){
		alert("시스템 점검 중 입니다.");
		return;
	}
	var param = {
		courseSeq : courseSeq
		, courseCsSeq : courseCsSeq
		, stuSeq : stuSeq
	}
	var UserAgent = navigator.userAgent;
	if (UserAgent.match(/iPhone|iPod|iPad|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
		// alert("수료증 출력은 PC에서만 가능하고 수료증 미리보기만 가능합니다.");
		alert("수료증 출력은 PC에서 진행 해주세요.\n모바일에서는 직인생략 수료증만 저장 가능합니다.");
	}
	common.userLayerPopup("/member/rl/mypage/popup/diplomaPreviewDownload.do", "divDiplomaPreview", param);
}
// 학습창 바로가기
doGoStudy = function(courseSeq, courseCsSeq, stuSeq){
    var param = {
        courseSeq : courseSeq,
        courseCsSeq : courseCsSeq,
        stuSeq : stuSeq,
        returnMessage : "hidden"
    };
    var callbackFuncChk = function (response) {
        var subjSeq = response.lastSubjSeq;
        if (typeof subjSeq == "undefined" || subjSeq == "" || subjSeq == null) subjSeq = "";
        
		window.open("/member/rl/studyRoom/studyRoomMain.do?courseSeq=" + courseSeq + "&courseCsSeq=" + courseCsSeq + "&stuSeq=" + stuSeq + "&subjSeq=" + subjSeq, "studyRoom");
			        
        
    };
    var url = "/member/rl/courseInfo/ajax/getLastSubjSeq.do";
    common.ajaxCallbackSubmit(url, param, callbackFuncChk);
}

//학습창 바로가기
doGoStudy2 = function(courseSeq, courseCsSeq, stuSeq){
    var param = {
        courseSeq : courseSeq,
        courseCsSeq : courseCsSeq,
        stuSeq : stuSeq,
        returnMessage : "hidden"
    };
    var callbackFuncChk = function (response) {
        var subjSeq = response.lastSubjSeq;
        if (typeof subjSeq == "undefined" || subjSeq == "" || subjSeq == null) subjSeq = "";
        
        if(subjSeq == ""){
        	confirm("현재 학습할 차시는 1차시입니다.\n해당 차시로 바로 이동하시겠습니까?\n(취소를 선택하시면 1차시로 이동합니다.)");
        } else {
        	if(!confirm("현재 학습할 차시는 " + subjSeq + "차시입니다.\n해당 차시로 바로 이동하시겠습니까?\n(취소를 선택하시면 1차시로 이동합니다.)"))
        		subjSeq = 1;
        } 
        
		window.open("/member/rl/studyRoom/studyRoomMain.do?courseSeq=" + courseSeq + "&courseCsSeq=" + courseCsSeq + "&stuSeq=" + stuSeq + "&subjSeq=" + subjSeq, "studyRoom");
			        
        
    };
    var url = "/member/rl/courseInfo/ajax/getLastSubjSeq.do";
    common.ajaxCallbackSubmit(url, param, callbackFuncChk);
}

doMobileSearch = function(gbn) {
	$('#searchStartDt'+gbn).val($('.calendar_txt'+gbn+'.start').text());
	$('#searchEndDt'+gbn).val($('.calendar_txt'+gbn+'.end').text());
	actionLayer('.filter'+gbn);
	doMyCurseCsPage(1);
}
</script>
</div>
                //FILTER_LIST_BOARD
            </div>
            //CONTENTS_AREA
        </div>
        // Contents
        <a href="" class="dp_ta btn_go_top">맨 위로 가기</a>

session 유지를 위해 refresh 300 초에 한번씩 리플래쉬
del frameborder="0"
<iframe id="sessionKeep" width="0" height="0" style="height:0px;display:none;" title="내용 없음"></iframe>
<script type="text/javascript">
$(document).ready(function() {
	var questionType = "";
	var questionViewPage = "";
	if(questionType == "AT03" && questionViewPage =="online") {
		$(".footer_area").css("display","none");
	}
});
</script>
<script>
    doCheckMenu = function(menuId, menuUrl, step, parentMenuId){
        if(menuId == 'DK20'){
            
            doMoveMenu(menuId, menuUrl, step, parentMenuId);
            
        } else {
            doMoveMenu(menuId, menuUrl, step, parentMenuId);
        }
    }

    var chkLoginKeep = getCookie("chkLoginKeep");

    // 로그인 상태 유지
    if(chkLoginKeep != "") {
        $("#sessionKeep").attr('src', "/member/rl/studyRoom/sessionRefresh.do"); // 세션유지
    }
</script>

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if (!wcs_add) var wcs_add = {};
    wcs_add["wa"] = "3f7b2ced299332";
    wcs_do();
</script>
 -->


    
    </div>
</body>
</html>