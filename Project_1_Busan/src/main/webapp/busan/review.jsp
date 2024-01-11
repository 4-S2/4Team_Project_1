<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.ReviewVO, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">

<style type="text/css">
#sb-body{
	padding: 20px;
	border-radius: 15px;
	background-color: #fff;
}
</style>

<!-- <script type="text/javascript" src="../shadow/js/shadowbox.js"></script> -->
<script type="text/javascript">
/* Shadowbox.init({
	players:['iframe']
}) */

$(document).ready(function(){	
	/* $('#reviewInsertBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_insert.do?gno="+gno',
			player:'iframe',
			title:'리뷰 작성',
			width: 640,
			height: 500
		})
	})
	
	$('#reviewDeleteBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_delete.do',
			player:'iframe',
			title:'리뷰 삭제',
			width: 640,
			height: 500
		})
	})
	
	$('#reviewUpdateBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_update.do',
			player:'iframe',
			title:'리뷰 수정',
			width: 640,
			height: 500
		})
	}) */
	
	$('#reviewCommentBtn').click(function(){
		$(this).closest('.review-list').find('.review-comment').toggle();
	})
	
	
	$("#reviewInsertBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let gno=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_insert.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    })
    
    
    $("#reviewUpdateBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let gno=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_update.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    })
    
    
    $("#reviewDeleteBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let gno=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_delete.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    })
    

    $("#reviewDeleteBtn").click(function () {
        // "삭제" 버튼에서 데이터 삭제를 위한 고유 식별자 가져오기
        let gno = $(this).closest('.review-list').data('gno');
        
        // AJAX를 사용하여 서버에 삭제 요청 보내기
        $.ajax({
            type: "POST",  // 또는 "GET" 등 사용하려는 HTTP 메서드
            url: "../busan/delete_review.do",  // 실제로 데이터를 삭제할 서버 엔드포인트로의 경로
            data: { gno: gno },  // 삭제할 리뷰의 고유 식별자 전달
            success: function (response) {
                // 서버에서 성공적으로 응답을 받았을 때 실행할 코드
                // 예를 들어, 삭제 후에 화면 갱신이나 사용자에게 알림을 보여주는 등의 작업 수행 가능
                console.log("리뷰가 성공적으로 삭제되었습니다.");
            },
            error: function (error) {
                // 서버에서 오류 응답을 받았을 때 실행할 코드
                console.error("리뷰 삭제 중 오류가 발생했습니다:", error);
            }
        });
    });
})


function reviewInsert(gno) {
    let x=(document.body.offsetWidth/2) - (640/2);
    let y=(window.screen.height/2) - (480/2) - 50;
    window.open("../busan/review_insert.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
	}

</script>

</head>
<body>
	<button value="리뷰 작성" class="btn" id="reviewInsertBtn" onclick="reviewInsert(${vo.gno})">리뷰 작성</button>
	<c:forEach var="rvo" items="${rlist}">
        <div class="review-list" data-gno="${vo.gno}">
        	<input type="hidden" id="goods_gno" value="${gno}">
        	<div class="review-profile">
        		<div class="profile">
        			<div class="profile-icon">
        				<img src="../images/icon_user.png" alt="프로필 이미지">
        			</div>
	        		<h4>${rvo.id}<br>
	        			<span class="regdate">${rvo.regdate}</span>
	        		</h4>
        		</div>
        		<select class="cate">
        			<option value="1">명소</option>
        			<option value="2">맛집</option>
        			<option value="3">축제</option>
        			<option value="4">체험</option>
        			<option value="5">전시</option>
        			<option value="6">특산물</option>
        		</select>
        		<span class="score">${rvo.score}</span>점
        	</div>
        	
        	<div class="review-item">
        		<img src="${rvo.img}" class="review-img" alt="후기 이미지">
        		<p class="cont">${rvo.cont}</p>
        	</div>
        	
        	<div class="btn-wrapper">
	        	<button class="btn-sm btn-primary" value="수정" id="reviewUpdateBtn">수정</button>
		        <button class="btn-sm btn-info" value="삭제" id="reviewDeleteBtn">삭제</button>
        	</div>
        	
        	<button value="댓글" class="btn" id="reviewCommentBtn">댓글</button>
	        
	        <div class="review-comment" style="display:none">
	        	<ul class="review-comment-list">
	        		<li>
	        			<h5>lee5678<br>
	        				<span class="regdate">2024.01.05</span>
	        			</h5>
	        			<p class="comment">댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용 댓글 내용</p>
	        			<ul class="review-comment-reply">
	        				<li>
	        					<h5>park0000<br>
	        					<span class="regdate">2024.01.05</span>
			        			</h5>
			        			<p class="comment">답글 내용 답글 내용 답글 내용 답글 내용 답글 내용 답글 내용</p>
	        				</li>
	        			</ul>
	        		</li>
	        	</ul>
	        </div>
        </div>
	</c:forEach>
   	<%-- <div class="text-center">
    	<a href="#" class="btn btn-sm btn-primary">이전</a>
    	${curpage} page / ${totalpage} pages
    	<a href="#" class="btn btn-sm btn-primary">다음</a>
   	</div> --%>
</body>
</html>