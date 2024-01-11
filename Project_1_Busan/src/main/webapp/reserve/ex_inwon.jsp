<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tinwon:active, .tinwon:hover,.tinwon:active {
    color: #fff;
    background-color: #0923a9;
    border-color: #0923a9;
}
.tinwon{
    color: #0923a9;
    background-color: #fff;
    border-color: #0923a9;
}
</style>
<script type="text/javascript">
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
   <table class="table">
   <tr>
     <td>
      <c:forEach var="i" begin="1" end="10">
        <button class="btn btn-xs tinwon" value="${i}">${i}명</span>
      </c:forEach>
     </td>
   </tr>
  </table>
</body>
</html>
