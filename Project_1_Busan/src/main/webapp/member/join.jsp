<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <%-- Assume that you have a CSS file included here --%>
  <link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	  players: ['iframe']
	});
$(function(){
	/*$('#joinBtn').on('click',function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			alert("아이디 체크를 하세요!!");
			$('#id').focus();
			return;
		}
	})*/
	
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			title:'아이디 중복체크',
			width:350,
			height:200
		})
	});
	
	
})
	

</script>
  <style>
    <%-- Define your arbitrary delimiter --%>
    <% String delimiter = "%{"; %>

    .signup-container {
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh; /* Ensure full viewport height */
      margin-top: 50px; /* Add margin to create space below the header */
      position: relative; /* Make the container position relative */
      z-index: 1; /* Ensure it's above other elements */
    }

    .container {
      width: 640px;
      padding: 40px 20px;
      background-color: #ffffff; /* White container background */
      border: 1px solid #eee; /* Light gray border */
      border-radius: 8px; /* Rounded corners */
      /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow for depth */
      z-index: 2; /* Ensure it's above other elements, including the header */ */
    }

    .title {
      font-size: 24px;
      text-align: center;
      color: #2546F4; /* Blue title color */
      margin-bottom: 10px; /* Reduced margin */
    }

    .form-group {
      margin-bottom: 15px; /* Reduced margin */
    }

    .form-control {
      width: 100%;
      padding: 10px;
      border: 1px solid #007bff; /* Blue border */
      border-radius: 5px;
    }
	label{
		display: inline-block;
		margin-bottom: 5px;
	}

    .required {
      color: red;
    }
	
	.input-wrapper{
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 5px;
	}

    .btn-info {
      /* width: 100%; */
      height: 34px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      color: #fff; /* White text color */
      background-color: #007bff; /* Blue button background */
      /* margin-top: 10px; */
      white-space: nowrap;
    }

	.btn-wrapper{
		display: flex;
		width: 100%;
		justify-content: space-between;
		align-items: center;
		gap: 5px;
	}
	.btn-wrapper .btn{
		width : 100%;
		height: 42px;	
	}
	
    .btn-secondary {
      background-color: #6c757d; /* Secondary button background */
    }
  </style>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {    
                var addr = ''; 
                var extraAddr = '';
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                   
                    if(data.bname !== '' && /[dong|ro|ga]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    if(extraAddr !== ''){
                        extraAddr = '(' + extraAddr + ')';
                    }
                    
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
              
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
        $(document).ready(function() {
          
            $("#searchZipCodeBtn").click(function() {
              
              sample6_execDaumPostcode();
            });
          });
    }  
</script> 
<script type="text/javascript">
var postalCode = data.zonecode;
var address = addr;
var detailAddress = document.getElementById("sample6_detailAddress").value;

// Store data in session
sessionStorage.setItem("postalCode", postalCode);
sessionStorage.setItem("address", address);
sessionStorage.setItem("detailAddress", detailAddress);
</script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="../js/member.js"></script>
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
  
</head>
<body>
  <div class="signup-container">
    <div class="container">
      <h2 class="title">회원가입</h2>
      <form method="post" action="../member/join_ok.do" name="frm">
        <!-- Your form groups here -->
        <div class="form-group">
        
     
          <label for="id">아이디 <span class="required">*</span></label>
          <span class="input-wrapper">
	          <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요" required readonly>
	          <input type="button" value="중복체크" style="float: right"
	         class="btn-sm btn-info" id="checkBtn">
          </span>
        </div>
        <div class="form-group">
          <label for="password">비밀번호 <span class="required">*</span></label>
          <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요" required>
        </div>
        <div class="form-group">
          <label for="password_confirmation">비밀번호 확인 <span class="required">*</span></label>
          <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" placeholder="비밀번호를 다시 입력하세요" required>
          <div id="passwordConfirmationMessage" style="color: red;"></div>
        </div>
        <div class="form-group">
          <label for="email">이메일 <span class="required">*</span></label>
          <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요" required>
          <div id="emailFormatMessage"></div>
        </div>
        <div class="form-group">
          <label for="name">이름 <span class="required">*</span></label>
          <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요" required>
        </div>
        <div class="form-group">
          <label for="mobile">휴대폰 번호 <span class="required">*</span></label>
          <input type="text" class="form-control" name="phone" id="phone" placeholder="휴대폰 번호를 입력하세요" required>
        </div>
        <div class="form-group">
  <label for="postal_code">우편번호 <span class="required">*</span></label>
  <span class="input-wrapper">
	  <input type="text" class="form-control" name="postal_code" id="sample6_postcode" placeholder="우편번호를 입력하세요" readonly required>
	  <button type="button" id="searchZipCodeBtn" class="btn-sm btn-info" style="float:right" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
  </span>
  
</div>
<div class="form-group">
  <label for="address">주소 <span class="required">*</span></label>
  <input type="text" class="form-control" name="address" id="sample6_address" placeholder="주소를 입력하세요" readonly required>
</div>
<div class="form-group">
  <label for="detail_address">상세 주소</label>
  <input type="text" class="form-control" name="detail_address" id="sample6_detailAddress" placeholder="상세 주소를 입력하세요">
</div>
<div class="form-group">
  <label for="extra_address">참고항목</label>
  <input type="text" class="form-control" name="extra_address" id="sample6_extraAddress" readonly>
</div>
	<div class="btn-wrapper">
      <input type="submit" value="회원가입" class="btn" id="joinBtn" style="background-color: #2546F4; color: #fff">
        <input type=button value="취소" class="btn" onclick="javascript:history.back()" style="background-color: #ccc">
    </div>
     
      </form>
    </div>
  </div>
</body>
</html>