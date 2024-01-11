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
	border: 1px solid #2546F4;
	display: inline-block;
	border-radius: 25px;
	padding: 5px 18px;
	margin: 0px auto;
	margin-bottom: 10px;
	color: #2546F4;
	width: 80px;
	text-align: center;
}

.table_content .text-left {
	border-bottom-style: none;
}

.table_content a:hover {
	background-color: #2546F4;
	color: white;
	text-decoration: none;
}

.table_content a:focus {
	background-color: #2546F4;
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
	height: 540px;
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
	background-color: #2546F4;
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

#notice .input-sm{
    border-radius: revert-layer;
    font-size: 14px;
    
}
#notice .btn-group-sm>.btn, .btn-sm{
    font-size: 14px;
    border-radius: 50px;
    width: 70px;
}
.btn-primary{
    background-color: #2546F4;
    border-color: black;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active{
   background-color: #2546F4 !important;
   border-color: black !important;
}
</style>
</head>
<body>
	<div class="container" id="notice">
		<div class="row">
			<h1 class="text-center">공지&nbsp;수정</h1>
			<form method="post" action="../board/notice_update_ok.do">
			<table class="table_content" width=800>

				<tr>
					<th width=15% class="text-center">제목</th>
					<td width="85%"><input type=text name=ntitle size=55
						class="input-sm" value="${vo.ntitle }"></td>
					<input type="hidden" name=nno value="${vo.nno }">
				</tr>

				<tr>
					<th width=15% class="text-center">내용</th>
					<td width="85%"><textarea rows="20" style="width:100%;height:100%" 
							name=ncont>${vo.ncont }</textarea></td>
				</tr>

				<!-- <tr>
					<th width=15% class="text-center">비밀번호</th>
					<td width="85%"><input type=password name=pwd size=10
						class="input-sm" required></td>
				</tr> -->

				<tr>
					<td colspan="2" class="text-right"><input type=submit
						value="수정" class="btn-primary btn-sm"> <input type=button
						value="취소" class="btn-primary btn-sm"
						onclick="javacript:history.back()"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>