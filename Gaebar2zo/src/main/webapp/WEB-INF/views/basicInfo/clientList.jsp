<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<body>
   <h1>/Styleboso/basicInfo/clientList.jsp</h1>

   <input type="button" value="검색">
   <input type="button" value="등록" onclick="location.href='/basicInfo/clientAdd'">
   
   <table class="table table-hover">
      <thead>
         <tr>
            <th scope="col">
               <div class="form-check">
                  <input class="form-check-input" type="checkbox" value=""
                     id="selectAll" onclick = "toggleCheckboxes(this)"> <!-- <label
                     class="form-check-label" for="flexCheckDisabled">
                     Disabled checkbox </label> -->
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
                          <!--  <label class="form-check-label" for="flexCheckChecked"> Checked checkbox </label> -->
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

</body>  

<style>
  .custom-btn {
    text-align: left; /* 텍스트를 왼쪽으로 정렬합니다 */
    padding-left: 10px; /* 왼쪽 여백을 추가합니다 */
    width: 100%; /* 버튼이 부모 요소에 맞게 전체 너비를 가지도록 설정합니다 */
  }
</style> 

   <!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
//모달 열기 함수
function openCliRegModal() {
  $('#cliRegModal').modal('show'); // jQuery를 사용하여 모달 창 열기
}

	//모달창 외의 영역/esc 클릭시 창 닫힘 차단
$(document).ready(function(){
    $('#cliRegModal').modal({
         backdrop: 'static',
        keyboard: false 
    });
    
    // 취소 버튼 클릭시 확인 모달 열기
    $("#cancelButton").click(function(){
        $("#confirmationModal").modal('show');
    });
    
 	// 확인 클릭시 모달 리셋
    $("#confirmCancelButton").click(function(){
        $("#confirmationModal").modal('hide');
        $("#cliRegModal").modal('hide');
        resetForm();
    });

    // 확인 모달의 아니오 버튼 클릭시 모달 숨기기
    $("#denyButton").click(function(){
        $("#confirmationModal").modal('hide');
        $("#cliRegModal").modal('show');
    });
    
    $('#cliRegModal').on('hidden.bs.modal', function () {
        $('#regForm')[0].reset();
    });

    $('.select-pic').on('click', function() {
        var selectedPic = $(this).data('name');
        $('#pic_username').val(selectedPic);
        $('#exampleModal2').modal('hide');
    });
    
 // 전체 선택/해제 기능
    function toggleCheckboxes(source) {
        const checkboxes = document.querySelectorAll('.form-check-input');
        checkboxes.forEach(checkbox => {
            checkbox.checked = source.checked;
        });
    }

});
	
</script>

<%@ include file="../include/footer.jsp" %>

</html>