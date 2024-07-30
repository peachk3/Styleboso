/**
 *  item.jsp 랑 연결
 *  - 공통 품목코드 모달창  
 *
 */
		const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const name = $("#userName").val();
        
        var originalItemCode = '';
        var originalItemName = '';
        var originalValues = {};

        function openFormModal() {
            // 등록 버튼 클릭 시 모달 창을 여는 로직을 여기에 작성하세요.
        }
        
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
            if (!hasChanges()) {
                Swal.fire({
                    icon: 'info',
                    title: '변경 사항 없음',
                    text: '변경된 내용이 없습니다.'
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
                    Swal.fire("수정되었습니다.");
                },
                error: function(error) {
                    console.log('저장 실패:', error);
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "시스템 에러! 수정 실패",
                    });
                }
            }).always(function() {
                $('#itemModal').modal('hide');
            });
        }