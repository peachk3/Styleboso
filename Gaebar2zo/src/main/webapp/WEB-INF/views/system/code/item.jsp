<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- JQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<%@ include file="../../include/header.jsp" %>

<%
    String groupCode = request.getParameter("group_code");
%>



<body>
${itemCodeList}
    <h1>품목코드 상세 정보</h1>
    <p>그룹 코드: <strong>${param.group_code}</strong></p>

	<c:choose>
		<c:when test="${groupCode.startsWith('IT')}">
			<h2>IT 그룹 목록</h2>
			<ul>
				<c:forEach var="item" items="${itemCodeList}">
					<li>${item.s_cate_item_code} - ${item.s_cate_item_name}</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:when test="${groupCode.startsWith('IB')}">
			<!-- IB 그룹 코드에 대한 리스트를 출력 -->
			<h2>IB 그룹 목록</h2>
			<ul>
				<c:forEach var="item" items="${itemCGroupListAll}">
					<li>${item.s_cate_item_code}- ${item.s_cate_item_name}</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:when test="${groupCode.startsWith('IO')}">
			<!-- IO 그룹 코드에 대한 리스트를 출력 -->
			<h2>IO 그룹 목록</h2>
			<ul>
				<c:forEach var="item" items="${itemCGroupListAll}">
					<li>${item.s_cate_item_code}- ${item.s_cate_item_name}</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:when test="${groupCode.startsWith('IS')}">
			<!-- IS 그룹 코드에 대한 리스트를 출력 -->
			<h2>IS 그룹 목록</h2>
			<ul>
				<c:forEach var="item" items="${itemCGroupListAll}">
					<li>${item.s_cate_item_code}- ${item.s_cate_item_name}</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p>해당 그룹 코드에 대한 정보가 없습니다.</p>
		</c:otherwise>
	</c:choose>

	<jsp:include page="../../include/footer.jsp" />
</body>
</html>