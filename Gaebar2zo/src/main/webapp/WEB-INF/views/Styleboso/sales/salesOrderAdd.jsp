<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>

   <h1>/Styleboso/sales/salesOrderAdd.jsp</h1>

   <div class="container-lg px-4">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
<!--                <div class="card-header"> -->
<!--                   <strong>수주관리</strong><span class="small ms-1">등록</span> -->
<!--                </div> -->
               <div class="card-body">
<!--                   <p class="text-body-secondary small"> -->
<!--                      Custom -->
<!--                      <code>&lt;select&gt;</code> -->
<!--                      menus need only a custom class, -->
<!--                      <code>.form-select</code> -->
<!--                      to trigger the custom styles.Custom styles are limited to the -->
<!--                      <code>&lt;select&gt;</code> -->
<!--                      ’s initial appearance and cannot modify the -->
<!--                      <code>&lt;option&gt;</code> -->
<!--                      s due to browser limitations. -->
<!--                   </p> -->
                  <form class="row g-3 needs-validation" novalidate>
                     <div class="col-md-6">
                        <label for="validationCustom01" class="form-label">납기일자</label> 
                           <input type="date" class="form-control"
                           id="validationCustom01" required>
                        <div class="invalid-feedback">납기일자를 입력해주세요</div>
                     </div>
                     <div class="col-md-6">
                        <label for="validationCustom02" class="form-label">수주일자</label> 
                           <input type="date" class="form-control"
                           id="validationCustom02" required>
                        <div class="invalid-feedback">수주일자를 입력해주세요</div>
                     </div>
                     <div class="col-md-6">
                        <label for="validationCustom03" class="form-label">거래처</label>
                           <input type="text" class="form-control custom-btn" id="validationCustom03" value="-"
                                 data-coreui-toggle="modal" data-coreui-target="#exampleModal1" readonly required>
                        <div class="invalid-feedback">거래처를 입력해주세요</div>
                     </div>
                     <div class="col-md-6">
                        <label for="validationCustom04" class="form-label">담당자</label>
                           <input type="text" class="form-control" id="validationCustom04"
                                 data-coreui-toggle="modal" data-coreui-target="#exampleModal2" readonly required>
                        <div class="invalid-feedback">담당자를 입력해주세요</div>
                     </div>
                  <div class="example">
                     <ul class="nav nav-underline-border" role="tablist">
                     </ul>
                     <div class="tab-content rounded-bottom">
                        <div class="tab-pane p-3 active preview" role="tabpanel"
                           id="preview-1000">
                              <table class="table">
                                 <thead class="table-light">
                                    <tr>
                                       <th scope="col">#</th>
                                       <th scope="col">First</th>
                                       <th scope="col">Last</th>
                                       <th scope="col">Handle</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <th scope="row">1</th>
                                       <td>Mark</td>
                                       <td>Otto</td>
                                       <td>@mdo</td>
                                    </tr>
                                    <tr>
                                       <th scope="row">2</th>
                                       <td>Jacob</td>
                                       <td>Thornton</td>
                                       <td>@fat</td>
                                    </tr>
                                    <tr>
                                       <th scope="row">3</th>
                                       <td>Larry</td>
                                       <td>the Bird</td>
                                       <td>@twitter</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                     </div>
                  </div>
                     <div class="col-12">
                        <button class="btn btn-primary" type="submit" id="submitFormBtn">Submit form</button>
                     </div>
                     <!-- Modal1 -->
                     <div class="modal fade" id="exampleModal1" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="exampleModalLabel">거래처</h5>
                                 <button type="button" class="btn-close"
                                    data-coreui-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                 <table class="table table-hover" id="modal1-table">
                                    <thead class="table-light">
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col">거래처 코드</th>
                                          <th scope="col">거래처 명</th>
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
                     <!-- Modal2 -->
                     <div class="modal fade" id="exampleModal2" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="exampleModalLabel">담당자</h5>
                                 <button type="button" class="btn-close"
                                    data-coreui-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                 <table class="table table-hover" id="modal1-table">
                                    <thead class="table-light">
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col">거래처 코드</th>
                                          <th scope="col">거래처 명</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       
                                    </tbody>
                                 </table>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
                                 <button type="button" class="btn btn-primary" id="sendBtn">Send message</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>

      </div>
   </div>
   <h1>/Styleboso/sales/salesOrderAdd.jsp</h1>
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

<script type="text/javascript">
   
   document.addEventListener('DOMContentLoaded', function() {
      
       const submitFormBtn = document.getElementById('submitFormBtn');
   
       submitFormBtn.addEventListener('click', function(event) {
         event.preventDefault(); // 기본 제출 동작 방지
   
         // 필요한 유효성 검사를 적용할 모든 폼을 가져오기
         const forms = document.querySelectorAll('.needs-validation');
         
         // NodeList를 배열로 변환하고 각각의 폼에 대해 처리
         Array.from(forms).forEach(form => {
            // 유효성 검사 통과 여부 확인
            if (!form.checkValidity()) {
              event.stopPropagation(); // 상위 요소로 이벤트 전파 방지
            }
            
            // Bootstrap의 'was-validated' 클래스 추가
            form.classList.add('was-validated');
         });
       });

      $('#modal1-table tbody').on('click', 'tr', function() {
          var targetInput = document.getElementById('validationCustom03');
          var cliNum = $(this).find('td:nth-child(2)').text(); // 두 번째 열(거래처 코드)

          // Modal에서 입력된 값을 가져와서 다른 input 요소에 설정
          targetInput.value = cliNum;
      
          // Modal 닫기 (Optional)
          var modal = document.getElementById('exampleModal1');
          var modalInstance = coreui.Modal.getInstance(modal);
          modalInstance.hide();
      });
      
      
      
      function getClientList() {
         
          $('#modal1-table tbody tr').remove();
          
          $.ajax({
              url: "/Styleboso/common/clientList",
              type: "get",
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function(data) {
                  // body 태그에 내용 추가
                  console.log(data);
                  data.forEach(function(item, idx){
                     console.log(idx);
                     var row = "<tr><th scope='row'>" + (parseInt(idx)+1) + "</th><td>" + item.cli_num + "</td><td>" + item.cli_name + "</td></tr>"
                      $('#modal1-table tbody').append(row);
                  });
                  
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                  alert("AJAX 요청 실패!");
              }
          });
      }
      
      getClientList();
      
   });
   
</script>

<%@ include file="../include/footer.jsp" %>
</html>
