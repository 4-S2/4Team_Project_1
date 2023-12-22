<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
    <style type="text/css">
        body {
            
        }

        #login-all-cont {
            display: flex;
            align-items: center;
            justify-content: space-around;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #log {
            width: 600px;
            height: 500px;
            background-color: #fff;
            border-radius: 5px;
            margin-right: 20px;
        }

        #login-form-all {
            width: 400px;
            background-color: #fff;
            padding: 50px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        h1 {
            text-align: center;
            color: #3498db; /* Blue header */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #3498db; /* Blue label */
            width: 70px;
        }
       label#saveId{
       margin :5px;}
       #saveId{
         
         width:12px;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"],
        input[type="checkbox"] {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #3498db; /* Blue submit button */
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        a {
            display: inline;
            margin-top: 10px;
            text-decoration: none;
           
        }

        a:hover {
            text-decoration: underline;
        }

        a.log-link-1 {
            width: 300px;
            margin: 10px auto;
            text-align: center;
            background-color: #3498db; /* Blue links */
            color: white;
            border-radius: 1px;
        }

        /* 추가된 스타일 */
        div.checkbox-container {
            display: flex;
            align-items: center;
        }
        
        div.links
        {
         margin 0 auto;
        }
        
        
    </style>
</head>
<body>

    <div id="login-all-cont">
        <img src="../images/login_1.jpg" id="log">
        <form id="login-form-all" action="login.do" method="post">
            <div>
                <p>
                <p>
                <p>
                 <p>
                <h1>로그인</h1>
                <label for="id">ID</label>
                <input type="text" id="id" name="id" />
            </div>
            <div>
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" />
            </div>
            <!-- 수정된 부분 -->
            <div class="checkbox-container">
                 <input type="checkbox" id="saveId" name="saveId" />
                <label for="saveId">ID 저장</label>
               
            </div>
            <!-- 수정된 부분 종료 -->
            <input type="submit" value="Login" />
            <div class="links">
                <a href="#" class="log-link-1">ID 찾기</a>  
                <a href="#" class="log-link-1">비밀번호 찾기</a>  
                <a href="../member/join.do" class="log-link-1">회원가입</a>
            </div>
        </form>
    </div>

</body>
</html>