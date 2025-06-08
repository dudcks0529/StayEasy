<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���� �亯</title>
<!-- Font Awesome ������ ���̺귯�� �߰� -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/backbutton.css">

<style>
body {
    background-color: #f8f9fa;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
}

/* ��ü ���̺� */
.table {
    width: 620px;
    margin: 40px auto;
    margin-top: 0;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    border-collapse: separate;
    border-spacing: 0 15px;
}

/* �׸� ���� �� */
.table th {
    width: 140px;
    background-color: #f1f1f1;
    text-align: left;
    font-weight: bold;
    padding: 10px 12px;
    border-radius: 8px;
    color: #333;
    vertical-align: top;
}

/* �Է� ���� �� */
.table td {
    padding: 10px 12px;
    vertical-align: top;
}

/* �Է� ��� ��Ÿ�� */
input[type="text"], textarea, select {
    width: 100%;
    padding: 12px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 10px;
    transition: border-color 0.2s ease-in-out;
    box-sizing: border-box;
    resize: vertical;
}

input[type="text"]:focus,
textarea:focus,
select:focus {
    border-color: #ff7a99;
    outline: none;
}

/* ���� �޽��� */
font[color="red"] {
    display: block;
    margin-top: 6px;
    font-size: 13px;
}

/* ��ư ���� */
.center {
    text-align: center;
    padding-top: 25px;
}

input[type="submit"],
input[type="reset"] {
    background-color: #ff7a99;
    color: white;
    border: none;
    padding: 12px 24px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 10px;
    margin: 0 10px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

input[type="submit"]:hover,
input[type="reset"]:hover {
    background-color: #ff4f78;
    transform: translateY(-2px);
}

</style>
<script>
// ���� ���� �� �����ȣ �ڵ� �Է�
function updateReservId(select) {
    const reservId = select.value;
    document.getElementById("reserv_id_input").value = reservId;
}
</script>
</head>

<body>

<form:form action="../inquire/replyDo.html" method="post" modelAttribute="inquire">
	<br/>
	<!-- ������� ���ư��� ��ư -->
    <a href="../inquire/detail.html?inquire_id=${param.inquire_id}" class="back-button">
        <i class="fas fa-arrow-left"></i>
    </a>
    <!-- ������ �ʵ�� -->
    <form:hidden path="order_no" />
    <form:hidden path="group_id" />
    <form:hidden path="parent_id" />
    <form:hidden path="inquire_id"/>
    <form:hidden path="reservation.reservation_id" id="reserv_id_input" /> <!-- ���õ� ���� ID ���� -->

    <table class="table">
        <!-- ���� ��ȣ -->
        <tr>
            <th>���� ��ȣ</th>
            <td>${inquire.inquire_id }</td>
        </tr>
        <tr>
            <th>���� ��ȣ</th>
            <td>${inquire.reservation.reservation_id}</td>
        </tr>
        <!-- ���� ���� -->
        <tr>
            <th>������ ����</th>
      		<td>${acc.accname}</td>
        </tr>
         <tr>
            <th>������ ��</th>
      		<td>${reservation.room.name}</td>
        </tr>
        <tr>
        	<th>������</th>
        	<td><fmt:formatDate value="${reservation.r_date}" pattern="yyyy-MM-dd" /></td>
        	
        </tr>
        
        <tr>
            <th>������</th>
            <td>${reservation.user.user_id}</td>
        </tr>

        <!-- �ۼ��� -->
        <tr>
            <th>�ۼ���</th>
            <td>${sessionScope.loginUser.id}</td>
        </tr>

        <!-- ���� -->
        <tr>
            <th>����</th>
            <td>
                <form:input path="title" value="${title}" />
                <font color="red"><form:errors path="title" /></font>
            </td>
        </tr>

        <!-- ���� -->
        <tr>
            <th>�� ��</th>
            <td>
                <form:textarea path="content" rows="8" cols="60" />
                <font color="red"><form:errors path="content" /></font>
            </td>
        </tr>

	    <tr>
	        <th>�亯 ����</th>
	        <td>
	            <form:input path="status" readonly="true"/>
	        </td>
	    </tr>

        <!-- �ۼ��� -->
        <tr>
            <th>���� �ۼ���</th>
            <td><fmt:formatDate value="${i_date}" pattern="yyyy-MM-dd" /></td>
        </tr>

        <!-- ��ư -->
        <tr>
            <td colspan="2" class="center">
                <input type="submit" value="�亯�ϱ�" />
                <input type="reset" value="���" />
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
