/**
 * 로그인 - 아이디 저장 
 * 
 */
	  $(document).ready(function() {
            function toggleSubmitButton() {
                if ($("#username").val() && $("#password").val()) {
                    $("button[type='submit']").addClass("active");
                } else {
                    $("button[type='submit']").removeClass("active");
                }
            }

            $("#username, #password").on("keyup change", toggleSubmitButton);

            var key = getCookie("key");
            $("#username").val(key); 
              
            if($("#username").val() != ""){
                $("#saveId").attr("checked", true); 
            }
              
            $("#saveId").change(function(){ 
                if($("#saveId").is(":checked")){ 
                    setCookie("key", $("#username").val(), 7); 
                }else{ 
                    deleteCookie("key");
                }
            });
              
            $("#username").keyup(function(){ 
                if($("#saveId").is(":checked")){ 
                    setCookie("key", $("#username").val(), 7); 
                }
            });
        });
          
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
          
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
          
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1) end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
        
/**
 * 로그인 - 로그인 버튼 활성/비활성화
 */
        document.addEventListener('DOMContentLoaded', function () {
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('password');
            const loginButton = document.querySelector('button[type="submit"]');

            function toggleButtonState() {
                const username = usernameInput.value.trim();
                const password = passwordInput.value.trim();
                const isActive = username && password;

                loginButton.disabled = !isActive;

                if (isActive) {
                    loginButton.classList.add('btn-active');
                } else {
                    loginButton.classList.remove('btn-active');
                }
            }

            // 초기 상태 설정
            toggleButtonState();

            // 입력 필드 변화 감지
            usernameInput.addEventListener('input', toggleButtonState);
            passwordInput.addEventListener('input', toggleButtonState);
        });
        