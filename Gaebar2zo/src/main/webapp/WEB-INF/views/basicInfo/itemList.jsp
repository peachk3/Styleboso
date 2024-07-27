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
               		<td class="clickable-cell">${itl.item_num }</td>
               		<td class="clickable-cell">${itl.item_cli_code }</td>
               		<td class="clickable-cell">${itl.item_name }</td>
               		<td class="clickable-cell">${itl.group_name }</td>
               		<td class="clickable-cell">${itl.item_purchase_price }</td>
               		<td class="clickable-cell">${itl.item_sale_price }</td>
               		<td class="clickable-cell">${itl.item_mat }</td>
               		<td class="clickable-cell">${itl.comm }</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
	


<!-- 상세보기 모달창-->
<div class="modal fade" id="exampleModalToggle" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    	<div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"> 품목 상세 보기 </h5>
                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="needs-validation" id="fm1" novalidate>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td><label for="validationCustom01" class="form-label">품목 코드</label></td>
                                <td><input type="text" class="form-control" id="item_num" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom02" class="form-label">품목명</label></td>
                                <td><input type="text" class="form-control" id="item_name" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom02" class="form-label">거래처 코드</label></td>
                                <td><input type="text" class="form-control" id="item_cli_code" readonly></td>
                            </tr>
                           	<tr>
                                <td><label for="validationCustom03" class="form-label"> 대분류 제품 유형 </label></td>
                                <td>
								<select class="form-select" id="m_cate_item_code" name="m_cate_item_code" aria-label="Default select example" required>
									<option value="0"> 제품 유형을 선택하세요 </option>
									<option value="IT" id="m_cate_item_code"> 상의 </option>
									<option value="IB" id="m_cate_item_code"> 하의 </option>
									<option value="IO" id="m_cate_item_code"> 아우터 </option>
									<option value="IS" id="m_cate_item_code"> 원피스/스커트 </option>
								</select>
								</td>
                            </tr>
                            <tr>
                            	<td><label for="validationCustom03" class="form-label"> 소분류 제품 유형 </label></td>
                            	<td>
                            	<select class="form-select" id="item_cate_code" name="item_cate_code" aria-label="Default select example" required>
									<option value="0"> 소분류 제품 유형을 선택하세요 </option>
								</select>
								</td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">재질</label></td>
                                <td><input type="text" class="form-control" id="item_mat" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">매입 단가</label></td>
                                <td><input type="text" class="form-control" id="item_purchase_price" readonly></td>
                            </tr>
                            <tr>    
                                <td><label for="validationCustom03" class="form-label">매출 단가</label></td>
                                <td><input type="text" class="form-control" id="item_sale_price" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">비고</label></td>
                                <td><input type="text" class="form-control" id="comm" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="editButton">수정</button>
                <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">저장</button>
                <button type="button" class="btn btn-success" id="saveCancelButton" style="display: none;">취소</button>
                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
            </div>
        </div>
    
   	</div>
</div>

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
	
	// 상세보기
	 $(".clickable-cell").click(function() {
	        var item_num = $(this).closest("tr").find("td:nth-child(2)").text();
	        currentItemNum = item_num;
	        
	        $.ajax({
	            url: '/basicInfo/itemDetails',
	            type: 'GET',
	            data: { item_num: item_num },
	            dataType: "json",
	            success: function(response) {
	                console.log(response);  // 응답 데이터 확인
	                
	                if (response.length > 0) {
	                    var item = response[0];
	                    console.log(item);  // 클라이언트 데이터 확인
	                
	                // 각 요소에 값을 설정
	                $("#item_num").val(item.item_num);
	                $("#item_cli_code").val(item.item_cli_code);
	                $("#item_name").val(item.item_name);
	                $("#group_name").val(item.group_name);
	                $("#item_purchase_price").val(item.item_purchase_price);
	                $("#item_sale_price").val(item.item_sale_price);
	                $("#item_mat").val(item.item_mat);
	                $("#comm").val(item.comm);
	                
// 		             // 모든 입력 필드를 읽기 전용으로 설정
// 	                    $("#exampleModalToggle input").attr('readonly', true);
// 	                    $("#exampleModalToggle input[type=radio]").prop('disabled', true);
// 	                    $("#validationCustom05, #validationCustom06").attr('disabled', true);

// 	                    // 수정 버튼 보이기, 저장 및 취소 버튼 숨기기
// 	                    $("#editButton").show();
// 	                    $("#saveButton, #saveCancelButton, #postCodeButton").hide();
	                
// 		             	// 원래 값을 저장
// 	                    originalValues = {
// 	                        cli_num: client.cli_num,
// 	                        cli_name: client.cli_name,
// 	                        cli_crn: client.cli_crn,
// 	                        cli_cate: client.cli_cate,
// 	                        cli_ind: client.cli_ind,
// 	                        cli_postCode: client.cli_postCode,
// 	                        cli_add1: client.cli_add1,
// 	                        cli_add2: client.cli_add2,
// 	                        cli_add3: client.cli_add3,
// 	                        cli_tel: client.cli_tel,
// 	                        cli_rep: client.cli_rep,
// 	                        cli_email: client.cli_email,
// 	                        pic_username: client.pic_username,
// 	                        user_per_name: client.usersList[0].user_per_name
// 	                    };
		             	
	                	$("#exampleModalToggle").modal("show");
	                }
	            },
	            error: function() {
	            	console.log(error);
	                alert('Failed to fetch transaction details.');
	            }
	        });
	 	 });
	
	
	// 수정 버튼 
	    $("#editButton").click(function(event) {
	    	event.preventDefault();
	    	
	    	// 선택된 클라이언트의 입력 필드만 수정 가능하게 변경
	       	//$("#exampleModalToggle input").removeAttr('readonly'); // 전체 readonly 해제
	    	$("#exampleModalToggle input:not(#item_num)").removeAttr('readonly');
	    	
	        $(this).hide();
	        $("#postCodeButton").show();
	        $("#saveButton").show();
	        $("#postCodeButton").prop("disabled", false);
	        $("#saveCancelButton").show();
	        
	        saveOriginalValues(); // 수정 모드로 전환할 때 원래 값 저장
	    });

	
	
	
});	
	
	
</script>

<%@ include file="../include/footer.jsp" %>

</html>