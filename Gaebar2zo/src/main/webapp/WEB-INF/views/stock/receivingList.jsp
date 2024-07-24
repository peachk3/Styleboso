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
    <h1>/Styleboso/stock/receivingList.jsp</h1>

    <table class="table table-hover">
        <tr>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled>
                    <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
                </div>
            </td>
            <td>입고번호</td>
            <td>품목코드</td>
            <td>품목명</td>
            <td>입고 수량</td>
            <td>입고일</td>
            <td>거래 번호</td>
            <td>재고 번호</td>
            <td>비고</td>
            <td>상태</td>
        </tr>

        <c:forEach var="rc" items="${rc}">
            <c:forEach var="item" items="${rc.itemList}"  varStatus="rcStatus">
                <tr>
                    <c:forEach var="inchange" items="${rc.inchangeList}">
                        <td>
                            <label class="form-check-label" for="flexCheckDefault${rcStatus.index}">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${rcStatus.index}">
                                Default checkbox
                            </label>
                        </td>
                        <td class="clickable-cell">${rc.tran_num}</td>
                        <td class="clickable-cell">${item.item_num}</td>
                        <td class="clickable-cell">${item.item_name}</td>
                        <c:forEach var="goods" items="${item.tranGoodsList}">
                            <td class="clickable-cell">${goods.goods_qty}</td>
                            <td class="clickable-cell">${rc.rec_date}</td>
                            <td class="clickable-cell">${rc.top_tran_num}</td>
                            <td class="clickable-cell">${inchange.inven_num}</td>
                            <td class="clickable-cell">${rc.comm}</td>
                            <td class="clickable-cell">${rc.pro_status}</td>
                        </c:forEach>
                    </c:forEach>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>

    <div>
        <button id="addRowBtn" class="btn btn-outline-info" type="button" onclick="location.href='/stock/releaseAdd'">입고 등록</button>
    </div>

    <div class="container mt-3">
        <button id="statusChangeBtn" class="btn btn-outline-info">상태 변경</button>
        <div class="status-buttons mt-2">
            <button class="btn btn-outline-info">입고 예정</button>
            <button class="btn btn-outline-info">입고 완료</button>
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
                            <label for="validationCustom04" class="form-label">입고 예정일</label>
                            <input type="date" class="form-control" id="modal-rec_date" required>
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

<script>
function formatDate(dateStr) {
    // Date 객체로 변환
    var date = new Date(dateStr);
    // YYYY-MM-DD 형식으로 변환
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}
$(document).ready(function() {
    // Add click event listener to the cells
    $(".clickable-cell").click(function() {
        var tran_num = $(this).closest("tr").find("td:nth-child(2)").text();
        
        $.ajax({
            url: '/stock/getTransactionDetails',
            type: 'GET',
            data: { tran_num: tran_num },
            dataType: "json",
            success: function(response) {
                console.log(response);  // 응답 데이터 확인
                
                // 각 요소에 값을 설정
                $("#modal-tran_num").val(response.top_tran_num);
                $("#modal-cli_num").val(response.cli_num);
                $("#modal-cli_name").val(response.cli_name);
                $("#modal-rec_date").val(response.rec_date); 
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
});
</script>
