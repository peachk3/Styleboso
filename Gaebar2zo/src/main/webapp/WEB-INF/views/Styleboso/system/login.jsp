<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
	rel="stylesheet"
	integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
	integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b"
	crossorigin="anonymous">
  </script>
<title>Insert title here</title>
</head>
<body>
	<form action="/login" method="post">
	<div class="card col-md-7 p-4 mb-0">
		<div class="card-body">
			<h1>Login</h1>
			<p class="text-body-secondary">Sign In to your account</p>
			<div class="input-group mb-3">
				<span class="input-group-text">
					 <svg class="icon">
                        <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-user"></use>
               		 </svg>
                </span> 
                <input class="form-control" type="text" id="username" name="username" placeholder="Username" required="required">
                <span></span>
                <!-- 히든 토큰 정보를 가지고 있어야만 로그인 가능 -->
				<!-- 서버(시큐리티)에서 토큰 여부를 체크 -->
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</div>
			<div class="input-group mb-4">
				<span class="input-group-text">
					 <svg class="icon">
                        <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-lock-locked"></use>
                	 </svg>
                 </span> 
                 <input class="form-control" type="password" id="password" name="password" placeholder="Password" required="required">
			</div>
			<div class="input-checkbox">
				<input type="checkbox" id="saveId" name="saveId">아이디 저장
			</div>
			<div class="row">
				<div class="col-6">
					<button type="submit" class="btn btn-primary px-4">Login</button>
				</div>
				<div class="col-6 text-end">
					<button class="btn btn-link px-0" type="button">Forgot password?</button>
				</div>
			</div> <!-- row -->
		</div><!-- card-body -->
	</div>
</form>

    <!-- 아이디 저장  -->
    <script>
	  $(document).ready(function() {
            function toggleSubmitButton() {
                if ($("#username").val() && $("#password").val()) {
                    $("input[type='submit']").addClass("active");
                } else {
                    $("input[type='submit']").removeClass("active");
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
	</script>




</body>
</html>