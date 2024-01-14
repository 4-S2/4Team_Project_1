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
/* $(document).ready(function(){
  $("#search").on("keyup", function() {
    let value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle(($(this).find("td:eq(2)").text().toLowerCase().indexOf(value) > -1))
    });
    
  }); */
  $(document).ready(function(){
	  $("#search").on("keyup", function() {
	    let value = $(this).val().toLowerCase();

	    $("#myTable tr").filter(function() {
	      let matchColumn2 = $(this).find("td:eq(2)").text().toLowerCase().indexOf(value) > -1;
	      let matchColumn3 = $(this).find("td:eq(3)").text().toLowerCase().indexOf(value) > -1;

	      $(this).toggle(matchColumn2 || matchColumn3);
	    });
	});

  
  $(".upDel").click(function(){
		let x=(document.body.offsetWidth/2)-(750/2)
		let y=(window.screen.height/2)-(570/2)-50
		let gno=$(this).attr('data-gno')
		window.open("../admin/goods_upDel.do?gno="+gno,"",'width=750, height=570, left='+x+', top='+y)
	});
  
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
		th {
/* 			color: #0923a9; */
			text-align: center
		}
 .tab_contents_area {
    float: left;
    margin-right: 210px; 
  }

  #sFrm {
    float: left;
  }

  .clearfix::after {
    content: "";
    display: table;
    clear: both;
  }
  #search {
    width: 250px; 
    height: 32px; 
    border-radius: 5px;
    border: 1px solid #ccc; 
    padding: 8px;
  }

  #searchBtn {
    width: 60px; 
    height: 30px; 
  }

</style>
</head>
<body>
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox"><strong>특산물</strong>관리</h4>
   	  </div>
   	  <div class="clearfix">
   	  <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${gSize}</strong>개의 상품이 등록되어 있습니다.</span></p>
   	  </div>
		  <div id="sFrm">
		  	<input type=search name=search id="search" placeholder="검색어을 입력하세요" value="${search }">
		  	<input type=button id="searchBtn" value="검색" class="btn btn-sm btn-info">
		  </div>
	  </div>
	<div class="container mt-3" style="overflow-y: scroll;height:800px;width:850px">

	  <table class="table table-hover" style="table-layout: auto; ">
	    <thead>
	      <tr>
	        <th style="width: 6%;">번호</th>
	        <th></th>
	        <th>상품명</th>
	        <th>제조사</th>
	        <th>가격</th>
	        <th>수정|삭제</th>
	      </tr>
	    </thead>
	    <tbody id=myTable>
	    	<c:forEach var="vo" items="${list }">
	    		<tr>
	    			<td style="text-align: center;">${vo.num}</td>
			        <td width=10%><img src="${vo.poster }" width=60px height=40px></td>
			        <td><a href="../store/goods_detail.do?gno=${vo.gno }"><span> ${vo.gname }</span></a></td>
			        <td><span>${vo.manufacturer }</span></td>
			        <td>${vo.price }</td>
			        <td><input type="button" value="수정|삭제" id="" data-gno="${vo.gno }" class="btn btn-sm upDel"></td>
			    </tr>
	    	</c:forEach>
	    </tbody>
	  </table>
	</div>
</body>
</html>