/**
 * 
 */

 
$(document).ready(function() {
  // Add an event listener for the form submission
  $("#registrationForm").submit(function(event) {
    // Prevent the default form submission
    event.preventDefault();

    // Perform client-side validation
    if (validateForm()) {
      // If validation succeeds, proceed with AJAX submission
      submitForm();
    }
  });

  function validateForm() {
    // Add your validation logic here
    // Example: Check if the ID is not empty
    var id = $("#id").val();
    if (id.trim() === "") {
      alert("아이디를 입력하세요.");
      return false;
    }

    // Add more validation checks for other fields as needed

    // If all validations pass
    return true;
  }

  function submitForm() {
    // Use AJAX to submit the form data to the server
    $.ajax({
      type: "POST",
      url: "RegisterServlet", // Replace with your server-side endpoint
      data: $("#registrationForm").serialize(), // Serialize form data
      success: function(response) {
        // Handle the server response if needed
        console.log(response);
      },
      error: function(error) {
        // Handle AJAX error if needed
        console.error(error);
      }
    });
  }
  
  // validation.js

$(document).ready(function() {
  // Event listener for password confirmation field
  $("#password_confirmation").on("keyup", function() {
    var password = $("#password").val();
    var confirmPassword = $(this).val();

    if (password !== confirmPassword) {
      $("#passwordConfirmationMessage").text("비밀번호가 일치하지 않습니다.");
    } else {
      $("#passwordConfirmationMessage").text("");
    }
  });

  // Event listener for email field
  $("#email").on("keyup", function() {
    var email = $(this).val();
    var emailFormat = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email.match(emailFormat)) {
      $("#emailFormatMessage").text("올바른 이메일 형식입니다.");
    } else {
      $("#emailFormatMessage").text("올바른 이메일 형식이 아닙니다.");
    }
  });

  // Rest of your code...
});

});