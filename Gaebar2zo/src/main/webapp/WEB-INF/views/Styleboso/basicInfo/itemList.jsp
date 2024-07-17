<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
	rel="stylesheet" integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
	integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<h1>/Styleboso/basicInfo/itemList.jsp</h1>
	
	<input type="button" value="등록" onclick="openRegModal()">
	<input type="button" value="삭제">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"> 
					<div class="form-check">
               			<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
            		</div>
				</th>
				<th scope="col">품목 코드</th>
				<th scope="col">거래처 코드</th>
				<th scope="col">품목명</th>
				<th scope="col">제품 유형</th>
				<th scope="col">재질</th>
				<th scope="col">비고</th>
				<th scope="col">현재고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="itl" items="${itemList }">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> 
                  			<label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label>
               			</div>
               		</td>
               		<td>${itl.item_num }</td>
               		<td>${itl.item_cli_code }</td>
               		<td>${itl.item_name }</td>
               		<td>${itl.group_name }</td>
               		<td>${itl.item_mat }</td>
               		<td>${itl.comm }</td>
               		<td></td>
				</tr>	
			</c:forEach>

		</tbody>
	</table>
	
</body>
</html>