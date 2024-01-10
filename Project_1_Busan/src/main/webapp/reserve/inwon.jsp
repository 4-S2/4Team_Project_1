<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
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
	   
	   $.ajax({
		   type:'post',
		   url:'../reserve/inwon.do',
		   success:function(result){
			   $('#inwons').html(result);
		   }
	   })
	})
})
$(function(){
    $('.tinwon').click(function(){
    	$('.tinwon').css({
			"background-color": "#fff",
			"color": "#0923a9",
			"border-color": "#0923a9"
		});
       let tinwon = $(this).val();
       $(this).css("background-color", "#0923a9");
		$(this).css("color", "#fff");
       $('#ex_inwon').text(tinwon);
       $('#rinwon').val(tinwon);
       $('#ok').show();
    });
});
</script>
</head>
<body>
  <c:forEach var="i" begin="1" end="10">
    <span class="btn btn-xs btn-info tinwon">${i }명</span>
  </c:forEach>
    <span class="btn btn-xs btn-info tinwon">단체</span>
</body>
</html>