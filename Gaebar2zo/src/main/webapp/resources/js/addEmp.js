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
