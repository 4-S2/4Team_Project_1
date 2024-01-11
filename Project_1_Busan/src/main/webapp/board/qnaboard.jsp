<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#notice .container {
	margin-top: 50px;
	margin: 0px auto;
}

#notice .row {
	margin: 0px auto;
	margin-top: 100px;
	position: relative;
	min-height: 700px;
}

#notice a {
	text-decoration: none;
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
#noticesearch{
    position: absolute;
    right: 0%;
    top: 190px;
}

#searchBtn{
    margin-left: 5px;
    height: 30px;
    width: 50px;
    border-radius: 50px;
    background-color: #2546F4;
	color: white;
}

#noticesearch #searchbar{
    height: 30px;
    width: 250px;
}

#insert{
    position: absolute;
    left: 0%;
    top: 190px;
}
#insert button{
    height: 30px;
    width: 90px;
    background-color: #0923a9;
	color: white;
	border-radius: 50px;
}
a.btn{
    height: 30px;
    width: 60px;
    background-color: #0923a9;
    color: white;
    border-radius: 50px;
    text-align: center;
    font-size: 13px;
    margin: 0px 10px;
}
a.btn:hover{
   color: white; 
}
.page{
    margin: 100px 0px;
    
}
</style>
</head>
<body>
	<div class="container" id="notice">
		<div class="row">
			<h1 class="text-center">Q&A 게시판</h1>
			<div id="insert">
			    <button onclick="location.href='../board/qnaboard_insert.do'">작성하기</button>
			</div>
			<div id="noticesearch">
			  <form method="post" action="../board/qnaboard_find.do">
			    <input type="text" id="searchbar" name="word" required>
			    <input type="submit" id="searchBtn" value="검색">
			  </form>
			</div>
			<table class="table">
				<tr>
					<th width=10% class="text-center">번호</th>
					<th width=55% class="text-center">제목</th>
					<th width=10% class="text-center">작성자</th>
					<th width=15% class="text-center">작성일</th>
					<th width=10% class="text-center">조회수</th>
				</tr>

				<c:forEach var="vo" items="${list}" varStatus="s">
					<tr>
						<td width=10% class="text-center">${count-(s.index)}</td>
						<td width=55%>
						<a href="../board/qnaboard_detail.do?qno=${vo.qno}">
						<c:if test="${vo.group_step>0 }"><img src="../images/re_icon.png"></c:if>
						${vo.subject}</a></td>
						<td width=10% class="text-center">${vo.name}</td>
						<td width=15% class="text-center">${vo.dbday}</td>
						<td width=10% class="text-center">${vo.hit}</td>
					</tr>
				</c:forEach>
			</table>

			<div class="text-center page">
			<tr>
             <td colspan="5" class="text-center">
              <a href="qnaboard.do?page=${(curpage-1)>1?curpage-1:startPage }" class="btn">이전</a>
              ${curpage } page / ${totalpage } pages
              <a href="qnaboard.do?page=${(curpage+1)<endPage?curpage+1:endPage }" class="btn">다음</a>
             </td>
            </tr>
				<%-- <ul class="pagination">
					
                            <!ENTITY lt "<">
                            <!ENTITY gt ">">
                            => &lt;
                       
					<c:if test="${startPage>1}">
						<li><a href="qnaboard.do?page=${startPage-1}">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li ${curpage==i?"class=active":""}><a
							href="qnaboard.do?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${endPage<totalpage}">
						<li><a href="qnaboard.do?page=${endPage+1}">&gt;</a></li>
					</c:if>
				</ul> --%>
			</div>
		</div>
	</div>
</body>
</html>