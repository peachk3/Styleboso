<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<body>
    <h1>/Styleboso/stock/receivingAdd.jsp</h1>
    <div class="container-lg px-4">
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <form class="row g-3 needs-validation" novalidate>
                            <div class="col-md-6">
                                <label for="validationCustom01" class="form-label">납기일자</label>
                                <input type="date" class="form-control" id="validationCustom01" required>
                                <div class="invalid-feedback">납기일자를 입력해주세요</div>
                            </div>
                            <div class="col-md-6">
                                <label for="validationCustom02" class="form-label">수주일자</label>
                                <input type="date" class="form-control" id="validationCustom02" required>
                                <div class="invalid-feedback">수주일자를 입력해주세요</div>
                            </div>
                            <div class="col-md-6">
                                <label for="validationCustom03" class="form-label">거래처</label>
                                <input type="text" class="form-control custom-btn" id="validationCustom03" value="-" data-coreui-toggle="modal" data-coreui-target="#exampleModal1" readonly required>
                                <div class="invalid-feedback">거래처를 입력해주세요</div>
                            </div>
                            <div class="col-md-6">
                                <label for="validationCustom04" class="form-label">담당자</label>
                                <input type="text" class="form-control" id="validationCustom04" data-coreui-toggle="modal" data-coreui-target="#exampleModal2" readonly required>
                                <div class="invalid-feedback">담당자를 입력해주세요</div>
                            </div>
                            <div class="example">
                                <ul class="nav nav-underline-border" role="tablist">
                                </ul>
                                <div class="tab-content rounded-bottom">
                                    <table class="table">
        <thead class="table-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">입고번호</th>
                <th scope="col">품목코드</th>
                <th scope="col">품목명</th>
                <th scope="col">입고 수량</th>
                <th scope="col">입고일</th>
                <th scope="col">발주 번호</th>
                <th scope="col">재고 번호</th>
                <th scope="col">비고</th>
                <th scope="col">상태</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
            </tr>
        </tbody>
    </table>
    
    <button id="addRowBtn" class="btn btn-outline-info" type="button">품목 추가</button>
</div>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-primary" type="submit" id="submitFormBtn">Submit form</button>
                            </div>
                            <!-- Modal1 -->
                            <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                            <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Recipient:</label>
                                                    <input type="text" class="form-control" id="recipient-name">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-coreui-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" id="sendBtn">Send message</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal2 -->
                            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                            <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="mb-3">
                                                    <label for="recipient-name" class="col-form-label">Recipient:</label>
                                                    <input type="text" class="form-control" id="recipient-name">
                                                </div>
                                            </form>
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

    















</body>

<style>
        .custom-btn {
            text-align: left;
            padding-left: 10px;
            width: 100%;
        }
    </style>
      <script>
        document.addEventListener('DOMContentLoaded', function() {
            const submitFormBtn = document.getElementById('submitFormBtn');
            const addRowBtn = document.getElementById('addRowBtn');
            const tableBody = document.getElementById('tableBody');

            submitFormBtn.addEventListener('click', function(event) {
                event.preventDefault();
                const forms = document.querySelectorAll('.needs-validation');
                Array.from(forms).forEach(form => {
                    if (!form.checkValidity()) {
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            });

            addRowBtn.addEventListener('click', function() {
                const newRow = document.createElement('tr');
                const rowCount = tableBody.rows.length + 1;
                newRow.innerHTML = `
                    <td>${rowCount}</td>
                    <td>새로운 입고번호</td>
                    <td>새로운 품목코드</td>
                    <td>새로운 품목명</td>
                    <td>새로운 입고 수량</td>
                    <td>새로운 입고일</td>
                    <td>새로운 발주 번호</td>
                    <td>새로운 재고 번호</td>
                    <td>새로운 비고</td> 
                    <td>새로운 상태</td>
                `;
                tableBody.appendChild(newRow);
            });

            // Modal에서 값을 가져와서 다른 input 요소에 넣기
            const sendBtn = document.getElementById('sendBtn');
            const recipientInput = document.getElementById('recipient-name');
            const targetInput = document.getElementById('validationCustom03');

            sendBtn.addEventListener('click', function() {
                targetInput.value = recipientInput.value;
                const modal = document.getElementById('exampleModal1');
                const modalInstance = coreui.Modal.getInstance(modal);
                modalInstance.hide();
            });
        });
    </script>
    
<%@ include file="../include/footer.jsp" %>
</html>
