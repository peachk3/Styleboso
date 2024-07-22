<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<body>
	<h1>/Styleboso/basicInfo/clientAdd.jsp</h1>

	<div class="container-lg px-4">
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
					<div class="card-body">
						<form class="row g-3 needs-validation" novalidate>
							<div>
								<h5>거래처 등록</h5>
							</div>
							<div class="col-md-6">
								<label for="cli_code" class="form-label"> 거래처 코드 </label> 
								<input type="text" class="form-control" id="cli_code" readonly>
							</div>
							<div class="col-md-6">
								<label for="cli_name" class="form-label"> 거래처명 </label> 
								<input type="text" class="form-control" id="cli_name" required>
								<div class="invalid-feedback" >거래처명을 입력하세요 </div>
							</div>
							<div class="col-md-6">
								<label for="cli_crn" class="form-label"> 사업자 번호 </label> 
								<input type="text" class="form-control" id="cli_crn" required>
								<div class="invalid-feedback" > 거래처명을 입력하세요</div>
							</div>
							<div class="col-md-6">
								<label for="cli_name" class="form-label"> 거래처 구분 </label>
								<div>
								<input type="radio" id="cli_cateCu" name="cli_cate" value="customer" required>
								<label for="cli_cateCu"> 고객사</label>
								<input type="radio" id="cli_catePt" name="cli_cate" value="partner" required> 
								<label for="cli_catePt">협력사</label>
								</div>
								<div class="invalid-feedback">거래처 구분을 선택하세요</div>
							</div>
							<div class="col-md-6">
								<label for="cli_name" class="form-label"> 대표자 </label> 
								<input type="text" class="form-control" id="cli_rep" name="cli_rep" required>
								<div class="invalid-feedback" > 대표자를 입력하세요 </div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom05" class="form-label">담당자 아이디</label> 
									<input type="text" class="form-control" id="validationCustom05" data-coreui-toggle="modal"
									data-coreui-target="#exampleModal2" required>
								<div class="invalid-feedback" > 담당자를 입력해주세요 </div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom06" class="form-label">담당자 명</label>
								<input type="text" class="form-control" id="validationCustom06" data-coreui-toggle="modal" data-coreui-target="#exampleModal2"
									required>
								<div class="invalid-feedback" >담당자를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="cli_tel" class="form-label"> 대표 연락처 </label> 
								<input type="tel" class="form-control" id="cli_tel" required>
								<div class="invalid-feedback" > 연락처를 입력하세요</div>
							</div>
							<div class="col-md-6">
								<label for="cli_email" class="form-label"> 이메일 </label> 
								<input type="email" class="form-control" id="cli_email" name="cli_email" placeholder="ex) itwill@google.com" >
							</div>
							<div class="col-md-3">
									<label for="cli_email" class="form-label">창고 주소</label> 
									<input type="text" class="form-control" id="wh_add1" name="wh_add1" >
							</div>
							<div class="col-md-3">
								<label for="wh_add2" class="form-label">창고 상세 주소</label>
										<input type="text" class="form-control" id="wh_add2" name="wh_add2" >
							</div>
							<div class="col-md-3">
								<input type="button" value="주소 찾기">
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
							<div class="col-12">
								<button class="btn btn-primary" type="submit" id="submitFormBtn">Submit form</button>
							</div>
	
	<!-- 담당자 선택 모달창 -->
		<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">담당자</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover" id="modal2-table">
						<thead class="table-light">
							<tr>
								<th scope="col"></th>
								<th scope="col">담당자 아이디</th>
								<th scope="col">담당자 명</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
	   document.addEventListener('DOMContentLoaded', function() {
		      
	       const submitFormBtn = document.getElementById('submitFormBtn');
	       const cliCateRadios = document.getElementsByName('cli_cate');
	   
	       submitFormBtn.addEventListener('click', function(event) {
	         event.preventDefault(); // 기본 제출 동작 방지
	   
	         // 필요한 유효성 검사를 적용할 모든 폼을 가져오기
	         const forms = document.querySelectorAll('.needs-validation');
	         
	         // NodeList를 배열로 변환하고 각각의 폼에 대해 처리
	         Array.from(forms).forEach(form => {
	            // 유효성 검사 통과 여부 확인
	            if (!form.checkValidity()) {
	              event.stopPropagation(); // 상위 요소로 이벤트 전파 방지
	            }
	            
	            // Bootstrap의 'was-validated' 클래스 추가
	            form.classList.add('was-validated');
	         });
	         
	      // 거래처 구분 선택 확인
	         let cliCateSelected = false;
	         for (let radio of cliCateRadios) {
	           if (radio.checked) {
	             cliCateSelected = true;
	             break;
	           }
	         }

	         if (!cliCateSelected) {
	           // 선택되지 않았을 경우, 첫 번째 라디오 버튼에 사용자 정의 유효성 메시지 설정
	           cliCateRadios[0].setCustomValidity("거래처 구분을 선택하세요");
	         } else {
	           // 선택되었을 경우, 유효성 메시지 초기화
	           cliCateRadios[0].setCustomValidity("");
	         }
	         cliCateRadios[0].reportValidity();
	       });

	       // 라디오 버튼 선택 변경 시 유효성 상태 초기화
	       for (let radio of cliCateRadios) {
	         radio.addEventListener('change', function() {
	           cliCateRadios[0].setCustomValidity("");
	         });
	       }
	       
	       
	       
	       $('#modal2-table tbody').on('click', 'tr', function() {
	           var targetInput1 = document.getElementById('validationCustom05');
	           var targetInput2 = document.getElementById('validationCustom06');
	           var cliNum1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
	           var cliNum2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

	           // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
	           targetInput1.value = cliNum1;
	           targetInput2.value = cliNum2;
	       
	           // Modal 닫기 (Optional)
	           var modal = document.getElementById('exampleModal2');
	           var modalInstance = coreui.Modal.getInstance(modal);
	           modalInstance.hide();
	       });
	       
	       
	    	// 전화번호 - 숫자만 입력 허용
	       $("#cli_tel").on("input", function() {
	           this.value = this.value.replace(/[^0-9]/g, '');
	       });      
	    	
	    	// 사업자 번호 - 숫자만 입력 허용
	       $("#cli_crn").on("input", function() {
	           this.value = this.value.replace(/[^0-9]/g, '');
	       });       
	    	
	    	
	getManagerList();

	function getManagerList() {
	   
	    //$('#modal2-table tbody tr').remove();
	    
	    $.ajax({
	        url: "/Styleboso/common/managerList",
	        type: "get",
	        contentType: 'application/json; charset=utf-8',
	        dataType: "json",
	        success: function(data) {
	            // body 태그에 내용 추가
	            console.log(data);
	            data.forEach(function(item, idx){
	               console.log(idx);
	               var row = "<tr><th scope='row'>" + (parseInt(idx)+1) + "</th><td>" + item.username + "</td><td>" + item.user_per_name + "</td></tr>"
	                $('#modal2-table tbody').append(row);
	            });
	            
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
	            alert("AJAX 요청 실패!");
	        }
	    });
	}
	
});
</script>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>