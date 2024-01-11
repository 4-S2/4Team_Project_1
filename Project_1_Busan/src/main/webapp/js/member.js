/**
 * 
 */

 
$(document).ready(function() {
 
  $("#registrationForm").submit(function(event) {
   
    event.preventDefault();

  
    if (validateForm()) {
  
      submitForm();
    }
  });

  function validateForm() {
  
    var id = $("#id").val();
    if (id.trim() === "") {
      alert("아이디를 입력하세요.");
      return false;
    }

  
    return true;
  }

  function submitForm() {
   
    $.ajax({
      type: "POST",
      url: "RegisterServlet", 
      data: $("#registrationForm").serialize(), 
      success: function(response) {
       
        console.log(response);
      },
      error: function(error) {
      
        console.error(error);
      }
    });
  }
  
  
$(document).ready(function() {

  $("#password_confirmation").on("keyup", function() {
    var password = $("#password").val();
    var confirmPassword = $(this).val();

    if (password !== confirmPassword) {
      $("#passwordConfirmationMessage").text("비밀번호가 일치하지 않습니다.");
    } else {
      $("#passwordConfirmationMessage").text("");
    }
  });

 
  $("#email").on("keyup", function() {
    var email = $(this).val();
    var emailFormat = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email.match(emailFormat)) {
      $("#emailFormatMessage").text("올바른 이메일 형식입니다.").css("color", "blue");
    } else {
      $("#emailFormatMessage").text("올바른 이메일 형식이 아닙니다.").css("color", "red");
    }
  });


    window.onload = function() {
        
        var savedId = localStorage.getItem('savedId');
        if (savedId) {
            document.getElementById('id').value = savedId;
            document.getElementById('saveId').checked = true;
        }
    };

 
    function saveId() {
        if (document.getElementById('saveId').checked) {
           
            var userId = document.getElementById('id').value;
            localStorage.setItem('savedId', userId);
        } else {
          
            localStorage.removeItem('savedId');
        }
    }

   
    document.getElementById('login-submit-btn').addEventListener('click', saveId);
});

});