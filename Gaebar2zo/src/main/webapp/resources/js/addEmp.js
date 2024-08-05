/**
 * 시스템 등록 - 등록, 수정,삭제
 */
function showRegisterModal() {
    $('#registerModal').modal('show');
}

$(document).ready(function() {
	// CSRF 토큰을 가져오는 부분 
	const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");
    const name = $("#userName").val();
	
    // 모든 AJAX 요청에 CSRF 토큰을 포함시키기 위해 전역 AJAX 설정
    $.ajaxSetup({
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        }
    });
    
 // 유효성 검사 함수들
    function regMemberName(user_per_name) {
        var regExp = /^[가-힣]{1,10}$/;
        return regExp.test(user_per_name);
    }

    function regMemberPassword(password) {
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
        return regExp.test(password);
    }

    function regMemberEmail(user_email) {
        var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return regExp.test(user_email);
    }

    function regMemberPhone(user_phone) {
        var regExp = /^010-\d{4}-\d{4}$/;
        return regExp.test(user_phone);
    }

    // 유효성 검사 로직
    $('#user_per_name').on('input', function() {
        checkName();
    });

    $('#password, #passwordCheck').on('input', function() {
        validatePassword();
        validatePasswordMatch();
    });

    $('#emailCheck').on('input', function() {
        validateEmail();
    });

    $('#inputTel').on('input', function() {
        validateCheckPhone();
    });

    // 유효성 검사 함수들
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

    function validatePassword() {
        var upwd = $('#password').val();
        var passwordError = $('#pwError');

        if (regMemberPassword(upwd)) {
            passwordError.hide();
        } else {
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

    function validateEmail() {
        var email = $('#emailCheck').val();
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
            url: '/system/emailCheck',
            type: 'GET',
            data: { user_email: email },
            dataType: 'json',
            success: function(response) {
                if (response.exists) {
                    emailExists.show();
                    emailAvailable.hide();
                } else {
                    emailExists.hide();
                    emailAvailable.show();
                }
            }
        });
    }

    function validateCheckPhone() {
        var user_phone = $('#inputTel').val();
        var telError = $('#telError');
        var telSuccess = $('#telSuccess');
        var telExists = $('#telExists');

        if (!regMemberPhone(user_phone)) {
            telError.show();
            telSuccess.hide();
            telExists.hide();
        } else {
            telError.hide();
         
         console.log("AJAX 전화번호 요청을 보냅니다.");
         
         
         //전화번호 중복 체크를 위한 Ajax 요청
            $.ajax({
                url: '/system/phoneCheck',
                method: 'GET',
                data: { user_phone: user_phone },
                success: function(response) {
                	console.log("AJAX  전화번호 응답:", response);
                    if (response.exists) { // 중복된 전화번호
                        telExists.show();
                        telSuccess.hide();
                    } else {
                        telExists.hide();
                        telSuccess.show();
                    }
                }
            });
        }
    }

    // 폼 제출 시 모든 유효성 검사 및 중복 체크 확인
    $('#registerForm').on('submit', function(event) {
        event.preventDefault();

        if (!validateForm()) {
            return;
        }

        Swal.fire('성공', '사용자 등록 완료', 'success').then(function() {
            location.reload();
        });
    });

    // 모든 유효성 검사 및 중복 체크 확인
    function validateForm() {
        checkName();
        validatePassword();
        validatePasswordMatch();
        validateEmail();
        validateCheckPhone();

        if ($('#nameError').is(':visible') ||
            $('#pwError').is(':visible') ||
            $('#pwMatchError').is(':visible') ||
            $('#emailError').is(':visible') ||
            $('#emailExists').is(':visible') ||
            $('#telError').is(':visible') ||
            $('#telExists').is(':visible')) {
            return false; // 유효성 검사 실패 시 폼 제출 중단
        }

        return true; // 모든 검사를 통과한 경우
    }
});




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
	
	
				