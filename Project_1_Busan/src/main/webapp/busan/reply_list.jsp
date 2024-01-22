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
        	let content=$(this).closest('.reply-list').find('.comment').text();
        	$(this).closest('.reply-list').find('.upBox').val(content);
            $(this).closest('.reply-list').find('.update').show();
        }
    });
    
    $('.replyBtn').click(function(){
    	var id= $(this).attr("data-id");
        var buttonText = $(this).text();
        if (!id || id.trim() === '') {
            alert("로그인 후 이용이 가능합니다.");
            location.href = "../member/login_main.do";
        }
        else{
        	if(buttonText === '취소') {
                // '취소'일 때의 동작
                $(this).text('답글달기');
                $(this).closest('.reply-list').find('.reply').hide();
            } else {
                // '취소'가 아닐 때의 동작
                $(this).text('취소');
                $(this).closest('.reply-list').find('.reply').show();
                
            }
        }
        
    });
    
     $('.reDel').click(function(){
    	let rrno=$(this).attr("data-rrno");
    	let rno=$(this).attr("data-rno");
    	
    	$.ajax({
    		type:'post',
    		url:'../busan/reply_redelete.do',
    		data:{'rrno':rrno,'rno':rno},
    		success:function(result)
			{
				if(result==='no')
				{
					alert('대댓글이 있는 경우 삭제할 수 없습니다');
				}
				else{
					$.ajax({
			    		type:'post',
			    		url:'../busan/reply_delete.do',
			    		data:{'rrno':rrno,'rno':rno},
			    		success:function(result)
						{
							$('#reply_list').html(result)
						}
			    	})
					
				}
			}
    	})
    }) 
    $('.reUpBtn').click(function(){
    	let rrno=$(this).closest('.Reply').find(".reDel").attr("data-rrno");
    	let rno=$(this).closest('.Reply').find(".reDel").attr("data-rno");
    	let cont=$(this).closest('.Reply').find('.upBox').val();
    	$.ajax({
    		type:'post',
    		url:'../busan/reply_update.do',
    		data:{'rrno':rrno,'rno':rno,'cont':cont},
    		success:function(result)
			{
				$('#reply_list').html(result)
			}
    	})
    }) 
    $('.replyInsertBtn').click(function(){
    	let rrno=$(this).attr("data-rrno");
    	let rno=$(this).attr("data-rno");
    	let cont=$(this).closest('.Reply').find('.replyBox').val();
    	let gid=$(this).attr("data-gid");
    	if(!cont || cont.trim() === ''){
			alert("내용을 입력하세요.")
		}
		else{
			$.ajax({
	    		type:'post',
	    		url:'../busan/reply_reReply.do',
	    		data:{'rrno':rrno,'rno':rno,'cont':cont,'gid':gid},
	    		success:function(result)
				{
					$('#reply_list').html(result)
				}
	    	})
		}
    	
    }) 
});

</script>
</head>
<body>

<c:forEach var="vo" items="${list }">
<div class="Reply" style="display: flex">
<c:forEach var="i" begin="1" end="${vo.group_tab }" varStatus="loop">
 <div style="display: block;width: 40px;">
 <c:if test="${loop.last}">
  <img src="../busan/icon-back.png" style="
    transform: rotate(180deg);
        height: 30px;">
 </c:if>
 </div>
 </c:forEach>
  <div class="reply-list" style="width: 100%;display: block">
		<h5>${vo.id }<span class="regdate">&nbsp;${vo.dbday }</span></h5>
			<div class="review-comment-list" style="border-top: 1px solid #eee">
			
			
				<p class="comment" style="border-top: 0px">${vo.cont }</p>
				<div class="btnTo">
				  <c:if test="${sessionScope.id==vo.id}">
					<button class="btn btn-sm reUp">수정</button>
					<button class="btn btn-sm reDel" data-rno="${vo.rno }" data-rrno="${vo.rrno }">삭제</button>
					</c:if>
					<button class="btn btn-sm replyBtn" data-id="${sessionScope.id}">답글달기</button>
				</div>
			</div>
			<div class="update" style="display: none">
				<input type=text class="upBox"> 
				<button class="btn btn-sm reUpBtn">수정</button>
			</div>
			<div class="reply" style="display: none">
				<h5>${id }</h5>
				<input type=text class="replyBox"> 
				<button class="btn btn-sm replyInsertBtn" data-rno="${vo.rno }" data-rrno="${vo.rrno }" data-gid="${vo.group_id }">등록</button>
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
			</div>
		</c:forEach>
		
</body>
</html>