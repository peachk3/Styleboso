<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="CoreUI - Bootstrap Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,SCSS,HTML,RWD,Dashboard">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Styleboso</title>
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/assets/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/assets/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/assets/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/assets/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/assets/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/assets/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/assets/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/assets/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/assets/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/assets/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/assets/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/favicon/favicon-16x16.png">
    <link rel="manifest" href="assets/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!-- Vendors styles-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendors/simplebar/css/simplebar.css">
    <!-- Main styles for this application-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <!-- We use those styles to show code examples, you should remove them in your application.-->
    <link href="${pageContext.request.contextPath }/resources/css/examples.css" rel="stylesheet">
    <script src="/resources/js/config.js"></script>
    <script src="/resources/js/color-modes.js"></script>
    <link href="${pageContext.request.contextPath }/resources/vendors/@coreui/chartjs/css/coreui-chartjs.css" rel="stylesheet">
  
    <div class="sidebar sidebar-dark sidebar-fixed border-end sidebar-narrow-unfoldable" id="sidebar">
      <div class="sidebar-header border-bottom">
        <div class="sidebar-brand">
          <svg class="sidebar-brand-full" width="110" height="32" alt="CoreUI Logo">
            <use xlink:href="/resources/assets/brand/coreui.svg#full"></use>
          </svg>
          <svg class="sidebar-brand-narrow" width="32" height="32" alt="CoreUI Logo">
            <use xlink:href="/resources/assets/brand/coreui.svg#signet"></use>
          </svg>
        </div>
      </div>
      <ul class="sidebar-nav" data-coreui="navigation" data-simplebar="">
        <li class="nav-title">MENU</li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-puzzle"></use>
            </svg><span data-coreui-i18n="시스템 관리">시스템 관리</span></a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="/system/employeeList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 사용자 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/system/code/common"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 공통 코드 관리</a></li>
          </ul>
        </li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-cursor"></use>
            </svg><span data-coreui-i18n="기본정보 관리">기본정보 관리</span></a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="/basicInfo/itemList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 품목 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/basicInfo/clientList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 거래처 관리</a></li>
            <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
                 <span class="nav-icon"><span class="nav-icon-bullet"></span></span><span data-coreui-i18n="창고 관리" onclick="location.href='/basicInfo/warehouseList'">창고 관리</span></a>
             <ul class="nav-group-items compact">
               <li class="nav-item" style="padding-left:20px;"><a class="nav-link" href="/basicInfo/warehouse?wh_code=GP"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 김포 창고</a></li>
               <li class="nav-item" style="padding-left:20px;"><a class="nav-link" href="/basicInfo/warehouse?wh_code=TS"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 대구 창고</a></li>
               <li class="nav-item" style="padding-left:20px;"><a class="nav-link" href="/basicInfo/whZone?wh_code=YS"><span class="nav-icon"><span class="nav-icon-bullet"></span></span>양산 창고</a></li>
             </ul>
           </li>
          </ul>
        </li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#"> 
            <svg class="nav-icon">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-notes"></use>
            </svg><span data-coreui-i18n="영업 관리">영업 관리</span></a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="/sales/salesOrderList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 수주 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/sales/purchaseOrderList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 발주 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/sales/shipmentList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 출하 관리</a></li>
          </ul>
        </li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-star"></use>
            </svg><span data-coreui-i18n="재고 관리">재고 관리</span></a>
          <ul class="nav-group-items compact">
            <li class="nav-item"><a class="nav-link" href="/stock/status"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 재고 현황</a></li>
           <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
                 <span class="nav-icon"><span class="nav-icon-bullet"></span></span><span data-coreui-i18n="재고 조정">재고 조정</span></a>
             <ul class="nav-group-items compact">
               <li class="nav-item" style="padding-left:20px;"><a class="nav-link" href="/stock/adjustment/exchange"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 교환</a></li>
               <li class="nav-item" style="padding-left:20px;"><a class="nav-link" href="/stock/adjustment/return"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 반품</a></li>
             </ul>
           </li>
            <li class="nav-item"><a class="nav-link" href="/stock/receivingList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 입고 관리</a></li>
            <li class="nav-item"><a class="nav-link" href="/stock/releaseList"><span class="nav-icon"><span class="nav-icon-bullet"></span></span> 출고 관리</a></li>
            
          </ul>
        </li>
    </div>
    <div class="sidebar sidebar-light sidebar-lg sidebar-end sidebar-overlaid border-start" id="aside">
      <div class="sidebar-header p-0 position-relative">
        <ul class="nav nav-underline-border w-100" role="tablist">
          <li class="nav-item"><a class="nav-link active" data-coreui-toggle="tab" href="#timeline" role="tab">
              <svg class="icon">
                <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-list"></use>
              </svg></a></li>
          <li class="nav-item"><a class="nav-link" data-coreui-toggle="tab" href="#messages" role="tab">
              <svg class="icon">
                <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-speech"></use>
              </svg></a></li>
          <li class="nav-item"><a class="nav-link" data-coreui-toggle="tab" href="#settings" role="tab">
              <svg class="icon">
                <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-settings"></use>
              </svg></a></li>
        </ul>
        <button class="btn-close position-absolute top-50 end-0 translate-middle my-0" type="button" aria-label="Close" onclick="coreui.Sidebar.getInstance(document.querySelector(&quot;#aside&quot;)).toggle()"></button>
      </div>
      
      <!-- Tab panes-->
      
      <div class="tab-content">
        <div class="tab-pane active" id="timeline" role="tabpanel">
          <div class="list-group list-group-flush">
            <div class="list-group-item border-start-4 border-start-secondary bg-body-tertiary text-center fw-bold text-body-secondary text-uppercase small" data-coreui-i18n="today">Today</div>
            <div class="list-group-item border-start-4 border-start-warning list-group-item-divider">
              <div class="avatar avatar-lg float-end"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"></div>
              <div>Meeting with <strong>Lucas</strong></div><small class="text-body-secondary me-3">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-calendar"></use>
                </svg> 1 - 3pm</small><small class="text-body-secondary">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-location-pin"></use>
                </svg> Palo Alto, CA</small>
            </div>
            <div class="list-group-item border-start-4 border-start-info">
              <div class="avatar avatar-lg float-end"><img class="avatar-img" src="/resources/assets/img/avatars/4.jpg" alt="user@email.com"></div>
              <div>Skype with <strong>Megan</strong></div><small class="text-body-secondary me-3">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-calendar"></use>
                </svg> 4 - 5pm</small><small class="text-body-secondary">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/brand.svg#cib-skype"></use>
                </svg> On-line</small>
            </div>
            <div class="list-group-item border-start-4 border-start-secondary bg-body-tertiary text-center fw-bold text-body-secondary text-uppercase small" data-coreui-i18n="tomorrow">Tomorrow</div>
            <div class="list-group-item border-start-4 border-start-danger list-group-item-divider">
              <div>New UI Project - <strong>deadline</strong></div><small class="text-body-secondary me-3">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-calendar"></use>
                </svg> 10 - 11pm</small><small class="text-body-secondary">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-home"></use>
                </svg> creativeLabs HQ</small>
              <div class="avatars-stack mt-2">
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/2.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/3.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/4.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/5.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/6.jpg" alt="user@email.com"></div>
              </div>
            </div>
            <div class="list-group-item border-start-4 border-start-success list-group-item-divider">
              <div><strong>#10 Startups.Garden</strong> Meetup</div><small class="text-body-secondary me-3">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-calendar"></use>
                </svg> 1 - 3pm</small><small class="text-body-secondary">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-location-pin"></use>
                </svg> Palo Alto, CA</small>
            </div>
            <div class="list-group-item border-start-4 border-start-primary list-group-item-divider">
              <div><strong>Team meeting</strong></div><small class="text-body-secondary me-3">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-calendar"></use>
                </svg> 4 - 6pm</small><small class="text-body-secondary">
                <svg class="icon">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-home"></use>
                </svg> creativeLabs HQ</small>
              <div class="avatars-stack mt-2">
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/2.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/3.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/4.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/5.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/6.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"></div>
                <div class="avatar avatar-xs"><img class="avatar-img" src="/resources/assets/img/avatars/8.jpg" alt="user@email.com"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane p-3" id="messages" role="tabpanel">
          <div class="message">
            <div class="py-3 pb-5 me-3 float-start">
              <div class="avatar"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
            </div>
            <div><small class="text-body-secondary">Lukasz Holeczek</small><small class="text-body-secondary float-end mt-1">1:52 PM</small></div>
            <div class="text-truncate fw-bold">Lorem ipsum dolor sit amet</div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</small>
          </div>
          <hr>
          <div class="message">
            <div class="py-3 pb-5 me-3 float-start">
              <div class="avatar"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
            </div>
            <div><small class="text-body-secondary">Lukasz Holeczek</small><small class="text-body-secondary float-end mt-1">1:52 PM</small></div>
            <div class="text-truncate fw-bold">Lorem ipsum dolor sit amet</div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</small>
          </div>
          <hr>
          <div class="message">
            <div class="py-3 pb-5 me-3 float-start">
              <div class="avatar"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
            </div>
            <div><small class="text-body-secondary">Lukasz Holeczek</small><small class="text-body-secondary float-end mt-1">1:52 PM</small></div>
            <div class="text-truncate fw-bold">Lorem ipsum dolor sit amet</div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</small>
          </div>
          <hr>
          <div class="message">
            <div class="py-3 pb-5 me-3 float-start">
              <div class="avatar"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
            </div>
            <div><small class="text-body-secondary">Lukasz Holeczek</small><small class="text-body-secondary float-end mt-1">1:52 PM</small></div>
            <div class="text-truncate fw-bold">Lorem ipsum dolor sit amet</div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</small>
          </div>
          <hr>
          <div class="message">
            <div class="py-3 pb-5 me-3 float-start">
              <div class="avatar"><img class="avatar-img" src="/resources/assets/img/avatars/7.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
            </div>
            <div><small class="text-body-secondary">Lukasz Holeczek</small><small class="text-body-secondary float-end mt-1">1:52 PM</small></div>
            <div class="text-truncate fw-bold">Lorem ipsum dolor sit amet</div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</small>
          </div>
        </div>
        <div class="tab-pane p-3" id="settings" role="tabpanel">
          <h6 data-coreui-i18n="settings">Settings</h6>
          <div class="aside-options">
            <div class="clearfix mt-4">
              <div class="form-check form-switch form-switch-lg">
                <input class="form-check-input me-0" id="flexSwitchCheckDefaultLg" type="checkbox" checked="">
                <label class="form-check-label fw-semibold small" for="flexSwitchCheckDefaultLg">Option 1</label>
              </div>
            </div>
            <div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</small></div>
          </div>
          <div class="aside-options">
            <div class="clearfix mt-3">
              <div class="form-check form-switch form-switch-lg">
                <input class="form-check-input me-0" id="flexSwitchCheckDefaultLg" type="checkbox">
                <label class="form-check-label fw-semibold small" for="flexSwitchCheckDefaultLg">Option 2</label>
              </div>
            </div>
            <div><small class="text-body-secondary">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</small></div>
          </div>
          <div class="aside-options">
            <div class="clearfix mt-3">
              <div class="form-check form-switch form-switch-lg">
                <input class="form-check-input me-0" id="flexSwitchCheckDefaultLg" type="checkbox">
                <label class="form-check-label fw-semibold small" for="flexSwitchCheckDefaultLg">Option 3</label>
              </div>
            </div>
          </div>
          <div class="aside-options">
            <div class="clearfix mt-3">
              <div class="form-check form-switch form-switch-lg">
                <input class="form-check-input me-0" id="flexSwitchCheckDefaultLg" type="checkbox" checked="">
                <label class="form-check-label fw-semibold small" for="flexSwitchCheckDefaultLg">Option 4</label>
              </div>
            </div>
          </div>
          <hr>
          <h6 data-coreui-i18n="systemUtilization">System Utilization</h6>
          <div class="small text-uppercase fw-semibold mb-1 mt-4" data-coreui-i18n="cpuUsage">CPU Usage</div>
          <div class="progress progress-thin">
            <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
          <div class="small text-body-secondary" data-coreui-i18n="cpuUsageDescription, { 'number_of_processes': 358, 'number_of_cores': '1/4' }">348 Processes. 1/4 Cores.</div>
          <div class="small text-uppercase fw-semibold mb-1 mt-2" data-coreui-i18n="memoryUsage">Memory Usage</div>
          <div class="progress progress-thin">
            <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
          <div class="small text-body-secondary">11444GB/16384MB</div>
          <div class="small text-uppercase fw-semibold mb-1 mt-2" data-coreui-i18n="ssdUsage">SSD Usage</div>
          <div class="progress progress-thin">
            <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
          <div class="small text-body-secondary">243GB/256GB</div>
          <div class="small text-uppercase fw-semibold mb-1 mt-2" data-coreui-i18n="ssdUsage">SSD Usage</div>
          <div class="progress progress-thin">
            <div class="progress-bar bg-success" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
          <div class="small text-body-secondary">25GB/256GB</div>
        </div>
      </div>
    </div>
    <div class="wrapper d-flex flex-column min-vh-100">
      <header class="header header-sticky p-0 mb-4">
        <div class="container-fluid px-4 border-bottom">
          <button class="header-toggler" type="button" onclick="coreui.Sidebar.getInstance(document.querySelector('#sidebar')).toggle()" style="margin-inline-start: -14px">
            <svg class="icon icon-lg">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-menu"></use>
            </svg>
          </button>
          <ul class="header-nav d-none d-md-flex">
            <li class="nav-item"><a class="nav-link" href="#" data-coreui-i18n="dashboard">Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-coreui-i18n="users">Users</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-coreui-i18n="settings">Settings</a></li>
          </ul>
          <ul class="header-nav d-none d-md-flex ms-auto">
            <li class="nav-item dropdown"><a class="nav-link" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <svg class="icon icon-lg my-1 mx-2">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-bell"></use>
                </svg><span class="badge rounded-pill position-absolute top-0 end-0 bg-danger-gradient">5</span></a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-lg pt-0">
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold rounded-top mb-2" data-coreui-i18n="notificationsCounter, { 'counter': 5 }">You have 5 notifications</div><a class="dropdown-item" href="#">
                  <svg class="icon me-2 text-success">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-user-follow"></use>
                  </svg><span data-coreui-i18n="newUserRegistered">New user registered</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2 text-danger">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-user-unfollow"></use>
                  </svg><span data-coreui-i18n="userDeleted">User deleted</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2 text-info">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-chart"></use>
                  </svg><span data-coreui-i18n="salesReportIsReady">Sales report is ready</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2 text-success">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-basket"></use>
                  </svg><span data-coreui-i18n="newClient">New client</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2 text-warning">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-speedometer"></use>
                  </svg><span data-coreui-i18n="serverOverloaded">Server overloaded</span></a>
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold my-2" data-coreui-i18n="server">Server</div><a class="dropdown-item d-block py-2" href="#">
                  <div class="text-uppercase small fw-semibold mb-1" data-coreui-i18n="cpuUsage">CPU Usage</div>
                  <div class="progress progress-thin">
                    <div class="progress-bar bg-info-gradient" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <div class="small text-body-secondary" data-coreui-i18n="cpuUsageDescription, { 'number_of_processes': 358, 'number_of_cores': '1/4' }">348 Processes. 1/4 Cores.</div>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="text-uppercase small fw-semibold mb-1" data-coreui-i18n="memoryUsage">Memory Usage</div>
                  <div class="progress progress-thin">
                    <div class="progress-bar bg-warning-gradient" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <div class="small text-body-secondary">11444MB/16384MB</div>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="text-uppercase small fw-semibold mb-1" data-coreui-i18n="ssdUsage">SSD Usage</div>
                  <div class="progress progress-thin">
                    <div class="progress-bar bg-danger-gradient" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <div class="small text-body-secondary">243GB/256GB</div>
                </a>
              </div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <svg class="icon icon-lg my-1 mx-2">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-list-rich"></use>
                </svg><span class="badge rounded-pill position-absolute top-0 end-0 bg-warning-gradient">5</span></a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-lg pt-0">
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold rounded-top mb-2" data-coreui-i18n="taskCounter, { 'counter': 5 }">You have 5 pending tasks</div><a class="dropdown-item d-block py-2" href="#">
                  <div class="d-flex justify-content-between mb-1">
                    <div class="small">Upgrade NPM</div>
                    <div class="fw-semibold">0%</div>
                  </div>
                  <div class="progress progress-thin">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="d-flex justify-content-between mb-1">
                    <div class="small">ReactJS Version</div>
                    <div class="fw-semibold">25%</div>
                  </div><span class="progress progress-thin">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                  </span>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="d-flex justify-content-between mb-1">
                    <div class="small">VueJS Version</div>
                    <div class="fw-semibold">50%</div>
                  </div><span class="progress progress-thin">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                  </span>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="d-flex justify-content-between mb-1">
                    <div class="small">Add new layouts</div>
                    <div class="fw-semibold">75%</div>
                  </div><span class="progress progress-thin">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </span>
                </a><a class="dropdown-item d-block py-2" href="#">
                  <div class="d-flex justify-content-between mb-1">
                    <div class="small">Angular Version</div>
                    <div class="fw-semibold">100%</div>
                  </div><span class="progress progress-thin">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </span>
                </a>
                <div class="dropdown-divider"></div><a class="dropdown-item text-center fw-semibold" href="#" data-coreui-i18n="viewAllTasks">View all tasks</a>
              </div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <svg class="icon icon-lg my-1 mx-2">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-envelope-open"></use>
                </svg><span class="badge rounded-pill position-absolute top-0 end-0 bg-info-gradient">7</span></a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-md pt-0" style="min-width: 24rem">
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold rounded-top mb-2" data-coreui-i18n="messagesCounter, { 'counter': 7 }">You have 4 messages</div><a class="dropdown-item" href="#">
                  <div class="d-flex">
                    <div class="avatar flex-shrink-0 my-3 me-3"><img class="avatar-img" src="/resources/assets/img/avatars/1.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
                    <div class="message text-wrap">
                      <div class="d-flex justify-content-between mt-1">
                        <div class="small text-body-secondary">Jessica Williams</div>
                        <div class="small text-body-secondary">Just now</div>
                      </div>
                      <div class="fw-semibold"><span class="text-danger">! </span>Urgent: System Maintenance Tonight</div>
                      <div class="small text-body-secondary">Attention team, we'll be conducting critical system maintenance tonight from 10 PM to 2 AM. Plan accordingly...</div>
                    </div>
                  </div>
                </a><a class="dropdown-item" href="#">
                  <div class="d-flex">
                    <div class="avatar flex-shrink-0 my-3 me-3"><img class="avatar-img" src="/resources/assets/img/avatars/2.jpg" alt="user@email.com"><span class="avatar-status bg-warning"></span></div>
                    <div class="message text-wrap">
                      <div class="d-flex justify-content-between mt-1">
                        <div class="small text-body-secondary">Richard Johnson</div>
                        <div class="small text-body-secondary">5 minutes ago</div>
                      </div>
                      <div class="fw-semibold"><span class="text-danger">! </span>Project Update: Milestone Achieved</div>
                      <div class="small text-body-secondary">Kudos on hitting sales targets last quarter! Let's keep the momentum. New goals, new victories ahead...</div>
                    </div>
                  </div>
                </a><a class="dropdown-item" href="#">
                  <div class="d-flex">
                    <div class="avatar flex-shrink-0 my-3 me-3"><img class="avatar-img" src="/resources/assets/img/avatars/4.jpg" alt="user@email.com"><span class="avatar-status bg-secondary"></span></div>
                    <div class="message text-wrap">
                      <div class="d-flex justify-content-between mt-1">
                        <div class="small text-body-secondary">Angela Rodriguez</div>
                        <div class="small text-body-secondary">1:52 PM</div>
                      </div>
                      <div class="fw-semibold">Social Media Campaign Launch</div>
                      <div class="small text-body-secondary">Exciting news! Our new social media campaign goes live tomorrow. Brace yourselves for engagement...</div>
                    </div>
                  </div>
                </a><a class="dropdown-item" href="#">
                  <div class="d-flex">
                    <div class="avatar flex-shrink-0 my-3 me-3"><img class="avatar-img" src="/resources/assets/img/avatars/5.jpg" alt="user@email.com"><span class="avatar-status bg-success"></span></div>
                    <div class="message text-wrap">
                      <div class="d-flex justify-content-between mt-1">
                        <div class="small text-body-secondary">Jane Lewis</div>
                        <div class="small text-body-secondary">4:03 PM</div>
                      </div>
                      <div class="fw-semibold">Inventory Checkpoint</div>
                      <div class="small text-body-secondary">Team, it's time for our monthly inventory check. Accurate counts ensure smooth operations. Let's nail it...</div>
                    </div>
                  </div>
                </a><a class="dropdown-item" href="#">
                  <div class="d-flex">
                    <div class="avatar flex-shrink-0 my-3 me-3"><img class="avatar-img" src="/resources/assets/img/avatars/3.jpg" alt="user@email.com"><span class="avatar-status bg-secondary"></span></div>
                    <div class="message text-wrap">
                      <div class="d-flex justify-content-between mt-1">
                        <div class="small text-body-secondary">Ryan Miller</div>
                        <div class="small text-body-secondary">3 days ago</div>
                      </div>
                      <div class="fw-semibold">Customer Feedback Results</div>
                      <div class="small text-body-secondary">Our latest customer feedback is in. Let's analyze and discuss improvements for an even better service...</div>
                    </div>
                  </div>
                </a>
                <div class="dropdown-divider"></div><a class="dropdown-item text-center fw-semibold" href="#" data-coreui-i18n="viewAllMessages">View all messages</a>
              </div>
            </li>
          </ul>
          <ul class="header-nav ms-auto ms-md-0">
            <li class="nav-item py-1">
              <div class="vr h-100 mx-2 text-body text-opacity-75"></div>
            </li>
            <li class="nav-item dropdown">
              <button class="btn btn-link nav-link" type="button" aria-expanded="false" data-coreui-toggle="dropdown">
                <svg class="icon icon-lg">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-language"></use>
                </svg>
              </button>
              <ul class="dropdown-menu dropdown-menu-end" style="--cui-dropdown-min-width: 8rem;">
                <li>
                  <button class="dropdown-item d-flex align-items-center" type="button" data-coreui-language-value="en" onclick="i18next.changeLanguage(&quot;en&quot;)">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/flag.svg#cif-gb"></use>
                    </svg>English
                  </button>
                </li>
                <li>
                  <button class="dropdown-item d-flex align-items-center" type="button" data-coreui-language-value="es" onclick="i18next.changeLanguage(&quot;es&quot;)">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/flag.svg#cif-es"></use>
                    </svg>Español
                  </button>
                </li>
                <li>
                  <button class="dropdown-item d-flex align-items-center" type="button" data-coreui-language-value="pl" onclick="i18next.changeLanguage(&quot;pl&quot;)">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/flag.svg#cif-pl"></use>
                    </svg>Polski
                  </button>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <button class="btn btn-link nav-link" type="button" aria-expanded="false" data-coreui-toggle="dropdown">
                <svg class="icon icon-lg theme-icon-active">
                  <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-contrast"></use>
                </svg>
              </button>
              <ul class="dropdown-menu dropdown-menu-end" style="--cui-dropdown-min-width: 8rem;">
                <li>
                  <button class="dropdown-item d-flex align-items-center" type="button" data-coreui-theme-value="light">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-sun"></use>
                    </svg><span data-coreui-i18n="light">Light</span>
                  </button>
                </li>
                <li>
                  <button class="dropdown-item d-flex align-items-center" type="button" data-coreui-theme-value="dark">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-moon"></use>
                    </svg><span data-coreui-i18n="dark"> Dark</span>
                  </button>
                </li>
                <li>
                  <button class="dropdown-item d-flex align-items-center active" type="button" data-coreui-theme-value="auto">
                    <svg class="icon icon-lg me-3">
                      <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-contrast"></use>
                    </svg>Auto
                  </button>
                </li>
              </ul>
            </li>
            <li class="nav-item py-1">
              <div class="vr h-100 mx-2 text-body text-opacity-75"></div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link py-0" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-md"><img class="avatar-img" src="/resources/assets/img/avatars/8.jpg" alt="user@email.com"></div>
              </a>
              <div class="dropdown-menu dropdown-menu-end pt-0">
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold rounded-top mb-2" data-coreui-i18n="account">Account</div><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-bell"></use>
                  </svg><span data-coreui-i18n="updates">Updates</span><span class="badge badge-sm bg-info-gradient ms-2">42</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-envelope-open"></use>
                  </svg><span data-coreui-i18n="messages">Messages</span><span class="badge badge-sm badge-sm bg-success ms-2">42</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-task"></use>
                  </svg><span data-coreui-i18n="tasks">Tasks</span><span class="badge badge-sm bg-danger-gradient ms-2">42</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-comment-square"></use>
                  </svg><span data-coreui-i18n="comments">Comments</span><span class="badge badge-sm bg-warning-gradient ms-2">42</span></a>
                <div class="dropdown-header bg-body-tertiary text-body-secondary fw-semibold my-2" data-coreui-i18n="settings">Settings</div><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-user"></use>
                  </svg><span data-coreui-i18n="profile">Profile</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-settings"></use>
                  </svg><span data-coreui-i18n="settings">Settings</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-credit-card"></use>
                  </svg><span data-coreui-i18n="payments">Payments</span><span class="badge badge-sm bg-secondary-gradient text-dark ms-2">42</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-file"></use>
                  </svg><span data-coreui-i18n="projects">Projects</span><span class="badge badge-sm bg-primary-gradient ms-2">42</span></a>
                <div class="dropdown-divider"></div><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-lock-locked"></use>
                  </svg><span data-coreui-i18n="lockAccount">Lock Account</span></a><a class="dropdown-item" href="#">
                  <svg class="icon me-2">
                    <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-account-logout"></use>
                  </svg><span data-coreui-i18n="logout">Logout</span></a>
              </div>
            </li>
          </ul>
          <button class="header-toggler" type="button" onclick="coreui.Sidebar.getInstance(document.querySelector('#aside')).show()" style="margin-inline-end: -12px">
            <svg class="icon icon-lg">
              <use xlink:href="/resources/vendors/@coreui/icons/svg/free.svg#cil-applications-settings"></use>
            </svg>
          </button>
        </div>
        <div class="container-fluid px-4">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb my-0">
              <li class="breadcrumb-item"><a href="/system/main" data-coreui-i18n="home">Home</a>
              </li>
              <li class="breadcrumb-item active"><span data-coreui-i18n="dashboard">Dashboard</span>
              </li>
            </ol>
          </nav>
        </div>
      </header>
      
    </head>