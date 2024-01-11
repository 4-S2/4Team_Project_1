<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
    <style>
         #findpwd-all-cont {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 800px;
        }

        #findpwd-all-cont #findpwd-form-all {
            width: 500px;
            padding: 20px;
            border-radius: 5px;
            border: none; /* 요청대로 테두리 제거 */
        }

        #findpwd-all-cont #log {
            width: 500px;
            height: auto;
            border-radius: 5px;
            margin-right: 20px;
        }

        

        #findpwd-all-cont h2 {
            text-align: center;
            color: #2546F4;
            margin-bottom: 20px;
        }

        #findpwd-all-cont label {
            display: block;
            margin-bottom: 5px;
            color: #444;
            width: 70px;
        }

        #findpwd-all-cont input[type="text"],
        #findpwd-all-cont input[type="password"],
        #findpwd-all-cont input[type="submit"],
        #findpwd-all-cont input[type="checkbox"] {
            width: calc(100% - 16px);
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            display: inline-block;
        }


        #findpwd-all-cont input[type="submit"] {
            background-color: transparent;
            color: #3498db;
            cursor: pointer;
            border: none;
        }

        #findpwd-all-cont input[type="submit"]:hover {
            background-color: transparent;
            color: #2546F4;
        }

        #findpwd-all-cont a {
            display: inline-block;
            margin: 10px;
            text-decoration: none;
            color: #666;
            border-radius: 1px;
        }

        #findpwd-all-cont a:hover {
            text-decoration: underline;
        }

        #findpwd-all-cont div.checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        #findpwd-all-cont div.links {
            text-align: center;
        }

        #findpwd-all-cont a.log-link-1 {
            margin: 0 10px;
        }
        #findpwd-all-cont #pwd-find-submit-btn
        {
        	background-color: #2546F4;
        	color: white;
        }
    </style>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function(){
        $('#pwd-find-submit-btn').click(function(e){
            e.preventDefault(); // 기본 폼 제출을 막음
            var id = $('#id').val().trim();
            var name = $('#name').val().trim();
            var phone = $('#phone').val().trim();
            var email = $('#email').val().trim();

            if(id === "") {
                alert('아이디를 입력해 주세요.');
                $('#id').focus();
                return;
            }

            if(name === "") {
                alert('이름을 입력해 주세요.');
                $('#name').focus();
                return;
            }

            if(phone === "") {
                alert('휴대폰 번호를 입력해 주세요.');
                $('#phone').focus();
                return;
            }

            if(email === "") {
                alert('이메일을 입력해 주세요.');
                $('#email').focus();
                return;
            }

            $.ajax({
                type: 'post',
                url: '../member/passwordfindOk.do',
                data: {"id":id, "name":name, "phone":phone, "email":email},
                success: function(result) {
                    var res = result.trim();
                    if(res === 'NO') {
                        alert('입력하신 정보와 일치하는 계정이 없습니다.');
                    } else {
                        alert('입력하신 이메일로 임시 비밀번호를 발송하였습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    alert('오류가 발생했습니다: ' + error);
                }
            });
        });
    });
    </script>
</head>
<body>

    <div id="findpwd-all-cont">
       
        <form id="findpwd-form-all" action="../member/passwordfindOk.do" method="post">

            <div>
                <h2>비밀번호 찾기</h2>
                <label for="id">ID</label>
                <input type="text" id="id" name="id" />
            </div>
               <div>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" />
            </div>
            <div>
            	<label for="id">휴대폰 번호</label>
                <input type="text" id="phone" name="phone" />
            </div>
             <div>
            	<label for="email">이메일</label>
                <input type="text" id="email" name="email" />
            </div>
           
            
            
            <input type="submit" value="비밀번호 찾기" id="pwd-find-submit-btn" />
            
            <div class="links">
                <a href="../member/join.do" class="log-link-1">회원가입</a>  
                <a href="../member/find_id.do" class="log-link-1">아이디찾기</a>  
                <a href="../member/find_password.do" class="log-link-1">비밀번호찾기</a>
            </div>
            
        </form>
    </div>

</body>
</html>