<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    /* 간단한 스타일링을 위한 CSS */

/*     .container {
      margin: 50px auto;
    } */
    label {
      display: block;
      margin-bottom: 10px;
    }
    input[type="text"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
    }
    input[type="submit"] {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      border: none;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="myReserv">
    <h1>나의 예약내역</h1>
    <form action="update_profile.jsp" method="post">
      <label for="name">이름:</label>
      <input type="text" id="name" name="name" placeholder="이름을 입력하세요">

      <label for="email">이메일:</label>
      <input type="text" id="email" name="email" placeholder="이메일을 입력하세요">

      <input type="submit" value="프로필 저장">
    </form>
  </div>
</body>
</html>