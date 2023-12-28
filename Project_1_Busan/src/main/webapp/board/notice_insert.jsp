<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../jsp/table.css">
</head>
<body>
<center>
    <h1>자유게시판</h1>
    <form method="post" action="insert_ok.do">
    <table class="table_content" width=800>
      <tr>
       <th width=20%>이름</th>
       <td width=80%>
        <input type=text name=name size=45 required>
       </td>
      </tr>
      
      <tr>
       <th width=20%>제목</th>
       <td width=80%>
        <input type=text name=subject size=45 required>
       </td>
      </tr>
      
      <tr>
       <th width=20%>내용</th>
       <td width=80%>
        <textarea row="10" cols="50" name=content size=45 required></textarea>
       </td>
      </tr>
      
      <tr>
       <th width=20%>비밀번호</th>
       <td width=80%>
        <input type=password name=pwd size=10 required>
       </td>
      </tr>
      
      <tr>
       <td colspan="2" class="text-center">
        <button>글쓰기</button>
        
        <input type="button" value="취소" onclick="javascript:history.back()">
       </td>
      </tr>
    </table>
    </form>
</center>
</body>
</html>