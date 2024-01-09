<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})

$(document).ready(function(){
	$('#reviewInsertBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_insert.do',
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
	})
	
	$('.review-comment-btn').click(function(){
		$(this).closest('.review-list').find('.review-comment').toggle();
	})
})
</script>
</head>
<body>
	<button value="리뷰 작성" class="btn" id="reviewInsertBtn">리뷰 작성</button>
	<c:forEach var="rvo" items="${rlist}" begin="0" end="3">
        <div class="review-list">
        	<div class="review-profile">
        		<div class="profile">
        			<div class="profile-icon">
        				<img src="../images/icon_user.png" alt="프로필 이미지">
        			</div>
	        		<h4>${rvo.mvo.id}<br>
	        			<span class="regdate">${rvo.regdate}</span>
	        		</h4>
        		</div>
        		<span class="score">${rvo.score}</span>
        	</div>
        	
        	<div class="review-item">
        		<img src="${rvo.img}" class="review-img" alt="후기 이미지">
        		<p class="cont">${rvo.cont}</p>
        	</div>
        	
        	<div class="btn-wrapper">
	        	<button class="btn-sm btn-info" value="수정" id="reviewUpdateBtn">수정</button>
		        <button class="btn-sm btn-danger" value="삭제" id="reviewDeleteBtn">삭제</button>
        	</div>
        	
        	<button value="댓글" class="btn review-comment-btn">댓글</button>
	        
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
   	<div class="text-center">
    	<a href="#" class="btn btn-sm btn-primary">이전</a>
    	${curpage} page / ${totalpage} pages
    	<a href="#" class="btn btn-sm btn-primary">다음</a>
   	</div>
</body>
</html>