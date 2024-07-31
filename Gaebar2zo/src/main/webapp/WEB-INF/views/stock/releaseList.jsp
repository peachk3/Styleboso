<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

    <style>
        .status-buttons { display: none; }
        .modal-dialog { max-width: 80%; }
        .search-container { display: flex; margin-bottom: 20px; }
        .search-group { display: flex; align-items: center; }
        .table-container { margin-top: 20px; }
    </style>


<body>
	<h1>/Styleboso/stock/releaseList.jsp</h1>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<input type="button" class="btn btn-primary" value="등록" onclick="location.href='/stock/releaseAdd'">
		<input type="button" id="deleteItemBtn" name="deleteItemBtn" class="btn btn-primary" value="삭제">
	</div>

<table class="table table-hover">
     	<thead>
    <tr>
        <td>
			<div class="form-check">
      			<input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
       		</div>
        </td>
        <td scope="col">출고번호</td>
        <td scope="col">품목코드</td>
        <td scope="col">품목명</td>
        <td scope="col">출고 수량</td>
        <td scope="col">출고일</td>
        <td scope="col">거래 번호</td>
        <td scope="col">재고 번호</td>
        <td scope="col">비고</td>
        <td scope="col">상태</td>
    </tr>
	</thead>
	<tbody>
    <c:forEach var="rs" items="${rs}">
        <c:forEach var="item" items="${rs.itemList}" varStatus="rsStatus">
            <tr>
                    <td>
              			<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckdefault${item.item_num }"> 
               			</div>
                    </td>
                <c:forEach var="inchange" items="${rs.inchangeList}">
                    <td class="clickable-cell">${rs.tran_num}</td>
                    <td class="clickable-cell">${item.item_num}</td>
                    <td class="clickable-cell">${item.item_name}</td>
                    <c:forEach var="goods" items="${item.tranGoodsList}">
                        <td class="clickable-cell">${goods.goods_qty}</td>
                        <td class="clickable-cell">${rs.rel_date}</td>
                        <td class="clickable-cell">${rs.top_tran_num}</td>
                        <td class="clickable-cell">${inchange.inven_num}</td>
                        <td class="clickable-cell">${rs.comm}</td>
                        <td class="clickable-cell">${rs.pro_status}</td>
                    </c:forEach>
                </c:forEach>
            </tr>
        </c:forEach>
    </c:forEach>
   </tbody>
</table>







<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">주문 리스트</h5>
                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="search-container">
                    <div class="col-md-6">
                        <label for="validationCustom01" class="form-label">발주리스트</label>
                        <input type="text" class="form-control" id="modal-tran_num" readonly>
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom02" class="form-label">거래처 코드</label>
                        <input type="text" class="form-control" id="modal-cli_num" readonly>
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom03" class="form-label">거래처 명</label>
                        <input type="text" class="form-control" id="modal-cli_name" readonly>
                    </div>
                </div>
                <div class="search-container">
                    <div class="col-md-6">
                        <label for="validationCustom04" class="form-label">출고 예정일</label>
                        <input type="date" class="form-control" id="modal-rel_date" required>
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom05" class="form-label">담당자 아이디</label>
                        <input type="text" class="form-control" id="modal-pic_username" readonly>
                    </div>
                    <div class="col-md-3">
                        <label for="validationCustom06" class="form-label">담당자 명</label>
                        <input type="text" class="form-control" id="modal-user_per_name" readonly>
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



<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>
<script>

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
    // Add click event listener to the cells
    $(".clickable-cell").click(function() {
        var tran_num = $(this).closest("tr").find("td:nth-child(2)").text();
        
        $.ajax({
            url: '/stock/getTransactionDetails2',
            type: 'GET',
            data: { tran_num: tran_num },
            dataType: "json",
            success: function(response) {
           	  $("#modal-tran_num").val(response.top_tran_num);
           	    $("#modal-cli_num").val(response.cli_num);
           	    $("#modal-cli_name").val(response.cli_name);
           	    $("#modal-rel_date").val(formatDateForInput(response.rel_date)); 
           	    $("#modal-pic_username").val(response.pic_username);
           	    $("#modal-user_per_name").val(response.user_per_name);
           	    
           	    $("#exampleModal1").modal("show");
            },
            error: function() {
                alert('Failed to fetch transaction details.');
            }
        });
    });

    // Show/hide status buttons
    $("#statusChangeBtn").click(function() {
        $(".status-buttons").toggle();
    });
    
	$("#deleteItemBtn").click(function(){
		
		const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
       	console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const item_nums = [];
	
        checkedCheckboxes.each(function() {
        	const item_num = $(this).closest('tr').find('td:eq(1)').text();
        	if (item_num) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 item_num:", item_num);
                item_nums.push(item_num);
            }
        });
        
     // 중복 제거
        const uniqueItemNums = [...new Set(item_nums)];
     
        console.log("최종 item_nums 배열:", item_nums);
        
        if (item_nums.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
	
        if (confirm('선택한 ' + item_nums.length + '개의 항목을 삭제하시겠습니까?')) {
    		$.ajax({
    			url: '/stock/deleteRL',
    			beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                 },
    			type: 'POST',
    			contentType: 'application/json',
                data: JSON.stringify({ item_nums: item_nums }),
                success: function(response) {
                    // Handle success, e.g., reload the page or show a message
                    location.reload();
                    alert("삭제 완료 되었습니다");
                },
                error: function(xhr, status, error) {
                    // Handle error
                    alert("An error occurred: " + error);
                }
            });
    		
          } //if
          
	}); // 버튼
    
    
});	
    
    
</script>
