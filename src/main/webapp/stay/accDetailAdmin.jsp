<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ڿ� ���� ��ȭ��</title>
<style type="text/css">
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
    body { padding: 20px; background-color: #f8f9fa; }
    .container { display: flex; margin-top: 10px;}
    .left-panel { width: 60%; }
    .hotel-image img { width: 100%; height: auto; }
    .hotel-info { margin-top: 10px; font-size: 16px; line-height: 1.5; }
    .review-btn { background-color: yellow; border: 1px solid black; font-weight: bold; cursor: pointer; margin-top: 10px; padding: 5px; }
    .right-panel { margin-left: 20px; width: 35%; }
</style>
</head>
<body>
<form action="" method="post">
<input type="submit" value="����"/>
</form>
<form action="" method="post">
<input type="submit" value="����"/>
</form>
<button class="admin-btn">����(������)</button>

<!-- üũ��, üũ�ƿ�, �ο��� ���� -->
<div class="check-info">
    üũ��: <input type="date">
    üũ�ƿ�: <input type="date">
 �ο���: <input type="number" min="1" max="10" value="2">

</div>

<!-- ���� -->
<div class="container">
    <!-- ���� �г�: ȣ�� �̹��� �� ���� -->
    <div class="left-panel">
        <div class="hotel-image">
            <img src="${ACC.acc_image}" alt="���� �̹���">
        </div>
        <div class="hotel-info">
            <h2>${ACC.accname}</h2>
            ��ġ: ${ACC.location}<br>
            ${ACC.description}<br><br>
           <br>
            <button class="review-btn">���� ��������</button>
        </div>
    </div>

    <!-- ������ �г�: ���� ����Ʈ -->
    <div class="right-panel">
        ��������
    </div>
</div>
</body>
</html>
