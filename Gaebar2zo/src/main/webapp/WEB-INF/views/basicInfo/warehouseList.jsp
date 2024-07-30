<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
    <style>
        .section {
            width: 200px;
            height: 100px;
            margin: 10px;
            padding: 20px;
            text-align: center;
            line-height: 100px;
            border: 1px solid #000;
            cursor: pointer;
        }
        .sectionA {
            background-color: lightblue;
        }
        .sectionB {
            background-color: lightgreen;
        }
        .sectionC {
            background-color: lightcoral;
        }
        .sectionD {
            background-color: lightcoral;
        }
    </style>
    
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
	
 	<div class="section sectionA" data-wh_num="GPA11A" class="sectionA" >
        Section A
    </div>
    <div class="section sectionB" onclick="handleClick('Section B')">
        Section B
    </div>
    <div class="section sectionC" onclick="handleClick('Section C')">
        Section C
    </div>
    <div class="section sectionD" onclick="handleClick('Section D')">
        Section D
    </div>

<div class="modal fade" id="exampleModalToggle"
    data-coreui-backdrop="static" data-coreui-keyboard="false"
    aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
    tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"> 재고 보기</h5>
               <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>품목코드</th>
                            <th>재고수량</th>
                            <th>창고 이름</th>
                            <th>창고 구역</th>
                            <th>창고 렉</th>
                            <th>창고 열</th>
                            <th>창고 번</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- JavaScript에서 행 삽입 -->
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


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
		}); // function()
        
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
      
	}); // $
	
	$(".sectionA").click(function() {
	    var wh_num = $(this).data("wh_num");
	    alert('WH num ' + wh_num);

	    $.ajax({
	        url: '/basicInfo/whInven',
	        type: 'GET',
	        data: { wh_num: wh_num },
	        dataType: "json",
	        success: function(response) {
	            // 기존 테이블 내용 비우기
	            var tableBody = $('#exampleModalToggle .modal-body table tbody');
	            tableBody.empty();
	            console.log(response);

	            // 서버에서 받은 데이터로 테이블 내용 채우기
	            $.each(response, function(index, item) {
	                var row = $('<tr></tr>');
	                row.append('<td><input type="checkbox"></td>');
	                row.append('<td>' + item.goods_num + '</td>');
	                row.append('<td>' + item.inven_qty + '</td>');

	                if (item.warehouseList && item.warehouseList.length > 0) {
	                    $.each(item.warehouseList, function(index, wh) {
	                        row.append('<td>' + wh.wh_name + '</td>');
	                        row.append('<td>' + wh.wh_zone + '</td>');
	                        row.append('<td>' + wh.wh_rack + '</td>');
	                        row.append('<td>' + wh.wh_row + '</td>');
	                        row.append('<td>' + wh.wh_column + '</td>');
	                    });
	                } else {
	                    // warehouseList가 없거나 빈 경우
	                    row.append('<td colspan="5">정보 없음</td>');
	                }
	                tableBody.append(row);
	            });

	            // 모달 표시
	            $('#exampleModalToggle').modal('show');
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX 오류: ", status, error);
	        }
	    });
	});
	
});

</script>

<%@ include file="../include/footer.jsp"%>
</body>
</html>