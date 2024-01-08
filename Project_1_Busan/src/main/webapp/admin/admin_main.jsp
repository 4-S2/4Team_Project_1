<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.active {
    /* background-color: #f0f0f0; /* 변경할 색상을 여기에 추가하세요 */ 
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
                <p class="tit">관리자페이지</p>
            </div>
            <!--//TITLE-->
            <!--FILTER-->
            <div class="board_filter_box filter_depth3 mypage">
                <ul class="board_filter_in">
                    <li class="filter_box">
                        <a href="../admin/main.do" class="menu_depth3 single">회원관리</a>
                    </li>
                    <li class="filter_box">
                        <a href="../admin/admin_reserv.do" class="menu_depth3 single">예약현황</a>
                    </li>
                    <li class="divider"></li>
                    <li class="filter_box">
                        <a href="../admin/admin_goods.do" class="menu_depth3 single ">특산물관리</a>
                    </li>
                    <li class="divider"></li>                      
                    <li class="filter_box">
                        <a href="../admin/admin_notice.do" class="menu_depth3 single ">공지사항</a>
                    </li>  
                    <li class="filter_box">
                        <a href="../admin/admin_qna.do" class="menu_depth3 single ">문의내역관리</a>
                    </li>
                </ul>
            </div>

            <!--//FILTER-->
        </div>
        <!--//FILTER_AREA-->
		        <div class="thumbnail_list_area" id="areaContainer">
		        <jsp:include page="${admin_jsp }"></jsp:include>
    			</div>
    </div>
    </div>
    </div>
   
</body>
</html>