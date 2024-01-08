<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table class="table">
       <tr>
         <c:forTokens items="${evo.poster }" delims="^" var="img">
           <td>
            <img src="${img }" style="width: 100%">
           </td>
         </c:forTokens>
       </tr>
     </table>
     <table class="table">
         <tr>
           <td colspan="2">
            <h3>${evo.ename }&nbsp;<span style="color:orange">${evo.eename }</span></h3>
           </td>
         </tr>
         <tr>
          <th width=20% class="text-center">주소</th>
          <td width=80%>${evo.loc }
            
          </td>
         </tr>
         <tr>
          <th width=20% class="text-center">영문명</th>
          <td width=80%>${evo.eename }</td>
         </tr>
         <tr>
          <th width=20% class="text-center">전시분야</th>
          <td width=80%>${evo.cate }</td>
         </tr>
         <tr>
          <th width=20% class="text-center">가격대</th>
          <td width=80%>${evo.price }</td>
         </tr>
        
      
       </table>
       <table class="table">
        <caption><h3>예약정보</h3></caption>
        <tr>
          <th width=20% class="text-center">예약번호</th>
          <td width=30% class="text-center">${rvo.no }</td>
          <th width=20% class="text-center">예약일</th>
          <td width=30% class="text-center">${rvo.rday }</td>
        </tr>
        <tr>
          <th width=20% class="text-center">예약시간</th>
          <td width=30% class="text-center">${rvo.rtime }</td>
          <th width=20% class="text-center">인원</th>
          <td width=30% class="text-center">${rvo.inwon }</td>
        </tr>
        <tr>
          <th width=20% class="text-center">등록일</th>
          <td colspan="3" class="text-left">${rvo.dbday }</td>
        </tr>
       </table>
</body>
</html>