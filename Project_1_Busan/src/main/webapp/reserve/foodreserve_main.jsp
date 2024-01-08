<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript">
$(function(){
	let no=$('#food_no').val();
	$('#fno').val(no);
	
	$.ajax({
		type:'post',
		url:'../reserve/food_date.do',
		data:{"no":no},
		success:function(result)
		{
			$('#food_date').html(result)
		}
	})
	$.ajax({
		type:'post',
		url:"../reserve/food_title.do",
		data:{"no":no},
		success:function(result)
		{
			var name=decodeURIComponent(result);
			$('#food_name').text(name);
		}
	})
	
}) 
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
          <input type="hidden" id="food_no" value="${param.no}">
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
            <img src="${param.poster }" style="width: 100%" id="food_image">
           </td>
          </tr>
          <tr>
            <td>업체명:&nbsp;<span id="food_name"></span></td>
          </tr>
          <tr>
            <td>예약일:&nbsp;<span id="food_day"></span></td>
          </tr>
          <tr>
            <td>예약시간:&nbsp;<span id="food_time"></span></td>
          </tr>
          <tr>
            <td>인원:&nbsp;<span id="food_inwon"></span></td>
          </tr>
          <tr>
     <td style="display: none" id="ok">
       <form method="post" action="../reserve/food_reserve_ok.do"> 
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