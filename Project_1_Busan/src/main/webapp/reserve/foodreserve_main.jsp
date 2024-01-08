<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
  margin: 0px auto;
  width: 100%
}
.table{
  width: 96%;
}
#food_list tr:hover{
   cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* $(function(){
	$.ajax({
		type:'post',
		url:'../reserve/food_list.do',
		data:{"no":1},
		success:function(result)
		{
			$('#food_list').html(result)
		}
	})
	$('.foods').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../reserve/food_list.do',
			data:{"no":no},
			success:function(result)
			{
				$('#food_list').html(result)
			}
		})
	})
}) */
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <table class="table" height="700">
      <tr>
       <td width=65% height="400" class="success">
         <table class="table">
          <caption><h3>예약일 정보</h3></caption>
          <tr>
           <td>
           <div id="food_date"></div>
           </td>
          </tr>
         </table>
       </td>
       <td width=35% rowspan="3" class="info">
         <table class="table">
          <caption><h3>예약정보</h3></caption>
          <tr>
           <td>
            <img src="../reserve/noimage.png" style="width: 100%" id="food_image">
           </td>
          </tr>
          <tr>
            <td>업체명:<span id="food_name"></span></td>
          </tr>
          <tr>
            <td>예약일:<span id="food_day"></span></td>
          </tr>
          <tr>
            <td>예약시간:<span id="food_time"></span></td>
          </tr>
          <tr>
            <td>인원:<span id="food_inwon"></span></td>
          </tr>
          <tr>
     <td style="display: none" id="ok">
       <form method="post" action="../reserve/reserve_ok.do"> 
       <input type="hidden" name="fno" id="fno">
       <input type="hidden" name="rday" id="rday">
       <input type="hidden" name="rtime" id="rtime">
       <input type="hidden" name="rinwon" id="rinwon">
       <button class="btn btn-sm btn-danger">예약하기</button>
       </form>
     </td>
    </tr>
         </table>
       </td>
      </tr>
      <tr>
        <td width="35%" height="150" class="warning">
          <table class="table">
           <caption><h3>시간정보</h3></caption>
           <tr>
           <td>
             <div id="times"></div>
           </td>
           </tr>
          </table>
        </td>    
      </tr>
      <tr>
      <td width="35%" height="150" class="danger">
          <table class="table">
           <caption><h3>인원정보</h3></caption>
           <tr>
           <td>
             <div id="inwons"></div>
           </td>
           </tr>
          </table>
        </td>
      </tr>
    </table>
   </div>
  </div>
</body>
</html>




