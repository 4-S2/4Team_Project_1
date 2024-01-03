<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>프로필 수정</title>
  <style>
    /* 간단한 스타일링을 위한 CSS */
    label {
      display: block;
      margin-bottom: 10px;
    }
    input[type="text"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
    }
    input[type="submit"] {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      border: none;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
    #idNo1{
    	max-width: 460px;
    }
  </style>
</head>
<body>
  <div class="editProfile">
  <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox"><strong>회원정보</strong>수정</h4>
   </div>
   <div class="my_information_area">
       <form id="frmJoin" name="frmJoin" method="post" class="login_form_area find_id_pw join_form">
	       <p class="find_label input_ta_mt80 input_ta_mb10 first ta_inblock">이름</p>
	       		<div class="form_contbox first ta_inblock"><input type="text" id="idNo1" data-required="true" data-type="{numeric:true}" maxlength="8" title="휴대전화 첫번째 자리" value="김연수" class="required"></div>
	       <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">아이디</p>
	       		<div class="form_contbox ta_inblock">duswl@naver.com</div>
	       <!-- <p class="find_label input_ta_mt80 input_ta_mb10 ta_first">비밀번호</p> -->
	       	       <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">비밀번호</p>
	       		<div class="form_contbox ta_inblock">duswl@naver.com</div>
	       	<p class="find_label input_ta_mt30">휴대전화</p>
		       	<div class="form_contbox">
	                        <div class="clear find_birth_area phone">
	                            <div class="find_birth_box pc_mt0">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo2" data-required="true" data-type="{numeric:true}" maxlength="4" title="휴대전화 첫번째 자리" value="010" class="required">
	                                </p>
	                            </div>
	                            <span class="phone_line pc_mt0"></span>
	                            <div class="find_birth_box pc_mt0">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo2" data-required="true" data-type="{numeric:true}" maxlength="4" title="휴대전화 두번째 자리" value="7274" class="required">
	                                </p>
	                            </div>
	                            <span class="phone_line pc_mt0"></span>
	                            <div class="find_birth_box">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo3" data-required="true" data-type="{numeric:true}" maxlength="4" title="휴대전화 마지막 자리" value="2285" class="required">
	                                </p>
	                            </div>
	                        </div>
	            </div>
   	   </form>
   </div>
<!--     <form action="update_profile.jsp" method="post">
      <label for="name">이름:</label>
      <input type="text" id="name" name="name" placeholder="이름을 입력하세요">

      <label for="email">이메일:</label>
      <input type="text" id="email" name="email" placeholder="이메일을 입력하세요">

      <input type="submit" value="프로필 저장">
    </form> -->
  </div>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
<!-- 				<tbody>
				    	<tr>
				            <td colspan="5" class="empty">
				                학습중인 온라인학습이 없습니다.
				            </td>
				        </tr>
				    </tbody> -->
				    <tbody>
					    <tr>
					                <td class="dp_pc num2">1</td>
					                <td class="title double ta_px20">
					                    <a href="javascript:;" onclick="doCourseDetail('11801','1','C130', {eduTypeCode:'0002',stuSeq:'1'})" class="ellipsis" 
					                    data-txt-origin="SNS 마케팅 마스터하기 - 블로그, 인스타그램">
					                        SNS 마케팅 마스터하기 - 블로그, 인스타그램</a><br>
					                    2023.12.28 ~ 2024.1.26<!--p class="dp_ta date2">2023.12.28 ~ 2024.1.26</p-->
					                    <p class="dp_ta writer">진도율7%</p>
					                </td>
					                <td class="dp_pc writer">7%</td>
					                <td class="category px_20 ta_px10">
					                    <a href="javascript:;" title="새 창 열림" onclick="doStudyOnlineLink('11801','1','1')" class="btn_button block btn_bg h36 ta_h52 radius50 bg_blue color_white fz14 ta_fz22"> 
						                            학습하기</a>
					                        </td>
					                <td class="category px_20 ta_px10">
					                    <a href="javascript:;" onclick="doCancelCourse('11801','1','1', 'N')" class="btn_button block btn_bg h36 ta_h52 radius50 bg_666 color_white fz14 ta_fz22">목록삭제</a>
					                    </td>
					                <td class="category px_20 ta_px10">
					                        
					                        -
					                    </td>
					            </tr>
					 </tbody>
				</table>
				</div>
				</div>
				</div>
				
</body>
</html> --%>