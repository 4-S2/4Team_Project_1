<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
         #login-all-cont {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 130vh;
        }

        #log {
            width: 500px;
            height: auto;
            border-radius: 5px;
            margin-right: 20px;
        }

        #login-form-all {
            width: 300px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        h2 {
            text-align: center;
            color: #3498db;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #3498db;
            width: 70px;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"],
        input[type="checkbox"] {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            display: inline-block;
        }

        input[type="checkbox"] {
            width: auto; /* Auto width for checkbox */
            margin-right: 5px; /* Add some space to the right of the checkbox */
        }

        input[type="submit"] {
            background-color: transparent;
            color: #3498db;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: transparent;
            color: #2980b9;
        }

        a {
            display: inline-block;
            margin: 10px;
            text-decoration: none;
            color: #3498db;
            border-radius: 1px;
        }

        a:hover {
            text-decoration: underline;
        }

        div.checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        div.links {
            text-align: center;
        }

        a.log-link-1 {
            margin: 0 10px;
        }
        #login-submit-btn
        {
        	background-color: #3498db;
        	color: white;
        }
    </style>
</head>
<body>

    <div id="login-all-cont">
       
        <form id="login-form-all" action="login.do" method="post">
            <div>
                <h2>로그인</h2>
                <label for="id">ID</label>
                <input type="text" id="id" name="id" />
            </div>
            <div>
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" />
            </div>
           
            <div class="checkbox-container">
                <input type="checkbox" id="saveId" name="saveId" />
                <label for="saveId">ID 저장</label>
            </div>
            
            <input type="submit" value="로그인" id="login-submit-btn" />
            
            <div class="links">
                <a href="#" class="log-link-1">회원가입</a>  
                <a href="#" class="log-link-1">아이디찾기</a>  
                <a href="#" class="log-link-1">비밀번호찾기</a>
            </div>
            
        </form>
    </div>

</body>
</html>
