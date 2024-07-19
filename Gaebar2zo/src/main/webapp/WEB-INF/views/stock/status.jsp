<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
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
	
<%@ include file="../include/footer.jsp" %>	
</body>
</html>
