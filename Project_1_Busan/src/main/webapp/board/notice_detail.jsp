<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table_content a {
	border: 1px solid #337ab7;
	display: inline-block;
	border-radius: 25px;
	padding: 5px 18px;
	margin: 0px auto;
	margin-bottom: 10px;
	color: #337ab7;
	width: 80px;
	text-align: center;
}
.table_content .text-left{
    border-bottom-style: none;
}
.table_content a:hover {
	background-color: #2b75d5;
    color: white;
	text-decoration: none;
}

.table_content a:focus {
	background-color: #2b75d5;
    color: white;
	text-decoration: none;
}

div.container {
	margin-bottom: 130px;
}

#notice .container {
	margin-top: 50px;
	margin: 0px auto;
}

#notice .row {
	margin: 0px auto;
	margin-top: 100px;
	position: relative;
}



.table th {
	background-color: #eee;
}

.table {
	margin-top: 150px;
}

#notice h1 {
	margin-top: 40px;
}

#notice .pagination {
	margin-bottom: 70px;
}

#noticesearch {
	position: absolute;
	right: 0%;
	top: 22%;
}

#noticesearch button {
	margin-left: 5px;
	height: 30px;
	width: 50px;
	border-radius: 50px;
	font-weight: bold;
}

#noticesearch #searchbar {
	height: 30px;
	width: 250px;
}

#insert {
	position: absolute;
	left: 0%;
	top: 22%;
}

#insert button {
	height: 30px;
	width: 50px;
	font-weight: bold;
}

.table_content {
	width: 100%;
	margin-top: 110px;
}

.table_content {
	border-collapse: collapse;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	border-top-color: #333;
	border-bottom-color: #333;
}

.table_content th, td {
	margin: 0px;
	padding: 10px;
}

.table_content th {
	background-color: #337ab7;
	color: #fff;
	border-bottom-width: 1px;
	border-bottom-color: #333;
}

.table_content td {
	border-bottom-width: 1px;
	border-bottom-color: #666;
	border-bottom-style: dotted;
}

.table_content .dataTr:HOVER {
	background-color: #FC6;
	cursor: pointer;
	cursor: hand;
}

.table_content .tdleft {
	text-align: left;
}

.table_content .tdcenter {
	text-align: center;
}

.text-center {
	text-align: center;
}
/* #notice a {
	color: black;
	text-decoration: none;
}
.table_content a {
	text-decoration: none;
	color: black;
} 
.table_content a.post {
	text-decoration: none;
	color: #fff;
}

.table_content a:HOVER {
	text-decoration: underline;
	color: green;
}


*/


/* a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: green;
	text-decoration: underline;
} */

.text-center {
	text-align: center;
}

center {
	margin-top: 150px;
	margin-bottom: 100px;
	height: 600px;
}

#cont {
	height: 400px;
}

#cont>pre {
	height: 100%;
	font-size: 16px;
	background-color: #fcfcfc;
}

h4 {
	font-size: 45px;
	margin-bottom: 30px;
}

</style>
</head>
<body>
	<div class="container" id="notice">
		<div class="row">
			<h1 class="text-center">공지사항</h1>
			
            <table class="table_content" width=800>
               <tr>
                  <th width=20%>번호</th>
                  <td width=30% class="text-center">${vo.nno }</td>
                  <th width=20%>작성일</th>
                  <td width=30% class="text-center">${vo.dbday }</td>
               </tr>
               
               <tr>
                 <th width=20%>제목</th>
                 <td colspan=3>${vo.ntitle}</td>
               </tr>

               <tr>
                  <td colspan="4" class="text-left" valign="top" height="200" id="cont"><pre
                        style="white-space: pre-wrap;">${vo.ncont }</pre></td>
               </tr>

               <tr>
                  <td colspan="4" class="text-right">
                  <c:if test="${sessionScope.admin=='y'}">
                  <a href="../board/notice_delete.do?nno=${nno }">삭제</a>
                  &nbsp; <a href="../board/notice_update.do?nno=${nno }">수정</a>
                  </c:if>
                  &nbsp; <a href="../board/notice.do">목록</a>&nbsp;</td>
               </tr>

            </table>

		</div>
	</div>
</body>
</html>