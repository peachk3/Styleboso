<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
		<button class="btn btn-primary" type="button">추가</button>
		<button class="btn btn-primary" type="button">수정</button>
		<button class="btn btn-primary" type="button">조회</button>
		<button class="btn btn-primary" type="button">삭제</button>
	</div>
	<table class="table table-hover">
      <tr>
         <td>
            <div class="form-check">
               <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled> 
               <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label>
            </div>
         </td>
         <td>사용자ID</td>
         <td>사용자명</td>
         <td>비밀번호</td>
         <td>직책</td>
         <td>E-MAIL</td>
         <td>전화번호</td>
      </tr>
      
      
     <%--  <c:forEach var="rc" items="${rc}">
      <tr>
            <td>
            <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> <label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label>
               </div></td>
            <td>${rc.tran_num }
            </td>
         
      <c:forEach var="item" items="${rc.itemList}">
         <td>${item.item_num }</td>
         <td>${item.item_name }</td>
    </c:forEach>
         
      <c:forEach var="goods" items="${rc.goodsList}">
            <td>${goods.goods_qty }</td>
      </c:forEach>
         <td>${rc.rec_date }</td>
         <td>${rc.top_tran_num }</td>
         
      <c:forEach var="inchange" items="${rc.inchangeList}">
            <td>${inchange.inven_num }</td>
      </c:forEach>
      
         <td>${rc.comm }</td>
         <td>${rc.pro_status }</td>
      </tr>
      </c:forEach> --%>
   </table>

          
<%@ include file="../include/footer.jsp" %>
</body>
</html>