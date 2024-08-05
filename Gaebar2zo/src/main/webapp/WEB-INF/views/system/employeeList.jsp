<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- sweet alert 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
<div>
	<div class="search_box">
        <form name="searchForm" method="post" action="/employeeList.do">
            <div class="sch_group fl">
                <select id="searchType" name="searchType" title="검색 유형 선택">
                    <option value="">전체 검색</option>
                    <option value="username">사용자 ID</option>
                    <option value="user_per_name">사용자명</option>
                </select>
                <input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요." title="키워드 입력" />
                <button type="submit" class="bt_search"><i class="fas fa-search"></i><span class="skip_info">검색</span></button>
            </div>
        </form>
    </div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<button class="btn btn-primary" type="button" onclick="showRegisterModal()">등록</button>
		<button class="btn btn-primary" type="button" onclick="updateRegister()">수정</button>
		<button class="btn btn-primary" type="button" onclick="deleteRegister()">삭제</button>
	</div>
</div>
	<table class="table table-hover">
      <thead>
      	<tr>
         <th scope="col"> 
            <div class="form-check">
           	   <input class="form-check-input" type="checkbox" value="" id="checkAll" onclick="checkAll(this)">
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
                  			<input class="form-check-input" type="checkbox" value="" id="checkAll"> 
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
	 <div class="modal fade" id="registerModal" role="dialog" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title w-100 text-center" id="registerModalLabel">사용자등록</h5>
                    <button type="button" class="close" id="modalCloseBtn" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" novalidate>
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> <!-- 시큐리티 토큰!! -->
						<div class="form-floating">
						  <input type="text" class="form-control" id="user_per_name" name="user_per_name" placeholder="이름" required>
						  <label for="floatingInput" style="margin-left: 10px">이름</label>
						   	<span id="nameError" class="text-danger" style="display: none;">유효하지 않은 이름입니다.</span>
                            <span id="nameSuccess" class="text-success" style="display: none;">사용 가능한 이름입니다.</span>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="password" placeholder="Password" required>
						  <label for="floatingPassword" style="margin-left: 10px">비밀번호</label>
						 	<span id="pwError" class="text-danger" style="display: none;">비밀번호는 8~16자의 영문, 숫자, 특수기호를 포함해야 합니다.</span>
						</div>
						<div class="form-floating">
						  <input type="password" class="form-control" id="passwordCheck" placeholder="passwordCheck" required>
						  <label for="floatingPassword" style="margin-left: 10px">비밀번호 재확인</label>
						 	<span id="pwMatchError" class="text-danger" style="display: none;">비밀번호가 일치하지 않습니다</span>
                            <span id="pwMatchSuccess" class="text-success" style="display: none;">비밀번호가 일치합니다</span>
						</div>
						<div class="form-floating">
						  <input type="email" class="form-control" id="emailCheck" name="emailCheck" placeholder="name@example.com" >
							<label for="floatingInput" style="margin-left: 10px">이메일</label>
							<span id="emailError" class="text-danger" style="display: none;">유효한 이메일을 입력해주세요.</span>
                            <span id="emailExists" class="text-danger" style="display: none;">사용중인 이메일입니다.</span>
                            <span id="emailAvailable" class="text-success" style="display: none;">사용 가능한 이메일입니다.</span>
						</div>
						<div class="form-floating">
						  <input type="text" class="form-control" id="inputTel" placeholder="010-1111-2222" required>
						  <label for="floatingInput" style="margin-left: 10px">전화번호</label>
						    <span id="telError" class="text-danger" style="display: none;">유효하지 않은 전화번호입니다.</span>
                            <span id="telSuccess" class="text-success" style="display: none;">사용 가능한 전화번호입니다.</span>
							 <span id="telExists" class="text-danger" style="display: none;">이미 사용 중인 전화번호입니다.</span>
						</div>
						<div class="mb-3">
							<select class="form-select" required aria-label="select example" >
								<option value="1">관리자</option>
								<option value="2">팀장</option>
								<option value="3">과장</option>
								<option value="4">차장</option>
								<option value="5">대리</option>
								<option value="6">사원</option>
							</select>
							<div class="invalid-feedback" style="margin-left: 10px">직책을 선택해 주세요</div>
						</div>
						<div class="col-12">
							<button class="btn btn-primary" type="submit">Submit Form</button>
						</div>
					</form>
                </div>
            </div>
          </div>
    </div>  
  
    
    <!-- addEmp.js 연결 -->   
    <script src="../resources/js/addEmp.js"></script>
    
<%@ include file="../include/footer.jsp" %>
</body>
</html>