<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #3498db; /* Blue header */
        }

        form {
            margin-top:150px;
            width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #3498db; /* Blue label */
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
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #3498db; /* Blue links */
        }

        a:hover {
            text-decoration: underline;
        }

        div.links {
            width: 300px;
            margin: 10px auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Log in</h1>
    <form id="login-form" action="login.do" method="post">
        <div>
            <label for="id">ID</label>
            <input type="text" id="id" name="id" />
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" />
        </div>
        <div>
            
            <label for="saveId">ID 저장</label>
            <input type="checkbox" id="saveId" name="saveId" />
        </div>
        <input type="submit" value="Login" />
    </form>
    <div class="links">
        <a href="#">ID 찾기</a>
        <a href="#">비밀번호 찾기</a>
        <a href="../member/join.do">회원가입</a>
    </div>
</body>
</html>
