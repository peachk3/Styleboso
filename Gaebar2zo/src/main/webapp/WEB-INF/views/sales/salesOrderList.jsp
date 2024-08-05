<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

    <style>
        .status-buttons { display: none; }
        .modal-dialog { max-width: 80%; }
        .search-container { display: flex; margin-bottom: 20px; }
        .search-group { display: flex; align-items: center; }
        .table-container { margin-top: 20px; }
    </style>
    
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>
    
</head>

<body>
	<h1>/sales/salesOrderList.jsp</h1>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
        <input type="button" class="btn btn-primary" value="등록" onclick="location.href='/sales/salesOrderAdd'">
        <input type="button" id="deleteItemBtn" name="deleteItemBtn" class="btn btn-primary" value="삭제">
    </div>
    
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="selectAll" onclick="toggleCheckboxes(this)"> 
                </div>
            </th>
            <th scope="col">수주번호</th>
            <th scope="col">거래처 명</th>
            <th scope="col">수주일자</th>
            <th scope="col">출고일자</th>
            <th scope="col">납기일자</th>
            <th scope="col">거래 금액</th>
            <th scope="col">담당자 명</th>
            <th scope="col">상태</th>
        </tr>
        </thead>
        <tbody>
	        <c:forEach var="so" items="${so}">
	            <tr data-tran-num="${so.tran_num}">
	                <td><div class="form-check">
	                        <input class="form-check-input" type="checkbox" value="${so.tran_num}" id="${so.tran_num}"> 
	                </div></td>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.tran_num}</td>
            <c:forEach var="cli" items="${so.clientList}">
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${cli.cli_name}</td>
	        </c:forEach>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.tran_date}</td>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.rel_date}</td>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.due_date}</td>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.income}</td>
            <c:forEach var="user" items="${so.userList}">
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${user.user_per_name}</td>
	        </c:forEach>
	                <td class="clickable-cell" data-coreui-toggle="modal" data-coreui-target="#soInfoModal">${so.pro_status}</td>
	            </tr>
	        </c:forEach>
        </tbody>
    </table>

    <div class="container mt-3">
        <button id="statusChangeBtn" class="btn btn-outline-info">상태 변경</button>
        <div class="status-buttons mt-2">
            <button class="btn btn-outline-info" id="preReceiveBtn">수주 접수</button>
            <button class="btn btn-outline-info" id="completedReceiveBtn">입고 완료</button>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="soInfoModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">수주 상세정보</h5>
                    <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
					<div class="row g-3">
						<div class="col-12">
							<label for="soInfo01" class="form-label">수주번호</label>
								<input type="text" class="form-control" id="tran_num" name="tran_num" readonly>
						</div>
						<div class="col-md-6">
							<label for="soInfo02" class="form-label">수주일자</label> 
								<input type="text" class="form-control" id="tran_date" name="tran_date" readonly>
						</div>
						<div class="col-md-6">
							<label for="soInfo03" class="form-label">출고일자</label> 
								<input type="text" class="form-control" id="rel_date" name="rel_date" readonly>
						</div>
						<div class="col-md-6">
							<label for="soInfo04" class="form-label">납기예정 일자</label> 
								<input type="text" class="form-control" id="ex_due_date" name="ex_due_date" readonly>
						</div>
						<div class="col-md-6">
							<label for="soInfo05" class="form-label">납기일자</label> 
								<input type="text" class="form-control" id="due_date" name="due_date" readonly>
						</div>
						<div class="col-md-3">
							<label for="soInfo06" class="form-label">거래처 번호</label>
								<input type="text" class="form-control" id="cli_num" name="cli_num" readonly>
						</div>
						<div class="col-md-3">
							<label for="soInfo07" class="form-label">거래처명</label>
								<input type="text" class="form-control" id="cli_name" readonly>
						</div>
						<div class="col-md-3">
							<label for="soInfo08" class="form-label">담당자 아이디</label>
								<input type="text" class="form-control" id="pic_username" name="pic_username" readonly>
						</div>
						<div class="col-md-3">
							<label for="soInfo09" class="form-label">담당자명</label>
								<input type="text" class="form-control" id="user_per_name" readonly>
						</div>
						<div class="col-12">
							<label for="soInfo10" class="form-label">비고</label>
								<input type="text" class="form-control" id="comm" name="comm" readonly>
						</div>
						
						<div class="example">
							<ul class="nav nav-underline-border" role="tablist"></ul>
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
</body>
</html>

<script>

const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"].form-check-input');
    checkboxes.forEach(checkbox => checkbox.checked = source.checked);
}

function formatDateForInput(dateStr) {
    if (!dateStr) return '';
    var date = new Date(dateStr);
    return date.toISOString().split('T')[0];
}

