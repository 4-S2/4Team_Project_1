<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
    .container {
        margin-top: 20px;
        width: 300px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border: 1px solid #ddd;
        background-color: #fff;
    }

    .row {
        margin: 0px auto;
        padding: 20px;
    }

    table {
        width: 100%;
    }

    input[type="text"], input[type="button"] {
        width: calc(100% - 16px);
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    input[type="button"] {
        background-color: #3498db;
        color: white;
        border: none;
        cursor: pointer;
        padding: 4px 8px; /* Smaller padding for smaller button */
        font-size: 12px; /* Smaller font size */
    }

    input[type="button"]:hover {
        background-color: #2980b9;
    }

    #result {
        color: #3498db;
        font-size: 14px;
    }

    .btn-sm {
        padding: 3px 6px; /* Even smaller padding for smaller button */
        font-size: 10px; /* Smaller font size for 'btn-sm' class */
    }

    .table {
        margin-bottom: 0;
    }

    .text-center {
        text-align: center;
    }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $('#pwdCheckBtn').click(function(){
        let password = $('#password').val();
        if(password.trim() === "") {
            $('#password').focus();
            return;
        }
        
        // 서버로 전송 
        $.ajax({
            type: 'post',
            url: '../member/pwdcheck_ok.do',
            data: {"password": password},
            success: function(result) {
                let isValid = result.trim() === 'true';
                if(isValid) {
                    $('#result').html('<font color="blue">비밀번호가 올바릅니다.</font>');
                    $('#okBtn').show();
                } else {
                    $('#result').html('<font color="red">비밀번호가 일치하지 않습니다.</font>');
                    $('#password').val("");
                    $('#password').focus();
                }
            }
        });
    });

    $('#okBtn').click(function(){
        parent.frm.password.value = $('#password').val();
        parent.Shadowbox.close();
    });
});
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <table class="table">
     <tr>
       <td>입력:<input type="password" size=15 class="input-sm" id="password">
         <input type="button" value="비밀번호 확인" 
          class="btn btn-sm btn-success" id="pwdCheckBtn">
       </td>
     </tr>
     <tr>
       <td><span id="result"></span></td>
     </tr>
     <tr>
       <td class="text-center"><input type="button" class="btn btn-sm btn-danger" value="확인" style="display:none" id="okBtn"></td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>