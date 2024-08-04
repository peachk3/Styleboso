<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- Bootstrap 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	rel="stylesheet">
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- itemCode.js 연결 -->
<script src="../../../../resources/js/itemCode.js"></script>

<!-- sweet alert 사용 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<%@ include file="../../include/header.jsp"%>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%
    String groupCode = request.getParameter("group_code");
%>

<body>
	<div class="container mt-5">
		<div class="row align-items-center mb-4" style="padding: 10px;">
			<div class="col-md-8 offset-md-2 text-center">
				<h2>
					<strong style="color: red;">${param.group_code}</strong> 그룹코드의 품목코드 리스트
				</h2>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 10px; padding: 10px;">
				<button class="btn btn-primary" type="button" onclick="insertItemCode()">등록</button>
				<button class="btn btn-primary" type="button" onclick="deleteSelectedItems()">삭제</button>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="checkAll"
								onclick="toggleAllCheckboxes(this)"> <!-- 체크박스 전체 선택 -->
						</div>
					</th>
					<th scope="col">품목공통 코드</th>
					<th scope="col">품목공통 코드 명</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:startsWith(groupCode, 'IT')}">
						<c:forEach var="item" items="${itemCodeList}">
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input item-checkbox" type="checkbox" value="${item.s_cate_item_code}">
									</div>
								</td>
								<td><a href="#" data-toggle="modal"
									data-target="#itemModal"
									onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
								<td>${item.s_cate_item_name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${fn:startsWith(groupCode, 'IB')}">
						<!-- IB 그룹 코드에 대한 리스트를 출력 -->
						<c:forEach var="item" items="${itemCodeList}">
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input item-checkbox" type="checkbox"
											value="${item.s_cate_item_code}">
									</div>
								</td>
								<td><a href="#" data-toggle="modal"
									data-target="#itemModal"
									onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
								<td>${item.s_cate_item_name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${fn:startsWith(groupCode, 'IO')}">
						<!-- IO 그룹 코드에 대한 리스트를 출력 -->
						<c:forEach var="item" items="${itemCodeList}">
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input item-checkbox" type="checkbox" value="${item.s_cate_item_code}">
									</div>
								</td>
								<td><a href="#" data-toggle="modal"
									data-target="#itemModal"
									onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
								<td>${item.s_cate_item_name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${fn:startsWith(groupCode, 'IS')}">
						<!-- IS 그룹 코드에 대한 리스트를 출력 -->
						<c:forEach var="item" items="${itemCodeList}">
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input item-checkbox" type="checkbox" value="${item.s_cate_item_code}">
									</div>
								</td>
								<td><a href="#" data-toggle="modal"
									data-target="#itemModal"
									onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
								<td>${item.s_cate_item_name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3">해당 그룹 코드에 대한 정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<!-- 모달 구조 -->
	<div class="modal fade" id="itemModal" tabindex="-1" role="dialog"
		aria-labelledby="itemModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form class="needs-validation" id="fm1" novalidate>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title w-100 text-center" id="itemModalLabel">품목코드 상세 정보</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<table class="table text-center mb-0">
						<thead>
							<tr>
								<th scope="col" class="align-middle">공통 품목코드</th>
								<th scope="col" class="align-middle">공통 품목코드 명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="s_cate_item_code" class="align-middle"></td>
								<td id="s_cate_item_name" class="align-middle" contenteditable="false"></td>
							</tr>
						</tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary d-none" id="cancelButton" onclick="cancelEdit()">취소</button>
						<button type="button" class="btn btn-primary" id="editButton" onclick="enableEdit()">수정</button>
						<button type="button" class="btn btn-success d-none" id="saveButton" onclick="saveItem()">저장</button>
					</div>
				</div>
			</form>
		</div>
	</div><!-- 수정,삭제 모달 -->
	
	<!-- 등록 모달 -->
	<div class="modal fade" id="insertItemModal" tabindex="-1" role="dialog" aria-labelledby="insertItemModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <form class="needs-validation" id="fm1" novalidate>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title w-100 text-center" id="insertItemModalLabel">공통 품목코드 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <table class="table text-center mb-0">
                        <thead>
                            <tr>
                                <th scope="col" class="align-middle">공통 품목코드</th>
                                <th scope="col" class="align-middle">공통 품목코드 명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="new_s_cate_item_code" class="form-control" required>
                               		<span id="validationMessage"></span>
                                </td>
                                <td>
                                    <input type="text" id="new_s_cate_item_name" class="form-control" required>
                                    <span id="validationMessage"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="saveNewItemCode()">저장</button>
                </div>
              </div>
           </form>
       </div>
    </div>

	
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>