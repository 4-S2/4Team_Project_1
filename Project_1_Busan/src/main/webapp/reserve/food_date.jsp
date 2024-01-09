<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 100%
}

.rdays:hover {
	cursor: pointer;
}
.dateCss{
    display: inline-block;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #000;
    color: #fff;
    line-height: 40px;
}
.dateCss3{
    display: inline-block;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    line-height: 40px;
}
</style>
<script type="text/javascript">
$(function(){
	$('.rdays').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		let day=$(this).attr("data-day");
		let rday=year+"년 "+month+"월 "+day+"일";
		$('#food_day').text(rday);
		$('#rday').val(rday);
		
		$.ajax({
			type:'post',
			url:"../reserve/food_time.do",
			data:{'day':day},
			success:function(result)
			{
				$('#times').html(result)
			}
		})
	})
	
});
/* $(function(){
	$('.rdays').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		let day=$(this).text();
		let rday=year+"년도 "+month+"월 "+day+"일"
		$('#food_day').text(rday);
		$('#rday').val(rday);
		$.ajax({
			type:'post',
			url:'../reserve/food_time.do',
			data:{"day":day},
			success:function(result)
			{
				$('#times').html(result)
			}
		})
	});
}) */
</script>
</head>
<body>
	<table class="table">
		<caption class="text-center">
			<h3 style="font-size: 21px">${year }년&nbsp;&nbsp;${month }월</h3>
		</caption>
		<tr class="danger">
			<c:forEach var="strWeek" items="${strWeek }">
				<td class="text-center" style="background-color:#e5e9ff">${strWeek }</td>
			</c:forEach>
			<c:set var="week" value="${week }" />
			<c:forEach var="i" begin="1" end="${lastday }">
				<c:if test="${i==1 }">
					<tr>
						<td class="text-center">&nbsp;</td>
				</c:if>
				<c:if test="${rday[i]==1}">
					<td class="text-center rdays"
						 data-year="${year }"
						data-month="${month }" data-day="${i }"><span class="dateCss">${i }<span></td>
				</c:if>
				<c:if test="${rday[i]==0}">
					<td class="text-center" data-day="${i }"><span class="dateCss3">${i }<span></td>
				</c:if>
				<c:set var="week" value="${week+1 }" />
				<c:if test="${week>6 }">
					<c:set var="week" value="0" />
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
</body>
</html>