<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>




<body>
	<h1>/Styleboso/stock/releaseList.jsp</h1>


<table class="table table-hover">
    <tr>
        <td>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled>
                <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
            </div>
        </td>
        <td>출고번호</td>
        <td>품목코드</td>
        <td>품목명</td>
        <td>출고 수량</td>
        <td>출고일</td>
        <td>거래 번호</td>
        <td>재고 번호</td>
        <td>비고</td>
        <td>상태</td>
    </tr>

    <c:forEach var="rs" items="${rs}" varStatus="rsStatus">
        <c:forEach var="item" items="${rs.itemList}">
            <tr>
                <c:forEach var="inchange" items="${rs.inchangeList}">
                    <td>
                        <label class="form-check-label" for="flexCheckDefault${rsStatus.index}">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${rsStatus.index}">
                            Default checkbox
                        </label>
                    </td>
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
</table>

<div>
    <button id="addRowBtn" class="btn btn-outline-info" type="button" onclick="location.href='/stock/releaseAdd'">출고 등록</button>
</div>

<!-- Modal1 -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">거래처</h5>
                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-hover" id="modal1-table">
                    <tbody>
                        <tr>
                            <th scope="row">출고번호</th>
                            <td id="modal-tran_num"></td>
                        </tr>
                        <tr>
                            <th scope="row">품목코드</th>
                            <td id="modal-item_num"></td>
                        </tr>
                        <tr>
                            <th scope="row">품목명</th>
                            <td id="modal-item_name"></td>
                        </tr>
                        <tr>
                            <th scope="row">출고 수량</th>
                            <td id="modal-goods_qty"></td>
                        </tr>
                        <tr>
                            <th scope="row">출고일</th>
                            <td id="modal-rel_date"></td>
                        </tr>
                        <tr>
                            <th scope="row">거래 번호</th>
                            <td id="modal-top_tran_num"></td>
                        </tr>
                        <tr>
                            <th scope="row">재고 번호</th>
                            <td id="modal-inven_num"></td>
                        </tr>
                        <tr>
                            <th scope="row">비고</th>
                            <td id="modal-comm"></td>
                        </tr>
                        <tr>
                            <th scope="row">상태</th>
                            <td id="modal-pro_status"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
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
    $(document).ready(function() {
        // Add click event listener to the cells
        $(".clickable-cell").click(function() {
            // Get the closest row
            var row = $(this).closest("tr");
            
            // Get the data from the row
            var tran_num = row.find("td:nth-child(2)").text();
            var item_num = row.find("td:nth-child(3)").text();
            var item_name = row.find("td:nth-child(4)").text();
            var goods_qty = row.find("td:nth-child(5)").text();
            var rel_date = row.find("td:nth-child(6)").text();
            var top_tran_num = row.find("td:nth-child(7)").text();
            var inven_num = row.find("td:nth-child(8)").text();
            var comm = row.find("td:nth-child(9)").text();
            var pro_status = row.find("td:nth-child(10)").text();
            
            // Set the data in the modal
            $("#modal-tran_num").text(tran_num);
            $("#modal-item_num").text(item_num);
            $("#modal-item_name").text(item_name);
            $("#modal-goods_qty").text(goods_qty);
            $("#modal-rel_date").text(rel_date);
            $("#modal-top_tran_num").text(top_tran_num);
            $("#modal-inven_num").text(inven_num);
            $("#modal-comm").text(comm);
            $("#modal-pro_status").text(pro_status);
            
            // Show the modal
            $("#exampleModal1").modal("show");
        });
    });
</script>
