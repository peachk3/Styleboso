/**
 * 시스템 등록 - 등록, 수정,삭제
 */
	function showRegisterModal() {
    $('#registerModal').modal('show');
    
}
	// CSRF 토큰을 가져오는 부분 
	const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");
    const name = $("#userName").val();

   	//==============유효성 검사===============
	//회원 이름 
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
				            url: '/system/emailCheck', // 서버의 이메일 중복 체크 엔드포인트
				            type: 'GET',
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
				   // 전화번호 필드에서 입력할 때마다 validateAndCheckPhone 함수를 호출
			    $('#inputTel').on('input', function() {
			        validateAndCheckPhone();
			    });

			    function validateAndCheckPhone() {
			        var phoneInput = document.getElementById('inputTel').value;
			        var telError = document.getElementById('telError');
			        var telSuccess = document.getElementById('telSuccess');
			        var telExists = document.getElementById('telExists');

			        // 전화번호 유효성 검사 정규식
			        var phoneRegex = /^010-\d{4}-\d{4}$/;

			        if (!phoneRegex.test(phoneInput)) {
			            telError.style.display = 'block';
			            telSuccess.style.display = 'none';
			            telExists.style.display = 'none';
			        } else {
			            telError.style.display = 'none';
			            // 유효한 전화번호인 경우 중복 체크 수행
			            checkPhoneDuplicate(phoneInput);
			        }
			    }

			    function checkPhoneDuplicate(phoneNumber) {
			        $.ajax({
			            url: '/checkPhone', // 서버의 중복 체크 API 엔드포인트
			            method: 'GET',
			            data: { user_phone: phoneNumber },
			            success: function(response) {
			                var telExists = document.getElementById('telExists');
			                var telSuccess = document.getElementById('telSuccess');

			                if (response === 1) { // 서버에서 중복된 전화번호로 응답한 경우
			                    telExists.style.display = 'block';
			                    telSuccess.style.display = 'none';
			                } else {
			                    telExists.style.display = 'none';
			                    telSuccess.style.display = 'block';
			                }
			            },
			            error: function() {
			                alert('전화번호 중복 체크 중 오류가 발생했습니다.');
			            }
			        });
			    }
	//==============유효성 검사 끝===============		
				
	//==============사원등록=================	
	//==============사원등록 끝=================	
				
				
				
				
	//==============사원수정=================			
   //==============사원수정 끝=================		
				
	//==============사원삭제 끝=================			
   //==============사원삭제=================			
				
				
	// '전체 선택' 체크박스가 클릭될 때 호출되는 함수
	function checkAll(source) {
		const checkboxes = document.querySelectorAll('.item-checkbox'); // 모든 체크박스 요소를 선택
		for (var i = 0; i < checkboxes.length; i++) { // 선택된 모든 체크박스를 반복
			checkboxes[i].checked = source.checked; // '전체 선택' 체크박스의 상태에 따라 개별 체크박스의 체크 상태를 변경
		}
	}
	
	//모달 닫기
	$('#modalCloseBtn').on('click', function() {
	    $('#registerModal').modal('hide');
	    $('#registerModal form')[0].reset(); // 폼 초기화
	    
	    // span 태그 초기화
	    $('#registerModal span.text-danger').hide(); // 에러 메시지 숨기기
	    $('#registerModal span.text-success').hide(); // 성공 메시지 숨기기
	});
	
	
				