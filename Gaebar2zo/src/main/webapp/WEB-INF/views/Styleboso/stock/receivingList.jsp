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
			<td>입고번호</td>
			<td>품목코드</td>
			<td>품목명</td>
			<td>입고 예정 수량</td>
			<td>입고 예정일</td>
			<td>발주 번호</td>
			<td>단가</td>
			<td>재고 번호</td>
			<td>비고</td>
			<td>상태</td>
		</tr>
		
		
		<c:forEach var="rc" items="${rc}">
		${rc }
		<tr>
			<td>${rc.tran_num }</td>
			<td>${rc.cli_num }</td>
			<td>${rc.cli_num }</td>
			<td>${rc.pic_username }</td>
			<td>${rc.tran_date }</td>
			<td>${rc.rel_date }</td>
			<td>${rc.due_date }</td>
			<td>${rc.pro_status }</td>
<%-- 			<td>${rc.goodsList.goods_num }</td> --%>
<%-- 			<td>${rc.pro_status }</td> --%>
      <c:forEach var="goods" items="${rc.goodsList}">
            <td>${goods.goods_num }</td>
            <td>${goods.goods_num }</td>
      </c:forEach>
<!-- 		</tr> -->
		</c:forEach>
	</table>
	
	
	
	
	
	
	
	
	
	
</body>
</html>
