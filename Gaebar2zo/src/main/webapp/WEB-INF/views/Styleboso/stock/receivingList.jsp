<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/stock/receivingList.jsp</h1>





	<table class="table table-hover">
		<tr>
			<td>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
				</div>
			</td>
			<td>입고번호</td>
			<td>품목코드</td>
			<td>품목명</td>
			<td>입고 수량</td>
			<td>입고일</td>
			<td>발주 번호</td>
			<td>재고 번호</td>
			<td>비고</td>
			<td>상태</td>
		</tr>


		<c:forEach var="rc" items="${rc}">
			<tr>
				<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> <label class="form-check-label" for="flexCheckDefault"> Default checkbox </label></td>
				<td>${rc.tran_num }</td>

				<c:forEach var="item" items="${rc.itemList}">
					<td>${item.item_num }</td>
					<td>${item.item_name }</td>
				</c:forEach>

				<c:forEach var="goods" items="${rc.goodsList}">
					<td>${goods.goods_qty }</td>
				</c:forEach>
				<td>${rc.rec_date }</td>
				<td>${rc.top_tran_num }</td>

				<c:forEach var="inchange" items="${rc.inchangeList}">
					<td>${inchange.inven_num }</td>
				</c:forEach>

				<td>${rc.comm }</td>
				<td>${rc.pro_status }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
	
	
	
	
	
	
<%@ include file="../include/footer.jsp" %>	
</body>
</html>
