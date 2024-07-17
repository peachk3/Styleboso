<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
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

	<input type="button" value="등록" onclick="openRegModal()" class="btn btn-primary">
	<input type="button" value="삭제">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> 
						<label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
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
			<c:forEach var="vo" items="${whCodeList }">
				<tr>
					<td>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> 
							<label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label>
						</div>
					</td>
					<td>${vo.m_cate_wh_code }${vo.s_cate_wh_code }</td>
					<td>${vo.s_cate_wh_name }</td>
					<td>${vo.wh_tel }</td>
					<td>${vo.wh_add1 }${vo.wh_add2 }</td>
					<td>${vo.wh_man }</td>
					<td>${vo.wh_status }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 모달 창 -->
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
		aria-labelledby="regModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="regModalLabel">창고 등록</h5>
				</div>
				<div class="modal-body">
					<!-- 등록 폼 -->
					<form id="regForm">
					<table class="table">
						<tbody>
							<tr>
								<td><label for="itemName">상품명</label></td>
								<td><input type="text" class="form-control" id="itemName"
									name="itemName" required></td>
							</tr>
							<tr>
								<td><label for="itemDescription">상품 설명</label></td>
								<td><textarea class="form-control" id="itemDescription"
										name="itemDescription" rows="3" required></textarea></td>
							</tr>
							<!-- 추가 필드 추가 가능 -->
						</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="submitForm()">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
// 모달 열기 함수
function openRegModal() {
  $('#regModal').modal('show'); // jQuery를 사용하여 모달 창 열기
}

// 폼 제출 함수 (실제로는 서버로 데이터를 전송할 수 있습니다)
function submitForm() {
  // 여기서 폼 데이터를 처리하는 JavaScript 코드를 작성할 수 있습니다.
  // 예: AJAX를 사용하여 서버로 데이터 전송 등
  $('#regModal').modal('hide'); // 폼을 제출한 후 모달 창 닫기
}
</script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>