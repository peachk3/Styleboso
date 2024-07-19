<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/basicInfo/itemList.jsp</h1>
	
	<input type="button" value="등록" onclick="openRegModal()">
	<input type="button" value="삭제">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"> 
					<div class="form-check">
               			<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" > 
               			<label class="form-check-label" for="flexCheckDisabled"> </label>
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
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${itl.item_num }" > 
                  			<!-- <label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label> -->
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
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>