<%@ page language="java" contentType="text/html  charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 30px"></div>
	<div class=col-sm-8>
		<table class=table>
			<tr>
				<td>

					<table class=table>
						<tr>
							<td class=text-left>◑ &nbsp;  
							</td>
							<td class=text-right><span
								class="btn btn-xs btn-success ups" data-no="">수정</span>&nbsp;
								<a href="#" class="btn btn-xs btn-info">삭제</a></td>
						</tr>
						<tr>
							<td colspan=2><pre
									style="white-space: pre-wrap backgorund-color:white border:none"> </pre>
							</td>
						</tr>
						<tr id=m "+rvo.getRno()+" class=updates style="display: none">
							<td colspan=2>

								<form method=post action=ReplyUpdateServlet>
									<input type=hidden name=rno value="+rvo.getRno()+"> <input
										type=hidden name=gno value="+no+"> <input type=hidden
										name=typeno value="+type+">
									<textarea name=msg rows=4 cols=50 style="float: left"> </textarea>
									<input type=submit value="댓글 수정 "
										style="width: 80px height:89px background:blue color:white">
								</form> 
								
								<!-- if(id!=null)//로그인이 되었다면  -->
								<form method=post action=GoodsDetailServlet>
									<input type=hidden name=gno value="+no+"> <input
										type=hidden name=typeno value="+type+">
									<textarea name=msg rows=4 cols=60 style="float: left"></textarea>
									<input type=submit value="댓글 쓰기 "
										style="width: 100px height:89px background:blue color:white">
								</form> 
	</div>
	<div class=col-sm-4></div>

</body>
</html>