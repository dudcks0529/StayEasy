<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ȭ��</title>
<!-- jQuery & jQuery UI -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!-- Font Awesome ������ ���̺귯�� �߰� -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/backbutton.css">

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

<style>
/* ��ü �����̳� */
.body {
	background-color: #f8f9fa;
}
.container {
    display: flex;
    gap: 20px;
    justify-content: center;
    max-width: 1200px;
    margin: auto;
}

.left-panel {
    width: 65%;
}
/* �� ����Ʈ ��Ÿ�� */
.right-panel {
    width: 35%;
    overflow-y: auto;
    max-height: 600px;
    padding-left: 20px;
}

/* üũ��, üũ�ƿ�, �ο� �� �Է� ��Ÿ�� */
.check-info {
    display: flex;
    justify-content: center;
    gap: 15px;
    align-items: center;
    padding: 10px 0;
    background-color: #f8f9fa;
    border-radius: 10px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

.check-info label {
    font-weight: bold;
    color: #333;
}

.check-info input {
    width: 120px;
    padding: 8px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    text-align: center;
    transition: border-color 0.3s;
}

.check-info input:focus {
    border-color: #007BFF;
    outline: none;
}

/* ���� �̹��� */
.hotel-image img {
    width: 100%;
    height: 450px;
    min-width: 400px; /* �ּ� �ʺ� ���� */
    min-height: 300px; /* �ּ� ���� ���� */
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}

/* ���� ���� */
.left-panel h2 {
    font-size: 24px;
    margin-top: 15px;
}
.left-panel p {
    font-size: 16px;
    color: #555;
}

/* �� �����̳� ��Ÿ�� */
.room-table {
    width: 100%;
    border: 2px solid #ddd;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 15px;
    transition: all 0.3s ease-in-out;
    background-color: white;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.room-table:hover {
    transform: scale(1.02);
    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2);
}

/* �� �̹��� */
.room-image {
    width: 100%;
    height: auto;
    border-bottom: 1px solid #ddd;
}

/* �� ���� ��ư */
.reserve-btn {
    background-color: #007BFF;
    color: white;
    font-size: 14px;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.3s, transform 0.2s;
}

.reserve-btn:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

/* ������ �� ���� (�׵θ� & ��ư �� ����) */
.selected-room {
    border: 3px solid #007BFF !important;
    box-shadow: 0px 0px 12px rgba(0, 123, 255, 0.5);
}

.selected-room .reserve-btn {
    background-color: #0056b3;
    color: #fff;
}

.selected-room .reserve-btn:hover {
    background-color: #004494;
    transform: scale(1.05);
}

/* ��ư ��Ÿ�� */
.btn {
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    font-size: 16px;
    font-weight: bold;
}
.btn:hover {
    opacity: 0.9;
}

/* �����ϱ� & ��ٱ��� ��ư */
.button-wrap {
    display: none;  /* �⺻������ ���� */
    justify-content: center;
    gap: 20px;
    margin-top: -10px; /* ��¦ ���� ���� */
}

/* ���� & ��ٱ��� ��ư ��Ÿ�� */
#finalReserveBtn, #cart-btn {
    padding: 12px 24px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    cursor: pointer;
    border: none;
}

/* �����ϱ� ��ư */
#finalReserveBtn {
    background-color: #28a745;
    color: white;
}


#finalReserveBtn:hover {
    background-color: #218838;
    transform: scale(1.05);
}

/* ��ٱ��� ��ư */
#cart-btn {
    background-color: #ff9800;
    color: white;
}

#cart-btn:hover {
    background-color: #e68900;
    transform: scale(1.05);
}


</style>
</head>

<body>
<c:if test="${message != null}">
    <script>alert("${message}");</script>
</c:if>

<form:form modelAttribute="reservation">
<form:hidden path="room.id.accommodationId" value="${ACC.accommodation_id}"/>
<form:hidden path="room.id.roomId" id="roomIdHidden"/>
<a href="../reserv/reservList.html?TYPE=${TYPE }&pageNo=1" class="back-button">
    <i class="fas fa-arrow-left"></i>
</a>
<!-- ���� ���� �Է� (������� �̵�) -->
<div class="check-info">
    <label>üũ��:</label> <form:input path="check_in_date" type="text" disabled="true"/>
    <label>üũ�ƿ�:</label> <form:input path="check_out_date" type="text" disabled="true"/>
    <label>�ο���:</label> <form:input path="count" type="number" cssClass="person" id="countInput" value="1" min="1"/>
   
	<div class="button-wrap">
    <button type="button" id="finalReserveBtn" onclick="submitForm('../reserv/reservGo.html')">�����ϱ�</button>
    <button type="button" id="cart-btn" onclick="submitForm('../cart/addCart.html')">��ٱ���</button>
  	<c:if test="${not empty message}">
		    <script>
		        alert("${message}");
		    </script>
	</c:if>
	</div>
</div>
<!-- ���� -->
<div class="container">
    <div class="left-panel">
    <div class="hotel-image">
        <img src="${pageContext.request.contextPath}/imgs/${ACC.acc_image}" alt="���� �̹���">
    </div>
    <h2>${ACC.accname}</h2>
    <p>��ġ: ${ACC.location}</p>
    <p>${ACC.description}</p>
    <button type="button" class="btn" onclick="goToPage('../review/list.html?ACC=${ACC.accommodation_id}')">���� ��������</button>
