<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>basicInfo/warehouse.jsp</h1>
	<h1>양산 창고</h1>
	
	<h1>창고 관리</h1>
    <p id="warehouse-name"></p>
	
<!-- <div class="section sectionA" data-wh_num="GPA11A" class="sectionA" > -->
	<div class="section sectionA" data-wh_code="YS" data-wh_zone="A" class="sectionA" id="section">
        Section A
    </div>
    <div class="section sectionB" data-wh_code="YS" data-wh_zone="B" class="sectionB" id="section">
        Section B
    </div>
    <div class="section sectionC" data-wh_code="YS" data-wh_zone="C" class="sectionC" id="section">
        Section C
    </div>
    <div class="section sectionD" data-wh_code="YS" data-wh_zone="D" class="sectionD" id="section">
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


<div class="modal fade" id="exampleModalToggle3" data-coreui-backdrop="static" data-coreui-keyboard="false" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"> 재고 보기</h5>
               <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
                        <div>
<!--             	<select id="rackSelect"> -->
<!-- 	                    <option value="1">Rack 1</option> -->
<!-- 	                    <option value="2">Rack 2</option> -->
<!-- 	                    <option value="3">Rack 3</option> -->
<!-- 	                    <option value="4">Rack 4</option> -->
<!--                 </select> -->
					<div class="rack rack1" data-wr_rack="1" id="rack"> 1번</div>
					<div class="rack rack2" data-wr_rack="2" id="rack"> 2번</div>
					<div class="rack rack3" data-wr_rack="3" id="rack"> 3번</div>
					<div class="rack rack4" data-wr_rack="4" id="rack"> 4번</div>
					
			</div>
            <div class="modal-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th></th>
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


</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>

<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

document.addEventListener('DOMContentLoaded', function() {
    // URL의 쿼리 파라미터를 가져옵니다.
    const urlParams = new URLSearchParams(window.location.search);
    const warehouseName = urlParams.get('wh_code');

    // 'name' 파라미터 값이 존재하면 AJAX 요청을 보냅니다.
    if (warehouseName) {
        $.ajax({
            url: '/basicInfo/warehouse',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ name: warehouseName }),
            success: function(data) {
                $('#warehouse-name').text(data.message);
            },
            error: function(xhr, status, error) {
                $('#warehouse-name').text('서버 오류');
            }
        });
    } else {
        $('#warehouse-name').text('창고 이름이 제공되지 않았습니다.');
    }

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
            var tableBody = $('#exampleModalToggle3 .modal-body table tbody');
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
            $('#exampleModalToggle3').modal('show');
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류: ", status, error);
        }
    });
});


// 구역 선택시 해당 구역의 렉... 등 정보 나옴
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
            // 서버에서 받은 데이터로 테이블 내용 채우기
//             if (response.length) {
//                 $.each(response, function(index, whCode) {
//                     const row = $('<tr></tr>');
//                     row.append('<td><input type="checkbox"></td>');
//                     row.append('<td>' + whCode.wh_name + '</td>');
//                     row.append('<td>' + whCode.wh_zone + '</td>');
//                     row.append('<td>' + whCode.wh_rack + '</td>');
//                     row.append('<td>' + whCode.wh_row + '</td>');
//                     row.append('<td>' + whCode.wh_column + '</td>');
//                     row.append('<td>' + whCode.wh_code + '</td>');
                    
//                     tableBody.append(row);
//                 });
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
});

</script>

<%@ include file="../include/footer.jsp"%>
</html>