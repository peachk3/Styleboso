<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
<div class="container-lg px-4">
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
					<div class="card-body">
						<form class="row g-3 needs-validation" action="/stock/receivingAdd" method="post" novalidate>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">			
						
							<div class="col-md-6">
								<label for="validationCustom01" class="form-label">거래 리스트</label>
									<input type="text" class="form-control" id="validationCustom01" name="tran_num"
										   data-coreui-toggle="modal" data-coreui-target="#exampleModal0" required>
								<div class="invalid-feedback">거래 리스트를 입력해주세요</div>
							</div>

							<div class="col-md-3">
								<label for="validationCustom03" class="form-label">거래처 번호</label>
									<input type="text" class="form-control" id="validationCustom03" name="cli_num" required>
								<div class="invalid-feedback">거래처를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom04" class="form-label">거래처명</label>
									<input type="text" class="form-control" id="validationCustom04" required>
							</div>
							<div class="col-md-6">
								<label for="validationCustom02" class="form-label">입고 예정일</label> 
									<input type="date" class="form-control" name="tran_date"
									id="validationCustom02" required>
								<div class="invalid-feedback">입고 예정일을 입력해주세요</div>
							</div>
							
							<div class="col-md-3">
								<label for="validationCustom05" class="form-label">담당자 아이디</label>
									<input type="text" class="form-control" id="validationCustom05" name="pic_username" required>
								<div class="invalid-feedback">담당자를 입력해주세요</div>
							</div>
							<div class="col-md-3">
								<label for="validationCustom06" class="form-label">담당자명</label>
									<input type="text" class="form-control" id="validationCustom06" required>
							</div>
							<div class="col-12">
								<label for="validationCustom07" class="form-label">비고</label>
									<input type="text" class="form-control" id="validationCustom07" name="comm">
							</div>
							
						<div class="example">
							<div class="tab-content rounded-bottom">

							<ul class="nav nav-underline-border" role="tablist">
							</ul>
								<table class="table item-table text-left">
									<thead class="table-light">
										<tr>
											<th scope="col" style="width:25%">제품번호</th>
											<th scope="col" style="width:25%">제품명</th>
											<th scope="col" style="width:12%"></th>
											<th scope="col" style="width:12%"></th>
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
						
						
						<!-- Modal0 -->
						<div class="modal fade" id="exampleModal0" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">거래 리스트</h5>
										<button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="table table-hover text-center" id="modal0-table">
											<thead class="table-light">
												<tr>
													<th scope="col"></th>
													<th scope="col">거래 번호</th>
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
									</div>
								</div>
							</div>
					</div>
				</div>
   

    <h1>/Styleboso/stock/receivingAdd.jsp</h1>
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
function formatDateForInput(dateStr) {
    if (!dateStr) return '';
    var date = new Date(dateStr);
    return date.toISOString().split('T')[0];
}


	const token = $("meta[name='_csrf']").attr("content")
	const header = $("meta[name='_csrf_header']").attr("content");
	const name = $("#userName").val();
   
   document.addEventListener('DOMContentLoaded', function() {
		
		const form = document.querySelector('.needs-validation');
		const submitFormBtn = document.getElementById('submitFormBtn');
   
		submitFormBtn.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 제출 동작 방지
			
			console.log(document.getElementById('validationCustom01').value);
			console.log(document.getElementById('validationCustom02').value);
			
			const formData = {
					tran_num: String(document.getElementById('validationCustom01').value),
					tran_date: String(document.getElementById('validationCustom02').value),
					cli_num: document.getElementById('validationCustom03').value,
					pic_username: document.getElementById('validationCustom05').value,
					tran_cate_code: "SO",
			        comm: document.getElementById('validationCustom07').value
		    };
			
			const tableData = dataChangeJSON();
			
			
			// 필요한 유효성 검사를 적용할 모든 폼을 가져오기
			const forms = document.querySelectorAll('.needs-validation');
			
			// 모든 폼이 유효성 검사를 통과했는지 여부를 저장하는 변수
			let allFormsValid = true; 
			
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
                    url: '/stock/receivingAdd', // 요청을 보낼 URL
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
                        window.location.href = 'http://localhost:8088/stock/receivingList';
                    },
                    error: function(error) {
                        console.error('에러 발생:', error);
                    }
                });
				
		    }
         
       });

		
		
		
	    $('#modal0-table tbody').on('click', 'tr', function() {
	          var targetInput1 = document.getElementById('validationCustom01');
	          var tranList = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래리스트)

	          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
	          targetInput1.value = tranList;
	      
	          // Modal 닫기 (Optional)
	          var modal = document.getElementById('exampleModal0');
	          var modalInstance = coreui.Modal.getInstance(modal);
	          modalInstance.hide();
	      });
		
      
      
	 getTransactionList();
      
	    function getTransactionList() {
	        // 기존 테이블 내용을 비웁니다
	        $('#modal0-table tbody tr').remove();
	        
	        // AJAX 요청으로 거래 리스트를 가져옵니다
	        $.ajax({
	            url: "/common/transactionList",
	            type: "get",
	            contentType: 'application/json; charset=utf-8',
	            dataType: "json",
	            success: function(data) {
	                // 성공적으로 데이터를 받아오면 테이블에 추가합니다
	                console.log(data);
	                data.forEach(function(item, idx) {
	                    console.log(idx);
	                    var row = "<tr><th scope='row'>" + (parseInt(idx) + 1) + "</th><td>" + item.tran_num + "</td></tr>";
	                    $('#modal0-table tbody').append(row);
	                });
	                
	                // 테이블 행 클릭 이벤트를 설정합니다
	                $('#modal0-table tbody tr').on('click', function() {
	                    var targetInput1 = document.getElementById('validationCustom01');
	                    var tranList = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래리스트)
	                    
	                    // 거래 번호 설정
	                    targetInput1.value = tranList;

	                    // 거래 상세 정보를 가져와서 폼에 채우기
	                    $.ajax({
	                        url: '/common/transactionDetails',
	                        type: 'GET',
	                        data: { tran_num: tranList },
	                        contentType: 'application/json; charset=utf-8',
	                        dataType: 'json',
	                        success: function(data) {
	                            // 거래 상세 정보 채우기
	                            document.getElementById('validationCustom03').value = data.tranDetails.cli_num;
	                            document.getElementById('validationCustom04').value = data.tranDetails.clientList[0].cli_name;
// 	                            document.getElementById('validationCustom02').value = data.tranDetails.rec_date;
	                            document.getElementById('validationCustom02').value = formatDateForInput(data.tranDetails.rec_date);
	                            document.getElementById('validationCustom05').value = data.tranDetails.pic_username;
	                            document.getElementById('validationCustom06').value = data.tranDetails.userList[0].user_per_name;

	                            // 거래 제품 정보 채우기
	                            var tableBody = $('#tableBody');
	                            tableBody.empty(); // 기존 테이블 내용 비우기
	                            data.tranGoods.forEach(function(item) {
	                                var row = '<tr>' +
	                                    '<td>' + item.goods_num + '</td>' +
	                                    '<td>' + item.itemList[0].item_name + '</td>' +
	                                    '<td></td>' +
	                                    '<td></td>' +
	                                    '<td>' + item.goods_qty + '</td>' +
	                                    '</tr>';
	                                tableBody.append(row);
	                            });
	                            
// 	                            $(객체).each(function(idx,item){
	                            	
	                            	
// 	                            });
	                        },
	                        error: function(jqXHR, textStatus, errorThrown) {
	                            console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
	                            alert("AJAX 요청 실패!");
	                        }
	                    });

	                    // Modal 닫기
	                    var modal = document.getElementById('exampleModal0');
	                    var modalInstance = coreui.Modal.getInstance(modal);
	                    modalInstance.hide();
	                });
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                // 요청이 실패한 경우 로그를 남기고 알림을 표시합니다
	                console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
	                alert("AJAX 요청 실패!");
	            }
	        });
	    } 
      
      

      
      
   });
   
	function dataChangeJSON() {
		var tableRows = $('.item-table tbody tr'); // 체크된 input의 부모 tr을 선택
	    var tableData = [];
	    
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
			'<td><div>'+
			'</tr>';
			
			$('.item-table tbody').append(row);
			cnt++;
		
		});
           
	}
	

    
</script>

<%@ include file="../include/footer.jsp" %>
</html>