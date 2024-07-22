<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
	<div class="search_box">
        <form name="searchForm" method="post" action="/status.do">
            <div class="sch_group fl">
                <select id="searchType" name="searchType" title="검색 유형 선택">
                    <option value="">전체 검색</option>
                    <option value="code">품목코드</option>
                    <option value="name">품목명</option>
                    <option value="warehouse">창고명</option>
                </select>
                <input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요." title="키워드 입력" />
                <button type="submit" class="bt_search" onclick="fnSearch"><i class="fas fa-search"></i><span class="skip_info">검색</span></button>
            </div>
        </form>
    </div>
    
	<table class="table table-hover">
		<tr>
			<td>품목코드</td>
			<td>품목명</td>
			<td>창고명</td>
			<td>구역명</td>
			<td>재고 위치</td>
			<td>현재 재고</td>
		</tr>


		<c:forEach var="sl" items="${sl}">
			<c:forEach var="item" items="${sl.itemList}">
				<tr>
					<c:forEach var="warehouse" items="${sl.warehouseList}">
						<td>${item.item_cate_code }</td>
						<td>${item.item_name }</td>
						<td>${warehouse.wh_name }</td>
						<td>${warehouse.wh_zone }</td>
						<td>${warehouse.wh_rack }</td>
						<td>${sl.inven_qty }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
	
	<nav aria-label="Page navigation" class="pagination-container">
  <ul class="pagination justify-content-end" style="margin-right:10px;">
    <c:if test="${pageVO.prev}">
      <li class="page-item">
        <a class="page-link" href="/stock/status?page=${pageVO.startPage - 1}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
    </c:if>

    <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
      <li class="page-item ${pageVO.cri.page == i ? 'active' : ''}">
        <a class="page-link" href="/stock/status?page=${i}">${i}</a>
      </li>
    </c:forEach>

    <c:if test="${pageVO.next && pageVO.endPage > 0}">
      <li class="page-item">
        <a class="page-link" href="/stock/status?page=${pageVO.endPage + 1}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </c:if>
  </ul>
</nav>

		
<%@ include file="../include/footer.jsp" %>	
</body>
</html>
