<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
   <style>
    
    body {
      font-family: sans-serif;
      background-color: #f0f0f0; /* Light gray background */
    }

    label {
      display: inline;
    }

    .container {
      width: 500px;
      margin: 0 auto;
      padding: 20px;
      background-color: #ffffff; /* White container background */
      border: 1px solid #ddd; /* Light gray border */
      border-radius: 8px; /* Rounded corners */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow for depth */
    }

    .title {
      font-size: 24px;
      text-align: center;
      color: #3498db; /* Blue title color */
    }

    .form-group {
      margin-bottom: 10px;
    }

    .form-control {
      width: 100%;
      padding: 10px;
      border: 1px solid #3498db; /* Blue border */
      border-radius: 5px;
    }

    .required {
      color: red;
    }

    .join-button, .btn1 {
      width: 100px;
      height: 40px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #fff; /* White text color */
    }

    .join-button {
      background-color: #3498db; /* Blue button background */
    }

    .btn1 {
      background-color: #000; /* Black button background */
    }

  </style>
   <script>
        function goBack() {
            window.location.href = document.referrer;
        }
    </script>
</head>
  <body>
    <div class="container">
        <h2 class="title">회원가입</h2>
        <form action="RegisterServlet" method="post"> <!-- Assuming you have a servlet named RegisterServlet to handle the form submission -->
            <div class="form-group">
                <label for="id">아이디</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요" required>
                
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                 <span class="required">*</span>
                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요" required>
               
            </div>
            <div class="form-group">
                <label for="password_confirmation">비밀번호 확인</label>
                <span class="required">*</span>
                <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" placeholder="비밀번호를 다시 입력하세요" required>
                
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요">
            </div>
            <div class="form-group">
                <label for="mobile">휴대폰 번호</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="mobile" id="mobile" placeholder="휴대폰 번호를 입력하세요">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <span class="required">*</span>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요">
            </div>
           
            <div class="form-group">
                <label for="address">주소</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="address" id="address" placeholder="주소를 입력하세요">
            </div>
            <div class="form-group">
                <label for="detail_address">상세 주소</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="address" id="address" placeholder="주소를 입력하세요">
            </div>
            <div class="form-group">
                <label for="postal_code">우편번호</label>
                <span class="required">*</span>
                <input type="text" class="form-control" name="postal_code" id="postal_code" placeholder="우편번호를 입력하세요">
            </div>
          
             
            <button type="submit" class="btn">회원가입</button>
            
            <button type="button" class="btn" onclick="goBack()">돌아가기</button>
             
        </form>
    </div>
</body>
</html>
