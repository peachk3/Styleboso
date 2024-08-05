<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        .cell {
            cursor: pointer;
        }
        .selected {
            background-color: #f0f0f0;
        }
 .grid-container {
            display: grid;
            gap: 1px;
            background-color: #ccc;
        }
        .grid-item {
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            text-align: center;
            cursor: pointer;
        }
        .grid-item.selected {
            background-color: #f0f0f0;
        }
    </style>
<body>
        <h1>Warehouse Management</h1>
        
    <select id="warehouseSelect">
        <option value="">Select Warehouse</option>
        <c:forEach items="${whCodeList}" var="whCodeList">
            <option value="${whCodeList.s_cate_wh_code}">${whCodeList.s_cate_wh_name}</option>
        </c:forEach>
    </select>
    
    <select id="zoneSelect">
        <option value="">Select Zone</option>
    </select>
    
    <select id="rackSelect">
        <option value="">Select Rack</option>
    </select>
    
	<div id="gridContainer" class="grid-container"></div>
	
	<ul id="inventoryList"></ul>
    
</body>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
const token = $("meta[name='_csrf']").attr("content")
const header = $("meta[name='_csrf_header']").attr("content");
const name = $("#userName").val();

$(document).ready(function() {
    $('#warehouseSelect').change(function() {
        var wh_code = $(this).val();
        $.ajax({
            url: '/basicInfo/getZones',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            type: 'POST',
	        dataType: "json",
            data: { wh_code: wh_code },
            success: function(data) {
                console.log(data);
                $('#zoneSelect').empty();
                $('#zoneSelect').append('<option value="">Select Zone</option>');
                $.each(data, function(index, value) {
                    $('#zoneSelect').append('<option value="' + value + '">' + value + '</option>');
                });
            }
        });
    });
    
    $('#zoneSelect').change(function() {
        var wh_code = $('#warehouseSelect').val();
        var wh_zone = $(this).val();
        $.ajax({
            url: '/basicInfo/getRacks',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            type: 'POST',
	        dataType: "json",
            data: { wh_code: wh_code, wh_zone: wh_zone },
            success: function(data) {
                $('#rackSelect').empty();
                $('#rackSelect').append('<option value="">Select Rack</option>');
                $.each(data, function(index, value) {
                    $('#rackSelect').append('<option value="' + value + '">' + value + '</option>');
                });
            }
        });
    });
    
    $('#rackSelect').change(function() {
        var wh_code = $('#warehouseSelect').val();
        var wh_zone = $('#zoneSelect').val();
        var wh_rack = $(this).val();
        $.ajax({
            url: '/basicInfo/getColumnRows',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            type: 'POST',
	        dataType: "json",
            data: { wh_code: wh_code, wh_zone: wh_zone, wh_rack: wh_rack },
            success: function(data) {
            	 var columns = data.columns;
                 var rows = data.rows;
                 
                 var tableHtml = '<table><thead><tr><th></th>';
                 
              // Add column headers
                 $.each(columns, function(index, column) {
                     tableHtml += '<th>' + column + '</th>';
                 });
                 tableHtml += '</tr></thead><tbody>';

                 // Add rows
                 $.each(rows, function(rowIndex, row) {
                     tableHtml += '<tr><td>' + row + '</td>';
                     $.each(columns, function(columnIndex, column) {
                         tableHtml += '<td class="cell" data-row="' + row + '" data-column="' + column + '">' + row + '-' + column + '</td>';
                     });
                     tableHtml += '</tr>';
                 });

                 tableHtml += '</tbody></table>';
                 $('#gridContainer').html(tableHtml);
             }

        });
    });
    
 // Handle cell clicks
    $(document).on('click', '.cell', function() {
        var row = $(this).data('row');
        var column = $(this).data('column');
        var wh_code = $('#warehouseSelect').val();
        var wh_zone = $('#zoneSelect').val();
        var wh_rack = $('#rackSelect').val();
        var wh_num = wh_code + wh_zone + wh_rack + row + column

        $.ajax({
            url: '/basicInfo/getInventory',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            type: 'POST',
	        dataType: "json",
            data: { wh_num: wh_num, wh_code: wh_code, wh_zone: wh_zone, wh_rack: wh_rack, wh_row: row, wh_column: column },
            success: function(data) {
            	 console.log('Inventory data:', data); // 데이터 확인
                 if (data && Array.isArray(data)) {
                     $('#inventoryList').empty();
                     $.each(data, function(index, value) {
                         $('#inventoryList').append('<li>' + value.goods_num + ': ' + value.inven_qty + '</li>');
                     });
                 } else {
                     $('#inventoryList').html('<li>No data available</li>');
                 }
             },
             error: function(xhr, status, error) {
                 console.error('Error fetching inventory:', error); // 오류 처리
             }
        });

        // Highlight selected cell
        $('.cell').removeClass('selected');
        $(this).addClass('selected');
    });
    
    
});

</script>
<%@ include file="../include/footer.jsp" %>
</html>
