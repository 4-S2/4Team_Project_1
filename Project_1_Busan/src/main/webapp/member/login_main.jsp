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
            height: 800px;
        }

        #login-all-cont #login-form-all {
            width: 500px;
            padding: 20px;
            border-radius: 5px;
            border: none; /* 요청대로 테두리 제거 */
        }

        #login-all-cont #log {
            width: 500px;
            height: auto;
            border-radius: 5px;
            margin-right: 20px;
        }

        

        #login-all-cont h2 {
            text-align: center;
            color: #3498db;
            margin-bottom: 20px;
        }

        #login-all-cont label {
            display: block;
            margin-bottom: 5px;
            color: #3498db;
            width: 70px;
        }

        #login-all-cont input[type="text"],
        #login-all-cont input[type="password"],
        #login-all-cont input[type="submit"],
        #login-all-cont input[type="checkbox"] {
            width: calc(100% - 16px);
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            display: inline-block;
        }

        #login-all-cont input[type="checkbox"] {
            width: auto; /* Auto width for checkbox */
            margin-right: 5px; /* Add some space to the right of the checkbox */
        }

        #login-all-cont input[type="submit"] {
            background-color: transparent;
            color: #3498db;
            cursor: pointer;
            border: none;
        }

        #login-all-cont input[type="submit"]:hover {
            background-color: transparent;
            color: #2980b9;
        }

        #login-all-cont a {
            display: inline-block;
            margin: 10px;
            text-decoration: none;
            color: #3498db;
            border-radius: 1px;
        }

        #login-all-cont a:hover {
            text-decoration: underline;
        }

        #login-all-cont div.checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        #login-all-cont div.links {
            text-align: center;
        }

        #login-all-cont a.log-link-1 {
            margin: 0 10px;
        }
        #login-all-cont #login-submit-btn
        {
        	background-color: #3498db;
        	color: white;
        }
    </style>
  <script type="text/javascript">
    $(document).ready(function() {
        // 로그인 폼 제출 이벤트 처리
        $("#login-form-all").submit(function(event) {
            // 기본 동작 방지
            event.preventDefault();

            // AJAX를 사용하여 로그인 요청 전송
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: function(response) {
                    // 서버로부터의 응답 처리
                    if (response === "Login Failed") {
                        // 로그인 실패 시 알림 표시
                        alert("로그인 정보가 일치하지 않습니다.");
                    } else {
                        // 로그인 성공 시 처리
                    	window.location.href = "../main/main.do";
                    }
                },
                error: function() {
                    // 네트워크 오류 등 기타 오류 처리
                }
            });
        });
    });
</script>
  
    
    
</head>
<body>

    <div id="login-all-cont">
       
        <form id="login-form-all" action="../member/login_ok.do" method="post">

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
                <a href="../member/join.do" class="log-link-1">회원가입</a>  
                <a href="../member/find_id.do" class="log-link-1">아이디찾기</a>  
                <a href="../member/find_password.do" class="log-link-1">비밀번호찾기</a>
            </div>
            
        </form>
    </div>

</body>
</html>