<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
   width: 95%;
   margin-top: 90px;
}
.row{
  margin: 0px auto;
  width: 100%
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
  border-top:0px;
}
#food_list tr:hover{
   cursor: pointer;
}
#food_image{
  height: 230px;
  border-radius: 30px;
    padding: 10px;
}
h3{
  font-size: 16px;
  color:black;
}
.tspans, .tinwon{
   font-size: 14px;
    margin: 0px 3px;
    height: 30px;
    width: 50px;
}
.resInfo{
    font-size: 15px;
    color:black;
}
.btn-res{
    color: #fff;
    background-color: #0923a9;
    border-color: #0923a9;
    border-radius: 20px;
}

.btn-res:hover{
    color: #fff;
    background-color: #0923a9d4;
    border-color: #0923a9;
}
.resDaInfo, .resInfo{
  border-collapse: collapse;
  border-radius: 10px;
  border-style: hidden;
  box-shadow: 0 0 0 2px #e6e6e6;
}
.resInfo .td{
  padding: 7px 25px;

}
.resInfo .td1{
padding: 7px 25px 20px;
}
#ok{
  padding: 0px 3px;
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
       <td width=65% height="400">
         <table class="table resDaInfo">
          <caption><h3>날짜선택</h3></caption>
          <input type="hidden" id="food_no" value="${param.no}">
          <tr>
           <td style="padding: 18px 20px 0px">
           <div id="food_date"></div>
           </td>
          </tr>
         </table>
       </td>
       <td width=35% rowspan="3">
         <table class="table resInfo">
          <caption><h3>예약정보 확인</h3></caption>
          <tbody style="height:404px">
          <tr>
           <td>
            <img src="${param.poster }" style="width: 100%" id="food_image">
           </td>
          </tr>
          <tr>
            <td class="td">업체명&nbsp;:&nbsp;<span id="food_name"></span></td>
          </tr>
          <tr>
            <td class="td">예약일&nbsp;:&nbsp;<span id="food_day"></span></td>
          </tr>
          <tr>
            <td class="td">예약시간&nbsp;:&nbsp;<span id="food_time"></span></td>
          </tr>
          <tr>
            <td class="td1">인원&nbsp;:&nbsp;<span id="food_inwon"></span></td>
          </tr>
          </tbody>
         </table>
         <div style="display: none" id="ok">
    <form method="post" action="../reserve/food_reserve_ok.do"> 
       <input type="hidden" name="fno" id="fno">
       <input type="hidden" name="rday" id="rday">
       <input type="hidden" name="rtime" id="rtime">
       <input type="hidden" name="rinwon" id="rinwon">
       <button class="btn btn-sm btn-res" style="font-size: 14px;width: 100%;height: 40px">예약하기</button>
       </form>
       </div>
       </td>
      </tr>
      <tr>
        <td width="35%" height="150">
          <table class="table">
           <h3>시간선택</h3>
           <tr>
           <td>
             <div id="times"></div>
           </td>
           </tr>
          </table>
        </td>    
      </tr>
      <tr>
      <td width="35%" height="150">
          <table class="table">
           <h3>인원선택</h3>
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