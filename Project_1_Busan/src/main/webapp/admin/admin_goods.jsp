<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle(($(this).find("td:eq(1)").text().toLowerCase().indexOf(value) > -1) || 
    		  		 ($(this).find("td:eq(2)").text().toLowerCase().indexOf(value) > -1))
    });
    
  });
  
  $('.gInfo').on("click", function(){
		let x=(document.body.offsetWidth/2)-(750/2)
		let y=(window.screen.height/2)-(570/2)-50
		let gno=$(this).attr('data-gno')
		window.open("../adminpage/groundDetail.do?gno="+gno,"",'width=750, height=570, left='+x+', top='+y)
  })
  $('.mInfo').on("click", function(){
	  	let x=(document.body.offsetWidth/2)-(750/2)
		let y=(window.screen.height/2)-(500/2)-50
		let id=$(this).attr('data-id')
		window.open("../adminpage/memberDetail.do?id="+id,"",'width=750, height=500, left='+x+', top='+y)
  })
  
  $('.rState').on("change",function(){
	  let rstate=$(this).val()
	  let rno=$(this).attr("data-rno")
	  location.href="../adminpage/stateChange.do?rstate="+rstate+"&rno="+rno
  })
});
</script>
<style type="text/css">

		.container::-webkit-scrollbar {
		    width: 10px;
		}
		.container::-webkit-scrollbar-thumb {
		    background-color: rgb(180, 180, 180);
		    border-radius: 10px;
		}
		.container::-webkit-scrollbar-track {
		    background-color: white;
		}
		#myTable span:hover{
			cursor: pointer;
			font-weight: bold;
		}
</style>
</head>
<body>
	<div class="container mt-3" style="overflow-y: scroll;;height:800px;width:850px">
	  <h4>예약 현황</h4>
	  <div style="height:30px;"></div>
	  <p>예약 현황</p><div><input type=search id="search" placeholder="구장 혹은 이름을 입력하세요.." style="width: 200px;"></div>   
	  <table class="table table-hover" style="table-layout: auto;">
	    <thead>
	      <tr>
	        <th></th>
	        <th>구장 이름</th>
	        <th>예약자</th>
	        <th>예약날짜</th>
	        <th>시간</th>
	        <th>승인여부</th>
	      </tr>
	    </thead>
	    <tbody id=myTable>
	    	<c:forEach var="vo" items="${list }">
	    		<tr>
			        <td width=10%><img src="${vo.gimage }" width=60px height=40px></td>
			        <td><span class="gInfo" data-gno="${vo.gno }">${vo.gname }</span></td>
			        <td><span class=mInfo data-id="${vo.id }">${vo.name }</span></td>
			        <td>${vo.rdate }</td>
			        <td>${vo.time }</td>
			        <td>
						<select class="rState" data-rno=${vo.rno }>
							<option ${vo.rstate=='예약대기'?"selected":"" } value=예약대기>예약대기</option>
							<option ${vo.rstate=='예약승인'?"selected":"" } value=예약승인>예약승인</option>
							<option ${vo.rstate=='예약취소'?"selected":"" } value=예약취소>예약취소</option>
						</select>
					</td>
			    </tr>
	    	</c:forEach>
	    </tbody>
	  </table>
	</div>
	
</body>
</html>