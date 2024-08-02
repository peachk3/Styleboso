/**
 * item.jsp 랑 연결 - 공통 품목코드 모달창
 * 
 */
	
    
    var originalItemCode = '';
    var originalItemName = '';
    var originalValues = {};

    //================================
    // 등록 기능
    // 등록모달
//    function insertItemCode() { //버튼 onclick=insertItemCode()
//	    $('#insertItemModal').modal('show');
//    }
    
  
    //유효성 검사 & 중복체크
//    function validateAndCheckItemCode(){
//    	const sCateItemCode = $('#new_s_cate_item_code').val().trim();
//    	const sCateItemName =$('#new_s_cate_item_name').val().trim();
//    	
//    	//입력 값 유효성 검사
//    	if(sCateItemCode ===''){
//    		$('#validationMessage').text('공통 품목 코드를 입력해주세요');
//    		 return false;
//    	}
//    	
//    	// 소분류 코드가 대문자만으로 이루어져 있는지, 공백이 없는지 유효성 검사
//        const uppercasePattern = /^[A-Z]+$/;
//        if (!uppercasePattern.test(sCateItemCode)) {
//            $('#validationMessage').text('공통 품목 코드는 공백 없이 대문자만 입력 가능합니다.');
//            return false;
//        }
//        
//        
//    	if(sCateItemName ===''){
//    		$('#validationMessage').text('공통 품목 코드명을 입력해주세요');
//    		return false;
//    	}
//    	return performCheckItemCode(sCateItemCode); //비동기 적으로 중복 검사 후 결과에 따라 처리
//    }
//    
//  //비동기 작업 처리하는데 사용 -> Promise
//	// 작업 처리 완료 -> resolve 함수에 전달된 값이 then 메서드를 통해 접근 가능
//	//작업 처리 실패 -> reject 함수에 전달된 값이 catch메서드를 통해 접근 가능
//    function performCheckItemCode(sCateItemCode) {
//    	return new Promise(function(resolve, reject) { 
//    		
// 
//        $.ajax({
//            url: '/system/checkItemCode',
//            type: 'GET',
//            data: JSON.stringify({ s_cate_item_code: sCateItemCode }),
//            contentType: 'application/json',
//            async: false,  // 비동기식이 아닌 동기식으로 설정!! --> 중복 검사 완료 후 저장 진행
//            success: function(response) {
//                if (response === 'duplicate')  {
//                    $('#validationMessage').text('이미 존재하는 공통 품목 코드입니다.');
//                    resolve(false);  // 중복된 코드일 경우 false를 전달
//                } else {
//                    $('#validationMessage').text('사용 가능한 코드입니다.');
//                    resolve(true);  // 중복되지 않은 코드일 경우 true를 전달
//                }
//            },
//            error: function() {
//                $('#validationMessage').text('시스템 에러! - 중복검사 실패.');
//                reject(new Error('중복 검사 실패'));  // 오류 발생 시 reject로 에러 전달
//            }
//        });
//    });
//}


    function insertItemCode() { //버튼 onclick=insertItemCode()
    	$('#insertItemModal').modal('show');
    }
    
    
    //등록기능 - 저장 onclick=saveNewItemCode()
    function saveNewItemCode(){ 
    	const token = $("meta[name='_csrf']").attr("content");
	    const header = $("meta[name='_csrf_header']").attr("content");
	    const name = $("#userName").val();
	    
	    var s_cate_item_code = $('#new_s_cate_item_code').val().trim();
	    var s_cate_item_name = $('#new_s_cate_item_name').val().trim();
    	
    	
    	if(s_cate_item_code === '' || s_cate_item_name ===''){
    		 Swal.fire({
 	            icon: 'info',
 	            title: '변경 사항 없음',
 	            text: '변경된 내용이 없습니다.'
 	        }).then(() => {
 	            $('#insertItemModal').modal('hide');
 	        });
 	        return;
 	    }
    	
    	 $.ajax({
    	        url: '/system/saveItemCode',  // 실제 서버 URL로 변경
    	        beforeSend: function(xhr) {
    	        	xhr.setRequestHeader(header, token);
    	        },
    	        type: 'POST',
    	        data: JSON.stringify({ s_cate_item_code,s_cate_item_name}),
    	        contentType: 'application/json',
    	        success: function(response) {
    	            if (response === 'success') {
    	                Swal.fire('저장 완료', '공통 품목코드가 저장되었습니다.', 'success')
    	                    .then(() => {
    	                        $('#insertItemModal').modal('hide');
    	                        location.reload();
    	                    });
    	            } else {
    	            	 Swal.fire({
    	                     icon: "error",
    	                     title: "Oops...",
    	                     text: "시스템 에러! 등록 실패"
    	                 }).then(() => {
    	                     $('#insertItemModal').modal('hide');
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
    
  
    	
    //================================
    // 수정기능
    // openModal 함수에서 초기값 저장
    function openModal(itemCode, itemName) {
        originalItemCode = itemCode;
        originalItemName = itemName;

        document.getElementById('s_cate_item_code').innerText = itemCode;
        document.getElementById('s_cate_item_name').innerText = itemName;

        // 초기값 저장
        originalValues['s_cate_item_code'] = itemCode;
        originalValues['s_cate_item_name'] = itemName;

        document.getElementById('cancelButton').classList.add('d-none');
        document.getElementById('saveButton').classList.add('d-none');
        document.getElementById('editButton').classList.remove('d-none');
        document.getElementById('s_cate_item_code').setAttribute('contenteditable', 'false');
        document.getElementById('s_cate_item_name').setAttribute('contenteditable', 'false');
    }
    
    // enableEdit 함수는 수정 모드를 활성화합니다.
    function enableEdit() {
        document.getElementById('editButton').classList.add('d-none');
        document.getElementById('saveButton').classList.remove('d-none');
        document.getElementById('cancelButton').classList.remove('d-none');
        document.getElementById('s_cate_item_name').setAttribute('contenteditable', 'true');
    }
    
    // cancelEdit 함수는 원래 값으로 복원합니다.
    function cancelEdit() {
        document.getElementById('s_cate_item_code').innerText = originalItemCode;
        document.getElementById('s_cate_item_name').innerText = originalItemName;
        document.getElementById('cancelButton').classList.add('d-none');
        document.getElementById('saveButton').classList.add('d-none');
        document.getElementById('editButton').classList.remove('d-none');
        document.getElementById('s_cate_item_name').setAttribute('contenteditable', 'false');
    }
   // 원래 값과 현재 값을 비교하는 함수
    function hasChanges() {
        return document.getElementById('s_cate_item_name').innerText !== originalValues['s_cate_item_name'];
    }
    
    // saveItem 함수는 서버에 수정된 값을 저장합니다.
	function saveItem() {
		const token = $("meta[name='_csrf']").attr("content");
	    const header = $("meta[name='_csrf_header']").attr("content");
	    const name = $("#userName").val();
	    
	    if (!hasChanges()) {
	        Swal.fire({
	            icon: 'info',
	            title: '변경 사항 없음',
	            text: '변경된 내용이 없습니다.'
	        }).then(() => {
	            $('#itemModal').modal('hide');
	        });
	        return;
	    }

        const itemName = document.getElementById('s_cate_item_name').innerText;

        // 서버로 데이터 전송
        $.ajax({
            url: "/system/updateItemCode", // 실제로 처리할 URL
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            contentType: 'application/json',
            data: JSON.stringify({ s_cate_item_code: originalItemCode, s_cate_item_name: itemName }),
            success: function(response) {
                console.log('공통 품목 코드 수정 (저장) 성공:', response);
                Swal.fire("수정되었습니다.").then(() => {
                    $('#itemModal').modal('hide');
                    	location.reload(); // 페이지 리로드
                    });
            },
            error: function(error) {
                console.log('저장 실패:', error);
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: "시스템 에러! 수정 실패"
                }).then(() => {
                    $('#itemModal').modal('hide');
                });
            }
        });// ajax
    }
 // 모달 창의 x 버튼을 눌렀을 때 모달 창을 닫는 이벤트 핸들러 추가
    $(document).ready(function() {
        $('#itemModal').on('hidden.bs.modal', function () {
            $('#itemModal').modal('hide');
        });
    });
    //================================
    //삭제기능
    function deleteSelectedItems(){
	 const token = $("meta[name='_csrf']").attr("content");
	 const header = $("meta[name='_csrf_header']").attr("content");
	 const name = $("#userName").val();
    	 // '.item-checkbox:checked' 선택자를 사용해서 선택된 체크박스를 모두 가져오기
        const selectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');

        // 선택된 체크박스의 값을 배열로 변환임
        const selectedItems = [];
        selectedCheckboxes.forEach(function(checkbox) {
            selectedItems.push(checkbox.value);
        });

        console.log(selectedItems); // 선택된 항목의 값을 출력
        
        if (selectedItems.length === 0) {
            Swal.fire('삭제할 항목을 선택하세요.');
            return;
        }
        Swal.fire({
            title: "삭제 확인",
            text: "선택한 항목"+selectedItems.length+"개 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: "예, 삭제합니다.",
            cancelButtonText: "아니요, 취소합니다."
        }).then((result) => {
            if (result.isConfirmed) {
            	
                $.ajax({
                    url: "/system/deleteItemCode",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    type: "POST",
                    data: { itemCodes: selectedItems },
                    traditional: true, // 배열을 쿼리 파라미터로 전송할 때 필요합니다.
                    success: function(response) {
                        if (response === 'success') {
                            Swal.fire('삭제 완료', '선택한 항목이 삭제되었습니다.', 'success')
                                .then(() => {
                                    // 페이지를 새로고침하여 업데이트된 리스트를 표시합니다.
                                    location.reload();
                                });
                        } else {
                            Swal.fire('삭제 실패', '항목 삭제 중 오류가 발생했습니다.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('삭제 실패', '서버와의 통신 중 오류가 발생했습니다.', 'error');
                    }
                });
            }
        });
    }

    //================================
    // '전체 선택' 체크박스가 클릭될 때 호출되는 함수
    function toggleAllCheckboxes(source) {
        const checkboxes = document.querySelectorAll('.item-checkbox');
        checkboxes.forEach(checkbox => checkbox.checked = source.checked);
    }