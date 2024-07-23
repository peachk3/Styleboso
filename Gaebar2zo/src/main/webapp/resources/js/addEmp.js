/**
 * //회원 이름 
 */
	
	$(document).ready(function() {
            function regMemberName(user_per_name) {
                var regExp = /^[가-힣]{1,10}$/;
                return regExp.test(user_per_name);
            }


            function checkName() {
                var user_name = $('#user_per_name').val();
                var nameError = $('#nameError');
                var nameSuccess = $('#nameSuccess');
                
                if (!regMemberName(user_name)) {
                    nameError.show();
                    nameSuccess.hide();
                } else {
                    nameError.hide();
                    nameSuccess.show();
                }
            }

            // 이름 필드에서 입력할 때마다 checkName 함수를 호출합니다..
            $('#user_per_name').on('input', function() {
                checkName();
            });
	 });
	
	/**
	 * 
	 *비밀번호
	 */
	
		//패스워드 유효성
			 function regMemberPassword(password){ //패스워드 //8~16자 영문,숫자,특수기호 숫자최소 1 특수기호최소 1
					var regExp= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
					return regExp.test(password);
	            }
			 
			 function validatePassword() {
		            var upwd = $('#password').val();
		            var passwordFeedback = $('#pwSuccess');
		            var passwordError = $('#pwError');

		            if (regMemberPassword(upwd)) {
		                passwordFeedback.show();
		                passwordError.hide();
		            } else {
		                passwordFeedback.hide();
		                passwordError.show();
		            }
		        }
			 
			 function validatePasswordMatch() {
		            var upwd = $('#password').val();
		            var cpwd = $('#passwordCheck').val();
		            var pwMatchSuccess = $('#pwMatchSuccess');
		            var pwMatchError = $('#pwMatchError');

		            if (upwd === cpwd && upwd !== '' && cpwd !== '') {
		                pwMatchSuccess.show();
		                pwMatchError.hide();
		            } else {
		                pwMatchSuccess.hide();
		                pwMatchError.show();
		            }
		        }
			  $(document).ready(function() {
				  $('#password, #passwordCheck').on('input', function() {
		                validatePassword();
		                validatePasswordMatch();
		            });
			  });
			  $('#registerForm').on('submit', function(event) {
	                event.preventDefault();

	                var upwd = $('#password').val();
	                var cpwd = $('#passwordCheck').val();

	                if (!regMemberPassword(upwd)) {
	                    $('#password').val('');
	                    $('#pwError').show();
	                    return;
	                }
	                if (upwd !== cpwd) {
	                    $('#passwordCheck').val('');
	                    $('#pwMatchError').show();
	                    return;
	                }

	                Swal.fire('성공', '사용자 등록 완료', 'success').then(function() {
	                    location.reload();
	                });
	            });
/**
 *  이메일 중복체크
 */	
			  function regMemberEmail(user_email) { // 이메일 형식 검사
				    var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
				    return regExp.test(user_email);
				}

				$(document).ready(function() {
				    $('#emailCheck').on('input', function() {
				        var email = $(this).val();
				        var emailError = $('#emailError');
				        var emailExists = $('#emailExists');
				        var emailAvailable = $('#emailAvailable');

				        if (!regMemberEmail(email)) {
				            emailError.show();
				            emailExists.hide();
				            emailAvailable.hide();
				            return;
				        } else {
				            emailError.hide();
				        }

				        // 이메일 중복 체크를 위한 Ajax 요청
				        $.ajax({
				            url: '/emailCheck', // 서버의 이메일 중복 체크 엔드포인트
				            type: 'POST',
				            data: { user_email: email },
				            dataType: 'json',
				            success: function(response) {
				                console.log(response); // 응답 확인을 위한 로그 추가
				                if (response.exists) {
				                    emailExists.show();
				                    emailAvailable.hide();
				                } else {
				                    emailExists.hide();
				                    emailAvailable.show();
				                }
				            },
				            error: function() {
				                // 에러 처리
				                emailError.show();
				                emailExists.hide();
				                emailAvailable.hide();
				            }
				        });
				    });
				});
	
		/*
		 * 전화번호 중복체크
		 */
				