<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="review-insert">
        <form method="post" action="../busan/review.do">
			<table class="table">
				<tr>
					<th width=10%>아이디</th>
					<td width=90%>${sessionScope.id}</td>
				</tr>
				<tr>
					<th width=10%>평점</th>
					<td width=90%>
						<input type="text" name="score" required>
					</td>
				</tr>
				<tr>
					<th width=10%>이미지</th>
					<td width=90%>
						<input type="file" name="img" required>
					</td>
				</tr>
				<tr>
					<th width=10%>내용</th>
					<td width=90%>
						<textarea rows="10" cols="60" name="cont" required style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<th width=10%>비밀번호</th>
					<td width=90%>
						<input type="password" name="pwd" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn-sm btn-success" value="작성" id="reviewIsertBtn">작성</button>
	           			<button class="btn-sm btn-info" value="취소" id="reviewCancelBtn" onclick="javascript:history.back()">취소</button>
	         		</td>
	       		</tr>
	    	</table>
	    </form>
    </div>
</body>
</html>