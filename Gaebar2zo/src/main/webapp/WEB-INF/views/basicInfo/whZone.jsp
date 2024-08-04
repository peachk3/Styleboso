<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<style>
	.section {
		width: 400px;
		height: 250px;
		margin: 10px;
		padding: 20px;
		text-align: center;
		line-height: 100px;
		border: 1px solid #000;
		cursor: pointer;
	}
	.rack {
		width: 100px;
		height: 100px;
		margin: 10px;
		padding: 20px;
		text-align: center;
		line-height: 100px;
		border: 1px solid #000;
		cursor: pointer;
		background-color: lightblue;
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
		background-color: lightyellow;
	}
</style>
<body>


	<div class="section sectionA" data-wh_zone="A" class="sectionA" id="section">
        Section A
    </div>
    <div class="section sectionB" data-wh_zone="B" class="sectionB" id="section">
        Section B
    </div>
    <div class="section sectionC"  data-wh_zone="C" class="sectionC" id="section">
        Section C
    </div>
    <div class="section sectionD" data-wh_zone="D" class="sectionD" id="section">
        Section D
    </div>
    
    
<!-- 창고 모달 -->
<div class="modal fade" id="exampleModalToggle1" data-coreui-backdrop="static" data-coreui-keyboard="false" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
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
                            <th></th>
                            <th>창고 이름</th>
                            <th>창고 구역</th>
                            <th>창고 렉</th>
                            <th>창고 열</th>
                            <th>창고 행</th>
                            <th>창고 코드</th>
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

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>

<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

//구역 선택시 해당 구역의 렉... 등 정보 나옴
$(".section").click(function() {
	var wh_code = $(this).data("wh_code");
    var wh_zone = $(this).data("wh_zone");
    alert('wh num ' + wh_code + wh_zone);

    $.ajax({
        url: '/basicInfo/whZoneList',
        type: 'GET',
        data: { wh_code, wh_zone },
        dataType: "json",
        success: function(response) {
            console.log(response);
            // 기존 테이블 내용 비우기
            var tableBody = $('#exampleModalToggle1 .modal-body table tbody');
            tableBody.empty();

         // 응답이 배열인지 확인
            if (Array.isArray(response) && response.length) {
                $.each(response, function(index, whCode) {
                	const row = $('<tr></tr>');
                    
                    row.append('<td><input type="checkbox"></td>');
                    row.append('<td>' + (whCode.wh_name || '') + '</td>');
                    row.append('<td>' + (whCode.wh_zone || '') + '</td>');
                    row.append('<td>' + (whCode.wh_rack || '') + '</td>');
                    row.append('<td>' + (whCode.wh_row || '') + '</td>');
                    row.append('<td>' + (whCode.wh_column || '') + '</td>');
                    row.append('<td>' + (whCode.wh_code || '') + '</td>');

                    tableBody.append(row);
                });
                }else {
                    tableBody.append('<tr><td colspan="4">No data available</td></tr>');
                }

            // 모달 표시
            $('#exampleModalToggle1').modal('show');
        }, //success
        error: function(xhr, status, error) {
            console.error("AJAX 오류: ", status, error);
        } //error
	});	// ajax

}); // click.function

</script>


<%@ include file="../include/footer.jsp"%>
</html>