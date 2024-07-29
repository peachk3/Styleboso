<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- sweet alert 사용 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@ include file="../../include/header.jsp" %>

<%
    String groupCode = request.getParameter("group_code");
%>

<body>
    <div class="container mt-5">
        <div class="row align-items-center mb-4" style="padding: 10px;">
            <div class="col-md-8 offset-md-2 text-center">
                <h2><strong style="color: red;">${param.group_code}</strong> 그룹코드의 품목코드 리스트</h2>
            </div>
            <div class="col-md-2 d-md-flex justify-content-md-end">
                <button class="btn btn-primary" type="button" onclick="openFormModal()">등록</button>
            </div>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">품목공통 코드</th>
                    <th scope="col">품목공통 코드 명</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${fn:startsWith(groupCode, 'IT')}">
                        <c:forEach var="item" items="${itemCodeList}">
                            <tr>
                                <td><a href="#" data-toggle="modal" data-target="#itemModal" onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
                                <td>${item.s_cate_item_name}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${fn:startsWith(groupCode, 'IB')}">
                        <!-- IB 그룹 코드에 대한 리스트를 출력 -->
                        <c:forEach var="item" items="${itemCodeList}">
                            <tr>
                                <td><a href="#" data-toggle="modal" data-target="#itemModal" onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
                                <td>${item.s_cate_item_name}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${fn:startsWith(groupCode, 'IO')}">
                        <!-- IO 그룹 코드에 대한 리스트를 출력 -->
                        <c:forEach var="item" items="${itemCodeList}">
                            <tr>
                                <td><a href="#" data-toggle="modal" data-target="#itemModal" onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
                                <td>${item.s_cate_item_name}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${fn:startsWith(groupCode, 'IS')}">
                        <!-- IS 그룹 코드에 대한 리스트를 출력 -->
                        <c:forEach var="item" items="${itemCodeList}">
                            <tr>
                                <td><a href="#" data-toggle="modal" data-target="#itemModal" onclick="openModal('${item.s_cate_item_code}', '${item.s_cate_item_name}')">${item.s_cate_item_code}</a></td>
                                <td>${item.s_cate_item_name}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="2">해당 그룹 코드에 대한 정보가 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <!-- 모달 구조 -->
    <!-- 모달 구조 -->
    <div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
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
                            <th scope="col" class="align-middle">품목공통 코드</th>
                            <th scope="col" class="align-middle">품목공통 코드 명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="modalItemCode" class="align-middle"></td>
                            <td id="s_cate_item_name" class="align-middle"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="modal-footer">
						<button type="button" class="btn btn-secondary d-none" id="cancelButton" onclick="cancelEdit()">취소</button>
                        <button type="button" class="btn btn-primary" id="editButton" onclick="enableEdit()">수정</button>
                        <button type="button" class="btn btn-success d-none" id="saveButton" onclick="saveItem()">저장</button>                  </div>
            </div>
           </form>
        </div>
    </div>
    <script>
    const token = $("meta[name='_csrf']").attr("content")
    const header = $("meta[name='_csrf_header']").attr("content");
    const name = $("#userName").val();
    
        function openFormModal() {
            // 등록 버튼 클릭 시 모달 창을 여는 로직을 여기에 작성하세요.
        }

        function openModal(itemCode, itemName) {
            currentItemCode = itemCode;
            document.getElementById('modalItemCode').innerText = itemCode;
            document.getElementById('s_cate_item_name').innerText = itemName;
            document.getElementById('cancelButton').classList.add('d-none');
            document.getElementById('saveButton').classList.add('d-none');
            document.getElementById('editButton').classList.remove('d-none');
            document.getElementById('modalItemCode').setAttribute('contenteditable', 'false');
            document.getElementById('s_cate_item_name').setAttribute('contenteditable', 'false');
        }

        function enableEdit() {
            document.getElementById('editButton').classList.add('d-none');
            document.getElementById('saveButton').classList.remove('d-none');
            document.getElementById('cancelButton').classList.remove('d-none');
            document.getElementById('s_cate_item_name').setAttribute('contenteditable', 'true');
        }

        function cancelEdit() {
            const itemName = document.getElementById('s_cate_item_name').innerText;
            openModal(currentItemCode, s_cate_item_name);
        }

        function saveItem() {
            const itemName = $("#s_cate_item_name").val();

            // 서버로 데이터 전송
            $.ajax({
                url: "/system/updateItemCode", // 실제로 처리할 URL
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                 },
                type: "POST",
                contentType: 'application/json',
                data: JSON.stringify(itemName),
                success: function(response) {
                    console.log('공통 품목 코드 수정 (저장) 성공:', response);
                    Swal.fire("수정되었습니다.");
                },
                error: function(error) {
                    console.log('저장 실패:', error);
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "시스템 에러! 수정 실패",
                    });
                }
            });
        } 	 
    </script>
    
   <jsp:include page="../../include/footer.jsp" />
</body>
</html>