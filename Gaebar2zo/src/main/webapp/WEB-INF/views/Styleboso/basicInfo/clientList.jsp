<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<body>
   <h1>/Styleboso/basicInfo/clientList.jsp</h1>

   <input type="button" value="검색">
   <input type="button" value="등록" onclick="openCliRegModal()">
   <table class="table table-hover">
      <thead>
         <tr>
            <th scope="col">
               <div class="form-check">
                  <input class="form-check-input" type="checkbox" value=""
                     id="flexCheckDisabled" > 
                     <label class="form-check-label" for="flexCheckDisabled"> </label>
               </div>
            </th>
            <th scope="col">거래처 코드</th>
            <th scope="col">거래처명</th>
            <th scope="col">거래처 사업자 등록 번호</th>
            <th scope="col">거래처 구분</th>
            <th scope="col">거래처 업종</th>
            <th scope="col">거래처 주소</th>
            <th scope="col">연락처</th>
            <th scope="col">대표자</th>
            <th scope="col">이메일</th>
            <th scope="col">담당자</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="cli" items="${clientList }">
            <tr>
               <td>
                    <div class="form-check">
                           <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${cli.cli_num}"> 
                           <!-- <label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label> -->
                        </div>
                     </td>
                     <td>${cli.cli_num }</td>
                     <td>${cli.cli_name }</td>
                     <td>${cli.cli_crn }</td>
                     <td>${cli.cli_cate }</td>
                     <td>${cli.cli_ind }</td>
                     <td>${cli.cli_add1 } ${cli.cli_add2 }</td>
                     <td>${cli.cli_tel }</td>
                     <td>${cli.cli_rep }</td>
                     <td>${cli.cli_email }</td>
                     <td>${cli.pic_username }</td>
                     
            </tr>
         
         </c:forEach>
      </tbody>
   </table>
   
<%@ include file="../include/footer.jsp" %>
</body>
</html>