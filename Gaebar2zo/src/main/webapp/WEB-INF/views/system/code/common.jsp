<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<body>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<button class="btn btn-primary" type="button" onclick="openFormModal()">추가</button>
		<button class="btn btn-primary" type="button" onclick="">수정</button>
		<button class="btn btn-primary" type="button" onclick="">조회</button>
		<button class="btn btn-primary" type="button">삭제</button>
	</div>
	<table class="table table-hover">
      <thead>
      	<tr>
         <th scope="col"> 
            <div class="form-check">
               <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> 
            </div>
         </th>
	         <th scope="col">그룹코드</th>
	         <th scope="col">그룹코드 명</th>
      	</tr>
      </thead>
      <tbody>
			<c:forEach var="codetbl" items="${codeList}">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"> 
               			</div>
               		</td>
               		<td>${codetbl.group_code}</td>
               		<td>${codetbl.group_name}</td>
				</tr>	
			</c:forEach>

		</tbody>
		
   </table>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>