$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    $('td[data-coreui-toggle="modal"]').on('click', function() {
        var tran_num = $(this).closest('tr').data('tran-num');
        console.log(tran_num);

        $.ajax({
            type: 'POST',               // 요청 방식
            url: '/sales/salesOrderInfo',  // AJAX 요청을 보낼 URL
            beforeSend: function(xhr) {
            	xhr.setRequestHeader(header, token);
            },
            contentType: 'application/json; charset=utf-8', // 데이터 형식
            data: tran_num, // 전송할 데이터
            dataType: "json",
            success: function(response) {
                console.log('성공:', response);
                
                $('.item-table tbody tr').remove();
                response.forEach(function(item, idx){
                	document.getElementById('tran_num').value = item.tran_num;
                	document.getElementById('tran_date').value = timestampToDateString(item.tran_date);
                	document.getElementById('rel_date').value = timestampToDateString(item.rel_date);
                	document.getElementById('ex_due_date').value = timestampToDateString(item.ex_due_date);
                	document.getElementById('due_date').value = timestampToDateString(item.due_date);
                	document.getElementById('cli_num').value = item.cli_num;
                	document.getElementById('cli_name').value = item.clientList[0].cli_name;
                	document.getElementById('pic_username').value = item.userList[0].username;
                	document.getElementById('user_per_name').value = item.userList[0].user_per_name;
                	document.getElementById('comm').value = item.comm;
	        	    addRow(item.itemList);
                   
                });
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error);
                // 에러 시 처리할 내용
            }
        });
    });
    
    function addRow(data) {
	    var cnt = 1;
	    
	    data.forEach(function(item, idx){
			var row ='<tr id="row'+ cnt +'">'+
			'<td> <div id="goods-num'+ cnt +'" name="goods_num">'+ item.goodsList[0].goods_num+
			'</div></td>'+
			'<td><div id="goods-name'+ cnt +'">'+ item.item_name +
			'</div></td>'+
			'<td><div id="goods_size'+ cnt +'">'+ item.goodsList[0].goods_size +
			'</div></td>'+
			'<td><div id="goods_color'+ cnt +'">'+ item.goodsList[0].goods_color +
			'</div></td>'+
			'<td><div id="goods_qty'+ cnt +'">'+ item.tranGoodsList[0].goods_qty +
			'</tr>';
			
			$('.item-table tbody').append(row);
			cnt++;
		
		});
           
	}
    
    function timestampToDateString(timestamp) {
    	if(timestamp == null) {
	        return "``";
    	} else {
	        var date = new Date(parseInt(timestamp)); // 밀리초 단위로 변환
	        var year = date.getFullYear();
	        var month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
	        var day = String(date.getDate()).padStart(2, '0'); // 날짜는 1부터 시작
	        
	        return year +'-'+ month +'-'+ day; // YYYY-MM-DD 형식
    	}
    }

    $("#statusChangeBtn").click(function() {
        $(".status-buttons").toggle();
    });

    $(".status-buttons .btn").click(function() {
        const pro_status = $(this).text().trim(); // "입고 예정" 혹은 "입고 완료" 버튼의 텍스트를 상태로 사용

        const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
        const tran_nums = [];

        checkedCheckboxes.each(function() {
            const tran_num = $(this).closest('tr').find('td:eq(1)').text(); // Assuming tran_num is in the first column
            if (tran_num) {
                tran_nums.push(tran_num);
            }
        });

        if (tran_nums.length === 0) {
            alert('변경할 항목을 선택해주세요.');
            return;
        }

        $.ajax({
            url: '/common/updateStatus',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ tran_nums: tran_nums, pro_status: pro_status }),
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                location.reload();
                alert("상태가 성공적으로 변경되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
    });

    $("#deleteItemBtn").click(function(){
        const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
        console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const tran_nums = [];

        checkedCheckboxes.each(function() {
            const tran_num = $(this).closest('tr').find('td:eq(1)').text();
            if (tran_num) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 tran_num:", tran_num);
                tran_nums.push(tran_num);
            }
        });
        
        console.log("최종 tran_nums 배열:", tran_nums);
        
        if (tran_nums.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
    
        if (confirm('선택한 ' + tran_nums.length + '개의 항목을 삭제하시겠습니까?')) {
            $.ajax({
                url: '/common/deleteTran',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ tran_num : tran_nums }),
                success: function(response) {
                    location.reload();
                    alert("삭제 완료 되었습니다");
                },
                error: function(xhr) {
                    // 서버에서 반환된 오류 메시지 처리
                    alert(xhr.responseText);  // 오류 메시지 표시
                    location.reload();
                }
            });
        } // if
    }); // 버튼
});  
</script>