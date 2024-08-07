<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	.modal.right-modal .modal-dialog {
		position: absolute;
		right: -500px; /* 첫 번째 모달의 오른쪽에 위치하도록 설정 */
		top: 50%;
		transform: translateY(-50%);
	}
</style>
<style>
	.section {
		width: 200px;
		height: 100px;
		margin: 10px;
		padding: 20px;
		text-align: center;
		line-height: 100px;
		border: 1px solid #000;
		cursor: pointer;
	}
	
	.sectionA {
		background-color: lightblue;
	}
	
	.sectionB {
		background-color: lightgreen;
	}
	
	.sectionC {
		background-color: lightcoral;
	}
	
	.sectionD {
		background-color: lightcoral;
	}
</style>

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

<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
	    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
	<input class="button btn-primary" type="button" value="등록" onclick="location.href='/basicInfo/warehouseAdd'" class="btn btn-primary">
	<input class="button btn-primary" id="deleteWarehouseBtn" type="button" value="삭제">
	</sec:authorize>
</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
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
			<c:forEach var="whc" items="${whCodeList }">
				<tr>
					<td>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${whc.m_cate_wh_code }"> 
						</div>
					</td>
					<td class="clickable-cell">${whc.m_cate_wh_code }${whc.s_cate_wh_code }</td>
					<td class="clickable-cell">${whc.s_cate_wh_name }</td>
					<td class="clickable-cell">${whc.wh_tel }</td>
					<td class="clickable-cell">${whc.wh_add1 } ${whc.wh_add2 } ${whc.wh_add3 }</td>
					<td class="clickable-cell">${whc.wh_man }</td>
					<td class="clickable-cell">
						<c:choose>
							<c:when test="${whc.wh_status == 1 }">사용중</c:when>
				    		<c:otherwise> 사용 중지</c:otherwise>
						</c:choose>
				    </td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="modal fade" id="exampleModalToggle" data-coreui-backdrop="static" data-coreui-keyboard="false" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
		tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel">창고 상세 보기</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" id="fm1" novalidate>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td><label for="validationCustom01" class="form-label">창고 코드 </label></td>
									<td><input type="text" class="form-control" id="s_cate_wh_code" readonly></td>
								</tr>
								<tr>
									<td><label for="validationCustom01" class="form-label">창고명 </label></td>
									<td><input type="text" class="form-control" id="s_cate_wh_name" name="s_cate_wh_name" readonly></td>
								</tr>
								<tr>
									<td><label for="validationCustom01" class="form-label"> 연락처 </label></td>
									<td><input type="text" class="form-control" id="wh_tel" name="wh_tel" maxlength="11" placeholder="ex) 01012341234" readonly></td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td><label for="validationCustom05" class="form-label"> 창고 담당자 아이디 </label></td> -->
<!-- 									<td><input type="text" class="form-control" id="validationCustom05" data-coreui-toggle="modal" data-coreui-target="#exampleModalToggle2" required disabled></td> -->
<!-- 								</tr> -->
								<tr>
									<td><label for="validationCustom06" class="form-label">창고 담당자 이름 </label></td>
									<td><input type="text" class="form-control" id="validationCustom06" data-coreui-toggle="modal" name="wh_man" data-coreui-target="#exampleModalToggle2" required disabled></td>
								</tr>
								<tr>
									<td><label for="validationCustom03" class="form-label">우편번호</label></td>
									<td>
										<div class="d-flex">
											<input type="text" class="form-control" id="sample6_postcode" name="wh_postCode" readonly> 
											<button type="button" id="postCodeButton" onclick="sample6_execDaumPostcode()" disabled>찾기</button>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="validationCustom03" class="form-label">주소</label></td>
									<td><input type="text" class="form-control" id="sample6_address" name="wh_add1" readonly></td>
								</tr>
								<tr>
									<td><label for="validationCustom03" class="form-label">상세 주소</label></td>
									<td><input type="text" class="form-control" id="sample6_detailAddress" name="wh_add2" readonly></td>
								</tr>
								<tr>
									<td><label for="validationCustom03" class="form-label">참고 항목</label></td>
									<td><input type="text" class="form-control" id="sample6_extraAddress" name="wh_add3" readonly></td>
								</tr>
								<tr>
									<td><label for="validationCustom03" class="form-label"> 현재 상태 </label></td>
									<td>
										<input type="radio" id="wh_statusOk" name="wh_status" value="1" required disabled>
                                        <label for="wh_statusOk">사용중</label>
                                        <input type="radio" id="wh_statusNo" name="wh_status" value="0" required disabled>
                                        <label for="wh_statusNo">사용 중지</label>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
					<button type="button" class="btn btn-secondary" id="editButton">수정</button>
					<button type="submit" class="btn btn-success" id="saveButton" style="display: none;">저장</button>
					<button type="button" class="btn btn-success" id="saveCancelButton" style="display: none;">취소</button>
					</sec:authorize>
					<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	
