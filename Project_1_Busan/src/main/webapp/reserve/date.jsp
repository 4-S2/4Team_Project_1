<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calendar Display</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.unique-calendar-container {
  margin: 0 auto;
  max-width: 100%;
}
.unique-calendar .unique-calendar-cell {
  padding: 10px;
  text-align: center;
  vertical-align: middle;
}
.unique-calendar .unique-calendar-header {
  background-color: #f2dede;
}
.unique-calendar .unique-calendar-highlight {
  color: #a94442;
}
.unique-table-responsive {
  margin: 20px 0;
}
</style>
</head>
<body>
  <div class="container unique-calendar-container">
    <div class="jumbotron">
      <h3 class="text-center">예약</h3>
    </div>
    <div class="row unique-calendar">
      <h4 class="text-center">
       ${year}년도 ${month}월
      </h4>  
      <div class="unique-table-responsive">
        <table class="table unique-calendar">
           <tr class="unique-calendar-header">
             <c:forEach var="str" items="${strWeek}">
               <th class="unique-calendar-cell">${str}</th>
             </c:forEach>
           </tr>
           <c:set var="dayCount" value="1"/>
           <c:forEach var="week" begin="1" end="${(lastday + week - 1) div 7}">
              <tr>
                <c:forEach var="dayOfWeek" begin="1" end="7">
                    <c:choose>
                        <c:when test="${week == 1 and dayOfWeek < startDayOfWeek}">
                            <td class="unique-calendar-cell"> </td>
                        </c:when>
                        <c:when test="${dayCount <= lastday}">
                            <td class="unique-calendar-cell ${dayCount == day ? 'unique-calendar-highlight' : ''}">${dayCount}</td>
                            <c:set var="dayCount" value="${dayCount + 1}"/>
                        </c:when>
                        <c:otherwise>
                            <td class="unique-calendar-cell"> </td>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
              </tr>
           </c:forEach>
         </table>
       </div>
    </div>
  </div>
</body>
</html>