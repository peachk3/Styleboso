<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<body>
	<h1>/Styleboso/basicInfo/warehouseList.jsp</h1>

	<div class="container-fluid px-4">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb my-0">
				<li class="breadcrumb-item"><a href="#" data-coreui-i18n="home">김포창고</a>
				</li>
				<li class="breadcrumb-item"><span data-coreui-i18n="plugins">구역</span>
				</li>
				<li class="breadcrumb-item active"><span>열</span></li>
			</ol>
		</nav>
	</div>

	<input type="button" value="등록" onclick="openRegModal()" class="btn btn-primary">
	<input type="button" value="삭제">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="selectAll" onclick = "toggleCheckboxes(this)"> 
					</div>
				</th>
				<th scope="col">창고 코드</th>
				<th scope="col">창고 이름</th>
				<th scope="col">연락처</th>
				<th scope="col">주소</th>
				<th scope="col">관리자</th>
				<th scope="col">현재상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="whc" items="${whCodeList }">
				<tr>
					<td>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${whc.m_cate_wh_code }"> 
						</div>
					</td>
					<td>${whc.m_cate_wh_code }${whc.s_cate_wh_code }</td>
					<td>${whc.s_cate_wh_name }</td>
					<td>${whc.wh_tel }</td>
					<td>${whc.wh_add1 }${whc.wh_add2 }</td>
					<td>${whc.wh_man }</td>
					<td>
						<c:choose>
							<c:when test="${vo.wh_status == 1 }">사용중</c:when>
				    		<c:otherwise> 사용 중지</c:otherwise>
						</c:choose>
				    </td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 모달 창 -->
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="regModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="regModalLabel">창고 등록</h5>
				</div>
				<div class="modal-body">
					<!-- 등록 폼 -->
					<form id="regForm" onsubmit="return submitForm()">
						<table class="table">
							<tbody>
								<tr>
									<td><label for="warehouseCode">창고코드</label></td>
									<td><input type="text" class="form-control" id="warehouseCode" name="warehouseCode" readonly="readonly"></td>
								</tr>
								<tr>
									<td><label for="s_cate_wh_code">창고 지역명</label></td>
									<td><input type="text" class="form-control" id="s_cate_wh_code" name="s_cate_wh_code" maxlength="2" placeholder="ex) 김포 -> GP" required>
									<div id="whLocalNameError" class="text-danger" style="display: none;">창고 지역명을 입력하세요</div>
									<div id="whCodeError" class="text-danger" style="display: none;">영어로 입력하시오</div>
									</td>
								</tr>
								<tr>
									<td><label for="s_cate_wh_name">창고명</label></td>
									<td><input type="text" class="form-control" id="s_cate_wh_name" name="s_cate_wh_name" required>
									<div id="whNameError" class="text-danger" style="display: none;">창고명을 입력하세요</div></td>
								</tr>
								<tr>
									<td><label for="wh_tel">연락처</label></td>
									<td>
									<input type="tel" class="form-control" id="wh_tel" name="wh_tel" maxlength="11" placeholder="ex) 01012341234" required>
									</td>
								</tr>
								<tr>
									<td><label for="wh_add1">창고 주소</label></td>
									<td>
										<div class="input-group">
											<div class="input">
											<input type="text" class="form-control" id="wh_add1" name="wh_add1" required>
											</div>
											<div class="input-group-append">
												<input type="button" value="주소 찾기">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="wh_add2">창고 상세 주소</label></td>
									<td><input type="text" class="form-control" id="wh_add2" name="wh_add2" required></td>
								</tr>
								<tr>
									<td><label for="wh_man">창고 담당자</label></td>
									<td>
										<div class="input-group">
											<div class="input">
											<input type="text" class="form-control" id="wh_man" name="wh_man" required>
											</div>
											<div class="input-group-append">
												<input type="button" value="찾기" onclick="openManModal()">
											</div>
										</div>
									</td>
								</tr>
								<!-- 추가 필드 추가 가능 -->
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"  id="cancelButton">취소</button>
					<button type="button" class="btn btn-primary" onclick="submitForm()">등록</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmationModalLabel">확인</h5>
      </div>
      <div class="modal-body">
        정말 취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="confirmCancelButton">확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="denyButton">아니오</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- Modal2 -->
	<div class="modal fade" id="manModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">담당자</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover" id="modal1-table">
						<thead class="table-light">
							<tr>
								<th scope="col"></th>
								<th scope="col">거래처 코드</th>
								<th scope="col">거래처 명</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="sendBtn">확인</button>
				</div>
			</div>
		</div>
	</div>

