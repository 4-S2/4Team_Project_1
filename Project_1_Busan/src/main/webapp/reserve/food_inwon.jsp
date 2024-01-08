<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
    $('.tinwon').click(function(){
       let tinwon = $(this).text();
       $('#food_inwon').text(tinwon);
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
        <span class="btn btn-xs btn-info tinwon">${i}</span>
      </c:forEach>
     </td>
   </tr>
  </table>
</body>
</html>
