<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.comment{
    display: inline-block;
    min-width: 60%;
}
.reUpBtn, .replyInsertBtn{
    height: 60px;
    width: 9.6%;
    padding: 20px;
}
.upBox, .replyBox{
    min-width: 90%;
    height: 60px;
}
.reUp, .reUpBtn, .reDel, .reInBtn, .reBack, .replyBtn, .replyInsertBtn {
    background-color: #2546F4;
    color: #fff;
}
.btn.focus, .btn:focus, .btn:hover{
color: #fff;
}
.reUp, .reDel {
    width:49px;
}
.btnTo{
    display: inline-block;
    float: right;
    margin-top: 7px;
}
.reply-insert .reply-btn-wrapper {
    justify-content: right;
}
</style>
<script type="text/javascript">
$(function(){
	let rno=$('#rno').val();
	
	$.ajax({
		type:'post',
		url:'../busan/reply.do',
		data:{"rno":rno},
		success:function(result)
		{
			$('#reply_list').html(result)
		}
	});
	$('#replyInsert').click(function(){
		let cont=$('#cont').val();
		$.ajax({
			type:'post',
			url:'../busan/reply_insert.do',
			data:{"rno":rno, "cont":cont},
			success:function(result)
			{
				$('#reply_list').html(result)
			}
		});
		
	});
	
	
	
	
	
}) 
</script>
</head>
<body>
<input type="hidden" id="rno" value="${rno }">
	<div id="reply_list">
	
	</div>
	<div class="reply-insert">
		
			<table class="table">

				<tr>

					<td style="position: relative; max-width: 100%; padding: 10px 0">
						<h5>${id }</h5> <textarea rows="4" cols="60" id="cont" required
							style="resize: none"></textarea><br>
							<input type="hidden" name="rno" value="${rno }">
						<div class="reply-btn-wrapper">
							<button class="btn-sm btn reInBtn" value="등록" id="replyInsert">등록</button>
							<button class="btn-sm btn reBack" value="취소" id="replyCancel"
								onclick="javascript:history.back()">취소</button>
						</div>
					</td>
				</tr>

			</table>
		
	</div>
</body>
</html>