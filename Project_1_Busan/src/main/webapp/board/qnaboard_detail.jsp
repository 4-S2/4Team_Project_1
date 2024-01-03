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
.table_content #delete{
    border: 1px solid #337ab7;
    display: inline-block;
    border-radius: 25px;
    padding: 5px 18px;
    margin: 0px auto;
    margin-bottom: 10px;
    color: #337ab7;
    width: 80px;
    text-align: center;
    background-color: white;

}
#delBtn{
    border: 1px solid #337ab7;
    display: inline-block;
    border-radius: 25px;
    padding: 5px 18px;
    margin: 0px auto;
    color: #337ab7;
    width: 80px;
    text-align: center;
    background-color: white;
}
.table_content .text-left{
    border-bottom-style: none;
}
.table_content #delete:hover {
	background-color: #2b75d5;
    color: white;
	text-decoration: none;
}
.table_content #delBtn:hover {
	background-color: #2b75d5;
    color: white;
	text-decoration: none;
}
.table_content #delBtn:focus {
	background-color: #2b75d5;
    color: white;
	text-decoration: none;
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

input::placeholder {
    color: gray;
    text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=false;
$(function(){
	$('#delete').click(function(){
		if(bCheck===false)
		{
			bCheck=true;
			$('#delete_area').show();
			$('#del').focus();
			$('#delete').val('취소');
			
		}
		else{
			bCheck=false;
			$('#delete_area').hide();
			$('#delete').val('삭제');
			
		}
	});
	$('#delBtn').click(function(){
		let qno=$('#delBtn').attr("data-no");
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../board/qnaboard_delete.do',
			data:{"qno":qno,"pwd":pwd},
			success:function(result)
			{
				if(result=="yes")
				{
					location.href="../board/qnaboard.do";
				}
				else{
					alert("비밀번호가 틀립니다");
					$('#pwd').val("")
					$('#pwd').focus();
				}
			}
		});
		
	})
});
</script>
</head>
<body>
	<div class="container" id="notice">
		<div class="row">
			<h1 class="text-center">Q&A 게시판</h1>
			
            <table class="table_content" width=800>
               <tr>
                  <th width=20%>번호</th>
                  <td width=30%>${vo.qno }</td>
                  <th width=20%>작성일</th>
                  <td width=30%>${vo.dbday }</td>
               </tr>
               <tr>
                  <th width=20%>작성자</th>
                  <td width=30%>${vo.name }</td>
                  <th width=20%>조회수</th>
                  <td width=30%>${vo.hit }</td>
               </tr>
               
               <tr>
                 <th width=20%>제목</th>
                 <td colspan=3>${vo.subject}</td>
               </tr>

               <tr>
                  <td colspan="4" class="text-left" valign="top" height="200" id="cont"><pre
                        style="white-space: pre-wrap;">${vo.cont }</pre></td>
               </tr>

               <tr>
                  <td colspan="4" class="text-right">
                  <c:if test="${vo.name!='관리자'}">
                  <a href="../board/qnaboard_update.do?qno=${vo.qno }">수정</a> 
                  &nbsp; <input type="button" id="delete" value="삭제">  
                  </c:if>
                  &nbsp; <a href="../board/qnaboard.do">목록</a>&nbsp;</td>
               </tr>
               <tr id="delete_area" style="display:none">
                  <td colspan="4" class="text-right">
                  &nbsp;<input type="password" id="pwd" style="height: 25px" class="text-right" placeholder="비밀번호 입력">  
                  &nbsp; <input type="button" id="delBtn" value="삭제" data-no="${vo.qno }">&nbsp;
                  </td>
               </tr>
               
            </table>

		</div>
	</div>
</body>
</html>