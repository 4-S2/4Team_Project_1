<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>unregister</title>
<style type="text/css">
.mypage, .adminpage{
	padding-bottom: 100px;
}

.mypage-main {
        background-color: #FFFFFF;
        width: 100%;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
        padding:20px;
        padding-bottom: 100px;
        margin-bottom:50px;
    }

.mypage-sub {
        background-color: #FFFFFF;
        width: 100%;
        border-radius: 1.5em;
        padding:10px 10px;
    }
    
.mypage-myinfo-edit, .mypage-myinfo-submit {
      cursor: pointer;
        border-radius: 5em;
        color: #77D6C9;
        background: #fff;
        border: 1px solid #77D6C9;
        padding-left: 30px;
        padding-right: 30px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-size: 15px;
        font-weight: bold;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        display: inline-block;
        margin: 20px;
        margin: center;
        width: 150px;
}

.page-title{
        padding-bottom: 15px;
        color: #77D6C9;
        font-weight: bold;
        font-size: 25px;
        text-align: center;
}


.myinfo-main {
        background-color: #FFFFFF;
        width: 100%;
        height: 900px;
		padding-top:58px;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
.myinfo-main > tr > td {
    	text-align:left;
    }   
    
    
.myinfo>tbody>tr>td
{
	padding: 8px;
    line-height: 1.42857143;
    vertical-align: middle;
    border-top: 1px solid #ddd;
    text-align:left;
}


/* ADMINPAGE */
.span-btn{
	cursor:pointer;
	display:inline-block;
	background: #77D6C9 none repeat scroll 0 0;
    border: 0 none;
    color: #fff;
    font-size: 14px;
    font-weight: 700;
    padding: 6px 10px;
}


.delete-to-confirm-submit {
    cursor: pointer;
    border-radius: 5em;
    color: black;
    background: #fff;
    border: 1px solid #0923a9;
    padding-left: 30px;
    padding-right: 30px;
    padding-bottom: 10px;
    padding-top: 10px;
    font-size: 13px;
    font-weight: bold;
    box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    display: inline-block;
    margin: 20px;
    margin: center!important;
    width: 150px;
    text-decoration:none!important;
}  

.delete-cancel {
        cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: #0923a9;
        border: 0;
        padding:10px 30px;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        display: inline-block;
        margin: 20px;
        margin: center;
        width: 150px;
        font-weight: bold;     
    }  
    
.delete-before{
	padding:18px;
    font-weight: 500;
    text-align:center;
	font-size: large;
}

.delete-password {
    display: block;
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 5px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    text-align: center;
    margin: 0px 150px;
    font-family: 'Noto Sans KR', sans-serif;
}


.delete-main {
    background-color: #FFFFFF;
    width: 600px;
    margin: 7em auto;
    border-radius: 1.5em;
    box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

</style>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript">
$(function(){
	$('#delAccBtn').click(function(){
		let pwd = $('#pwdInput').val().trim();
		if(pwd==="")
		{
			$('#pwdInput').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'myacc_delete_ok.do',
			data:{"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res==='NO')
			    {
					alert("비밀번호가 틀립니다. 다시 확인해주세요.");
					$('#pwdInput').val("");
					$('#pwdInput').focus();
				}
				else if(res==='OK')
				{
					alert("회원 탈퇴가 완료되었습니다.");
					location.href="../main/main.do";
				}
				else if(res==='fail'){
					alert('회원 탈퇴에 실패했습니다');
					location.href="../main/main.do";
				}
			},error:function(e){
				console.log(e)
			}
			
		})
	})
})
</script>
</head>
<body>
  <div class="unregister">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">회원<strong>탈퇴</strong></h4>
   	  </div>
<div class="delete-main">
      <p class="delete-before">비밀번호 확인  </p> 
      <input class="delete-password" type="password" align="center" placeholder="" id="pwdInput">
      <div style="display:inline;margin:0px 100px;">
	      <a id="delAccBtn" class="delete-to-confirm-submit" align="center">탈퇴하기</a>
	      <span class="delete-cancel" align="center" style="text-decoration: none;"  onclick="javascript:history.back()">취소</span>
      </div>
</div>
  </div>
</body>
</html>

