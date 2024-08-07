<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/header.jsp" %>
    <style>
        .status-buttons { display: none; }
        .modal-dialog { max-width: 80%; }
        .search-container { display: flex; margin-bottom: 20px; }
        .search-group { display: flex; align-items: center; }
        .table-container { margin-top: 20px; }
        .custom-select-radius {
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }
        .custom-select-radius:focus {
            z-index: 10;
            position: relative;
        }
        .input-group {
            width: 200%;
        }
    </style>
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@3.2.2/dist/js/coreui.min.js"></script>
    <!-- CSRF Meta Tags -->
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
</head>
<body>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3 mb-3">
                <form action="/stock/adjustment/return" method="get" class="form-inline mt-3">
                    <div class="input-group w-500">
                        <div class="input-group-prepend">
                            <select class="form-select custom-select-radius custom-select-width" id="searchType" name="searchType">
                                <option value="" <c:if test="${empty searchType}">selected</c:if>>전체</option>
                                <option value="code" <c:if test="${searchType eq 'code'}">selected</c:if>>반품 번호</option>
                                <option value="name" <c:if test="${searchType eq 'name'}">selected</c:if>>품목명</option>
                                <option value="client" <c:if test="${searchType eq 'client'}">selected</c:if>>거래처명</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="keyword" value="${keyword}">
                        <button class="btn btn-outline-secondary" type="submit">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right : 10px; padding : 10px;">
        <input type="button" class="btn btn-primary" value="등록" onclick="location.href='/stock/adjustment/returnAdd'">
        <input type="button" id="deleteItemBtn" name="deleteItemBtn" class="btn btn-primary" value="삭제">
    </div>
    
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="selectAll" onclick="toggleCheckboxes(this)"> 
                </div>
            </th>
            <th scope="col">교환 번호</th>
            <th scope="col">반품 거래처</th>
            <th scope="col">품목명</th>
            <th scope="col">반품 수량</th>
            <th scope="col">접수일</th>
            <th scope="col">교환일</th>
            <th scope="col">교환 사유</th>
            <th scope="col">상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="re" items="${ex}">
            <c:forEach var="item" items="${ex.itemList}">
                <c:forEach var="inchange" items="${ex.inchangeList}">
                    <c:forEach var="goods" items="${item.tranGoodsList}">
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault${re.tran_num}"> 
                                </div>
                            </td>
                            <td class="clickable-cell">${ex.tran_num}</td>
                            <td class="clickable-cell">${ex.cli_num}</td>
                            <td class="clickable-cell">${item.item_name}</td>
                            <td class="clickable-cell">${goods.goods_qty}</td>
                            <td class="clickable-cell">${ex.tran_date}</td>
                            <td class="clickable-cell">${ex.rec_date}</td>
                            <td class="clickable-cell">${ex.comm}</td>
                            <td class="clickable-cell">${ex.pro_status}</td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>

    <div class="container mt-3">
        <button id="statusChangeBtn" class="btn btn-outline-info">상태 변경</button>
        <div class="status-buttons mt-2">
            <button class="btn btn-outline-info" id="preReceiveBtn">교환 예정</button>
            <button class="btn btn-outline-info" id="completedReceiveBtn">교환 완료</button>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">교환 상세 정보</h5>
                    <button type="button" class="btn-close" data-coreui-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Modal content here -->
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

    <c:url var="pageUrl" value="/stock/adjustment/return">
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
    
    <%@ include file="../../include/footer.jsp" %>
</body>
</html>

<script>
function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"].form-check-input');
    checkboxes.forEach(checkbox => checkbox.checked = source.checked);
}

function formatDateForInput(dateStr) {
    if (!dateStr) return '';
    dateStr = dateStr.split('T')[0];
    return dateStr;
}

$(document).ready(function() {
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    $(".clickable-cell").click(function() {
        var tran_num = $(this).closest("tr").find("td:nth-child(2)").text();

        $.ajax({
            url: '/stock/getReturnDetails',
            type: 'GET',
            data: { 
                tran_num: tran_num
            },
            dataType: "json",
            success: function(response) {
                console.log("AJAX 응답:", response);
                
                // 모달 내용 채우기
                // ...

                $("#exampleModal1").modal("show");
            },
            error: function(error) {
                console.log("에러 발생: ", error);
            }
        });
    });

    $("#statusChangeBtn").click(function() {
        $(".status-buttons").toggle();
    });

    $(".status-buttons .btn").click(function() {
        const pro_status = $(this).text().trim();

        const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
        const tran_nums = [];

        checkedCheckboxes.each(function() {
            const tran_num = $(this).closest('tr').find('td:eq(1)').text();
            if (tran_num) {
                tran_nums.push(tran_num);
            }
        });

        if (tran_nums.length === 0) {
            alert('변경할 항목을 선택해주세요.');
            return;
        }

        $.ajax({
            url: '/common/updateRecevingStatus',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ tran_nums: tran_nums, pro_status: pro_status }),
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                location.reload();
                alert("상태가 성공적으로 변경되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
    });

    $("#deleteItemBtn").click(function(){
        const checkedCheckboxes = $('input[type="checkbox"].form-check-input:checked');
        console.log("선택된 체크박스 수:", checkedCheckboxes.length);
        const tran_nums = [];

        checkedCheckboxes.each(function() {
            const tran_num = $(this).closest('tr').find('td:eq(1)').text();
            if (tran_num) {
                console.log("추출된 tran_num:", tran_num);
                tran_nums.push(tran_num);
            }
        });
        
        console.log("최종 tran_nums 배열:", tran_nums);
        
        if (tran_nums.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }

        if (confirm('선택한 ' + tran_nums.length + '개의 항목을 삭제하시겠습니까?')) {
            $.ajax({
                url: '/stock/deleteRE',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ tran_nums: tran_nums }),
                success: function(response) {
                    location.reload();
                    alert("삭제 완료 되었습니다");
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 오류:", status, error);
                    alert("An error occurred: " + error);
                }
            });
        }
    });

    $("#editButton").click(function(event) {
        event.preventDefault();
        
        // 수정 가능한 필드 활성화
        // ...

        $(this).hide();
        $("#saveButton, #saveCancelButton").show();
    });

    $("#saveButton").click(function(event) {
        event.preventDefault();

        const tran_num = $("#modal-tran_num").val();
        console.log("Save Button 클릭 시 tran_num: " + tran_num);
        
        const updatedData = {
            // 수정된 데이터 수집
            // ...
        };

        console.log("Updated Data: ", updatedData);
        
        $.ajax({
            url: '/stock/updateExchangeDetails',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(updatedData),
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                alert("수정되었습니다.");
                $("#exampleModal1").modal("hide");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });

        $("#modal-tran_date").attr('readonly', 'readonly');
        $(this).hide();
        $("#editButton").show();
        $("#saveCancelButton").hide();
    });

    $("#saveCancelButton").click(function(event) {
        event.preventDefault();
        
        $("#modal-tran_date").attr('readonly', 'readonly');
        $(this).hide();
        $("#saveButton").hide();
        $("#editButton").show();
    });

    $('#modal2-table tbody').on('click', 'tr', function() {
        var username = $(this).find('td:nth-child(2)').text();
        var user_per_name = $(this).find('td:nth-child(3)').text();

        $("#modal-pic_username").val(username);
        $("#modal-user_per_name").val(user_per_name);

        $("#exampleModal2").modal("hide");
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
