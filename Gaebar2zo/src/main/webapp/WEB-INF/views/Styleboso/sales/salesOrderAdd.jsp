<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<link
		href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
		rel="stylesheet"
		integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
		integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b"
		crossorigin="anonymous"></script>

	<h1>/Styleboso/sales/salesOrderAdd.jsp</h1>

	<div class="container-lg px-4">
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
<!-- 					<div class="card-header"> -->
<!-- 						<strong>수주관리</strong><span class="small ms-1">등록</span> -->
<!-- 					</div> -->
					<div class="card-body">
<!-- 						<p class="text-body-secondary small"> -->
<!-- 							Custom -->
<!-- 							<code>&lt;select&gt;</code> -->
<!-- 							menus need only a custom class, -->
<!-- 							<code>.form-select</code> -->
<!-- 							to trigger the custom styles.Custom styles are limited to the -->
<!-- 							<code>&lt;select&gt;</code> -->
<!-- 							’s initial appearance and cannot modify the -->
<!-- 							<code>&lt;option&gt;</code> -->
<!-- 							s due to browser limitations. -->
<!-- 						</p> -->
						<form class="row g-3 needs-validation" novalidate>
							<div class="col-md-6">
								<label for="validationCustom01" class="form-label">납기일자</label> 
									<input type="date" class="form-control"
									id="validationCustom01" required>
								<div class="invalid-feedback">납기일자를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="validationCustom01" class="form-label">수주일자</label> 
									<input type="date" class="form-control"
									id="validationCustom01" required>
								<div class="invalid-feedback">수주일자를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="validationCustom02" class="form-label">거래처</label>
									<input type="text" class="form-control custom-btn" id="validationCustom02" value=""
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal" required>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="validationCustom03" class="form-label">담당자</label>
									<input type="text" class="form-control" id="validationCustom03" required>
								<div class="invalid-feedback">담당자를 입력해주세요</div>
							</div>
						<div class="example">
							<ul class="nav nav-underline-border" role="tablist">
<!-- 								<li class="nav-item" role="presentation"> -->
<!-- 								<a class="nav-link active" data-coreui-toggle="tab" -->
<!-- 									href="#preview-1000" role="tab" aria-selected="true"> -->
<!-- 								<svg class="icon me-2"> -->
<!-- 		                        	<use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-media-play"></use> -->
<!-- 		                        </svg>Preview -->
<!-- 								</a></li> -->
<!-- 								<li class="nav-item" role="presentation"><a -->
<!-- 									class="nav-link" -->
<!-- 									href="https://coreui.io/docs/forms/select/#default" -->
<!-- 									target="_blank" aria-selected="false" tabindex="-1" role="tab"> -->
<!-- 										<svg class="icon me-2"> -->
<!--                             <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-code"></use> -->
<!--                           </svg>Code -->
<!-- 								</a></li> -->
							</ul>
							<div class="tab-content rounded-bottom">
								<div class="tab-pane p-3 active preview" role="tabpanel"
									id="preview-1000">
									<select class="form-select" aria-label="Default select example">
										<option selected="">Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
						</div>
							<div class="col-12">
								<button class="btn btn-primary" type="submit" id="submitFormBtn">Submit form</button>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">New message</h5>
											<button type="button" class="btn-close"
												data-coreui-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form>
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">Recipient:</label>
													<input type="text" class="form-control" id="recipient-name">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary" id="saveChangesBtn">Send message</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<h1>/Styleboso/sales/salesOrderAdd.jsp</h1>

</body>

<style>
  .custom-btn {
    text-align: left; /* 텍스트를 왼쪽으로 정렬합니다 */
    padding-left: 10px; /* 왼쪽 여백을 추가합니다 */
    width: 100%; /* 버튼이 부모 요소에 맞게 전체 너비를 가지도록 설정합니다 */
  }
</style>

<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->

<script type="text/javascript">

// 	//필요한 유효성 검사를 적용할 모든 폼을 가져오기
// 	const forms = document.querySelectorAll('.needs-validation');
	
// 	// NodeList를 배열로 변환하고 각각의 폼에 대해 처리
// 	Array.from(forms).forEach(form => {
// 	  form.addEventListener('submit', event => {
// 	    // 유효성 검사 통과 여부 확인
// 	    if (!form.checkValidity()) {
// 	      event.preventDefault(); // 폼 제출 방지
// 	      event.stopPropagation(); // 상위 요소로 이벤트 전파 방지
// 	    }
	
// 	    // Bootstrap의 'was-validated' 클래스 추가
// 	    form.classList.add('was-validated');
// 	  }, false);
// 	});
	
	document.addEventListener('DOMContentLoaded', function() {
	    const submitFormBtn = document.getElementById('submitFormBtn');
	
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
	    });

		const saveChangesBtn = document.getElementById('saveChangesBtn');
	    const recipientInput = document.getElementById('recipient-name');

	    saveChangesBtn.addEventListener('click', function() {
	      const recipient = recipientInput.value;

	      // 모달 버튼의 텍스트를 입력받은 값으로 변경합니다.
	      const modalBtn = document.querySelector('[data-bs-target="#exampleModal"]');
	      if (modalBtn) {
	          modalBtn.textContent = recipient;
	        } else {
	          console.error('모달 버튼을 찾을 수 없습니다.');
	        }

	      // 모달을 닫습니다.
// 	      const modal = bootstrap.Modal.getInstance(document.getElementById('exampleModal'));
// 	      if (modal) {
// 	        modal.hide();
// 	      } else {
// 	        console.error('모달 인스턴스를 찾을 수 없습니다.');
// 	      }
	      const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
	      modal.hide();
	    });
	});
	
</script>
</html>
