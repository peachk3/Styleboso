<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/basicInfo/itemList.jsp</h1>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<input type="button" class="btn btn-primary" value="등록" onclick="location.href='/basicInfo/itemAdd'">
		<input type="button" id="deleteItemBtn" name="deleteItemBtn" class="btn btn-primary" value="삭제">
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"> 
					<div class="form-check">
               			<input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
            		</div>
				</th>
				<th scope="col">품목 코드</th>
				<th scope="col">거래처 코드</th>
				<th scope="col">품목명</th>
				<th scope="col">제품 유형</th>
				<th scope="col">매입 단가 (만 원)</th>
				<th scope="col">매출 단가 (만 원)</th>
				<th scope="col">재질</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="itl" items="${itemList }">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckdefault${itl.item_num }"> 
               			</div>
               		</td>
               		<td>${itl.item_num }</td>
               		<td>${itl.item_cli_code }</td>
               		<td>${itl.item_name }</td>
               		<td>${itl.group_name }</td>
               		<td>${itl.item_purchase_price }</td>
               		<td>${itl.item_sale_price }</td>
               		<td>${itl.item_mat }</td>
               		<td>${itl.comm }</td>
				</tr>	
			</c:forEach>

		</tbody>
	</table>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>

<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

// 전체 선택
function toggleCheckboxes(source) {
    const checkboxes = document.getElementsByClassName('form-check-input');
    for (let checkbox of checkboxes) {
        checkbox.checked = source.checked;
    }
}

$(document).ready(function(){
	// 삭제
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
    			url: '/basicInfo/deleteItem',
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

<%@ include file="../include/footer.jsp" %>

</html>