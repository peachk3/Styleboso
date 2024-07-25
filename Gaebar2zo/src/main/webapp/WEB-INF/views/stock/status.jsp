<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<style>
    .custom-select-radius {
        border-top-left-radius: 0.25rem;
        border-bottom-left-radius: 0.25rem;
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    
    .custom-select-radius:focus {
        z-index: 10;
        position: relative;
    }
    
    .input-group {
    	width: 200%;
    }
</style>
   
<body>
   <div class="container">
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3 mb-3">
                <form action="/stock/status" method="get" class="form-inline mt-3">
                    <div class="input-group w-500">
                        <div class="input-group-prepend">
                            <select class="form-select custom-select-radius custom-select-width" id="searchType" name="searchType">
                                <option value="" <c:if test="${empty searchType}">selected</c:if>>전체</option>
                                <option value="code" <c:if test="${searchType eq 'code'}">selected</c:if>>재고 번호</option>
                                <option value="name" <c:if test="${searchType eq 'name'}">selected</c:if>>품목명</option>
                                <option value="warehouse" <c:if test="${searchType eq 'warehouse'}">selected</c:if>>창고명</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="keyword" value="${keyword}">
                        <button class="btn btn-outline-secondary" type="submit">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <table class="table border mb-0 table-hover" id="stockTable">
        <thead class="table-light">
            <tr>
                <td>재고 번호</td>
                <td>품목명</td>
                <td>사이즈</td>
                <td>색상</td>
                <td>창고명</td>
                <td>구역명</td>
                <td>재고 위치</td>
                <td>재고 수량</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="sl" items="${sl}">
                <c:forEach var="item" items="${sl.itemList}">
                    <c:forEach var="warehouse" items="${sl.warehouseList}">
                        <tr class="table-row" data-item-code="${sl.inven_num}" data-item-name="${item.item_name}" data-wh-name="${warehouse.wh_name}" data-wh-zone="${warehouse.wh_zone}" data-wh-rack="${warehouse.wh_rack}" data-inven-qty="${sl.inven_qty}" >
                            <td>${sl.inven_num }</td>
                            <td>${item.item_name }</td>
                            <td>${warehouse.wh_name }</td>
                            <td></td>
                            <td></td>
                            <td>${warehouse.wh_zone }</td>
                            <td>${warehouse.wh_rack }</td>
                            <td>${sl.inven_qty }</td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </c:forEach>
        </tbody>
    </table>

    <c:url var="pageUrl" value="/stock/status">
        <c:param name="searchType" value="${searchType}"/>
        <c:param name="keyword" value="${keyword}"/>
    </c:url>

    <nav aria-label="Page navigation" class="pagination-container">
        <ul class="pagination justify-content-end">
            <c:if test="${pageVO.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pageUrl}&page=${pageVO.startPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
                <li class="page-item ${pageVO.cri.page == i ? 'active' : ''}">
                    <a class="page-link" href="${pageUrl}&page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${pageVO.next && pageVO.endPage > 0}">
                <li class="page-item">
                    <a class="page-link" href="${pageUrl}&page=${pageVO.endPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<!-- <!-- Modal --> -->
<!-- <div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true"> -->
<!--     <div class="modal-dialog"> -->
<!--         <div class="modal-content"> -->
<!--             <div class="modal-header"> -->
<!--                 <h5 class="modal-title" id="itemModalLabel">상세 정보</h5> -->
<!--                 <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button> -->
<!--             </div> -->
<!--             <div class="modal-body"> -->
<!--                 <p><strong>품목코드:</strong> <span id="modalGoodsNum"></span></p> -->
<!--                 <p><strong>품목명:</strong> <span id="modalItemName"></span></p> -->
<!--                 <p><strong>창고명:</strong> <span id="modalWhName"></span></p> -->
<!--                 <p><strong>구역명:</strong> <span id="modalWhZone"></span></p> -->
<!--                 <p><strong>재고위치:</strong> <span id="modalWhRack"></span></p> -->
<!--                 <p><strong>현재재고:</strong> <span id="modalInvenQty"></span></p> -->
<!--                 <p><strong>입고단가:</strong> <span id="modalPurchasePrice"></span></p> -->
<!--             </div> -->
<!--             <div class="modal-footer"> -->
<!--                 <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

<!-- <script>
    document.addEventListener('DOMContentLoaded', function() {
        const rows = document.querySelectorAll('#stockTable .table-row');
        rows.forEach(row => {
            row.addEventListener('click', function() {
                const itemCode = this.dataset.itemCode;
                const itemName = this.dataset.itemName;
                const whName = this.dataset.whName;
                const whZone = this.dataset.whZone;
                const whRack = this.dataset.whRack;
                const invenQty = this.dataset.invenQty;
                const purchasePrice = this.dataset.purchasePrice;

                document.getElementById('modalItemCode').innerText = itemCode;
                document.getElementById('modalItemName').innerText = itemName;
                document.getElementById('modalWhName').innerText = whName;
                document.getElementById('modalWhZone').innerText = whZone;
                document.getElementById('modalWhRack').innerText = whRack;
                document.getElementById('modalInvenQty').innerText = invenQty;
                document.getElementById('modalPurchasePrice').textContent = 
                    purchasePrice && purchasePrice !== '0' ? purchasePrice : '정보 없음';

                const itemModal = new coreui.Modal(document.getElementById('itemModal'));
                itemModal.show();
            });
        });
    });
</script> -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>
