<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
    <style>
        /* 두 번째 모달의 z-index를 첫 번째 모달보다 높게 설정 */
        .modal.modal-second {
            z-index: 1051;
        }
        .modal-backdrop.modal-backdrop-second {
            z-index: 1050;
        }
    </style>
    <style>
        .status-buttons { display: none; }
        .modal-dialog { max-width: 60%; padding: 50px;}
        .search-container { display: flex; margin-bottom: 20px; }
        .search-group { display: flex; align-items: center; }
        .table-container { margin-top: 20px; }
    </style>
    
<body>
   <h1>/Styleboso/basicInfo/clientList.jsp</h1>
   
    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
      <button class="btn btn-primary" type="button" onclick="">검색</button>
      <button class="btn btn-primary" type="button" onclick="location.href='/basicInfo/clientAdd'">등록</button>
      <button class="btn btn-primary" type="button">삭제</button>
   </div>

   <table class="table table-hover">
      <thead>
         <tr>
            <th scope="col">
               <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
                     <!-- <label class="form-check-label" for="flexCheckDisabled"> Disabled checkbox </label> -->
               </div>
            </th>
            <th scope="col">거래처 코드</th>
            <th scope="col">거래처명</th>
            <th scope="col">거래처 사업자 등록 번호</th>
            <th scope="col">거래처 구분</th>
            <th scope="col">거래처 업종</th>
            <th scope="col">우편번호</th>
            <th scope="col">거래처 주소</th>
            <th scope="col">거래처 주소2</th>
            <th scope="col">거래처 주소3</th>
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
                     <td class="clickable-cell">${cli.cli_num }</td>
                     <td class="clickable-cell">${cli.cli_name }</td>
                     <td class="clickable-cell">${cli.cli_crn }</td>
                     <td class="clickable-cell">${cli.cli_cate }</td>
                     <td class="clickable-cell">${cli.cli_ind }</td>
                     <td class="clickable-cell">${cli.cli_postCode }</td>
                     <td class="clickable-cell">${cli.cli_add1 }</td>
                     <td class="clickable-cell">${cli.cli_add2 }</td>
                     <td class="clickable-cell">${cli.cli_add3 }</td>
                     <td class="clickable-cell">${cli.cli_tel }</td>
                     <td class="clickable-cell">${cli.cli_rep }</td>
                     <td class="clickable-cell">${cli.cli_email }</td>
                     <td class="clickable-cell">${cli.pic_username }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"> 거래처 상세 보기 </h5>
                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="needs-validation" id="fm1" novalidate>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td><label for="validationCustom01" class="form-label">거래처 코드</label></td>
                                <td><input type="text" class="form-control" id="cli_num" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom02" class="form-label">거래처명</label></td>
                                <td><input type="text" class="form-control" id="cli_name" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="cli_cate" class="form-label">거래처 구분</label></td>
                                <td>
                                    <div>
                                        <input type="radio" id="cli_cateCu" name="cli_cate" value="CLCU" required>
                                        <label for="cli_cateCu">고객사</label>
                                        <input type="radio" id="cli_catePt" name="cli_cate" value="CLPT" required>
                                        <label for="cli_catePt">협력사</label>
                                    </div>
                                    <div class="invalid-feedback">거래처 구분을 선택하세요</div>
                                </td>
                           </tr>
                           <tr>
                                <td><label for="validationCustom03" class="form-label">사업자 등록 번호</label></td>
                                <td><input type="text" class="form-control" id="cli_crn" readonly></td>
                            </tr>
                            <tr>
                                <!-- <td><label for="validationCustom03" class="form-label">거래처 구분</label></td>
                                <td><input type="text" class="form-control" id="modal-cli_cate" readonly></td> -->
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">거래처 업종</label></td>
                                <td><input type="text" class="form-control" id="cli_ind" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">우편번호</label></td>
                                <td>
                                    <div class="d-flex">
                                        <input type="text" class="form-control" id="sample6_postcode" readonly>
                                        <button type="button" id="postCodeButton" onclick="sample6_execDaumPostcode()" disabled>찾기</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">주소</label></td>
                                <td><input type="text" class="form-control" id="sample6_address" readonly></td>
                            </tr>
                            <tr>    
                                <td><label for="validationCustom03" class="form-label">상세 주소</label></td>
                                <td><input type="text" class="form-control" id="sample6_detailAddress" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">참고 항목</label></td>
                                <td><input type="text" class="form-control" id="sample6_extraAddress" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">연락처</label></td>
                                <td><input type="text" class="form-control" id="cli_tel" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">대표자</label></td>
                                <td><input type="text" class="form-control" id="cli_rep" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">이메일</label></td>
                                <td><input type="text" class="form-control" id="cli_email" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom05" class="form-label">담당자 아이디</label></td>
                                <td><input type="text" class="form-control" id="validationCustom05" data-coreui-toggle="modal"
									data-coreui-target="#exampleModal2" name="pic_username" required></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom06" class="form-label">담당자 이름</label></td>
                                <td><input type="text" class="form-control" id="validationCustom06" data-coreui-toggle="modal" data-coreui-target="#exampleModal2"
									required></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="editButton">수정</button>
                <button type="button" class="btn btn-success" id="saveButton" style="display: none;">저장</button>
                <button type="button" class="btn btn-success" id="saveCancelButton" style="display: none;">취소</button>
                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

	<!-- 담당자 선택 모달창 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">담당자</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
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

<!-- 주소 api -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
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
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>
<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

// 전체 선택/해제 기능
function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('.form-check-input');
    checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked;
    });
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

