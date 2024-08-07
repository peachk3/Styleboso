<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
  
<!-- 	<h1>/sales/salesOrderAdd.jsp</h1> -->

	<div class="container-lg px-4">
		<div class="row">
			<div class="col-12">
					<div class="card-body">
						<form class="row g-3 needs-validation" action="/sales/salesOrderAdd" method="post" novalidate>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">			
						
							<div class="col-md-6">
								<label for="validationCustom01" class="form-label">납기예정 일자</label> 
									<input type="date" class="form-control" name="ex_due_date"
									id="validationCustom01" required>
								<div class="invalid-feedback">납기예정 일자를 입력해주세요</div>
							</div>
							<div class="col-md-6">
								<label for="validationCustom02" class="form-label">수주일자</label> 
									<input type="date" class="form-control" name="tran_date"
									id="validationCustom02" required>
								<div class="invalid-feedback">수주일자를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom03" class="form-label">거래처 번호</label>
									<input type="text" class="form-control" id="validationCustom03" name="cli_num"
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal1" required>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom04" class="form-label">거래처명</label>
									<input type="text" class="form-control" id="validationCustom04" 
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal1" required>
							</div>
							<div class="col-md-3">
								<label for="validationCustom05" class="form-label">담당자 아이디</label>
									<input type="text" class="form-control" id="validationCustom05" name="pic_username"
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal2" required>
								<div class="invalid-feedback">담당자를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom06" class="form-label">담당자명</label>
									<input type="text" class="form-control" id="validationCustom06"
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal2" required>
							</div>
							<div class="col-12">
								<label for="validationCustom07" class="form-label">비고</label>
									<input type="text" class="form-control" id="validationCustom07" name="comm">
							</div>
							
						<div class="example">
							<div class="tab-content rounded-bottom">

								<button id="addRowBtn" class="btn btn-outline-info btn-sm"
									type="button" style="margin-bottom: 10px;"
									data-coreui-toggle="modal" data-coreui-target="#exampleModal3" >품목 선택</button>
									
							<ul class="nav nav-underline-border" role="tablist">
							</ul>
								<table class="table item-table text-left">
									<thead class="table-light">
										<tr>
											<th scope="col" style="width:25%">제품번호</th>
											<th scope="col" style="width:25%">제품명</th>
											<th scope="col" style="width:12%">사이즈</th>
											<th scope="col" style="width:12%">색상</th>
											<th scope="col" style="width:25%">수량</th>
										</tr>
									</thead>
									<tbody id="tableBody">
									</tbody>
								</table>
							</div>
						</div>
							<div class="col-12">
								<button class="btn btn-primary" type="submit" id="submitFormBtn">등록</button>
							</div>
						</form>
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
											<table class="table table-hover text-center" id="modal1-table">
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
										</div>
									</div>
								</div>
							</div>
							<!-- Modal2 -->
							<div class="modal fade" id="exampleModal2" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">담당자</h5>
											<button type="button" class="btn-close"
												data-coreui-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table class="table table-hover text-center" id="modal2-table">
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
											<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal3 -->
							<div class="modal fade" id="exampleModal3" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-scrollable modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">제품</h5>
											<button type="button" class="btn-close"
												data-coreui-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table class="table table-hover text-center" id="modal3-table">
												<thead class="table-light">
													<tr>
														<th scope="col"></th>
														<th scope="col">제품 번호</th>
														<th scope="col">제품 명</th>
														<th scope="col">제품 사이즈</th>
														<th scope="col">제품 색상</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
										<div class="modal-footer">
											<button class="btn btn-primary" type="submit" id="submitModal3Btn" onclick="checkedData();">등록</button>
											<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
   

<!--    <h1>/sales/salesOrderAdd.jsp</h1> -->
</body>

<style>
	.custom-btn {
		text-align: left; /* 텍스트를 왼쪽으로 정렬합니다 */
		padding-left: 10px; /* 왼쪽 여백을 추가합니다 */
		width: 100%; /* 버튼이 부모 요소에 맞게 전체 너비를 가지도록 설정합니다 */
	}
	
	.hidden {
		isplay: none;
	}
</style>

