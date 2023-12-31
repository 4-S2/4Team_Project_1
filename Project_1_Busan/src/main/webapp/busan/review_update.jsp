<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#reviewUpdateBtn').click(function(){
		Shadowbox.open({
			content:'../busan/review_update.do',
			player:'iframe',
			title:'리뷰 수정',
			width: 640,
			height: 480
		})
	})
	
	$('#reviewUpdateBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()===""){
			$('#id').focus();
			return;
		}
		
		let score=$('#score').val()
		if(score.trim()===""){
			$('#subject').focus();
			return;
		}
		
		let cont=$('#cont').val()
		if(cont.trim()===""){
			$('#cont').focus();
			return;
		}
		
		let img=$('#img').val()
		
		let pwd=$('#pwd').val()
		if(pwd.trim()===""){
			$('#pwd').focus();
			return;
		}
		
		let rno=$('#rno').val()
		
		$.ajax({
			type:'post',
			url:'../busan/review_update.do',
			data:{"rno":rno,"id":id,"score":score,
				 "cont":cont,"pwd":pwd},
			success:function(result){ //out.write
			
				if(result==="yes"){
					location.href="../busan/review.do?rno="+rno;
				}
				else{
					alert("비밀번호가 틀립니다.")
					$('#pwd').val("")
					$('#pwd').focus()
				}
			},
			error:function(err){
				alert(err)
			}
			
		})
	})
</script>
</head>
<body>
	<div class="review-insert review-update">
        <form method="post" action="../busan/review_insert_ok.do">
			<table class="table">
				<tr>
					<th width=10%>아이디</th>
					<td width=90% id="id">아이디</td>
				</tr>
				<tr>
					<th width=10%>평점</th>
					<td width=90%>
						<input type="text" name="score" id="score" required>
					</td>
				</tr>
				<tr>
					<th width=10%>이미지</th>
					<td width=90%>
						<input type="file" name="img" id="img" required>
					</td>
				</tr>
				<tr>
					<th width=10%>내용</th>
					<td width=90%>
						<textarea rows="10" cols="60" name="cont" id="cont" required style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<th width=10%>비밀번호</th>
					<td width=90%>
						<input type="password" name="pwd" id="pwd" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn-sm btn-success" value="수정" id="reviewUpdateBtn">수정</button>
	           			<button class="btn-sm btn-info" value="취소" id="reviewCancelBtn" onclick="javascript:history.back()">취소</button>
	         		</td>
	       		</tr>
	    	</table>
	    </form>
    </div>
</body>
</html>