$(document).ready(function() {
    // Add click event listener to the cells
    $(".clickable-cell").click(function() {
        var cli_num = $(this).closest("tr").find("td:nth-child(2)").text();
        
        $.ajax({
            url: '/basicInfo/clientDetails',
            type: 'GET',
            data: { cli_num: cli_num },
            dataType: "json",
            success: function(response) {
                console.log(response);  // 응답 데이터 확인
                
                if (response.length > 0) {
                    var client = response[0];
                    console.log(client);  // 클라이언트 데이터 확인
                
                // 각 요소에 값을 설정
                //$("#modal-tran_num").val(response.top_tran_num);
                $("#cli_num").val(client.cli_num);
                $("#cli_name").val(client.cli_name);
                $("#cli_crn").val(client.cli_crn);
                $("#cli_cate").val(client.cli_cate);
                $("#cli_ind").val(client.cli_ind);
                $("#sample6_postcode").val(client.cli_postCode);
                $("#sample6_address").val(client.cli_add1);
                $("#sample6_detailAddress").val(client.cli_add2);
                $("#sample6_extraAddress").val(client.cli_add3);
                $("#cli_tel").val(client.cli_tel);
                $("#cli_rep").val(client.cli_rep);
                $("#cli_email").val(client.cli_email);
                $("#validationCustom05").val(client.pic_username);
                $("#validationCustom06").val(client.usersList[0].user_per_name);
                
	                if (client.cli_cate === 'CLCU') {
	                    document.getElementById('cli_cateCu').checked = true;
	                } else if (client.cli_cate === 'CLPT') {
	                    document.getElementById('cli_catePt').checked = true;
	                }
	             	// 원래 값을 저장
                    originalValues = {
                        cli_num: client.cli_num,
                        cli_name: client.cli_name,
                        cli_crn: client.cli_crn,
                        cli_cate: client.cli_cate,
                        cli_ind: client.cli_ind,
                        cli_postCode: client.cli_postCode,
                        cli_add1: client.cli_add1,
                        cli_add2: client.cli_add2,
                        cli_add3: client.cli_add3,
                        cli_tel: client.cli_tel,
                        cli_rep: client.cli_rep,
                        cli_email: client.cli_email,
                        pic_username: client.pic_username,
                        user_per_name: client.usersList[0].user_per_name
                    };
	             	
                	$("#exampleModal1").modal("show");
                }
            },
            error: function() {
            	console.log(error);
                alert('Failed to fetch transaction details.');
            }
        });
 	 });
    
 // 담당자 정보 가져오기
    $('#modal2-table tbody').on('click', 'tr', function() {
        var targetInput1 = document.getElementById('validationCustom05');
        var targetInput2 = document.getElementById('validationCustom06');
        var cliNum1 = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)
        var cliNum2 = $(this).find('td:nth-child(3)').text(); // 두 번째 열(거래처 코드)

        // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
        targetInput1.value = cliNum1;
        targetInput2.value = cliNum2;
    
        // Modal 닫기 (Optional)
        var modal = document.getElementById('exampleModal2');
        var modalInstance = coreui.Modal.getInstance(modal);
        modalInstance.hide();
    });
 
    $("#editButton").click(function() {
    	event.preventDefault();
    	
    	$("#exampleModal1 input:not(#cli_num,#cli_crn,#sample6_postcode,#sample6_address,#sample6_extraAddress)").removeAttr('readonly');
       //$("#exampleModal1 input").removeAttr('readonly'); -> 전체 readonly 해제
        $("#exampleModal1 input[type=radio]").prop('disabled', false);
        $(this).hide();
        $("#postCodeButton").show();
        $("#postCodeButton").prop("disabled", false);
        $("#saveCancelButton").show();
    });

    $("#saveButton").click(function(event) {
        // 모달 창 닫히는 기본 동작 방지
        event.preventDefault();
        
        // 모든 입력 필드를 readonly로 설정
        $("#exampleModal1 input").attr('readonly', 'readonly');
        $("#exampleModal1 input[type=radio]").prop('disabled', true);
        
        // 저장 버튼 숨기기, 수정 버튼 보이기
        $(this).hide();
        $("#editButton").show();
        $("#postCodeButton").prop("disabled", true);
        $("#postCodeButton").hide();
        
    });
    
    $("#saveCancelButton").click(function(event) {
        event.preventDefault();
        
        // 원래 값으로 복원
        $("#cli_num").val(originalValues.cli_num);
        $("#cli_name").val(originalValues.cli_name);
        $("#cli_crn").val(originalValues.cli_crn);
        $("#cli_cate").val(originalValues.cli_cate);
        $("#cli_ind").val(originalValues.cli_ind);
        $("#sample6_postcode").val(originalValues.cli_postCode);
        $("#sample6_address").val(originalValues.cli_add1);
        $("#sample6_detailAddress").val(originalValues.cli_add2);
        $("#sample6_extraAddress").val(originalValues.cli_add3);
        $("#cli_tel").val(originalValues.cli_tel);
        $("#cli_rep").val(originalValues.cli_rep);
        $("#cli_email").val(originalValues.cli_email);
        $("#pic_username").val(originalValues.pic_username);
        $("#user_per_name").val(originalValues.user_per_name);
        
        // 입력 필드 및 라디오 버튼 readonly 및 disabled 상태로 복원
        $("#exampleModal1 input:not(#cli_num,#cli_crn,#sample6_postcode,#sample6_address,#sample6_extraAddress)").attr('readonly', 'readonly');
        $("#exampleModal1 input[type=radio]").prop('disabled', true);
        
        $(this).hide();
        $("#saveButton").hide();
        $("#editButton").show();
    });
    
    getManagerList();

	function getManagerList() {
	   
	   	$('#modal2-table tbody tr').remove();
	    
	    $.ajax({
	        url: "/common/managerList",
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