</div>

    <div class="right-panel">
    <c:forEach var="room" items="${RoomList}">
        <table class="room-table" data-room-id="${room.id.roomId}">
            <tr><td colspan="2"><img class="room-image" src="${pageContext.request.contextPath}/imgs/${room.room_image}" alt="�� �̹���"></td></tr>
            <tr><td>${room.name}</td><td>�ִ� �ο�: ${room.capacity}</td></tr>
            <tr><td colspan="2">1�� ����: <fmt:formatNumber value="${room.price_per_night}" pattern="#,###"/>��</td></tr>
            <tr>
                <td class="center" colspan="2">
                    <button class="btn reserve-btn" type="button">�� �����ϱ�</button>
                </td>
            </tr>
        </table>
    </c:forEach>
</div>
</div>
</form:form>
<script>
function openCartPopup() {
    let form = document.getElementById("cartForm");
    let formData = new FormData(form);
    let actionUrl = form.getAttribute("action");

    let popupWindow = window.open("", "cartPopup", "width=400,height=300");

    form.target = "cartPopup"; // �˾� â���� ����� ����
    form.submit();
}
</script>
<script type="text/javascript">
var reservedDates = ${reservedDatesJson};
let selectedRoomId = null, unavailableDates = [];

$(document).ready(function() { initDatepicker(); });

$(document).ready(function() {
    $(".reserve-btn").click(function() {
        const roomTable = $(this).closest(".room-table");
        selectedRoomId = roomTable.data("room-id");

        // ���� ���õ� �� ��Ÿ�� �ʱ�ȭ
        $(".room-table").removeClass("selected-room");

        // ������ �� ��Ÿ�� ���� (�׵θ� & ��ư �� ����)
        roomTable.addClass("selected-room");

        // ���� & ��ٱ��� ��ư ���̱� (display: flex ����)
        $(".button-wrap").css("display", "flex");

        // �� ���� �� �Է� �����ϰ� ����
        $("#check_in_date").prop("disabled", false);
        $("#check_out_date").prop("disabled", false);
        $("#count").prop("disabled", false);

        // ������ roomID�� hidden �ʵ忡 ����
        $("#roomIdHidden").val(selectedRoomId);

        const checkInDates = reservedDates[selectedRoomId]?.checkInDates.map(d => d.split(" ")[0]) || [];
        const checkOutDates = reservedDates[selectedRoomId]?.checkOutDates.map(d => d.split(" ")[0]) || [];

        unavailableDates = [];
        for (let i = 0; i < checkInDates.length; i++) {
            const start = new Date(checkInDates[i]), end = new Date(checkOutDates[i]);
            for (let d = new Date(start); d < end; d.setDate(d.getDate() + 1)) {
                unavailableDates.push($.datepicker.formatDate("yy-mm-dd", d));
            }
        }
        initDatepicker();
    });
});


function initDatepicker() {
    $('input[name="check_in_date"]').datepicker('destroy').datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        beforeShowDay: function(date) {
            let formattedDate = $.datepicker.formatDate('yy-mm-dd', date);
            return unavailableDates.includes(formattedDate) ? [false] : [true];
        },
        onSelect: function(selectedDate) {
            let minCheckoutDate = new Date(selectedDate);
            minCheckoutDate.setDate(minCheckoutDate.getDate() + 1); // üũ�� ���� ������ ���� ����
            $('input[name="check_out_date"]').datepicker('destroy').datepicker({
                dateFormat: 'yy-mm-dd',
                minDate: minCheckoutDate, // üũ�� ��¥ +1�Ϻ��� ���� ����
                beforeShowDay: function(date) {
                    let formattedDate = $.datepicker.formatDate('yy-mm-dd', date);
                    return unavailableDates.includes(formattedDate) ? [false] : [true];
                }
            });
        }
    });

    // üũ�ƿ� datepicker �ʱ�ȭ
    $('input[name="check_out_date"]').datepicker('destroy').datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 1, // üũ�� ��¥ ���� �������� �ּ� �Ϸ� ���ķ� ����
        beforeShowDay: function(date) {
            let formattedDate = $.datepicker.formatDate('yy-mm-dd', date);
            return unavailableDates.includes(formattedDate) ? [false] : [true];
        }
    });
}


function submitForm(url) { $('form').attr('action', url).submit(); }
function goToPage(url) { location.href = url; }

//üũ��, üũ�ƿ�, �ο����� ��� ������ �ȳ� alertâ ����
function submitForm(url) {
    const checkIn = $('input[name="check_in_date"]').val();
    const checkOut = $('input[name="check_out_date"]').val();
    const count = $('input[name="count"]').val();

    // ���� ����ִ� ��� �˸� ǥ��
    if (!checkIn) {
        alert('üũ�� ��¥�� �������ּ���.');
        return;
    }
    if (!checkOut) {
        alert('üũ�ƿ� ��¥�� �������ּ���.');
        return;
    }
    
    if (checkIn === checkOut) {
        alert('üũ�ΰ� üũ�ƿ� ��¥�� ������ �� �����ϴ�.');
        return;
    }
    
    if (!count || count <= 0) {
        alert('�ο� ���� 1�� �̻� �Է����ּ���.');
        return;
    }

    // ��� �ԷµǾ��� ���� submit
    $('form').attr('action', url).submit();
}
function goToPage(url) {
    location.href = url;
}
</script>
</body>
</html>