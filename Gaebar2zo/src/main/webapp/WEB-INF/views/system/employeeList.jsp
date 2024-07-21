<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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
						<!-- <div class="col-md-4">
							<label for="validationCustom01" class="form-label">이름</label> <input
								type="text" class="form-control" id="validationCustom01" placeholder="홍길동" required>
						</div> -->
						<div class="form-floating">
						  <input type="text" class="form-control" id="floatingInput" placeholder="이름" required>
						  <label for="floatingInput">이름</label>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
						  <label for="floatingPassword">비밀번호</label>
						  <span></span>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
						  <label for="floatingPassword">비밀번호 재확인</label>
						</div>
						<div class="form-floating mb-3">
						  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" required>
						  <label for="floatingInput">이메일</label>
						</div>
						<div class="form-floating mb-3">
						  <input type="email" class="form-control" id="floatingInput" placeholder="010-1111-2222" required>
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
							<div class="invalid-feedback">Example invalid select feedback</div>
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
    
    
<%@ include file="../include/footer.jsp" %>
</body>
</html>