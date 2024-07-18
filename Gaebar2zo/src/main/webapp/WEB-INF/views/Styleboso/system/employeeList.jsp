<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<button class="btn btn-primary" type="button" onclick="openRegModal()">추가</button>
		<button class="btn btn-primary" type="button">수정</button>
		<button class="btn btn-primary" type="button">조회</button>
		<button class="btn btn-primary" type="button">삭제</button>
	</div>
	<table class="table table-hover">
      <thead>
      	<tr>
         <th scope="col"> 
            <div class="form-check">
               <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> 
               <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
            </div>
         </th>
	         <th scope="col">사용자ID</th>
	         <th scope="col">사용자명</th>
	         <th scope="col">비밀번호</th>
	         <th scope="col">직책</th>
	         <th scope="col">E-MAIL</th>
	         <th scope="col">전화번호</th>
      	</tr>
      </thead>
      <tbody>
			<c:forEach var="emptbl" items="${employeeList }">
				<tr>
					<td>
				  		<div class="form-check">
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> 
                  			<label class="form-check-label" for="flexCheckChecked" > Checked checkbox </label>
               			</div>
               		</td>
               		<td>${emptbl.username }</td>
               		<td>${emptbl.user_per_name}</td>
               		<td>${emptbl.password }</td>
               		<td>${emptbl.user_pos}</td>
               		<td>${emptbl.user_email  }</td>
               		<td>${emptbl.user_phone }</td>
               		<td></td>
				</tr>	
			</c:forEach>

		</tbody>
   </table>

          
<%@ include file="../include/footer.jsp" %>
</body>
</html>