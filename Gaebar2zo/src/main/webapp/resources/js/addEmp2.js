/**
 * 시스템 등록 
 */

const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

document.addEventListener('DOMContentLoaded', function() {
	event.preventDefault(); // 기본 제출 동작 방지   
       const submitFormBtn = document.getElementById('submitFormBtn'); 
       
       submitBtn.addEventListener('click', function(event) {
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
          
          // 모든 유효성 검사가 통과되었을 경우에만 폼 데이터 전송
          if (document.querySelector('.was-validated:invalid') === null) {
          	
              // 폼 데이터 수집
              const formData = new FormData(form);
              const data = Object.fromEntries(formData.entries());
	   
              $.ajax({
                  url: '/system/addEmp',
                  beforeSend: function(xhr) {
                      xhr.setRequestHeader(header, token);
                   },
                  type: 'POST',
                  data:$("#fm1").serialize(),

                  success: function(result) {
                          alert('등록되었습니다');
                          
                          form.reset();
                          window.location.href = '/basicInfo/clientList';
                  },
                  error: function(jqXHR, textStatus, errorThrown) {
                      console.error('AJAX Error:', textStatus, errorThrown);
                      console.log('Response Text:', jqXHR.responseText);
                      console.log('Status Code:', jqXHR.status);
                      alert('An error occurred while submitting the form. Check console for details.');
                  }
              }); 
	   
          }
       });
              
       });
       
});