<!-- 담당자 선택 모달창 -->
<div class="modal fade" id="exampleModalToggle2" data-coreui-backdrop="static" data-coreui-keyboard="false" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalToggleLabel2">담당자</h5>
					<button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover" id="modal2-table">
						<thead class="table-light">
							<tr>
								<th scope="col"></th>
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
<!-- 					<button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button> -->
				<button class="btn btn-primary" data-coreui-target="#exampleModalToggle" data-coreui-toggle="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 주소 api -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<!-- <script src="path/to/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>

<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

// 주소 
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

// 전체 선택
function toggleCheckboxes(source) {
    const checkboxes = document.getElementsByClassName('form-check-input');
    for (let checkbox of checkboxes) {
        checkbox.checked = source.checked;
    }
}

$(document).ready(function(){
	// 삭제
	$("#deleteWarehouseBtn").click(function(){
		
		const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
       	console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const s_cate_wh_codes = [];
		
        checkedCheckboxes.each(function() {
        	const wh_full_code = $(this).closest('tr').find('td:eq(1)').text(); // cli_num이 있는 열의 인덱스에 따라 조정
        	var s_cate_wh_code = wh_full_code.slice(-2);
        	if (s_cate_wh_code) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 wh_codes:", s_cate_wh_code);
                s_cate_wh_codes.push(s_cate_wh_code);
            }
		}); // function()
        
     // 중복 제거
        const uniqueWhNums = [...new Set(s_cate_wh_codes)];
        
     	console.log("최종 wh_codes 배열:", s_cate_wh_codes);
        
        if (s_cate_wh_codes.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        
        if (confirm('선택한 ' + s_cate_wh_codes.length + '개의 항목을 삭제하시겠습니까?')) {
		$.ajax({
			url: '/basicInfo/deleteWarehouse',
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
			type: 'POST',
			contentType: 'application/json',
            data: JSON.stringify({ s_cate_wh_codes: s_cate_wh_codes }),
            success: function(response) {
                // Handle success, e.g., reload the page or show a message
                location.reload();
                alert("삭제 완료 되었습니다");
            },
            error: function(xhr, status, error) {
                // Handle error
                alert("An error occurred: " + error);
            }
        });
		
      } // if
      
	}); // $
	// 상세보기
    $(".clickable-cell").click(function() {
        var whCode = $(this).closest("tr").find("td:nth-child(2)").text();
        var s_cate_wh_code = whCode.slice(-2);
        currentWhCode = s_cate_wh_code;
        
        $.ajax({
            url: '/basicInfo/warehouseDetails',
            type: 'GET',
            data: { s_cate_wh_code: s_cate_wh_code },
            dataType: "json",
            success: function(response) {
                console.log(response);  // 응답 데이터 확인
                
                if (response.length > 0) {
                    var whCode = response[0];
                    console.log(whCode);  // 클라이언트 데이터 확인
                
                // 각 요소에 값을 설정
                $("#s_cate_wh_code").val(whCode.s_cate_wh_code);
                $("#s_cate_wh_name").val(whCode.s_cate_wh_name);
                $("#wh_tel").val(whCode.wh_tel);
                $("#sample6_postcode").val(whCode.wh_postCode);
                $("#sample6_address").val(whCode.wh_add1);
                $("#sample6_detailAddress").val(whCode.wh_add2);
                $("#sample6_extraAddress").val(whCode.wh_add3);
                $("#validationCustom06").val(whCode.wh_man);
                $("#wh_status").val(whCode.wh_status);
                //$("#validationCustom05").val(client.pic_username);
                //$("#validationCustom06").val(client.usersList[0].user_per_name);
                
	                if (whCode.wh_status === 1) {
	                    document.getElementById('wh_statusOk').checked = true;
	                } else if (whCode.wh_status === 0) {
	                    document.getElementById('wh_statusNo').checked = true;
	                }
	                
	             // 모든 입력 필드를 읽기 전용으로 설정
                    $("#exampleModalToggle input").attr('readonly', true);
                    $("#exampleModalToggle input[type=radio]").prop('disabled', true);
                    $("#validationCustom05, #validationCustom06").attr('disabled', true);

                    // 수정 버튼 보이기, 저장 및 취소 버튼 숨기기
                    $("#editButton").show();
                    $("#saveButton, #saveCancelButton, #postCodeButton").hide();
                
	             	// 원래 값을 저장
                    originalValues = {
                    		s_cate_wh_code: whCode.s_cate_wh_code,
                            s_cate_wh_name: whCode.s_cate_wh_name,
                            wh_tel: whCode.wh_tel,
                            wh_postCode: whCode.wh_postCode,
                            wh_add1: whCode.wh_add1,
                            wh_add2: whCode.wh_add2,
                            wh_add3: whCode.wh_add3,
                            wh_man: whCode.wh_man,
                            wh_status: whCode.wh_status
                    };
	             	
                	$("#exampleModalToggle").modal("show");
                }
            },
            error: function() {
            	console.log(error);
                alert('Failed to fetch transaction details.');
            }
        });
 	 });
 
 	// 수정 버튼 
    $("#editButton").click(function(event) {
    	event.preventDefault();
    	
    	// 선택된 클라이언트의 입력 필드만 수정 가능하게 변경
       	//$("#exampleModalToggle input").removeAttr('readonly'); // 전체 readonly 해제
    	$("#exampleModalToggle input:not(#s_cate_wh_code,#sample6_postcode,#sample6_address,#sample6_extraAddress)").removeAttr('readonly');
        $("#exampleModalToggle input[type=radio]").prop('disabled', false);
        $("#validationCustom05, #validationCustom06").removeAttr('disabled');
    	
        $(this).hide();
        $("#postCodeButton").show();
        $("#saveButton").show();
        $("#postCodeButton").prop("disabled", false);
        $("#saveCancelButton").show();
        
        saveOriginalValues(); // 수정 모드로 전환할 때 원래 값 저장
    });

 	// 담당자 정보 가져오기 (체크로)
    $('#modal2-table tbody').on('change', 'input[type="checkbox"]', function() {
        if ($(this).prop('checked')) {
        
            // 체크박스가 선택되면, 해당 행의 값을 가져와서 입력 요소에 설정
            var $row = $(this).closest('tr');
            var cliNum1 = $row.find('td:nth-child(3)').text();
            var cliNum2 = $row.find('td:nth-child(4)').text();
            $('#validationCustom05').val(cliNum1);
            $('#validationCustom06').val(cliNum2);
            
            // 다른 체크박스는 해제
            $('#modal2-table tbody input[type="checkbox"]').not(this).prop('checked', false);
        }
    });
 
    var originalValues = {}; // 입력 필드의 원래 값을 저장할 객체

    // 페이지 로드 시 입력 필드의 원래 값을 저장
    function saveOriginalValues() {
        $("#exampleModalToggle input").each(function() {
            originalValues[this.id] = $(this).val();
        });
        $("#exampleModalToggle input[type=radio]").each(function() {
            if ($(this).is(':checked')) {
                originalValues[this.name] = $(this).val();
            }
        });
    }

    // 원래 값과 현재 값을 비교
    function hasChanges() {
        var changed = false;

        $("#exampleModalToggle input").each(function() {
            if (originalValues[this.id] !== $(this).val()) {
                changed = true;
                return false; // 변경이 발견되면 반복문 종료
            }
        });

        $("#exampleModalToggle input[type=radio]").each(function() {
            if ($(this).is(':checked') && originalValues[this.name] !== $(this).val()) {
                changed = true;
                return false; // 변경이 발견되면 반복문 종료
            }
        });

        return changed;
    }

    // 페이지 로드 시 원래 값 저장
    saveOriginalValues();

    $("#saveButton").click(function(event) {
        // 모달 창 닫히는 기본 동작 방지
        event.preventDefault();

        if (!hasChanges()) {
            alert("수정사항이 없습니다.");
            return;
        }
        
        const updatedWhCode = {
                s_cate_wh_code: $("#s_cate_wh_code").val(),
                s_cate_wh_name: $("#s_cate_wh_name").val(),
                wh_tel: $("#wh_tel").val(),
                wh_postCode: $("#sample6_postcode").val(),
                wh_add1: $("#sample6_address").val(),
                wh_add2: $("#sample6_detailAddress").val(),
                wh_add3: $("#sample6_extraAddress").val(),
                wh_man: $("#validationCustom06").val(),
                wh_status: $("input[name='wh_status']:checked").val()
            };
        
        $.ajax({
        	url: '/basicInfo/updateWhCode',
        	beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
        	type: 'POST',
        	contentType: 'application/json',
        	data: JSON.stringify(updatedWhCode),
        	success: function(response){
        		alert(" 수정되었습니다. ");
        		$("#exampleModalToggle").modal("hide");
        	},
        	error: function(textStatus){
        		console.log(textStatus);
        	}
        });
        
        // 모든 입력 필드를 readonly로 설정
        $("#exampleModalToggle input").attr('readonly', 'readonly');
        $("#exampleModalToggle input[type=radio]").prop('disabled', true);
        $("#validationCustom05, #validationCustom06").attr('disabled', true);

        // 저장 버튼 숨기기, 수정 버튼 보이기
        $(this).hide();
        $("#editButton").show();
        $("#postCodeButton").prop("disabled", true);
        //$("#postCodeButton").hide();
        $("#saveCancelButton").hide();
        
        currentClientNum = null;
    });
    
    // 저장 취소 버튼
    $("#saveCancelButton").click(function(event) {
        event.preventDefault();
        
        var userConfirmed = confirm("취소하시겠습니까?");
        
        if (userConfirmed) {
       
       	// 취소 작업 수행 => 원래 값으로 복원
       	$("#s_cate_wh_code").val(originalValues.s_cate_wh_code);
        $("#s_cate_wh_name").val(originalValues.s_cate_wh_name);
        $("#wh_tel").val(originalValues.wh_tel);
        $("#sample6_postcode").val(originalValues.wh_postCode);
        $("#sample6_address").val(originalValues.wh_add1);
        $("#sample6_detailAddres").val(originalValues.wh_add2);
        $("#sample6_extraAddress").val(originalValues.wh_add3);
        $("#validationCustom06").val(originalValues.wh_man);
        $("#wh_status").val(originalValues.wh_status);
        
        // 입력 필드 및 라디오 버튼 readonly 및 disabled 상태로 복원
        $("#exampleModalToggle input:not(#s_cate_wh_code, #sample6_postcode,#sample6_address,#sample6_extraAddress)").attr('readonly', 'readonly');
        $("#exampleModalToggle input[type=radio]").prop('disabled', true);
        $("#validationCustom05, #validationCustom06").attr('disabled', true);
        
        $(this).hide();
        $("#saveButton").hide();
        $("#postCodeButton").prop("disabled", true);
        $("#editButton").show();
        
            alert("변경 사항이 취소되었습니다.");
            // 필요한 경우 폼 초기화 또는 다른 취소 작업 수행
        } else {
            // 아무 작업도 하지 않음 (원래의 수정상태로 유지)
            alert("취소 작업이 중단되었습니다.");
        }
        alert(" 취소하시겠습니까? ");
        
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
	               var row = "<tr><th scope='row'><input type='checkbox' onclick='checkOneOnly(this)'></th><td>" + (parseInt(idx)+1) + "</td><td>" + item.username + "</td><td>" + item.user_per_name + "</td></tr>"
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

<%@ include file="../include/footer.jsp"%>
</body>
</html>