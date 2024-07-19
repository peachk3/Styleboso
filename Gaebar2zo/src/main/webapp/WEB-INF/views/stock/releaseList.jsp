<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/stock/releaseList.jsp</h1>



	<table class="table table-hover">
		<tr>
			<td>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
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


		<c:forEach var="rs" items="${rs}">
				<c:forEach var="item" items="${rs.itemList}">
			<tr>
				<c:forEach var="inchange" items="${rs.inchangeList}">
				<td>
				<label class="form-check-label" for="flexCheckDefault"> 
				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> 
					Default checkbox 
				</label>
				</td>
				<td>${rs.tran_num }</td>

					<td>${item.item_num }</td>
					<td>${item.item_name }</td>
				
				<c:forEach var="goods" items="${item.goodsList}">
					<td>${goods.goods_qty }</td>
				<td>${rs.rel_date }</td>
				<td>${rs.top_tran_num }</td>

				<td>${inchange.inven_num }</td>
				<td>${rs.comm }</td>
				<td>${rs.pro_status }</td>

				</c:forEach>
			</c:forEach>
					</tr>
			</c:forEach>
		</c:forEach>
	</table>
	
	<div>
	    <button id="addRowBtn" class="btn btn-outline-info" type="button" onclick="location.href='/stock/releaseAdd'">출고 등록</button>
	</div>
	
	
<%@ include file="../include/footer.jsp" %>	
</body>


</html>
