<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
#notice .container{
   margin-top :50px;
   margin: 0px auto;
}
#notice .row{
   margin: 0px auto;
   margin-top :100px;
}
#notice a{
    color: black;
    text-decoration: none;
}
.table th {
    background-color: #eee;
}
.table{
    margin-top :100px;
}
</style>
</head>
<body>
   <div class="container" id="notice">
     <div class="row">
       <h1 class="text-center">공지사항</h1>
       <table class="table">
         <tr>
            <a href="notice_insert.do">새글</a>
         </tr>
        
         <tr>
         <th width=10% class="text-center">번호</th>
         <th width=70% class="text-center">제목</th>
         <th width=30% class="text-center">작성일</th>
       </tr>
       
       <c:forEach var="vo" items="${list}">
       <tr>
         <td width=10% class="text-center">${vo.nno}</td>
         <td width=40%><a href="notice_detail.do?no=${vo.nno}">${vo.ntitle}</a></td>
         <td width=20% class="text-center">${vo.dbday}</td>
       </tr>
       </c:forEach>
       </table>
     </div>
   </div>
</body>
</html>