<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

// 모달창 외의 영역/esc 클릭시 창 닫힘 차단
	
	$(document).ready(function(){
	    $('#regModal').modal({
	         backdrop: 'static',
	        keyboard: false 
	    });
	    
	    // 취소 버튼 클릭시 확인 모달 열기
	    $("#cancelButton").click(function(){
	        $("#confirmationModal").modal('show');
	    });
	    
	    // 전화번호 숫자만 입력 허용
	    $("#wh_tel").on("input", function() {
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
	
	    // 창고 지역 코드명 대문자 영어 2자리만 입력 허용
	    $("#s_cate_wh_code").on("input", function() {
	    	
	    	// 입력값을 대문자로 변환
	        let inputValue = this.value.toUpperCase();
	        
	        // 영어 대문자 2자리만 허용
	        inputValue = inputValue.replace(/[^A-Z]/g, '');

	        // 한글이 포함된 경우
	        const hasHangul = /[가-힣]/.test(this.value);
	        
	        // 자음과 모음만 포함된 경우
	        const hasConsonantOrVowel = /[ㄱ-ㅎㅏ-ㅣ]/.test(this.value);

	        // 오류 메시지 요소
	        const errorMessage = document.getElementById('whCodeError');

	        // 한글이나 자음/모음이 포함된 경우 오류 메시지 표시
	        if (hasHangul || hasConsonantOrVowel) {
	            errorMessage.style.display = 'block';
	        } else {
	            errorMessage.style.display = 'none';
	        }

	        // 필드 값 업데이트
	        this.value = inputValue;
	    	
	    });
	    
	    // 확인 클릭시 모달 리셋
	    $("#confirmCancelButton").click(function(){
	        $("#confirmationModal").modal('hide');
	        $("#regModal").modal('hide');
	        resetForm();
	    });
	
	    // 확인 모달의 아니오 버튼 클릭시 모달 숨기기
	    $("#denyButton").click(function(){
	        $("#confirmationModal").modal('hide');
	        $("#regModal").modal('show');
	    });
	    
/* 	    $('#regModal').on('shown.bs.modal', function () {
	        $('#s_cate_wh_name').trigger('focus');
	    }); */
	});


	// 전체 선택/해제 기능
	function toggleCheckboxes(source) {
	    const checkboxes = document.querySelectorAll('.form-check-input');
	    checkboxes.forEach(checkbox => {
	        checkbox.checked = source.checked;
	    });
	}

	// 모달 열기 함수
	function openRegModal() {
	  $('#regModal').modal('show'); // jQuery를 사용하여 모달 창 열기
	}
	

	// 폼 제출 함수 (실제로는 서버로 데이터를 전송할 수 있습니다)
	function submitForm() {
        const whNameInput = document.getElementById('s_cate_wh_name');
        const errorMessage = document.getElementById('whNameError');
        
        const whLocalNameInput = document.getElementById('s_cate_wh_code');
        const errorMessageLocal = document.getElementById('whLocalNameError');

        
 		if (whLocalNameInput.value.trim() === '') {
            errorMessageLocal.style.display = 'block';
            return false; // 폼 제출을 막음
		} else {
            errorMessageLocal.style.display = 'none';
           
            // 여기서 폼 데이터를 처리하는 JavaScript 코드를 작성할 수 있습니다.
            // 예: AJAX를 사용하여 서버로 데이터 전송 등
            // $('#regModal').modal('hide'); // 폼을 제출한 후 모달 창 닫기
            //return true; // 폼 제출을 진행
        }
/* 	  // 여기서 폼 데이터를 처리하는 JavaScript 코드를 작성할 수 있습니다.
	  // 예: AJAX를 사용하여 서버로 데이터 전송 등
	  
	  $('#regModal').modal('hide'); // 폼을 제출한 후 모달 창 닫기 */
	  
        if (whNameInput.value.trim() === '') {
            errorMessage.style.display = 'block';
            return false; // 폼 제출을 막음
        } else {
            errorMessage.style.display = 'none';
        }
	}
	
	
	function openManModal() {
		$('#manModal').modal('show');
	}
	
	function resetForm() {
	    $("#regForm")[0].reset();
	}
</script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>