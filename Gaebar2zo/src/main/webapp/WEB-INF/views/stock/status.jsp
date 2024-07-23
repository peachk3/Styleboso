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
                            <option value="code" <c:if test="${searchType eq 'code'}">selected</c:if>>품목코드</option>
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


 
	<table class="table border mb-0 table-hover">
		<thead class="table-light">
		<tr>
			<td>품목코드</td>
			<td>품목명</td>
			<td>창고명</td>
			<td>구역명</td>
			<td>재고 위치</td>
			<td>현재 재고</td>
		</tr>
		</thead>

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

		
<%@ include file="../include/footer.jsp" %>	
</body>
</html>
