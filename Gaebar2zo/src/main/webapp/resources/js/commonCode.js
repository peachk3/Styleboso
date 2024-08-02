/**
 * common.jsp
 * 공통 그룹코드 -등록,수정,삭제
 */
//===================================================================
//공통 그룹코드 - 등록
    function insertGroupCode() { //버튼 onclick=insertGroupCode()
    	$('#insertCodeModal').modal('show');
    }
    
    
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
  //삭제기능 - onclick=deleteGroupCode()()
   	function deleteGroupCode(){
   	    const token = $("meta[name='_csrf']").attr("content");
   	    const header = $("meta[name='_csrf_header']").attr("content");
    	const name = $("#userName").val();

    	   // 선택된 체크박스 가져오기
        const selectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');

        // 선택된 항목이 없는 경우 경고 메시지
        if (selectedCheckboxes.length === 0) {
            Swal.fire('삭제할 항목을 선택하세요.');
            return;
        }

     // 선택된 항목의 값을 배열로 수집 (group_code 값만)
        const selectedItems = [];
        selectedCheckboxes.forEach(function(checkbox) {
            selectedItems.push(checkbox.value); // 단순히 group_code 값만 추가
        });

        // SweetAlert로 삭제 확인
        Swal.fire({
            title: "삭제 확인",
            text: "선택한 항목 " + selectedItems.length + "개를 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: "예, 삭제합니다.",
            cancelButtonText: "아니요, 취소합니다."
        }).then((result) => {
            if (result.isConfirmed) {
                // AJAX 요청 보내기
                $.ajax({
                    url: "/system/deleteGroupCode",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ groupCodes: selectedItems }), // groupCodes로 묶어 전송
                    success: function(response) {
                        if (response === 'success') {
                            Swal.fire('삭제 완료', '선택한 항목이 삭제되었습니다.', 'success')
                                .then(() => {
                                    location.reload(); // 페이지 새로고침
                                });
                        } else {
                            Swal.fire('삭제 실패', '항목 삭제 중 오류가 발생했습니다.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('삭제 실패', '서버와의 통신 중 오류가 발생했습니다.', 'error');
                    }
                });//ajax
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