<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tspans:active, .tspans:hover,.tspans:active {
    color: #fff;
    background-color: #0923a9;
    border-color: #0923a9;
}
.tspans{
    color: #0923a9;
    background-color: #fff;
    border-color: #0923a9;
    padding: 3px;
}
</style>
<script type="text/javascript">
$(function(){
	$('.tspans').click(function(){
		$('.tspans').css({
			"background-color": "#fff",
			"color": "#0923a9",
			"border-color": "#0923a9"
		});
		let time=$(this).text();
		$(this).css("background-color", "#0923a9");
		$(this).css("color", "#fff");
	   $('#food_time').text(time);
	   $('#rtime').val(time);
	   $.ajax({
		   type:'post',
		   url:'../reserve/food_inwon.do',
		   success:function(result){
			   $('#inwons').html(result);
		   }
	   })
	})
})
</script>
</head>
<body>
<table class="table">
   <tr>
     <td>
      <c:forEach var="time" items="${list }">
        <span class="btn btn-xs tspans">${time }</span>
      </c:forEach>
     </td>
   </tr>
  </table>
</body>
</html>