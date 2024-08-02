<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../include/header.jsp" %>

<!-- itemCode.js 연결 -->
<script src="../../../../resources/js/commonCode.js"></script>

<!-- sweet alert 사용 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 10px; padding: 10px;">
        <button class="btn btn-primary" type="button" onclick="insertGroupCode()">등록</button>
        <button class="btn btn-primary" type="button" onclick="">수정</button>
        <button class="btn btn-primary" type="button" onclick="deleteGroupCode()">삭제</button>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="checkAll" onclick="checkAll(this)">
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
                            <input class="form-check-input item-checkbox" type="checkbox" value="" id="checkAll" value="${codetbl.group_code}">
                        </div>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:startsWith(codetbl.group_code, 'I')}">
                                <a href="item?group_code=${codetbl.group_code}" style="font-weight: bold; color: red;">
                                    <strong>${codetbl.group_code}</strong>
                                </a>
                            </c:when>
                            <c:otherwise>
                                ${codetbl.group_code}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${codetbl.group_name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
	<!-- 등록 모달 -->
	<div class="modal fade" id="insertCodeModal" tabindex="-1" role="dialog" aria-labelledby="insertCodeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <form class="needs-validation" id="fm1" novalidate>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title w-100 text-center" id="insertCodeModalLabel">공통 그룹코드 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <table class="table text-center mb-0">
                        <thead>
                            <tr>
                                <th scope="col" class="align-middle">공통 그룹코드</th>
                                <th scope="col" class="align-middle">공통 그룹코드 명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="group_code" class="form-control" required>
                               		<span id="validationMessage"></span>
                                </td>
                                <td>
                                    <input type="text" id="group_name" class="form-control" required>
                                    <span id="validationMessage"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="saveGroupCode()">저장</button>
                </div>
              </div>
           </form>
       </div>
    </div>
	


    <jsp:include page="../../include/footer.jsp" />
</body>
</html>