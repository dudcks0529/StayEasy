<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��û�ϱ�</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/backbutton.css">

<style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

/* �����̳� ��ü �ڽ� */
.container {
    max-width: 1200px;
    margin: 50px auto;
    padding: 30px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
}

/* ���� */
.header-title {
    font-size: 26px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 30px;
}

/* �¿� ������ flex �����̳� */
.content {
    display: flex;
    flex-direction: row; /* �ٽ�! ���Ʒ��� �ƴ϶� ������ ��ġ */
    justify-content: space-between;
    gap: 40px;
    width: 100%;
    flex-wrap: wrap; /* ���� ȭ�鿡���� �ڵ� �ٹٲ� */
}

/* ����/������ �ڽ� ���� */
.left, .right {
    flex: 1;
    min-width: 400px;
}

/* �Է� �ʵ� �ڽ� */
.input-box {
    margin-bottom: 18px;
    text-align: left;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 6px;
}

input[type="text"], input[type="file"], input[type="number"], select {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 14px;
}
input[name$="_name"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 5px;
    margin-bottom: 10px;
    box-sizing: border-box;
    font-size: 14px;
}


/* ���� ��ǥ���� ���� */
.photo-section {
    margin-top: 25px;
    font-weight: bold;
    text-align: center;
}

/* �� ���� �� */
.room-section {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 18px;
    margin-top: 20px;
    background: #fdfdfd;
    text-align: left;
}

.room-section h4 {
    text-align: center;
    font-size: 16px;
    margin-bottom: 12px;
}

/* ��û�ϱ� ��ư ��ġ */
.form-footer {
    text-align: center;
    margin-top: 40px;
}

/* ��ư ������ */
.submit-btn {
    background-color: #FF6699;
    color: white;
    padding: 12px 26px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(255, 102, 153, 0.3);
}

.submit-btn:hover {
    background-color: #FF3366;
    box-shadow: 0 6px 12px rgba(255, 51, 102, 0.5);
    transform: translateY(-2px);
}
.delete-room-btn {
    float: right;
    background: none;
    border: none;
    font-size: 18px;
    color: #999;
    cursor: pointer;
    margin-top: -8px;
}
.delete-room-btn:hover {
    color: #e74c3c;
}
.error-message {
    color: red;
    font-size: 14px;
}

</style>
</head>
<body>

<div class="container">
    <div class="header-title">���� ��û�ϱ�</div>
	<a href="../mypage/mypageMain.html" class="back-button">
	    <i class="fas fa-arrow-left"></i>
	</a>
    <form:form modelAttribute="accommodation" action="../acc/submitAcc.html" id="accForm"
        method="post" enctype="multipart/form-data">
        <div class="content">
            <!-- ����: ���� ���� -->
            <div class="left">
                <div class="input-box">
                    <label>����</label>
                    <form:select path="category.category_id">
                        <form:option value="MOT">����</form:option>
                        <form:option value="HOT">ȣ��/����Ʈ</form:option>
                        <form:option value="PEN">���/Ǯ����</form:option>
                        <form:option value="CAM">ķ��/�۷���</form:option>
                        <form:option value="GUE">�Խ�Ʈ �Ͽ콺</form:option>
                        <form:option value="SPA">�����뿩</form:option>
                    </form:select>
                </div>

                <div class="input-box">
                    <label>���Ҹ� <form:errors path="accname" cssClass="error-message"/></label>
                    <form:input path="accname" placeholder="���Ҹ��� �Է��ϼ���"/>
                </div>

                <div class="input-box">
                    <label>����ڸ�   <form:errors path="user.username" cssClass="error-message"/></label>
                    <form:input path="user.username" readonly="true"/>
                </div>

                <div class="input-box">
                    <label>�ּ�   <form:errors path="location" cssClass="error-message"/></label>
                    <form:input path="location" placeholder="�ּҸ� �Է��ϼ���"/>
                </div>

                <div class="input-box">
                    <label>��ȭ��ȣ   <form:errors path="user.phone" cssClass="error-message"/></label>
                    <form:input path="user.phone" readonly="true"/>
                </div>

                <div class="input-box">
                    <label>���� ����   <form:errors path="description" cssClass="error-message"/></label>
                    <form:input path="description" placeholder="üũ�� 16�� ����, üũ�ƿ� 12�� ����, �ְߵ��� ���� ��"/>
                </div>

                <div class="photo-section">
                    <label>���� ��ǥ ����</label>
                    <input type="file" name="main_photo" id="main_photo">
                </div>
            </div>

            <!-- ������: �� ���� -->
            <div class="right">
                <div class="room-section" id="room1-section">
                    <h4>�� 1 </h4>
                    <label>��1 ����</label>
                    <input type="file" name="room1_photo">
                    <input name="room1_name" placeholder="�� �̸� �Է�" />
                    <input name="room1_price_per_night" placeholder="1�� ���� �Է�" type="number" step="1000"/>
                    <label>�ִ� �ο�:
                        <input type="number" name="room1_capacity" min="1" max="20" value="1" />
                    </label>
                </div>

				<div class="room-section" id="room2-section" data-room-visible="false" style="display: none;">
    				<h4>�� 2 <button type="button" class="delete-room-btn" onclick="deleteRoom(2)">��</button></h4>
                    <label>��2 ����</label>
                    <input type="file" name="room2_photo">
                    <input name="room2_name" placeholder="�� �̸� �Է�" />
                    <input name="room2_price_per_night" placeholder="1�� ���� �Է�" type="number" step="1000"/>
                    <label>�ִ� �ο�:
                        <input type="number" name="room2_capacity" min="1" max="20" value="1" />
                    </label>
                </div>

                <div class="room-section" id="room3-section" data-room-visible="false" style="display: none;">
    				<h4>�� 3 <button type="button" class="delete-room-btn" onclick="deleteRoom(3)">��</button></h4>
                    <label>��3 ����</label>
                    <input type="file" name="room3_photo">
                    <input name="room3_name" placeholder="�� �̸� �Է�" />
                    <input name="room3_price_per_night" placeholder="1�� ���� �Է�" type="number" step="1000"/>
                    <label>�ִ� �ο�:
                        <input type="number" name="room3_capacity" min="1" max="20" value="1" />
                    </label>
                </div>

                <div style="text-align: center; margin-top: 15px;">
                    <button type="button" class="submit-btn" id="add-room-btn">+ �� �߰��ϱ�</button>
                </div>
            </div>
        </div>

        <!-- ��� �ϴ�: ��û ��ư -->
        <div class="form-footer">
            <button type="submit" class="submit-btn">��û�ϱ�</button>
        </div>
    </form:form>
