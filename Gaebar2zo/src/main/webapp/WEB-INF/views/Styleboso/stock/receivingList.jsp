<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
      rel="stylesheet"
      integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL"
      crossorigin="anonymous">
   <script
      src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
      integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b"
      crossorigin="anonymous"></script>


</head>
<body>
	<h1>/Styleboso/stock/receivingList.jsp</h1>
	
	
	
	
	<table class="table table-hover">
		<tr>
			<td><button class="btn btn-secondary" type="button">선택</button></td>
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
			
			<td><button class="btn btn-secondary" type="button"></button></td>
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
	
	
	
	
	
	
</body>
</html>