<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	const token = $("meta[name='_csrf']").attr("content")
	const header = $("meta[name='_csrf_header']").attr("content");
	const name = $("#userName").val();
   
   document.addEventListener('DOMContentLoaded', function() {
		
		const form = document.querySelector('.needs-validation');
		const submitFormBtn = document.getElementById('submitFormBtn');
   
		submitFormBtn.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 제출 동작 방지
			
			// 모든 폼이 유효성 검사를 통과했는지 여부를 저장하는 변수
			let allFormsValid = true; 
			
			const formData = {
					ex_due_date: String(document.getElementById('validationCustom01').value),
					tran_date: String(document.getElementById('validationCustom02').value),
					cli_num: document.getElementById('validationCustom03').value,
					pic_username: document.getElementById('validationCustom05').value,
					tran_cate_code: "SO",
			        comm: document.getElementById('validationCustom07').value
		    };
			
			var tableData = [];
			
			if (dataChangeJSON() == null) {
				  event.stopPropagation(); // 상위 요소로 이벤트 전파 방지
				  allFormsValid = false; // 하나라도 유효성 검사를 통과하지 못한 경우
				  alert("제품을 추가해주세요");
			} else {
				tableData = dataChangeJSON();
			}
			
			// 필요한 유효성 검사를 적용할 모든 폼을 가져오기
			const forms = document.querySelectorAll('.needs-validation');
			
			// NodeList를 배열로 변환하고 각각의 폼에 대해 처리
			Array.from(forms).forEach(form => {
				// 유효성 검사 통과 여부 확인
				if (!form.checkValidity()) {
				  event.stopPropagation(); // 상위 요소로 이벤트 전파 방지
				  allFormsValid = false; // 하나라도 유효성 검사를 통과하지 못한 경우
				}
				
				// Bootstrap의 'was-validated' 클래스 추가
				form.classList.add('was-validated');
			});
			
			if (allFormsValid) {
				
				var csrfToken = $('input[name="_csrf"]').attr('content');
				
				$.ajax({
                    type: 'POST',
                    url: '/sales/salesOrderAdd', // 요청을 보낼 URL
                    beforeSend: function(xhr) {
                    	xhr.setRequestHeader(header, token);
                    },
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({
                    	tvo: JSON.stringify(formData),
                    	tgvo: JSON.stringify(tableData)
                    }),
                    success: function(response) {
                        console.log('서버 응답:', response);
                        window.location.href = 'http://localhost:8088/sales/salesOrderList';
                    },
                    error: function(error) {
                        console.error('에러 발생:', error);
                    }
                });
				
		    }
         
       });

      $('#modal1-table tbody').on('click', 'tr', function() {
          var targetInput1 = document.getElementById('validationCustom03');
          var targetInput2 = document.getElementById('validationCustom04');
          var cli1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
          var cli2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
          targetInput1.value = cli1;
          targetInput2.value = cli2;
      
          // Modal 닫기 (Optional)
          var modal = document.getElementById('exampleModal1');
          var modalInstance = coreui.Modal.getInstance(modal);
          modalInstance.hide();
      });

      $('#modal2-table tbody').on('click', 'tr', function() {
          var targetInput1 = document.getElementById('validationCustom05');
          var targetInput2 = document.getElementById('validationCustom06');
          var user1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
          var user2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
          targetInput1.value = user1;
          targetInput2.value = user2;
      
          // Modal 닫기 (Optional)
          var modal = document.getElementById('exampleModal2');
          var modalInstance = coreui.Modal.getInstance(modal);
          modalInstance.hide();
      });
      
      $('#modal3-table tbody').on('click', 'tr', function() {
          var rowNum = $('#click-row').val();
          var targetInput1 = document.getElementById('goods-num'+ rowNum);
          var targetInput2 = document.getElementById('goods-name'+ rowNum);
          var goods1 = $(this).find('td:nth-child(2)').text();
          var goods2 = $(this).find('td:nth-child(3)').value;
          
          
          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
          targetInput1.value = goods1;
          targetInput2.value = goods2;
      
          // Modal 닫기 (Optional)
          var modal = document.getElementById('exampleModal3');
          var modalInstance = coreui.Modal.getInstance(modal);
          modalInstance.hide();
      });
      
      getClientList();
      
      function getClientList() {
         
          $('#modal1-table tbody tr').remove();
          
          $.ajax({
              url: "/common/clientList2",
              type: "get",
              contentType: 'application/json;',
              data: {cli_cate : "CLCU"},
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
      
      getManagerList();
      
      function getManagerList() {
         
          $('#modal2-table tbody tr').remove();
          
          $.ajax({
              url: "/common/managerList",
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
      
      getGoodsList();
      
      function getGoodsList() {
         
          $('#modal3-table tbody tr').remove();
          
          $.ajax({
              url: "/common/goodsList",
              type: "get",
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function(data) {
                  // body 태그에 내용 추가
                  console.log(data);
                  data.forEach(function(item, idx){
                     console.log(idx);
                     var row = "<tr id='row"+ (parseInt(idx)+1) +"'><th scope='row'><input class='form-check-input'type='checkbox' id='check" + (parseInt(idx)+1) + "'></th><td>" + item.goods_num + "</td><td>" + item.itemList.map(itemVO => itemVO.item_name).join(', ') + "</td><td>" + item.goods_size + "</td><td>" + item.goods_color + "</td></tr>"
                      $('#modal3-table tbody').append(row);
                  });
                  
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                  alert("AJAX 요청 실패!");
              }
          });
      }
      
      
   });
   
	function dataChangeJSON() {
		var tableRows = $('.item-table tbody tr'); // 체크된 input의 부모 tr을 선택
	    var tableData = [];
	    
	    if (tableRows.length == 0){
	    	return null;
	    } else{
		    tableRows.each(function() {
		        var row = $(this); // 현재 처리 중인 행을 jQuery 객체로 가져옴
		        var goods_num = row.find('td:eq(0)').text().trim(); // 상품 번호 가져오기
		        var goods_qty = row.find('td:eq(4) input').val(); // 상품 이름 가져오기
		        
		        // JSON 객체로 데이터 구성
		        var rowData = {
		            goods_num: goods_num,
		            goods_qty: goods_qty,
		        };
		        
		        tableData.push(rowData); // 배열에 JSON 객체 추가
		    });
		    
		    var tableDataJSON = JSON.stringify(tableData);
			
		    // 배열을 JSON 문자열로 변환하여 출력
		    console.log(tableDataJSON);
		    
		    return tableData;
	    }
	}
	
	function checkedData() {
		var checkedRows = $('#exampleModal3 tbody input[type="checkbox"]:checked').closest('tr'); // 체크된 input의 부모 tr을 선택
	    var checkedData = [];
	    
	    checkedRows.each(function() {
	        var row = $(this); // 현재 처리 중인 행을 jQuery 객체로 가져옴
	        var goods_num = row.find('td:eq(0)').text().trim(); // 상품 번호 가져오기
	        var goods_name = row.find('td:eq(1)').text().trim(); // 상품 이름 가져오기
	        var goods_size = row.find('td:eq(2)').text().trim(); // 상품 이름 가져오기
	        var goods_color = row.find('td:eq(3)').text().trim(); // 상품 이름 가져오기
	        
	        // JSON 객체로 데이터 구성
	        var rowData = {
	            goods_num: goods_num,
	            goods_name: goods_name,
	            goods_size: goods_size,
	            goods_color: goods_color
	        };
	        
	        checkedData.push(rowData); // 배열에 JSON 객체 추가
	    });
	    
	    var checkedDataJSON = JSON.stringify(checkedData);

	    // 배열을 JSON 문자열로 변환하여 출력
	    console.log(checkedDataJSON);
	    
	    $('.item-table tbody tr').remove();
	    
	    addRow(JSON.parse(checkedDataJSON));
        
		// Modal 닫기 (Optional)
        var modal = document.getElementById('exampleModal3');
        var modalInstance = coreui.Modal.getInstance(modal);
        modalInstance.hide();
	    
	}
	
	function addRow(data) {
	    var cnt = 1;
	    
	    data.forEach(function(item, idx){
			console.log(item);
			
			var row ='<tr id="row'+ cnt +'">'+
			'<td> <div id="goods-num'+ cnt +'" name="goods_num">'+ item.goods_num +
			'</div></td>'+
			'<td><div id="goods-name'+ cnt +'">'+ item.goods_name +
			'</div></td>'+
			'<td><div id="goods_size'+ cnt +'">'+ item.goods_size +
			'</div></td>'+
			'<td><div id="goods_color'+ cnt +'">'+ item.goods_color +
			'</div></td>'+
			'<td><div>'+
			'<input type="text" id="goods-qty'+ cnt +'" class="form-control form-control-sm" name="goods_qty" required>'+
			'</div></td>'+
			'</tr>';
			
			$('.item-table tbody').append(row);
			cnt++;
		
		});
           
	}
	

    
</script>

<%@ include file="../include/footer.jsp" %>
</html>
