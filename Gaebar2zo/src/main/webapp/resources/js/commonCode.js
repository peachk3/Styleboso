/**
 * common.jsp
 * 공통 그룹코드 -등록,수정,삭제
 */
//===================================================================
//공통 그룹코드 - 등록
	function insertGroupCode() { //버튼 onclick=insertGroupCode()
    	$('#insertCodeModal').modal('show');
    }
    
 // 등록 모달 닫기와 폼 초기화
    $('#insertModalCloseBtn').on('click', function() {
        $('#insertCodeModal').modal('hide');
        $('#insertCodeForm')[0].reset(); // 폼 초기화
    });
    //등록기능 - 저장 onclick=saveNewGroupCode()
    function saveGroupCode(){ 
    	const token = $("meta[name='_csrf']").attr("content");
	    const header = $("meta[name='_csrf_header']").attr("content");
	    const name = $("#userName").val();
	    
	    var group_code = $('#group_code').val().trim();
	    var group_name = $('#group_name').val().trim();
    	
    	
    	if(group_code === '' || group_name ===''){
    		 Swal.fire({
 	            icon: 'info',
 	            title: '변경 사항 없음',
 	            text: '변경된 내용이 없습니다.'
 	        }).then(() => {
 	            $('#insertCodeModal').modal('hide');
 	        });
 	        return;
 	    }
    	
    	 $.ajax({
    	        url: '/system/saveGroupCode',  // 실제 서버 URL로 변경
    	        beforeSend: function(xhr) {
    	        	xhr.setRequestHeader(header, token);
    	        },
    	        type: 'POST',
    	        data: JSON.stringify({ group_code,group_name}),
    	        contentType: 'application/json',
    	        success: function(response) {
    	            if (response === 'success') {
    	                Swal.fire('저장 완료', '공통 품목코드가 저장되었습니다.', 'success')
    	                    .then(() => {
    	                        $('#insertGroupModal').modal('hide');
    	                        location.reload();
    	                    });
    	            } else {
    	            	 Swal.fire({
    	                     icon: "error",
    	                     title: "Oops...",
    	                     text: "시스템 에러! 등록 실패"
    	                 }).then(() => {
    	                     $('#insertGroupModal').modal('hide');
    	                 });
    	             }
    	         },
    	        error: function() {
    	        	 Swal.fire({
    	                 icon: "error",
    	                 title: "Oops...",
    	                 text: "시스템 에러! 등록 실패"
    	             }).then(() => {
    	                 $('#insertItemModal').modal('hide');
    	             });
    	         }
    	     });
    	 }
    
  

//===================================================================
//수정(update)기능
    var originalGroupCode = '';
    var originalGroupName = '';

    // 수정 버튼 클릭 시 호출
    function updateCode() {
        // 체크된 체크박스를 찾아 해당 그룹 코드 가져오기
        var checkedBoxes = document.querySelectorAll('.item-checkbox:checked');
      
        //체크박스 여러개 선택시 
        if (checkedBoxes.length !== 1) {
            Swal.fire('알림', '수정할 항목을 하나만 선택하세요.', 'warning');
            return;
        }
        
        //체크박스가 속한 테이블 행에서 특정 데이터 가져오기
        var selectedCode = checkedBoxes[0].value;
        var selectedRow = checkedBoxes[0].closest('tr');
        var selectedName = selectedRow.querySelector('td:nth-child(3)').innerText;

        // 모달에 값 설정
        document.getElementById('edit_group_code').value = selectedCode;
        document.getElementById('edit_group_name').value = selectedName;

        // 초기값 저장
        originalGroupCode = selectedCode;
        originalGroupName = selectedName;

        // 모달 열기
        $('#commonModal').modal('show');
    }
    

    // 수정된 코드 저장
    function saveEditedCode() {
        // CSRF 토큰 설정
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const name = $("#userName").val();
        
        var groupCode = document.getElementById('edit_group_code').value;
        var groupName = document.getElementById('edit_group_name').value;

        $.ajax({
            url: '/system/updateCode', // 실제 서버 측 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ group_code: groupCode, group_name: groupName }),
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);  // CSRF 토큰 설정
            },
            success: function(response) {
                Swal.fire('저장 완료', '공통 그룹코드가 저장되었습니다.', 'success')
                    .then(() => {
                        $('#commonModal').modal('hide');
                        location.reload();
                    });
            },
            error: function(error) {
                Swal.fire('Error', '저장 중 오류가 발생했습니다.', 'error');
            }
        });
    }

    // 취소 버튼 클릭 시
    function cancelEdit() {
        // 초기값으로 되돌리기
        document.getElementById('edit_group_code').value = originalGroupCode;
        document.getElementById('edit_group_name').value = originalGroupName;

        // 모달 닫기
        $('#commonModal').modal('hide');
    }   
    
    
   
    
 //===================================================================
  //삭제기능 - onclick=deleteCode()()
    function deleteCode(){
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const name = $("#userName").val();
        
        // 체크된 체크박스의 값을 배열로 가져오기
        let selectedCodes = [];
        $(".item-checkbox:checked").each(function() {
            selectedCodes.push($(this).val()); // 선택된 체크박스의 value 값을 추가
        });

        // selectedCodes 배열에 저장된 값을 콘솔에 출력하여 확인
        console.log("Selected Codes:", selectedCodes);
        
        if (selectedCodes.length === 0) {
            Swal.fire('Error', '삭제할 그룹코드를 선택해주세요.', 'error');
            return;
        }

        Swal.fire({
            title: "삭제 확인",
            text: "선택한 항목 " + selectedCodes.length + "개를 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: "예, 삭제합니다.",
            cancelButtonText: "아니요, 취소합니다."
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/system/deleteCode',  // 서버 측 컨트롤러 매핑 URL
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(selectedCodes),
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);  // CSRF 토큰 설정
                    },
                    success: function(response) {
                        Swal.fire('Deleted!', '그룹코드가 삭제되었습니다.', 'success').then(() => {
                            location.reload();  // 페이지 새로고침
                        });
                    },
                    error: function(error) {
                    	console.log("AJAX Error:", error); // 오류 정보를 콘솔에 출력
                        Swal.fire('Error', '삭제 중 오류가 발생했습니다.', 'error');
                    }
                });
            }
        });
    }

//===================================================================
   // '전체 선택' 체크박스가 클릭될 때 호출되는 함수
   	function checkAll(source) {
   	    const checkboxes = document.querySelectorAll('.item-checkbox'); // 모든 체크박스 요소를 선택
   	    for (var i = 0; i < checkboxes.length; i++) { // 선택된 모든 체크박스를 반복
   	        checkboxes[i].checked = source.checked; // '전체 선택' 체크박스의 상태에 따라 개별 체크박스의 체크 상태를 변경
   	    }
   	}
   	
    // 등록 모달 닫기와 폼 초기화
//    $('#insertModalCloseBtn').on('click', function() {
//        $('#insertCodeModal').modal('hide');
//        $('#insertCodeForm')[0].reset(); // 폼 초기화
//    });
// // 상세 모달 닫기와 폼 초기화
//    $('#commonModalCloseBtn').on('click', function() {
//        $('#commonModal').modal('hide');
//        $('#updateCommonForm')[0].reset(); // 폼 초기화
//    });
