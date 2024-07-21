<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- sweet alert 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<body>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<button class="btn btn-primary" type="button" onclick="openFormModal()">추가</button>
		<button class="btn btn-primary" type="button">수정</button>
		<button class="btn btn-primary" type="button">조회</button>
		<button class="btn btn-primary" type="button">삭제</button>
	</div>
	<table class="table table-hover">
      <thead>
      	<tr>
         <th scope="col"> 
            <div class="form-check">
               <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> 
               <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
            </div>
         </th>
	         <th scope="col">사용자ID</th>
	         <th scope="col">사용자명</th>
	         <th scope="col">비밀번호</th>
	         <th scope="col">직책</th>
	         <th scope="col">E-MAIL</th>
	         <th scope="col">전화번호</th>
      	</tr>
      </thead>
      <tbody>
			<c:forEach var="emptbl" items="${employeeList }">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"> 
                  			<label class="form-check-label" for="flexCheckChecked" > Checked checkbox </label>
               			</div>
               		</td>
               		<td>${emptbl.username }</td>
               		<td>${emptbl.user_per_name}</td>
               		<td>${emptbl.password }</td>
               		<td>${emptbl.user_pos}</td>
               		<td>${emptbl.user_email  }</td>
               		<td>${emptbl.user_phone }</td>
               		<td></td>
				</tr>	
			</c:forEach>

		</tbody>
		
   </table>
	
	<!-- 추가 버튼 모달창 -->
	 <!-- Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="formModalLabel">사용자등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeFormModal()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" novalidate>
						<div class="form-floating">
						  <input type="text" class="form-control" id="user_per_name" name="user_per_name" placeholder="이름" required>
						  <label for="floatingInput">이름</label>
						   	<span id="nameError" class="text-danger" style="display: none;">유효하지 않은 이름입니다.</span>
                            <span id="nameSuccess" class="text-success" style="display: none;">사용 가능한 이름입니다.</span>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="inputPw" placeholder="Password" required>
						  <label for="floatingPassword">비밀번호</label>
						 	<span id="pwError" class="text-danger" style="display: none;">비밀번호는 8~16자의 영문, 숫자, 특수기호를 포함해야 합니다.</span>
                            <span id="pwSuccess" class="text-success" style="display: none;">check</span>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="inputPwCheck" placeholder="Password" required>
						  <label for="floatingPassword">비밀번호 재확인</label>
						</div>
						<div class="form-floating mb-3">
						  <input type="email" class="form-control" id="inputEmail" placeholder="name@example.com" required>
						  <label for="floatingInput">이메일</label>
						</div>
						<div class="form-floating mb-3">
						  <input type="email" class="form-control" id="inputTel" placeholder="010-1111-2222" required>
						  <label for="floatingInput">전화번호</label>
						</div>
					
						<div class="mb-3">
							<select class="form-select" required aria-label="select example">
								<option value="" >직책</option>
								<option value="1">운영자</option>
								<option value="2">관리자</option>
								<option value="3">과장</option>
								<option value="4">대리</option>
								<option value="5">사원</option>
							</select>
							<div class="invalid-feedback">직책을 선택해 주세요</div>
						</div>
						<div class="col-12">
							<button class="btn btn-primary" type="submit">Submit Form</button>
							
						</div>
					</form>
                </div>
            </div>
          </div>
    </div> 
    <script>
        function openFormModal() {
            $('#formModal').modal('show');
        }
        
        function closeFormModal() {
            $('#formModal').modal('hide');
        }
    </script>
  <!--   <script>
    function validateForm() {
        let isValid = true;  // 유효성 검사 상태를 나타내는 변수입니다. 기본값은 true입니다.
        const formElements = document.querySelectorAll('#registerForm .form-control');
        // '#registerForm' 폼 내의 모든 .form-control 및 .form-select 요소를 선택합니다.

        for (let element of formElements) {  // 각 요소를 순회하면서 유효성 검사를 수행합니다.
            if (!element.checkValidity()) {  // 요소의 유효성을 검사합니다.
                element.focus();  // 유효하지 않은 요소로 포커스를 이동시킵니다.
                isValid = false;  // 유효성 검사 상태를 false로 설정합니다.
                break;  // 유효하지 않은 첫 번째 요소를 찾으면 반복문을 종료합니다.
            }
        }

        // 이름 유효성 검사
        const nameElement = document.getElementById('inputName');
        const nameValue = nameElement.value;
        const nameRegex = /^[가-힣]{1,10}$/;

        if (!nameRegex.test(nameValue)) {
            nameElement.setCustomValidity("Invalid field.");
            nameElement.focus();
            isValid = false;
        } else {
            nameElement.setCustomValidity("");
        }

        return isValid;  // 유효성 검사 상태를 반환합니다.
    }
     
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 동작 방지

            if (validateForm()) {
                closeFormModal();
                Swal.fire({
                    title: '사용자 등록 완료',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then(function() {
                    location.reload(); // 페이지를 새로고침하여 변경 사항을 반영합니다.
                });
		    } else {
		        Swal.fire({
		            title: '오류',
		            text: '모든 필드를 입력해 주세요.',
		            icon: 'error',
		            confirmButtonText: '확인'
		        });
		    }
		});

    </script> -->
    <!-- addEmp.js 연결 -->   
    <script src="../resources/js/addEmp.js"></script>
    
<%@ include file="../include/footer.jsp" %>
</body>
</html>