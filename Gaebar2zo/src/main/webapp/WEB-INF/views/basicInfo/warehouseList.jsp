<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

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

<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
	<input class="button btn-primary" type="button" value="등록" onclick="location.href='/basicInfo/warehouseAdd'" class="btn btn-primary">
	<input class="button btn-primary" id="deleteWarehouseBtn" type="button" value="삭제">
</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
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
					<td class="clickable-cell">${whc.m_cate_wh_code }${whc.s_cate_wh_code }</td>
					<td class="clickable-cell">${whc.s_cate_wh_name }</td>
					<td class="clickable-cell">${whc.wh_tel }</td>
					<td class="clickable-cell">${whc.wh_add1 }${whc.wh_add2 }</td>
					<td class="clickable-cell">${whc.wh_man }</td>
					<td class="clickable-cell">
						<c:choose>
							<c:when test="${whc.wh_status == 1 }">사용중</c:when>
				    		<c:otherwise> 사용 중지</c:otherwise>
						</c:choose>
				    </td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>


<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
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
	$("#deleteWarehouseBtn").click(function(){
		
		const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
       	console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const s_cate_wh_codes = [];
		
        checkedCheckboxes.each(function() {
        	const wh_full_code = $(this).closest('tr').find('td:eq(1)').text(); // cli_num이 있는 열의 인덱스에 따라 조정
        	var s_cate_wh_code = wh_full_code.slice(-2);
        	if (s_cate_wh_code) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 wh_codes:", s_cate_wh_code);
                s_cate_wh_codes.push(s_cate_wh_code);
            }
		});
        
     // 중복 제거
        const uniqueWhNums = [...new Set(s_cate_wh_codes)];
        
     	console.log("최종 wh_codes 배열:", s_cate_wh_codes);
        
        if (s_cate_wh_codes.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        
        if (confirm('선택한 ' + s_cate_wh_codes.length + '개의 항목을 삭제하시겠습니까?')) {
		$.ajax({
			url: '/basicInfo/deleteWarehouse',
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
			type: 'POST',
			contentType: 'application/json',
            data: JSON.stringify({ s_cate_wh_codes: s_cate_wh_codes }),
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
		
      } // if
      
	}); 
	
}); // document

</script>


<%@ include file="../include/footer.jsp"%>
</body>
</html>