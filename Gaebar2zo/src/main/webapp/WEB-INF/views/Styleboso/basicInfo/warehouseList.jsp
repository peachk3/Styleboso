<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/Styleboso/basicInfo/warehouseList.jsp</h1>
	
	<input type="button" value="등록">
	<input type="button" value="삭제">
	<table border="1">
		<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>창고 코드</th>
				<th>창고 이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>관리자</th>
				<th>현재상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${whCodeList }">
				<tr>
					<td><input type="checkbox"></td>
					<td>${vo.m_cate_wh_code }${vo.s_cate_wh_code }</td>
					<td>${vo.s_cate_wh_name }</td>
					<td>${vo.wh_tel }</td>
					<td>${vo.wh_add1 } ${vo.wh_add2 }</td>
					<td>${vo.wh_man }</td>
					<td>${vo.wh_status }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>