<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/basicInfo/itemList.jsp</h1>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<input type="button" class="btn btn-primary" value="등록" onclick="location.href='/basicInfo/itemAdd'">
		<input type="button" class="btn btn-primary" value="삭제">
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"> 
					<div class="form-check">
               			<input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
            		</div>
				</th>
				<th scope="col">품목 코드</th>
				<th scope="col">거래처 코드</th>
				<th scope="col">품목명</th>
				<th scope="col">제품 유형</th>
				<th scope="col">매입 단가</th>
				<th scope="col">매출 단가</th>
				<th scope="col">재질</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="itl" items="${itemList }">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckdefault${itl.item_num }"> 
               			</div>
               		</td>
               		<td>${itl.item_num }</td>
               		<td>${itl.item_cli_code }</td>
               		<td>${itl.item_name }</td>
               		<td>${itl.group_name }</td>
               		<td>${itl.item_purchase_price }</td>
               		<td>${itl.item_sale_price }</td>
               		<td>${itl.item_mat }</td>
               		<td>${itl.comm }</td>
				</tr>	
			</c:forEach>

		</tbody>
	</table>
	${itemList }

</body>

<script>
	// 전체 선택
	function toggleCheckboxes(source) {
	    const checkboxes = document.getElementsByClassName('form-check-input');
	    for (let checkbox of checkboxes) {
	        checkbox.checked = source.checked;
	    }
	}
	
</script>
<%@ include file="../include/footer.jsp" %>
</html>