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
    <!-- CSRF Meta Tags -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
</head>
<body>
    <h1>/Styleboso/stock/receivingList.jsp</h1>

    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
        <input type="button" class="btn btn-primary" value="등록" onclick="location.href='/stock/receivingAdd'">
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
            <th scope="col">입고번호</th>
            <th scope="col">제품코드</th>
            <th scope="col">품목명</th>
            <th scope="col">입고 수량</th>
            <th scope="col">입고일</th>
            <th scope="col">거래 번호</th>
            <th scope="col">재고 번호</th>
            <th scope="col">비고</th>
            <th scope="col">상태</th>
        </tr>
        </thead>
     <tbody>
    <c:forEach var="rc" items="${rc}">
        <c:forEach var="item" items="${rc.itemList}">
            <c:forEach var="goods" items="${item.tranGoodsList}">
                <tr>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${goods.goods_num}"> 
                        </div>
                    </td>
                    <td class="clickable-cell">${rc.tran_num}</td>
                    <td class="clickable-cell">${goods.goods_num}</td>
                    <td class="clickable-cell">${item.item_name}</td>
                    <td class="clickable-cell">${goods.goods_qty}</td>
                    <td class="clickable-cell">${rc.rec_date}</td>
                    <td class="clickable-cell">${rc.top_tran_num}</td>
                    <td class="clickable-cell">${rc.inchangeList[0].inven_num}</td>
                    <td class="clickable-cell">${rc.comm}</td>
                    <td class="clickable-cell">${rc.pro_status}</td>
                </tr>
            </c:forEach>
        </c:forEach>
    </c:forEach>
</tbody>
    </table>

    <div class="container mt-3">
        <button id="statusChangeBtn" class="btn btn-outline-info">상태 변경</button>
        <div class="status-buttons mt-2">
            <button class="btn btn-outline-info" id="preReceiveBtn">입고 예정</button>
            <button class="btn btn-outline-info" id="completedReceiveBtn">입고 완료</button>
        </div>
    </div>

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
                            <label for="validationCustom01" class="form-label">주문 리스트</label>
                            <input type="text" class="form-control" id="modal-top_tran_num" readonly>
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
                            <label for="validationCustom04" class="form-label">입고 예정일</label>
                            <input type="date" class="form-control" id="modal-tran_date" required>
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
                   <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>제품코드</th>
                                        <th>품목명</th>
                                        <th>수량</th>
                                        <th>상위거래번호</th>
                                        <th>비고</th>
                                        <th>재고 번호</th>
                                        <th>거래 번호</th>
                                    </tr>
                                </thead>
                                <tbody id="modal-table-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
</body>
</html>

<script>
function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"].form-check-input');
    checkboxes.forEach(checkbox => checkbox.checked = source.checked);
}

function formatDateForInput(dateStr) {
    if (!dateStr) return '';
    // 날짜 문자열에서 'T'와 그 이후의 모든 문자를 제거합니다.
    dateStr = dateStr.split('T')[0];
    return dateStr;
}

$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    $(".clickable-cell").click(function() {
        var tran_num = $(this).closest("tr").find("td:nth-child(2)").text();
        var top_tran_num = $(this).closest("tr").find("td:nth-child(7)").text();

        $.ajax({
            url: '/stock/getTransactionDetails',
            type: 'GET',
            data: { 
                tran_num: tran_num,
                top_tran_num: top_tran_num
            },
            dataType: "json",
            success: function(response) {
                console.log("AJAX 응답:", response);
                
                // 기본 거래 정보 설정
                $("#modal-top_tran_num").val(response.top_tran_num);
                $("#modal-cli_num").val(response.cli_num);
                $("#modal-cli_name").val(response.cli_name);
                $("#modal-tran_date").val(formatDateForInput(response.tran_date));
                $("#modal-pic_username").val(response.pic_username);
                $("#modal-user_per_name").val(response.user_per_name);
                
                // 테이블 바디를 비웁니다.
                $("#modal-table-body").empty();
                
                // 품목 정보 행 생성 및 추가
                $(response.items).each(function(idx,item){
                    var row = "<tr><th scope='row'></th><td>" + item.item_num + "</td><td>" 
                    + item.item_name + "</td><td>" + item.goods_qty + "</td><td>" + item.top_tran_num + "</td><td>" 
                    + item.comm + "</td><td>" + item.inven_num + "</td><td>" + item.tran_num + "</td></tr>";
                         
                    $("#modal-table-body").append(row);    
                });

                // 모달을 엽니다.
                $("#exampleModal1").modal("show");
            },
            error: function(error) {
                console.log("에러 발생: ", error);
            }
        });
    });

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
            url: '/common/updateRecevingStatus',
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
        const tran_nums = []; // 여기서 tran_nums를 배열로 선언

        checkedCheckboxes.each(function() {
            const tran_num = $(this).closest('tr').find('td:eq(1)').text();
            if (tran_num) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 tran_num:", tran_num);
                tran_nums.push(tran_num); // tran_nums 배열에 추가
            }
        });
        
        console.log("최종 tran_nums 배열:", tran_nums);
        
        if (tran_nums.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }

        if (confirm('선택한 ' + tran_nums.length + '개의 항목을 삭제하시겠습니까?')) {
            $.ajax({
                url: '/stock/deleteRC',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ tran_nums: tran_nums }),
                success: function(response) {
                    location.reload();
                    alert("삭제 완료 되었습니다");
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 오류:", status, error);
                    alert("An error occurred: " + error);
                }
            });
        }
    });
});  
</script>
