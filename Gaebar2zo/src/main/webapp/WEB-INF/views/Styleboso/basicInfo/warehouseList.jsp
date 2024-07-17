<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
	rel="stylesheet" integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
	integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
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

	<input type="button" value="등록" onclick="openRegModal()">
	<input type="button" value="삭제">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"> 
					<div class="form-check">
               			<input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
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
                  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> <label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label>
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
</body>
</html>




