<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/css/coreui.min.css"
      rel="stylesheet" integrity="sha384-39e9UaGkm/+yp6spIsVfzcs3j7ac7G2cg0hzmDvtG11pT1d7YMnOC26w4wMPhzsL"
      crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.2/dist/js/coreui.bundle.min.js"
      integrity="sha384-/lLdeDXcg75fFKvNaXc6K+P80Jk8U+1mKJUYqkLSxqr18HIUvJYVN42+m23Zbw4b"
      crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<body>
 
 
 	<div class="container-fluid px-4">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb my-0">
              <li class="breadcrumb-item"><a href="#" data-coreui-i18n="home">Home</a>
              </li>
              <li class="breadcrumb-item"><span data-coreui-i18n="plugins">Plugins</span>
              </li>
              <li class="breadcrumb-item active"><span>DataTables</span>
              </li>
            </ol>
          </nav>
        </div>
 
 	<div class="container-lg px-4">
          <div class="card mb-4">
            <div class="card-header"> DataTables<a class="badge bg-danger-gradient ms-2 text-decoration-none" href="https://coreui.io/pricing/?framework=bootstrap">CoreUI Pro Integration</a></div>
            <div class="card-body">
              <div class="example">
                <ul class="nav nav-underline-border" role="tablist">
                  <li class="nav-item" role="presentation"><a class="nav-link active" data-coreui-toggle="tab" href="#preview-1000" role="tab" aria-selected="true">
                      <svg class="icon me-2">
                        <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-media-play"></use>
                      </svg>Preview</a></li>
                  <li class="nav-item" role="presentation"><a class="nav-link" href="https://datatables.net/manual/" target="_blank" aria-selected="false" tabindex="-1" role="tab">
                      <svg class="icon me-2">
                        <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-code"></use>
                      </svg>Code</a></li>
                </ul>
                <div class="tab-content rounded-bottom">
                  <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1000">
                    <div id="DataTables_Table_0_wrapper" class="dt-container dt-bootstrap5 dt-empty-footer"><div class="row mt-2 justify-content-between"><div class="col-md-auto me-auto "><div class="dt-length"><select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select form-select-sm" id="dt-length-0"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select><label for="dt-length-0"> entries per page</label></div></div><div class="col-md-auto ms-auto "><div class="dt-search"><label for="dt-search-0">Search:</label><input type="search" class="form-control form-control-sm" id="dt-search-0" placeholder="" aria-controls="DataTables_Table_0"></div></div></div><div class="row mt-2 justify-content-md-center"><div class="col-12 "><table class="table table-striped border datatable dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="border-collapse: collapse !important"><colgroup><col style="width: 306.875px;"><col style="width: 293.906px;"><col style="width: 145.484px;"><col style="width: 159.766px;"><col style="width: 298.969px;"></colgroup>
                      <thead>
                        <tr role="row"><th data-dt-column="0" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-sort="ascending" aria-label="Username: Activate to invert sorting" tabindex="0"><span class="dt-column-title" role="button">Username</span><span class="dt-column-order"></span></th><th data-dt-column="1" rowspan="1" colspan="1" class="dt-type-date dt-orderable-asc dt-orderable-desc" aria-label="Date registered: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">Date registered</span><span class="dt-column-order"></span></th><th data-dt-column="2" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Role: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">Role</span><span class="dt-column-order"></span></th><th data-dt-column="3" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Status: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">Status</span><span class="dt-column-order"></span></th><th data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Actions: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">Actions</span><span class="dt-column-order"></span></th></tr>
                      </thead>
                      <tbody><tr class="align-middle">
                          <td class="sorting_1">Adam Alister</td>
                          <td class="dt-type-date">2012/01/21</td>
                          <td>Staff</td>
                          <td><span class="badge bg-success-gradient">Active</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Adinah Ralph</td>
                          <td class="dt-type-date">2012/06/01</td>
                          <td>Admin</td>
                          <td><span class="badge bg-dark-gradient">Inactive</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Ajith Hristijan</td>
                          <td class="dt-type-date">2012/03/01</td>
                          <td>Member</td>
                          <td><span class="badge bg-warning-gradient">Pending</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Alphonse Ivo</td>
                          <td class="dt-type-date">2012/01/01</td>
                          <td>Member</td>
                          <td><span class="badge bg-success-gradient">Active</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Anton Phunihel</td>
                          <td class="dt-type-date">2012/01/01</td>
                          <td>Member</td>
                          <td><span class="badge bg-success-gradient">Active</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Bao Gaspar</td>
                          <td class="dt-type-date">2012/01/01</td>
                          <td>Member</td>
                          <td><span class="badge bg-success-gradient">Active</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Bernhard Shelah</td>
                          <td class="dt-type-date">2012/06/01</td>
                          <td>Admin</td>
                          <td><span class="badge bg-dark-gradient">Inactive</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Bünyamin Kasper</td>
                          <td class="dt-type-date">2012/08/23</td>
                          <td>Staff</td>
                          <td><span class="badge bg-danger-gradient">Banned</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Carlito Roffe</td>
                          <td class="dt-type-date">2012/08/23</td>
                          <td>Staff</td>
                          <td><span class="badge bg-danger-gradient">Banned</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr><tr class="align-middle">
                          <td class="sorting_1">Chidubem Gottlob</td>
                          <td class="dt-type-date">2012/02/01</td>
                          <td>Staff</td>
                          <td><span class="badge bg-danger-gradient">Banned</span></td>
                          <td><a class="btn btn-success me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-magnifying-glass"></use>
                              </svg></a><a class="btn btn-info me-2" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-description"></use>
                              </svg></a><a class="btn btn-danger" href="#">
                              <svg class="icon">
                                <use xlink:href="vendors/@coreui/icons/svg/free.svg#cil-trash"></use>
                              </svg></a></td>
                        </tr></tbody>
                    <tfoot></tfoot></table></div></div><div class="row mt-2 justify-content-between"><div class="col-md-auto me-auto "><div class="dt-info" aria-live="polite" id="DataTables_Table_0_info" role="status">Showing 1 to 10 of 32 entries</div></div><div class="col-md-auto ms-auto "><div class="dt-paging paging_full_numbers"><ul class="pagination"><li class="dt-paging-button page-item disabled"><a class="page-link first" aria-controls="DataTables_Table_0" aria-disabled="true" aria-label="First" data-dt-idx="first" tabindex="-1">«</a></li><li class="dt-paging-button page-item disabled"><a class="page-link previous" aria-controls="DataTables_Table_0" aria-disabled="true" aria-label="Previous" data-dt-idx="previous" tabindex="-1">‹</a></li><li class="dt-paging-button page-item active"><a href="#" class="page-link" aria-controls="DataTables_Table_0" aria-current="page" data-dt-idx="0" tabindex="0">1</a></li><li class="dt-paging-button page-item"><a href="#" class="page-link" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0">2</a></li><li class="dt-paging-button page-item"><a href="#" class="page-link" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">3</a></li><li class="dt-paging-button page-item"><a href="#" class="page-link" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0">4</a></li><li class="dt-paging-button page-item"><a href="#" class="page-link next" aria-controls="DataTables_Table_0" aria-label="Next" data-dt-idx="next" tabindex="0">›</a></li><li class="dt-paging-button page-item"><a href="#" class="page-link last" aria-controls="DataTables_Table_0" aria-label="Last" data-dt-idx="last" tabindex="0">»</a></li></ul></div></div></div></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
 
	<input type="text" placeholder="">
	<input type="button" value="검색">
	<table border="1">
		<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>거래처 코드</th>
				<th>거래처명</th>
				<th>구분</th>
				<th>사업자 번호</th>
				<th>업태</th>
				<th>종목</th>
				<th>대표자</th>
				<th>담당자</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>			
		</tbody>
	</table>
	
</body>
</html>