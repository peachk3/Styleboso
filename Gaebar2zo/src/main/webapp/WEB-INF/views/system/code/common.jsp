<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../include/header.jsp" %>
<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<body>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 10px; padding: 10px;">
        <button class="btn btn-primary" type="button" onclick="openFormModal()">등록</button>
        <button class="btn btn-primary" type="button" onclick="">수정</button>
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
                    <td>
                        <c:choose>
                            <c:when test="${fn:startsWith(codetbl.group_code, 'I')}">
                                <a href="item.jsp?group_code=${codetbl.group_code}" style="font-weight: bold; color: red;">
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

    <script>
        function openFormModal() {
            // 등록 버튼 클릭 시 모달 창을 여는 로직을 여기에 작성하세요.
        }
    </script>

    <jsp:include page="../../include/footer.jsp" />
</body>
</html>