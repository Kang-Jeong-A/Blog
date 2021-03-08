$(function() {
           $("form[name='login']").validate({
             rules: {
               
               account: {
                 required: true
               },
               password: {
                 required: true
               }
             },
              messages: {
               account:{
            	  required: "아이디를 입력해주세요.",
               },
               password: {
                 required: "비밀번호를 입력해주세요.",
               }
               
             },
             submitHandler: function(form) {
               form.submit();
             }
           });
         });
         


$(function() {
  
  $("form[name='registration']").validate({
    rules: {
      account:{
    	required: true,
    	minlength: 5,
    	idCheck: true,
    	blankCheck: true
      },
      name: {
    	  required: true,
    	  minlength: 2
      },
      email: {
        required: true,
        email: true
      },
      password: {
        required: true,
        minlength: 6,
        pwCheck: true,
        blankCheck: true
      },
      password2: {
          required: true,
          minlength: 6,
          equalTo: "#password"
        }
    },
    
    messages: {
      account: {
    	  required: "아이디를 입력해주세요.",
    	  minlength: "아이디는 5자~10자로 입력해주세요.",
    	  idCheck: "영어, 숫자, 특수문자(_)만 입력가능합니다.",
    	  blankCheck: "공백없이 입력해주세요."
    	},
      name: {
    	  required: "닉네임을 입력해주세요.",
    	  minlength: "닉네임은 2자~10자로 입력해주세요.",
    	  blankCheck: "공백없이 입력해주세요."
      },
      password: {
        required: "비밀번호를 입력해주세요.",
        minlength: "비밀번호는 6자~15자로 입력해주세요.",
        pwCheck: "영어, 숫자, 특수문자 포함 6자~15자로 입력해주세요.",
        blankCheck: "공백없이 입력해주세요."
      },
      password2: {
          required: "비밀번호를 입력해주세요.",
          minlength: "비밀번호는 6자~15자로 입력해주세요.",
          equalTo: "비밀번호가 일치하지 않습니다." 
        },
      email: {
    	  required: "이메일을 입력해주세요.",
    	  email: "유효한 이메일 형식이 아닙니다."
      }
    },
  
    submitHandler: function(form) {
      form.submit();
    }
  });
});

//아이디 체크
$.validator.addMethod("idCheck", function(value, element){
	return this.optional(element) || /^[a-zA-Z0-9_\s]+$/.test(value);
});

//비밀번호 체크
$.validator.addMethod("pwCheck", function(value, element){
	return this.optional(element) || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
});

//공백체크
$.validator.addMethod("blankCheck", function(value, element){
	return this.optional(element) || /^.*\s.*$/.test(value)?false:true;
});