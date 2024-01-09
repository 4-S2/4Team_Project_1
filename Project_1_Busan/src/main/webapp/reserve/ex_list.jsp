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
$(function(){
	$('.ex_select').css("cursor","pointer")
	$('.ex_select').click(function(){
		let img=$(this).attr("data-poster");
		let ename=$(this).attr("data-ename");
		let eno=$(this).attr("data-eno");
		
		$('#ex_img').attr("src",img);
		$('#ex_ename').text(ename);
		$('#r_eno').val(eno);
		$.ajax({
			type:'post',
			url:'diary.do',
			data:{"eno":eno},
			success:function(result)
			{
				$('#reserve_day').html(result);
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table" >
    <tr>
     <th class="text-center"></th>
     <th class="text-center">전시회명</th>
     <th class="text-center">영문명</th>
    </tr>
    <c:forEach var="vo" items="${list }">
     <tr class="ex_select" data-poster="${vo.poster }" 
        data-name="${vo.ename }" data-eno="${vo.eno }">
      <td class="text-center">
        
      </td>
      <td>${vo.ename }</td>
      <td class="text-center">${vo.eename }</td>
     </tr>
    </c:forEach>
  </table>
</body>
</html>