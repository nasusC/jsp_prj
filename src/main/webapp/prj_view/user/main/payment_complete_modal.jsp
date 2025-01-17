<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료 모달</title>
    <style>
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
        }
        .modal {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .modal-header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: center; 
        }
        .modal-body {
            padding: 20px;
            text-align: center;
        }
        .modal-body p {
            margin-bottom: 20px;
            color: #333;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-secondary {
            background-color: white;
            color: #333;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <button id="openModal">주문 완료 모달 열기</button>

    <div id="modalOverlay" class="modal-overlay">
        <div class="modal">
            <div class="modal-header">
                주문 완료
            </div>
            <div class="modal-body">
                <p>주문이 정상적으로 완료되었습니다</p>
                <button id="viewPurchase" class="btn btn-primary">구매내역 보기</button>
                <button id="completeButton" class="btn btn-secondary">완료</button> <!-- Update 3 -->
            </div>
        </div>
    </div>

    <script>
        const modalOverlay = document.getElementById('modalOverlay');
        const openModalBtn = document.getElementById('openModal');
        const viewPurchaseBtn = document.getElementById('viewPurchase');
        const completeBtn = document.getElementById('completeButton'); // Update 4
        const continueShoppingBtn = document.getElementById('continueShopping');

        // 모달을 여는 함수

        function closeModal() {
            modalOverlay.style.display = 'none';
        }

        openModalBtn.addEventListener('click', openModal);
        viewPurchaseBtn.addEventListener('click', () => {
            alert('구매내역 페이지로 이동합니다.');
            closeModal();
        });
        completeBtn.addEventListener('click', closeModal); // Update 4
        

        
    </script>
</body>
</html>