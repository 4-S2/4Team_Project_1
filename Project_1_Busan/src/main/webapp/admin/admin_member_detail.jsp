<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style type="text/css">
  	.row{
  		margin:0 auto;
  		width:700px;
  	}
    th {
      text-align: center; 
    }
    .table.table-bordered th {
  background-color: #0923a9;
  color: white;
}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$('#cancelBtn').click(function(){
  			window.close()
  		})
  		
  		$('#modifyBtn').click(function(){
  			let formData=$('#frm').serialize();
  			
  			$.ajax({
  				url:"../admin/member_detail_edit.do",
  				type:"post",
  				data:formData,
  				success:function(res){
  					if(res==='success'){
    					alert('회원 정보가 수정되었습니다.')
      					opener.location.reload();
      	  		        window.close();
    				}else if (res==='fail') {
    					alert('회원 정보 수정에 실패했습니다.')
					}
  				}
  				
  			})
  		})
  		
  		$('#deleteBtn').click(function(){
  			$.ajax({
  				url:"../admin/member_delete.do",
  				type:"post",
  				data:{"id":'${vo.id}'},
  				success:function(res){
  					if(res==='success'){
    					alert('회원 삭제가 완료됐습니다.')
      					opener.location.reload();
      	  		        window.close();
    				}else if (res==='fail') {
    					alert('회원 삭제에 실패했습니다.')
					}
  				}
  			}) 
  		})
  	})
  </script>
</head>
<body>
	<div class="container">
		<div class=row>
			<h2 style="text-align: center;"><strong>${vo.name }</strong>님의 정보</h2>
			<div style="height:30px;"></div>
			<form method="post" id="frm">
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td>${vo.id }
						<input type=hidden name=id value="${vo.id }"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type=text name=email value="${vo.email }"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type=text name=name value="${vo.name }"></td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td><input type=text name=phone value="${vo.phone }"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type=text name=postcode value="${vo.postcode }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type=text name=addr value="${vo.addr }"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type=text name=daddr value="${vo.detail_addr }"></td>
					</tr>
					<tr>
												<th>관리자여부</th>
						<td><select name=admin>
							<option value=y ${vo.admin=="y"?"selected":"" }>y</option>
							<option value=n ${vo.admin=="n"?"selected":"" }>n</option>
						</select></td>
					</tr>
				</table>
				<div class="text-right">
					<input type="button" id="modifyBtn" value="수정">
					<input type="button" id="deleteBtn" value="탈퇴">
					<input type="button" id="cancelBtn" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>