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