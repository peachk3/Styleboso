<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/basicInfo/itemAdd.jsp</h1>
	
	<div class="container-lg px-4">
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
					<div class="card-body">
						<form class="row g-3 needs-validation" novalidate>
							<div>
								<h5>품목 등록</h5>
							</div>
							<div class="col-md-6">
								<label for="item_num" class="form-label"> 품목 코드 </label> 
								<input type="text" class="form-control" id="item_num" readonly>
							</div>
							<div class="col-md-6">
								<label for="item_name" class="form-label"> 제품명 * </label> 
								<input type="text" class="form-control" id="item_name" required>
								<div class="invalid-feedback"> 제품명을 입력하세요 </div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom03" class="form-label">거래처 코드</label>
									<input type="text" class="form-control" id="validationCustom03" 
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal1" required>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom04" class="form-label">거래처 명</label>
									<input type="text" class="form-control" id="validationCustom04" 
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal1" required>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="cli_name" class="form-label"> 제품 유형 </label>
								<div>
								<select class="form-select" id="productType" name="productType" aria-label="Default select example" required>
									<option value="0"> 제품 유형을 선택하세요 </option>
									<option value="상의"> 상의 </option>
									<option value="하의"> 하의 </option>
									<option value="아우터"> 아우터 </option>
									<option value="원피스/스커트"> 원피스/스커트 </option>
								</select>
								</div>
								<div class="invalid-feedback" >제품 유형을 선택하세요 </div>
							</div>
							<div class="col-md-6">
								<label for="item_mat" class="form-label"> 재질 </label> 
								<input type="text" class="form-control" id="item_mat" name="item_mat">
							</div>
							<div class="col-md-6">
								<label for="item_size" class="form-label"> 규격 </label> 
								<input type="text" class="form-control" id="item_size">
							</div>
							<div class="col-md-5">
								<label for="item_price" class="form-label"> 매입 단가 * </label> 
								<input type="number" class="form-control" id="item_price" name="item_price" placeholder="ex) 1000" required>
								<div class="invalid-feedback" >매입 단가를 입력하세요 </div>
							</div>
							<div class="col-md-1" id="money" >
								만 원
							</div>
							<div class="col-md-5">
								<label for="item_price2" class="form-label"> 매출 단가 * </label> 
								<input type="number" class="form-control" id="item_price2" name="item_price2" placeholder="ex) 1000" required>
								<div class="invalid-feedback" >매출 단가를 입력하세요 </div>
							</div>
							<div class="col-md-1" id="money">
								만 원
							</div>
							<div class="col-md-6">
								<label for="item_inven_qty" class="form-label"> 현재고 </label> 
								<input type="number" class="form-control" id="item_inven_qty">
							</div>
							<div class="col-md-6">
								<label for="item_comm" class="form-label"> 비고 </label> 
								<input type="text" class="form-control" id="item_comm">
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

							<!-- Modal1 -->
							<div class="modal fade" id="exampleModal1" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">거래처</h5>
											<button type="button" class="btn-close"
												data-coreui-dismiss="modal" aria-label="Close"></button>
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
											<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>

						<div class="col-12">
								<button class="btn btn-primary" type="submit" id="submitFormBtn">Submit form</button>
							</div>

<style>
#money {
	
	padding-top: 45px;
}
</style>
							
<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
   
   document.addEventListener('DOMContentLoaded', function() {
      
       const submitFormBtn = document.getElementById('submitFormBtn');
       const productTypeSelect = document.getElementById('productType');
       const itemPriceInput = document.getElementById('item_price');
       const itemPriceInput2 = document.getElementById('item_price2');

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
      // 제품 유형 선택 확인
         if (productTypeSelect.value === "0") {
             productTypeSelect.setCustomValidity("제품 유형을 선택하세요");
         } else {
             productTypeSelect.setCustomValidity("");
         }
         productTypeSelect.reportValidity();
       });
       
    // 선택 변경 시 유효성 상태 초기화
       productTypeSelect.addEventListener('change', function() {
           this.setCustomValidity("");
       });
    
    // 매입 단가 음수 입력 불가
       itemPriceInput.addEventListener('input', function() {
           if (this.value < 0) {
               this.value = '';
               this.setCustomValidity('매입 단가는 음수가 될 수 없습니다');
           } else {
               this.setCustomValidity('');
           }
           this.reportValidity();
       });
    // 매출 단가 음수 입력 불가
       itemPriceInput2.addEventListener('input', function() {
           if (this.value < 0) {
               this.value = '';
               this.setCustomValidity('매출 단가는 음수가 될 수 없습니다');
           } else {
               this.setCustomValidity('');
           }
           this.reportValidity();
       });
       
       getClientList();
       
       function getClientList() {
          
           $('#modal1-table tbody tr').remove();
           
           $.ajax({
               url: "/common/clientList",
               type: "get",
               contentType: 'application/json; charset=utf-8',
               dataType: "json",
               success: function(data) {
                   // body 태그에 내용 추가
                   console.log(data);
                   data.forEach(function(item, idx){
                      console.log(idx);
                      var row = "<tr><th scope='row'>" + (parseInt(idx)+1) + "</th><td>" + item.cli_num + "</td><td>" + item.cli_name + "</td></tr>"
                       $('#modal1-table tbody').append(row);
                   });
                   
               },
               error: function(jqXHR, textStatus, errorThrown) {
                   console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                   alert("AJAX 요청 실패!");
               }
           });
       }
       

      $('#modal1-table tbody').on('click', 'tr', function() {
          var targetInput1 = document.getElementById('validationCustom03');
          var targetInput2 = document.getElementById('validationCustom04');
          var cliNum1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
          var cliNum2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
          targetInput1.value = cliNum1;
          targetInput2.value = cliNum2;
      
          // Modal 닫기 (Optional)
          var modal = document.getElementById('exampleModal1');
          var modalInstance = coreui.Modal.getInstance(modal);
          modalInstance.hide();
      });
   });	
   
   
   
</script>
<%@ include file="../include/footer.jsp" %>

</body>
</html>