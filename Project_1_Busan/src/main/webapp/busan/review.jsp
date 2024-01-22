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
	
	$('.reviewCommentBtn').click(function () {
	    let rno = $(this).attr("data-rno");
	    let reviewCommentContainer = $(this).closest('.review-list').find('.review-comment');

	    // reviewCommentContainer에 내용이 있는지 확인
	    if (!reviewCommentContainer.html().trim()) {
	        // 내용이 없는 경우에만 AJAX 호출
	        $.ajax({
	            type: 'post',
	            url: '../busan/review_reply.do',
	            data: { 'rno': rno },
	            success: function (result) {
	                console.log(result);
	                reviewCommentContainer.html(result);
	            }
	        });
	    } else {
	        // 내용이 있는 경우 비우기
	    	$.ajax({
	            type: 'post',
	            url: '../busan/review_reply.do',
	            data: { 'rno': rno },
	            success: function (result) {
	                console.log(result);
	                reviewCommentContainer.html("");
	            }
	        });
	    }
	});



	
	
/*  	$("#reviewInsertBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let no=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_insert.do?no="+no, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    })  */
    
    
    $("#reviewUpdateBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let gno=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_update.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    })
    
    
    /* $("#reviewDeleteBtn").click(function(){
        let x=(document.body.offsetWidth/2) - (640/2);
        let y=(window.screen.height/2) - (480/2) - 50;
        let gno=$(this).closest('.review-list').data('gno');
        window.open("../busan/review_delete.do?gno="+gno, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
    }) */
    

    $(".reviewDeleteBtn").click(function () {
        // "삭제" 버튼에서 데이터 삭제를 위한 고유 식별자 가져오기
        let gno = $(this).closest('.review-list').data('gno');
        let rno = $(this).closest('.review-list').find('.goods_rno').val();
        // AJAX를 사용하여 서버에 삭제 요청 보내기
        $.ajax({
            type: "POST",  // 또는 "GET" 등 사용하려는 HTTP 메서드
            url: "../busan/review_delete_ok.do",  // 실제로 데이터를 삭제할 서버 엔드포인트로의 경로
            data: { gno: gno,'rno':rno },  // 삭제할 리뷰의 고유 식별자 전달
            success: function (response) {
                // 서버에서 성공적으로 응답을 받았을 때 실행할 코드
                // 예를 들어, 삭제 후에 화면 갱신이나 사용자에게 알림을 보여주는 등의 작업 수행 가능
                alert("리뷰가 성공적으로 삭제되었습니다.");
                location.href="../store/goods_detail.do?gno=" + gno;
            },
            error: function (error) {
                // 서버에서 오류 응답을 받았을 때 실행할 코드
                console.error("리뷰 삭제 중 오류가 발생했습니다:", error);
            }
        });
    });
})


 /* function reviewInsert(no) {
    let x=(document.body.offsetWidth/2) - (640/2);
    let y=(window.screen.height/2) - (480/2) - 50;
    window.open("../busan/review_insert.do?no="+no, "_blank", 'width=640, height=480, left=' + x + ', top=' + y);
	}  */

</script>

</head>
<body>
	<button class="btn" id="reviewInsertBtn" data-toggle="modal" data-target="#reviewModal">리뷰 작성</button>
	
	<!-- 리뷰 작성 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="yourFormId" action="../busan/review_insert_ok.do" enctype="multipart/form-data">
                    <input type="hidden" id="no" name="no">
                    
                    <!-- 리뷰 작성 폼 내용 -->
                    <table class="table">
                        <tr>
					<th width=15%>아이디</th>
					<td width=85% name="id">${sessionScope.id}</td>
				</tr>
				<tr>
					<th width="15%">카테고리</th>
					<td width="85%" >
						<select class="cate" name=cateno>
		        			<option value="1">명소</option>
		        			<option value="2">맛집</option>
		        			<option value="3">축제</option>
		        			<option value="4">체험</option>
		        			<option value="5">전시</option>
		        			<option value="6">특산물</option>
		        		</select>
					</td>
				</tr>
				<tr>
					<th width=15%>평점</th>
					<td width=85%>
						<select class="cate" name="score">
		        			<option value="1">1</option>
		        			<option value="2">2</option>
		        			<option value="3">3</option>
		        			<option value="4">4</option>
		        			<option value="5">5</option>
		        		</select>
					</td>
				</tr>
				<tr>
					<th width=15%>이미지</th>
					<td width=85%>
						<input type="file" name=upload>
					</td>
				</tr>
				<tr>
					<th width=15%>내용</th>
					<td width=85%>
						<textarea rows="10" cols="60" name="cont" required style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<th width=15%>비밀번호</th>
					<td width=85%>
						<input type="password" name="password" required>
					</td>
				</tr>
				<tr>
				 <td colspan="2" class="text-center"> 
                   <input type="submit" class="btn-sm btn-primary" value="작성" id="reviewInsertBtn">
                   <button class="btn-sm btn-info" value="취소" id="reviewCancelBtn" data-dismiss="modal">취소</button>
                 </td>
				</tr>
                    </table>
                </form>
                <script type="text/javascript">
                var noValue = ${no};
                document.getElementById("no").value = noValue;

                // 폼 제출 시
                $("#yourFormId").submit(function (event) {
                    event.preventDefault(); // 폼의 기본 제출 동작을 막음

                    // ajax를 사용하여 비동기적으로 폼 제출
                    $.ajax({
                        type: $(this).attr('method'),
                        url: $(this).attr('action'),
                        data: new FormData(this),
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            // 폼이 성공적으로 제출되면 모달 닫기
                            $("#yourModalId").modal('hide');

                            // 페이지 새로 고침
                            location.reload();
                        },
                        error: function (error) {
                            console.error("폼 제출 중 오류가 발생했습니다:", error);
                        }
                    });
                });
            </script>
            </div>
            
        </div>
    </div>
</div>
	
	<c:forEach var="rvo" items="${rlist}">
        <div class="review-list" data-gno="${rvo.no}">
        	<input type="hidden" class="goods_gno" value="${rvo.no}">
        	<input type="hidden" class="goods_rno" value="${rvo.rno}">
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
        		<img src="data:image/jpeg;base64,${rvo.img}" class="review-img" alt="후기 이미지">
        		<p class="cont">${rvo.cont}</p>
        	</div>
        	
        	<div class="btn-wrapper">
	        	<button class="btn-sm btn-primary" value="수정" id="reviewUpdateBtn">수정</button>
		        <button class="btn-sm btn-info reviewDeleteBtn" value="삭제" id="reviewDeleteBtn">삭제</button>
        	</div>
        	
        	<button value="댓글" class="btn reviewCommentBtn" id="reviewCommentBtn" data-rno="${rvo.rno }">댓글</button>
	        
	        <div class="review-comment">
	        	
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