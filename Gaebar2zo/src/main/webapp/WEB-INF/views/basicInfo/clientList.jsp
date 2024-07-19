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
   	<!-- 등록 모달 창 -->
	<div class="modal fade" id="cliRegModal" tabindex="-1" role="dialog" aria-labelledby="cliRegModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cliRegModalLabel">거래처 등록</h5>
				</div>
				<div class="modal-body">
					<form id="regForm" ><!-- onsubmit="return submitForm()" -->
						<table class="table">
							<tbody>
								<tr>
									<td><label for="cli_num">거래처 코드</label></td>
									<td><input type="text" class="form-control" id="cli_num" name="cli_num" readonly="readonly"></td>
								</tr>
								<tr>
									<td><label for="cli_name">거래처명</label></td>
									<td><input type="text" class="form-control" id="cli_name" name="cli_name" required>
									<div id="cliNameError" class="text-danger" style="display: none;">거래처명을 입력하세요</div>
									</td>
								</tr>
								<tr>
									<td><label for="cli_crn">사업자 번호</label></td>
									<td>
									<div>
									<input type="text" class="form-control" id="cli_crn" name="cli_crn" required>
									</div>
									<div>
									<input type="button" value="중복 확인">
									</div>
									<div id="cliCrnError" class="text-danger" style="display: none;">사업자 번호를 입력하세요</div>
									</td>
								</tr>
								
								<tr>
									<td><label for="cli_cate">거래처 구분</label></td>
									<td>
									<input type="radio" id="cli_cateCu" name="cli_cate" value="customer">
									<label for="cli_cateCu"> 고객사</label>
									<input type="radio" id="cli_catePt" name="cli_cate" value="partner">
									<label for="cli_catePt">협력사</label> 
									<div id="cliCateError" class="text-danger" style="display: none;">구분을 선택하세요</div></td>
								</tr>
								<tr>
									<td><label for="cli_rep">대표자</label></td>
									<td><input type="text" class="form-control" id="cli_rep" name="cli_rep" required>
									<div id="cliNameError" class="text-danger" style="display: none;">대표자를 입력하세요</div>
									</td>
								</tr>
								<tr>
									<td><label for="pic_userid" id="pic_userid">담당자 아이디</label></td>
									<td>
										<div class="input-group">
											<div class="input">
											<input type="text" class="form-control" id="pic_userid" name="pic_userid" 
											data-coreui-toggle="modal" data-coreui-target="#exampleModal2" required>
											</div>
											<div class="invalid-feedback">담당자를 입력해주세요</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="pic_username">담당자 이름</label></td>
									<td>
										<div class="input-group">
											<div class="input">
											<input type="text" class="form-control" id="pic_username" name="pic_username" 
											data-toggle="modal" data-target="#exampleModal2" required>
											</div>
											<div class="invalid-feedback">담당자 이름을 입력해주세요</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="cli_tel">대표 연락처</label></td>
									<td>
									<input type="tel" class="form-control" id="cli_tel" name="cli_tel" maxlength="11" placeholder="ex) 0512341234" required>
									</td>
								</tr>
								<tr>
									<td><label for="cli_email">이메일</label></td>
									<td>
									<input type="email" class="form-control" id="cli_email" name="cli_email" placeholder="ex) itwill@google.com" required>
									</td>
								</tr>
								
								<tr>
									<td><label for="wh_add1">창고 주소</label></td>
									<td>
										<div class="input-group">
											<div class="input">
											<input type="text" class="form-control" id="wh_add1" name="wh_add1" required>
											</div>
											<div class="input-group-append">
												<input type="button" value="주소 찾기">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="wh_add2">창고 상세 주소</label></td>
									<td><input type="text" class="form-control" id="wh_add2" name="wh_add2" required></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"  id="cancelButton">취소</button>
					<button type="button" class="btn btn-primary" onclick="submitForm()">등록</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmationModalLabel">확인</h5>
      </div>
      <div class="modal-body">
        정말 취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="confirmCancelButton">확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="denyButton">아니오</button>
      </div>
    </div>
  </div>
</div>

	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">담당자</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover" id="modal2-table">
						<thead class="table-light">
							<tr>
								<th scope="col"></th>
								<th scope="col">담당자 아이디</th>
								<th scope="col">담당자 명</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

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
    
 	// 전화번호 숫자만 입력 허용
    $("#cli_tel").on("input", function() {
        this.value = this.value.replace(/[^0-9]/g, '');
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
    
 /* 	    $('#pic_userid').on('click', function() {
        var targetInput1 = document.getElementById('pic_userid');
        var targetInput2 = document.getElementById('pic_username');
        var cliNum1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
        var cliNum2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

        // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
        targetInput1.value = cliNum1;
        targetInput2.value = cliNum2;

        // Modal 닫기 (Optional)
        var modal = document.getElementById('exampleModal2');
        var modalInstance = coreui.Modal.getInstance(modal);
        modalInstance.hide();
    });  */
 // 전체 선택/해제 기능
    function toggleCheckboxes(source) {
        const checkboxes = document.querySelectorAll('.form-check-input');
        checkboxes.forEach(checkbox => {
            checkbox.checked = source.checked;
        });
    }


getManagerList();

function getManagerList() {
   
    //$('#modal2-table tbody tr').remove();
    
    $.ajax({
        url: "/Styleboso/common/managerList",
        type: "get",
        contentType: 'application/json; charset=utf-8',
        dataType: "json",
        success: function(data) {
            // body 태그에 내용 추가
            console.log(data);
            data.forEach(function(item, idx){
               console.log(idx);
               var row = "<tr><th scope='row'>" + (parseInt(idx)+1) + "</th><td>" + item.username + "</td><td>" + item.user_per_name + "</td></tr>"
                $('#modal2-table tbody').append(row);
            });
            
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
            alert("AJAX 요청 실패!");
        }
    });
}

});
	
</script>

<%@ include file="../include/footer.jsp" %>

</html>