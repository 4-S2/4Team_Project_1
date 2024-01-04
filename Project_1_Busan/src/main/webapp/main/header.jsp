<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    $(document).ready(function(){
        // 드롭다운 메뉴에만 적용
        $('.navbar-nav .dropdown-toggle').dropdown();
    });
    

</script>


<nav class="navbar navbar-inverse">
    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="../main/main.do">Busan Tour</a>
        </div>

        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">부산 여행<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../busan/tour.do">명소</a></li>
                    <li><a href="../busan/food.do">맛집</a></li>
                    <li><a href="../busan/festival.do">축제</a></li>
                    <li><a href="../busan/activity.do">체험</a></li>
                    <li><a href="../busan/ex.do">전시</a></li>
                </ul>
            </li>

            <li><a href="../store/goods.do">특산물 쇼핑</a></li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../board/notice.do">공지사항</a></li>
                    <li><a href="../board/qnaboard.do">묻고 답하기</a></li>
                </ul>
            </li>
        </ul>

   <ul class="navbar-user" style="float: right; margin-bottom: 0">
    <!-- Check if the user is not logged in -->
       
    <c:if test="${sessionScope.id==null}">
        <li style="display: inline-block;"><a href="../member/login_main.do" style="padding: 0 15px; line-height: 50px;">로그인</a></li>
        <!-- Only display the Sign up link if the user is not logged in -->
        <li style="display: inline-block;"><a href="../member/join.do" style="padding: 0 15px; line-height: 50px;">회원가입</a></li>
    </c:if>

    <!-- Check if the user is logged in -->
    <c:if test="${sessionScope.id!=null}">
        <!-- Show logout link -->
        <li style="display: inline-block;"><a href="../member/logout.do" style="padding: 0 15px; line-height: 50px;">로그아웃</a></li>

        <!-- Further check if the user is an administrator -->
        <c:if test="${sessionScope.admin=='y'}">
            <li style="display: inline-block;"><a href="#" style="padding: 0 15px; line-height: 50px;">관리자 페이지</a></li>
        </c:if>

        <!-- Check if the user is a regular user -->
        <c:if test="${sessionScope.admin=='n'}">
            <li style="display: inline-block;"><a href="../mypage/main.do" style="padding: 0 15px; line-height: 50px;">마이 페이지</a></li>
        </c:if>
    </c:if>

    <!-- Shopping Cart Icon, always displayed -->
    <li style="display: inline-block;"><a href="#"><img class="icon-cart" src="../images/icon_cart.png"></a></li>
</ul>
    </div>
</nav>