</div>
</body>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    const addRoomBtn = document.getElementById("add-room-btn");

    // �� �߰� ��ư Ŭ�� ��: ������ �� ������ ǥ��
    addRoomBtn.addEventListener("click", function () {
        const room2 = document.getElementById("room2-section");
        const room3 = document.getElementById("room3-section");

        if (room2.style.display === "none") {
            room2.style.display = "block";
            room2.setAttribute("data-room-visible", "true");
        } else if (room3.style.display === "none") {
            room3.style.display = "block";
            room3.setAttribute("data-room-visible", "true");
        }
        
        // ��� �� ������ ���̸� �߰� ��ư ��Ȱ��ȭ
        if (room2.style.display !== "none" && room3.style.display !== "none") {
            addRoomBtn.disabled = true;
            addRoomBtn.innerText = "�� �̻� �߰��� �� �����ϴ�";
        }
    });
    
    // �� ���� ��: �ʼ� �Է� �׸�(���� ��ǥ ����, �� ���� ����, �̸�, ����) üũ
    const accForm = document.getElementById("accForm");
    accForm.addEventListener("submit", function (event) {
        const mainPhoto = document.getElementById("main_photo");
        if (!mainPhoto.value) {
            alert("���� ��ǥ ������ ������ �ּ���.");
            event.preventDefault();
            return;
        }
        
        // �� �� ���ǿ� ���� ��ȿ�� üũ
        const roomSections = [
            document.getElementById("room1-section"),
            document.getElementById("room2-section"),
            document.getElementById("room3-section")
        ];
        for (let i = 0; i < roomSections.length; i++) {
            if (roomSections[i].style.display !== "none") {
                const roomPhoto = roomSections[i].querySelector("input[type='file']");
                const roomName = roomSections[i].querySelector("input[name^='room'][name$='_name']");
                const roomPrice = roomSections[i].querySelector("input[name^='room'][name*='price']");
                if (!roomPhoto.value || !roomName.value.trim() || !roomPrice.value.trim()) {
                    alert("��� ���� ����(����, �̸�, 1�� ����)�� �Է��� �ּ���.");
                    event.preventDefault();
                    return;
                }
            }
        }
    });
});

// ���� ��ư Ŭ�� �� ȣ��Ǵ� �Լ�: �ش� �� ������ ����� �Է°� �ʱ�ȭ, �߰� ��ư ��Ȱ��ȭ
function deleteRoom(roomNumber) {
    const roomSection = document.getElementById("room" + roomNumber + "-section");
    const roomSections = [
        document.getElementById("room1-section"),
        document.getElementById("room2-section"),
        document.getElementById("room3-section")
    ];
    
    // ���� ���̴� ���� �� ��� (�ּ� 1���� ���ƾ� ��)
    let visibleCount = 0;
    roomSections.forEach(section => {
        if (section.style.display !== "none") {
            visibleCount++;
        }
    });
    if (visibleCount <= 1) {
        alert("�ּ� 1���� ���� ������ �ʿ��մϴ�.");
        return;
    }
    
    // �ش� �� ���� ����� ���� �Է°� �ʱ�ȭ
    roomSection.style.display = "none";
    roomSection.setAttribute("data-room-visible", "false");
    roomSection.querySelectorAll("input").forEach(input => {
        input.value = "";
    });
    
    // �߰� ��ư ��Ȱ��ȭ (������ �ʴ� ���� �ϳ��� ������)
    const addRoomBtn = document.getElementById("add-room-btn");
    if (document.getElementById("room2-section").style.display === "none" ||
        document.getElementById("room3-section").style.display === "none") {
        addRoomBtn.disabled = false;
        addRoomBtn.innerText = "+ �� �߰��ϱ�";
    }
}
</script>

</html>