<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
</head>
<body>
<c:if test="${not empty msg}">
    <script type="text/javascript">
    alert('${msg}');
    </script>
</c:if>
<div class="container">
<h1>��й�ȣ ����</h1>
<form action="../mypage/changePwdDo.html" method="post">
<table>
       <tr>
           <th>���� ��й�ȣ</th>
           <td><input type="password" name="nowPwd" placeholder="���� ��й�ȣ �Է�"/>
       </tr>
       <tr>
           <th>���� ��й�ȣ</th>
           <td><input type="password" name="ChangePwd" placeholder="���� ��й�ȣ �Է�"/>
       </tr>
        <tr>
           <th>���� ��й�ȣ Ȯ��</th>
           <td><input type="password" name="ConfirmPwd" placeholder="���� ��й�ȣ Ȯ��"/>
       </tr>
       
      </table>
        <button type="submit">�����ϱ�</button>
</form>
</div>
</body>
</html>