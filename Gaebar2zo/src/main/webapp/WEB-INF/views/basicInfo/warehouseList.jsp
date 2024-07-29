<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<body>
	<h1>/Styleboso/basicInfo/warehouseList.jsp</h1>

	<div class="container-fluid px-4">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb my-0">
				<li class="breadcrumb-item"><a href="#" data-coreui-i18n="home">김포창고</a>
				</li>
				<li class="breadcrumb-item"><span data-coreui-i18n="plugins">구역</span>
				</li>
				<li class="breadcrumb-item active"><span>열</span></li>
			</ol>
		</nav>
	</div>

<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
	<input class="button btn-primary" type="button" value="등록" onclick="location.href='/basicInfo/warehouseAdd'" class="btn btn-primary">
	<input class="button btn-primary" type="button" value="삭제">
</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="selectAll" onclick = "toggleCheckboxes(this)"> 
					</div>
				</th>
				<th scope="col">창고 코드</th>
				<th scope="col">창고 이름</th>
				<th scope="col">연락처</th>
				<th scope="col">주소</th>
				<th scope="col">관리자</th>
				<th scope="col">현재상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="whc" items="${whCodeList }">
				<tr>
					<td>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${whc.m_cate_wh_code }"> 
						</div>
					</td>
					<td>${whc.m_cate_wh_code }${whc.s_cate_wh_code }</td>
					<td>${whc.s_cate_wh_name }</td>
					<td>${whc.wh_tel }</td>
					<td>${whc.wh_add1 }${whc.wh_add2 }</td>
					<td>${whc.wh_man }</td>
					<td>
						<c:choose>
							<c:when test="${whc.wh_status == 1 }">사용중</c:when>
				    		<c:otherwise> 사용 중지</c:otherwise>
						</c:choose>
				    </td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>


<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

// 모달창 외의 영역/esc 클릭시 창 닫힘 차단
	
	$(document).ready(function(){
	    $('#regModal').modal({
	         backdrop: 'static',
	        keyboard: false 
	    });
	    
	    // 취소 버튼 클릭시 확인 모달 열기
	    $("#cancelButton").click(function(){
	        $("#confirmationModal").modal('show');
	    });
	    
	    // 확인 클릭시 모달 리셋
	    $("#confirmCancelButton").click(function(){
	        $("#confirmationModal").modal('hide');
	        $("#regModal").modal('hide');
	        resetForm();
	    });
	
	    // 확인 모달의 아니오 버튼 클릭시 모달 숨기기
	    $("#denyButton").click(function(){
	        $("#confirmationModal").modal('hide');
	        $("#regModal").modal('show');
	    });
	    
/* 	    $('#regModal').on('shown.bs.modal', function () {
	        $('#s_cate_wh_name').trigger('focus');
	    }); */
	});


	// 전체 선택/해제 기능
	function toggleCheckboxes(source) {
	    const checkboxes = document.querySelectorAll('.form-check-input');
	    checkboxes.forEach(checkbox => {
	        checkbox.checked = source.checked;
	    });
	}

	// 모달 열기 함수
	function openRegModal() {
	  $('#regModal').modal('show'); // jQuery를 사용하여 모달 창 열기
	}
	
</script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>