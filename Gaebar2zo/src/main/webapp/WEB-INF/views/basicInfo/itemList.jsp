<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
    <style>
      /* 두 번째 모달이 첫 번째 모달 오른쪽에 위치하도록 설정 */
        .modal.right-modal .modal-dialog {
            position: absolute;
            right: -500px; /* 첫 번째 모달의 오른쪽에 위치하도록 설정 */
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
<body>
   <h1>/Styleboso/basicInfo/itemList.jsp</h1>
   
   <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
      <input type="button" class="btn btn-primary" value="등록" onclick="location.href='/basicInfo/itemAdd'">
      <input type="button" id="deleteItemBtn" name="deleteItemBtn" class="btn btn-primary" value="삭제">
   </div>
   
    <div class="container">
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-md-3 mb-3">
                    <form action="/basicInfo/itemList" method="get" class="form-inline mt-3">
                        <div class="input-group w-500">
                            <div class="input-group-prepend">
                                <select class="form-select custom-select-radius custom-select-width" id="searchType" name="searchType">
                                    <option value="" <c:if test="${empty searchType}">selected</c:if>>전체</option>
                                    <option value="code" <c:if test="${searchType eq 'code'}">selected</c:if>>품목 코드</option>
                                    <option value="name" <c:if test="${searchType eq 'name'}">selected</c:if>>품목명</option>
                                    <option value="type" <c:if test="${searchType eq 'type'}">selected</c:if>>제품 유형</option>
                                </select>
                            </div>
                            <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="keyword" value="${keyword}">
                            <button class="btn btn-outline-secondary" type="submit">검색</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
   
   <table class="table table-hover">
      <thead>
         <tr>
            <th scope="col"> 
               <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="selectAll" onclick = "toggleCheckboxes(this)"> 
                  </div>
            </th>
            <th scope="col">품목 코드</th>
            <th scope="col">거래처 코드</th>
            <th scope="col">품목명</th>
            <th scope="col">제품 유형</th>
            <th scope="col">매입 단가 (만 원)</th>
            <th scope="col">매출 단가 (만 원)</th>
            <th scope="col">재질</th>
            <th scope="col">비고</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="itl" items="${itemList }">
            <tr>
               <td>
                    <div class="form-check">
                           <input class="form-check-input" type="checkbox" value="" id="flexCheckdefault${itl.item_num }"> 
                        </div>
                     </td>
                     <td class="clickable-cell">${itl.item_num }</td>
                     <td class="clickable-cell">${itl.item_cli_code }</td>
                     <td class="clickable-cell">${itl.item_name }</td>
                     <td class="clickable-cell">${itl.group_name }</td>
                     <td class="clickable-cell">${itl.item_purchase_price }</td>
                     <td class="clickable-cell">${itl.item_sale_price }</td>
                     <td class="clickable-cell">${itl.item_mat }</td>
                     <td class="clickable-cell">${itl.comm }</td>
            </tr>   
         </c:forEach>
      </tbody>
   </table>
   
   <c:url var="pageUrl" value="/basicInfo/itemList">
            <c:param name="searchType" value="${searchType}"/>
            <c:param name="keyword" value="${keyword}"/>
   </c:url>

        <nav aria-label="Page navigation" class="pagination-container">
            <ul class="pagination justify-content-center">
                <c:if test="${pageVO.prev}">
                    <li class="page-item">
                        <a class="page-link" href="${pageUrl}&page=${pageVO.startPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
                    <li class="page-item ${pageVO.cri.page == i ? 'active' : ''}">
                        <a class="page-link" href="${pageUrl}&page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageVO.next && pageVO.endPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="${pageUrl}&page=${pageVO.endPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
   

<!-- 상세보기 모달창-->
<div class="modal fade" id="exampleModalToggle" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"> 품목 상세 보기 </h5>
                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="needs-validation" id="fm1" novalidate>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td><label for="validationCustom01" class="form-label">품목 코드</label></td>
                                <td><input type="text" class="form-control" id="item_num" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom02" class="form-label">품목명</label></td>
                                <td><input type="text" class="form-control" id="item_name" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom02" class="form-label">거래처 코드</label></td>
                                <td><input type="text" class="form-control" id="item_cli_code" data-coreui-toggle="modal"
                           data-coreui-target="#exampleModalToggle2" name="item_cli_code" required disabled></td>
                            </tr>
                              <tr>
                                <td><label for="validationCustom03" class="form-label">제품 유형 </label></td>
                        <td><input type="text" class="form-control" id="group_name" name="group_name" readonly></td>
                            </tr>
                              <tr>
                                <td><label for="validationCustom03" class="form-label">제품 그룹명 </label></td>
                        <td><input type="text" class="form-control" id="s_cate_item_name" name="s_cate_item_name" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">재질</label></td>
                                <td><input type="text" class="form-control" id="item_mat" name="item_mat" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">매입 단가</label></td>
                                <td><input type="text" class="form-control" id="item_purchase_price" name="item_purchase_price" readonly></td>
                            </tr>
                            <tr>    
                                <td><label for="validationCustom03" class="form-label">매출 단가</label></td>
                                <td><input type="text" class="form-control" id="item_sale_price" name="item_sale_price" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="validationCustom03" class="form-label">비고</label></td>
                                <td><input type="text" class="form-control" id="comm" name="comm" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="editButton">수정</button>
                <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">저장</button>
                <button type="button" class="btn btn-success" id="saveCancelButton" style="display: none;">취소</button>
                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">닫기</button>
            </div>
        </div>
    
      </div>
</div>


<!-- 거래처 선택 모달창 -->
<div class="modal fade" id="exampleModalToggle2" data-coreui-backdrop="static" data-coreui-keyboard="false" tabindex="-1" aria-labelledby="exampleModalToggleLabel2" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel2">거래처</h5>
<!--                <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button> -->
            </div>
            <div class="modal-body">
               <table class="table table-hover" id="modal2-table">
                  <thead class="table-light">
                     <tr>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col">거래처 코드</th>
                        <th scope="col">거래처 이름</th>
                     </tr>
                  </thead>
                  <tbody>

                  </tbody>
               </table>
            </div>
            <div class="modal-footer">
<!--                <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button> -->
            <button class="btn btn-primary" data-coreui-target="#exampleModalToggle" data-coreui-toggle="modal">확인</button>
            </div>
         </div>
      </div>
   </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>

<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

// 전체 선택
function toggleCheckboxes(source) {
    const checkboxes = document.getElementsByClassName('form-check-input');
    for (let checkbox of checkboxes) {
        checkbox.checked = source.checked;
    }
}

$(document).ready(function(){
   // 삭제
   $("#deleteItemBtn").click(function(){
      
      const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
          console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const item_nums = [];
   
        checkedCheckboxes.each(function() {
           const item_num = $(this).closest('tr').find('td:eq(1)').text();
           if (item_num) {  // 빈 문자열이 아닌 경우에만 추가
                console.log("추출된 item_num:", item_num);
                item_nums.push(item_num);
            }
        });
        // 중복 제거
        const uniqueItemNums = [...new Set(item_nums)];
     
        console.log("최종 item_nums 배열:", item_nums);
        
        if (item_nums.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
   
        if (confirm('선택한 ' + item_nums.length + '개의 항목을 삭제하시겠습니까?')) {
          $.ajax({
             url: '/basicInfo/deleteItem',
             beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                 },
             type: 'POST',
             contentType: 'application/json',
                data: JSON.stringify({ item_nums: item_nums }),
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
          
          } //if
          
   }); // 버튼
   
   // 상세보기
    $(".clickable-cell").click(function() {
           var item_num = $(this).closest("tr").find("td:nth-child(2)").text();
           currentItemNum = item_num;
           
           $.ajax({
               url: '/basicInfo/itemDetails',
               type: 'GET',
               data: { item_num: item_num },
               dataType: "json",
               success: function(response) {
                   console.log(response);  // 응답 데이터 확인
                   
                   if (response) {
                       var item = response[0];
                       var itemName = response[0].itemCodeList[0];
                       console.log(name);
                       console.log(item);  
                   
                   // 각 요소에 값을 설정
                   $("#item_num").val(item.item_num);
                   $("#item_name").val(item.item_name);
                   $("#s_cate_item_name").val(itemName.s_cate_item_name);
                   $("#item_cli_code").val(item.item_cli_code);
                   $("#group_name").val(item.group_name);
                   $("#item_cate_code").val(item.item_cate_code);
                   $("#item_purchase_price").val(item.item_purchase_price);
                   $("#item_sale_price").val(item.item_sale_price);
                   $("#item_mat").val(item.item_mat);
                   $("#comm").val(item.comm);
                   
                    // 모든 입력 필드를 읽기 전용으로 설정
                       $("#exampleModalToggle input").attr('readonly', true);
                       $("#exampleModalToggle select").prop('disabled', true);

                        // 수정 버튼 보이기, 저장 및 취소 버튼 숨기기
                       $("#editButton").show();
                       $("#saveButton, #saveCancelButton").hide();
                       
                    // 원래 값을 저장
                       originalValues = {
                           item_num: item.item_num,
                           item_name: item.item_name,
                           s_cate_item_name : item.s_cate_item_name,
                           item_cli_code: item.item_cli_code,
                           group_name : item.group_name,
                           item_cate_code: item.item_cate_code,
                           item_purchase_price: item.item_purchase_price,
                           item_sale_price: item.item_sale_price,
                           item_mate : item.item_mate,
                           comm : item.comm
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
       $("#exampleModalToggle input:not(#item_num, #group_name, #s_cate_item_name)").removeAttr('readonly');
       $("#item_cli_code").removeAttr('disabled');
          
        $(this).hide();
        $("#saveButton").show();
        $("#saveCancelButton").show();
        
        saveOriginalValues(); // 수정 모드로 전환할 때 원래 값 저장
    });
   
       let originalValues = {}; // 입력 필드의 원래 값을 저장할 객체

       // 페이지 로드 시 입력 필드의 원래 값을 저장
       function saveOriginalValues() {
           $("#exampleModalToggle input").each(function() {
               originalValues[this.id] = $(this).val();
           });
           $("#exampleModalToggle select").each(function() {
               originalValues[this.id] = $(this).val();
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

           $("#exampleModalToggle select").each(function() {
               if (originalValues[this.name] !== $(this).val()) {
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
           
           const updatedItem = {
                 item_num: $("#item_num").val(),
                    //item_cate_code: $("#item_cate_code").val(),
                    item_cli_code: $("#item_cli_code").val(),
                    item_name: $("#item_name").val(),
                    item_purchase_price: $("#item_purchase_price").val(),
                    item_sale_price: $("#item_sale_price").val(),
                    item_mat : $("#item_mat").val(),
                    comm : $("#comm").val() 
               };
           
           $.ajax({
              url: '/basicInfo/updateItem',
              beforeSend: function(xhr) {
                   xhr.setRequestHeader(header, token);
                },
              type: 'POST',
              contentType: 'application/json',
              data: JSON.stringify(updatedItem),
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
           $("#exampleModalToggle select").removeAttr('disabled', true);

           // 저장 버튼 숨기기, 수정 버튼 보이기
           $(this).hide();
           $("#editButton").show();
           $("#saveCancelButton").hide();
           
           currentItemNum = null;
       });
   
    // 저장 취소 버튼
       $("#saveCancelButton").click(function(event) {
           event.preventDefault();
           
           var userConfirmed = confirm("취소하시겠습니까?");
           
           if (userConfirmed) {
          
             // 취소 작업 수행 => 원래 값으로 복원
           $("#item_num").val(originalValues.item_num);
           $("#item_cli_code").val(originalValues.item_cli_code);
           //$("#item_cate_code").val(originalValues.item_cate_code);
           $("#item_name").val(originalValues.item_name);
           $("#item_purchase_price").val(originalValues.item_purchase_price);
           $("#item_sale_price").val(originalValues.item_sale_price);
           $("#item_mat").val(originalValues.item_mat);
           $("#comm").val(originalValues.comm);
           
           // 입력 필드 및 라디오 버튼 readonly 및 disabled 상태로 복원
           $("#exampleModalToggle input:not(#item_num,#item_cli_code,#s_cate_item_name)").attr('readonly', 'readonly');
           $("#exampleModalToggle select").prop('disabled', true);
           
           $(this).hide();
           $("#saveButton").hide();
           $("#editButton").show();
           
               alert("변경 사항이 취소되었습니다.");
               // 필요한 경우 폼 초기화 또는 다른 취소 작업 수행
           } else {
               // 아무 작업도 하지 않음 (원래의 수정상태로 유지)
               alert("취소 작업이 중단되었습니다.");
           }
           alert(" 취소하시겠습니까? ");
           
       });
    
      getClientList();
      
      // 거래처 코드 가져오기
      function getClientList(){

          $('#modal2-table tbody tr').remove();
         
         $.ajax({
            url : "/common/clientList",
            type : "GET",
            contentType : 'application/json; charset=utf-8',
            dataType : "json",
            success : function(data){
               console.log(data);
               data.forEach(function(client, idx){
                  console.log(idx);
                  var row = "<tr><th scope='row'><input type='checkbox' onclick='checkOneOnly(this)'></th><td>"+ (parseInt(idx)+1) +"</td><td>"+ client.cli_num + "</td><td>"+ client.cli_name + "</td></tr>"
                  $('#modal2-table tbody').append(row);
               });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                  console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                  alert("AJAX 요청 실패!");
              }
            
         });
         
      }
   
       $('#modal2-table tbody').on('change', 'input[type="checkbox"]', function() {
          if ($(this).prop('checked')){
          
          var $row = $(this).closest('tr');
          var itemNum = $row.find('td:nth-child(3)').text();
          $('#item_cli_code').val(itemNum);

           // 다른 체크박스는 해제
            $('#modal2-table tbody input[type="checkbox"]').not(this).prop('checked', false);
           
          }
       });

});

</script>

<%@ include file="../include/footer.jsp" %>

</html>