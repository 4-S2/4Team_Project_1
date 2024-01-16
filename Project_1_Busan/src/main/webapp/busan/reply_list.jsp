<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
    $('.reUp').click(function(){
        var buttonText = $(this).text();
        
        if(buttonText === '취소') {
            // '취소'일 때의 동작
            $(this).text('수정');
            $(this).closest('.reply-list').find('.update').hide();
        } else {
            // '취소'가 아닐 때의 동작
            $(this).text('취소');
            $(this).closest('.reply-list').find('.update').show();
        }
    });
    
    $('.replyBtn').click(function(){
        var buttonText = $(this).text();
        
        if(buttonText === '취소') {
            // '취소'일 때의 동작
            $(this).text('답글달기');
            $(this).closest('.reply-list').find('.reply').hide();
        } else {
            // '취소'가 아닐 때의 동작
            $(this).text('취소');
            $(this).closest('.reply-list').find('.reply').show();
        }
    });
});

</script>
</head>
<body>
<c:forEach var="vo" items="${list }">
  <div class="reply-list">
		<h5>${vo.id }<span class="regdate">&nbsp;${vo.dbday }</span></h5>
			<div class="review-comment-list" style="border-top: 1px solid #eee">
			
				<p class="comment" style="border-top: 0px">${vo.cont }</p>
				<div class="btnTo">
					<button class="btn btn-sm reUp">수정</button>
					<a href="" class="btn btn-sm reDel">삭제</a>
					<button class="btn btn-sm replyBtn">답글달기</button>
				</div>
			</div>
			<div class="update" style="display: none">
				<input type=text class="upBox"> <a href=""
					class="btn btn-sm reUpBtn">수정</a>
			</div>
			<div class="reply" style="display: none">
				<h5>${id }</h5>
				<input type=text class="replyBox"> <a href=""
					class="btn btn-sm replyInsertBtn">등록</a>
			</div>
	</div>
	<%-- <ul class="review-comment-list">
				<li>
					<h5>
						${vo.id }<br> <span class="regdate">${vo.dbday }</span>
					</h5>
					<div>
						<p class="comment">${vo.cont }</p>
						<div class="btnTo">
							<button class="btn btn-sm reUp">수정</button>
							<a href="" class="btn btn-sm reDel">삭제</a>
							<button class="btn btn-sm replyBtn">답글달기</button>
						</div>
					</div> <c:forEach var="i" begin="0" end="2">
						<ul class="review-comment-reply">
							<li>
								<h5>
									park0000<br> <span class="regdate">2024.01.05</span>
								</h5>
								<p class="comment">답글 내용 답글 내용 답글 내용 답글 내용 답글 내용 답글 내용</p>
							</li>
							</ul>
					</c:forEach>
			
			</li>
			</ul> --%>
		</c:forEach>
</body>
</html>