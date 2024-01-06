<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
    <style>
         #findID-all-cont {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 800px;
        }

        #findID-all-cont #login-form-all {
            width: 500px;
            padding: 20px;
            border-radius: 5px;
            border: none; /* 요청대로 테두리 제거 */
        }

        #findID-all-cont #log {
            width: 500px;
            height: auto;
            border-radius: 5px;
            margin-right: 20px;
        }

        

        #findID-all-cont h2 {
            text-align: center;
            color: #3498db;
            margin-bottom: 20px;
        }

        #findID-all-cont label {
            display: block;
            margin-bottom: 5px;
            color: #3498db;
            width: 70px;
        }

        #findID-all-cont input[type="text"],
        #findID-all-cont input[type="password"],
        #findID-all-cont input[type="submit"],
        #findID-all-cont input[type="checkbox"] {
            width: calc(100% - 16px);
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            display: inline-block;
        }


        #findID-all-cont input[type="submit"] {
            background-color: transparent;
            color: #3498db;
            cursor: pointer;
            border: none;
        }

        #findID-all-cont input[type="submit"]:hover {
            background-color: transparent;
            color: #2980b9;
        }

        #findID-all-cont a {
            display: inline-block;
            margin: 10px;
            text-decoration: none;
            color: #3498db;
            border-radius: 1px;
        }

        #findID-all-cont a:hover {
            text-decoration: underline;
        }

        #findID-all-cont div.checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        #findID-all-cont div.links {
            text-align: center;
        }

        #findID-all-cont a.log-link-1 {
            margin: 0 10px;
        }
        #findID-all-cont #id-find-submit-btn
        {
        	background-color: #3498db;
        	color: white;
        }
    </style>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
    $('#id-find-submit-btn').on('click', function(e) {
        e.preventDefault(); // 폼 기본 제출 이벤트 방지
        let email = $('#email').val();
        if(email.trim() == "") {
            $('#email').focus();
            return;
        }
        
        $.ajax({
            type: 'post',
            url: '../member/idfind_ok.do',
            data: {"email": email},
            success: function(result) {
                let res = result.trim();
                let newWindow = window.open("", "_blank", "width=400,height=200");
                let content = "<html><head><title>아이디 찾기 결과</title>";
                content += "<style>";
                content += "body { font-family: Arial, sans-serif; text-align: center; padding: 20px; }";
                content += "p { color: #333; font-size: 16px; }";
                content += "p span { color: #3498db; font-weight: bold; }";
                content += "</style></head><body>";
                
                if(res === 'NO') {
                    content += "<p>이메일이 존재하지 않습니다.</p>";
                } else {
                    content += "<p>회원님의 아이디는 <span>" + res + "</span> 입니다.</p>";
                }

                content += "</body></html>";
                newWindow.document.write(content);
                newWindow.document.close(); // 새 창의 문서 작성을 완료
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error(status + " : " + error);
            }
        });
    });
});
</script>
    
</head>
<body>

    <div id="findID-all-cont">
       
        <form id="login-form-all" action="../member/idfind_ok.do" method="post">

            <div>
                <h2>아이디 찾기</h2>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" />
            </div>
            <div>
            	<label for="email">이메일</label>
                <input type="text" id="email" name="email" />
            </div>
           
            
            
            <input type="submit" value="아이디 찾기" id="id-find-submit-btn" />
            
            <div class="links">
                <a href="../member/join.do" class="log-link-1">회원가입</a>  
                <a href="../member/find_id.do" class="log-link-1">아이디찾기</a>  
                <a href="../member/find_password.do" class="log-link-1">비밀번호찾기</a>
            </div>
            
        </form>
    </div>

</body>
</html>