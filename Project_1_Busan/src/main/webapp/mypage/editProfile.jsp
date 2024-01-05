<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보수정</title>
  <style>
    label {
      display: block;
      margin-bottom: 10px;
    }
    input[type="text"] {
      width: 100%;
      padding: 8px;
      margin-bottom: 0px;
    }
    input[type="submit"] {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      border: none;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
    #daddr {
    	max-width: 460px;
    }
    #name, #pwd, #addr, #postcode, #email{
    	max-width: 300px;
    }
    .p {
    margin-bottom: 0px; 
    font-size: 14px;
    line-height: 24px;
    }
/*     .login_form_area .form_contbox {
    vertical-align: top;
    display: inline-block;
    margin-top: 30px;
     margin-bottom: 0px; 
} */
    
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
 <script src="../js/member.js"></script>


<!-- <script>
function checkPassword() {
    var enteredPassword = prompt("비밀번호를 입력하세요:");

    // 공백 제거, 입력된 문자=>숫자 변환 (유효성 검증)
    enteredPassword = parseInt(enteredPassword.trim());

    var correctPassword = ${vo.pwd};
    alert(correctPassword);
    
    if (enteredPassword === "") {
      alert("비밀번호를 입력해주세요.");
    } else if (enteredPassword === correctPassword) {
    	
    	alert("회원 정보가 수정되었습니다.");
      	window.location.href = "http://localhost:8080/Project_1_Busan/mypage/main.do";
    } else {
      alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
    }
  }
  </script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* $('#aUpdateMember').click(function(){ */
function checkPassword() {
	let name=$('#name').val();
	let pwd=$('#pwd').val();
	let telNo1=$('#telNo1').val();
	let telNo2=$('#telNo2').val();
	let telNo3=$('#telNo3').val();
	let postcode=$('#postcode').val();
	let addr=$('#addr').val();
	let daddr=$('#daddr').val();
		if($('#name').val().trim()==="")
		{
			$('#name').focus()
			$('#updateMsg').text('이름을 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		if($('#pwd').val().trim()==="")
		{
			$('#pwd').focus()
			$('#updateMsg').text('비밀번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		if($('#telNo1').val().trim()==="")
		{
			$('#telNo1').focus()
			$('#updateMsg').text('전화번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#telNo2').val().trim()==="")
		{
			$('#telNo2').focus()
			$('#updateMsg').text('전화번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px')
			return
		}
		
		if($('#telNo3').val().trim()==="")
		{
			$('#telNo3').focus()
			$('#updateMsg').text('전화번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}

		if($('#postcode').val().trim()==="")
		{
			$('#postcode').focus()
			$('#updateMsg').text('우편번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#addr').val().trim()==="")
		{
			$('#addr').focus()
			$('#updateMsg').text('주소를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#daddr').val().trim()==="")
		{
			$('#daddr').focus()
			$('#updateMsg').text('상세주소를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
	
/* 	$.ajax({
		type:'post',
		url:"../mypage/editmyprofile.do",
		data:{
			"pwd":pwd,
			"name":name,
			"phone":telNo1+telNo2+telNo3,
			"postcode":postcode,
			"addr":addr,
			"daddr":daddr,
		},
		success:function(result)
		{
			if(result=='success'){
				alert('회원 정보가 수정되었습니다.')
				location.href="../mypage/main.do";
			}
			else if (result=='fail'){
				alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.')
			}
		}
	
	}) */
})

</script>
</head>
<body>
  <div class="editProfile">
  <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox"><strong>회원정보</strong>수정</h4>
                <p style="margin: 0px; display: none" id=updateMsg></p>
   </div>
   <div class="my_information_area">
   
       <form id="frmJoin" name="frmJoin" method="post" class="login_form_area find_id_pw join_form">
	       <p class="find_label input_ta_mt80 input_ta_mb10 first ta_inblock">이름</p>
	       		<div class="form_contbox first ta_inblock"><input type="text" id="name" name="name" data-required="true" maxlength="8" value="${vo.name }" required></div>
	       <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">아이디</p>
	       		<div class="form_contbox ta_inblock">${vo.id }</div>
	       <!-- <p class="find_label input_ta_mt80 input_ta_mb10 ta_first">비밀번호</p> -->
	       <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">비밀번호</p>
	       		<div class="form_contbox ta_inblock"><input type="text" id="pwd" name="pwd" maxlength="30" value="${vo.pwd}" required></div>
	       <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">이메일</p>
	       		<div class="form_contbox ta_inblock"><input type="text" id="email" name="email" maxlength="30" value="${vo.email}" required></div>

	       	<p class="find_label input_ta_mt30">휴대전화</p>
		       	<div class="form_contbox">
	                        <div class="clear find_birth_area phone">
	                            <div class="find_birth_box pc_mt0">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo1" name="telNo1" maxlength="4" title="휴대전화 첫번째 자리" value="${telNo1 }" required>
	                                </p>
	                            </div>
	                            <span class="phone_line pc_mt0"></span>
	                            <div class="find_birth_box pc_mt0">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo2" name="telNo2" maxlength="4" title="휴대전화 두번째 자리" value="${telNo2 }" required>
	                                </p>
	                            </div>
	                            <span class="phone_line pc_mt0"></span>
	                            <div class="find_birth_box">
	                                <p class="inputbox block h40 ta_h80 border_ee login_input pc_mt0">
	                                    <input type="text" id="telNo3" name="telNo3"data-required="true" maxlength="4" title="휴대전화 마지막 자리" value="${telNo3 }" required>
	                                </p>
	                            </div>
	                        </div>
	            </div>
	          <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">우편번호</p>
	       		<div class="form_contbox ta_inblock"><input type="text" id="postcode" name="postcode" maxlength="8" value="${vo.postcode }" required>
	       		<button type="button" id="searchZipCodeBtn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
	       		</div>
	       	  <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock">주소</p>
	       		<div class="form_contbox ta_inblock"><input type="text" id="addr" name="addr" data-required="true" maxlength="8" value="${vo.addr }" required></div>
	       	  <p class="find_label input_ta_mt80 input_ta_mb10 ta_inblock"></p>	
	       		<div class="form_contbox ta_inblock"><input type="text" id="daddr" name="daddr"  data-required="true" maxlength="8" value="${vo.detail_addr }" required></div>
			
<!-- 	      <label for="postal_code" style="display: inline">우편번호 <span class="required">*</span></label>
				  <button type="button" id="searchZipCodeBtn" style="float:right" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
				  <input type="text" class="form-control" name="postal_code" id="sample6_postcode" placeholder="우편번호를 입력하세요" readonly required>
				  
				</div>
				<div class="form-group">
				  <label for="address">주소 <span class="required">*</span></label>
				  <input type="text" class="form-control" name="address" id="sample6_address" placeholder="주소를 입력하세요" readonly required>
				</div>
				<div class="form-group">
				  <label for="detail_address">상세 주소</label>
				  <input type="text" class="form-control" name="detail_address" id="sample6_detailAddress" placeholder="상세 주소를 입력하세요">
				</div>	 -->            
   	   </form>
   	   
   	   <div class="pc_mb110 pc_mt30 ta_mt20 ta_mb180 ta_px18 button_box">
                <div class="right">
                    <button type="button" id="aUpdateMember" onclick="javacript:checkPassword()" class="ta_fl btn_button btn_myreview type4">저장<span></span></button>
                </div>
       </div>
   </div>
  </div>
</body>
</html>
