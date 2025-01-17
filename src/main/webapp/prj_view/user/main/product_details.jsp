<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에고엠포리움</title>
<link rel="stylesheet" href="main.css?after">
<link rel="stylesheet" href="product_details.css?after">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
.nav-button {
	color: gray;
	cursor: pointer; 
	margin-right: 10px;
}

.nav-button.active {
	color: black; 
}

.content {
	display: none;
}

body {
    font-family: Arial, sans-serif;
    font-size: 12px;
    line-height: 1.5;
    color: #333;
    margin: 0;
    padding: 20px;
}

table {
    width: 55%; 
    /* max-width: 600px; */ 
    margin-left: auto;
    margin-right: auto;
    border-collapse: collapse;
    margin-bottom: 10px;
}

td {
    padding: 8px;
    text-align: left;
    border-top: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
    background-color: #ffffff;
}

th {
    padding: 8px;
    text-align: left;
    border-top: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
    width: 25%;
    background-color: #f5f5f5;
    font-weight: normal;
}

.three-column td {
    width: 25%;
}

.highlight {
    background-color: #f5f5f5;
}

.material-row {
    border-top: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
}

.material-row th, .material-row td {
    border: none;
}

</style>
<script type="text/javascript">
	 function setActive(element) {
	        // 모든 .nav-button에서 active 클래스 제거 및 색상 회색으로 변경
	        const buttons = document.querySelectorAll('.nav-button');
	        buttons.forEach(button => {
	            button.classList.remove('active');
	            button.style.color = 'gray'; // 회색으로 변경
	        });

	        // 클릭된 버튼에 active 클래스 추가 및 색상 검정으로 변경
	        element.classList.add('active');
	        element.style.color = 'black'; // 클릭한 버튼을 검정색으로 변경

	        // 모든 콘텐츠 숨김
	        const contents = document.querySelectorAll('.content');
	        contents.forEach(content => {
	            content.style.display = 'none'; // 모든 콘텐츠 숨김
	        });

	        // 클릭된 버튼에 해당하는 콘텐츠 표시
	        const contentId = element.textContent.trim();
	        const contentElement = document.getElementById(contentId);
	        if (contentElement) {
	            contentElement.style.display = 'block'; // 해당 콘텐츠 표시
	        }
	    }

	    // 페이지 로드 시 베스트상품 버튼을 검정색으로 설정하고 해당 콘텐츠 표시
	    document.addEventListener('DOMContentLoaded', () => {
	        const bestButton = document.querySelector('.nav-button.active');
	        if (bestButton) {
	            setActive(bestButton); // 베스트상품 버튼 활성화 및 콘텐츠 표시
	        }
	    });
	
</script>
</head>
<body>
	<div class="header">
		<div class="header-content">
			<a href="main.jsp"> <img
				src="http://localhost/html_prj/common/images/EGO.png" alt="쇼핑몰 로고">
			</a>
		</div>

		<div class="search-and-login">
			<div class="search-bar">
				<input type="text" placeholder="검색...">
				<button aria-label="검색">🔍</button>
			</div>
			<button class="login-button">로그인</button>
		</div>
	</div>

	<div class="logo-container">
		<a href="main.jsp"> <img
			src="http://localhost/html_prj/common/images/EGO.png" alt="로고"
			class="main-logo">
		</a>
	</div>

	<div class="nav-section">
		<a href="http://localhost/html_prj/project/main.html"
			class="nav-button active" onclick="setActive(this)">베스트상품</a> <a
			href="#" class="nav-button product-link" onclick="setActive(this)">전체상품</a>
		<div class="catalog">
			<ul>
				<li><a href="page1.html">아디다스</a></li>
				<li><a href="page2.html">나이키</a></li>
				<li><a href="page3.html">뉴발란스</a></li>
				<li><a href="page4.html">아식스</a></li>
			</ul>
		</div>
		<a href="http://localhost/html_prj/project/notification.html"
			class="nav-button" onclick="setActive(this)">공지사항</a>
	</div>

	<script>
        function updatePrice() {
            var color = document.getElementById("color").value;
            var size = document.getElementById("size").value;
            var price = document.querySelector(".total-price");
            if (color !== "선택" && size !== "선택") {
                price.textContent = "85,900원";
            } else {
                price.textContent = "0원";
            }
        }
    </script>
</head>
<body>
	<div class="product-container">
		<div class="product-image">
			<img
				src="http://localhost/html_prj/common/images/20241018_134131.png"
				alt="나이키 v2k 런 블랙 앤트러사이트">
		</div>
		<div class="product-details">
			<h1>나이키 v2k 런 블랙 앤트러사이트 #FD0736-001</h1>
			<div class="price-container">
				<span class="price">85,900원</span>
			</div>
			<div class="free-exchange">무료배송</div>

			<select id="color">
				<option value="">컬러</option>
				<option value="black" selected>블랙</option>
			</select> 
			
			<select id="size">
				<option value="">사이즈</option>
				<option value="220">220</option>
				<option value="230">230</option>
				<option value="240">240</option>
				<option value="250">250</option>
				<option value="260">260</option>
				<option value="270">270</option>
				<option value="280">280</option>
				<option value="290">290</option>
			</select>

			<div class="totals">
				<div class="total-amount">총 상품 금액</div>
				<div>
					<span class="total-quantity" id="total-quantity">총 수량 0개</span> <span
						class="total-price"><span id="total-price" class="price">0원</span></span>
				</div>
			</div>

			   <button class="buy-button" onclick="handleBuyClick()">구매하기</button>

<script>
    function handleBuyClick() {
        var color = document.getElementById("color").value;
        var size = document.getElementById("size").value;

        if (color === "" || size === "") {
            alert("옵션을 선택해주세요.");
        } else {
            location.href = 'http://localhost/html_prj/project/payment.html';
        }
    }
</script>

		</div>
	</div>

	<div class="tabs">
		<div class="tab active" data-tab="details">상세정보</div>
		<div class="tab" data-tab="reviews">리뷰</div>
	</div>

	<table>
		<tr class="three-column">
			<th>상품번호</th>
			<td>107189311198</td>
			<td class="highlight">상품상태</td>
			<td>신상품</td>
		</tr>
		<tr class="three-column">
			<th>제조사</th>
			<td>나이키</td>
			<td class="highlight">브랜드</td>
			<td>나이키</td>
		</tr>
		<tr>
			<th>원산지</th>
			<td colspan="3">상세페이지 참조</td>
		</tr>
	</table>

	<table class="material-row">
		<tr>
			<th>주요소재(갑피)</th>
			<td colspan="3">천연가죽(소가죽)</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>A/S 안내</th>
			<td colspan="3">상세페이지 참조</td>
		</tr>
		<tr>
			<th>제조 및 수입연월</th>
			<td colspan="3">수입 14일 이내 출고예정</td>
		</tr>
	</table>
	<div class="expanded-content">
		<img src="http://localhost/html_prj/common/images/20241018_133912.png"
			alt="상세 정보">
	</div>
	
	<div class="parent-container">
	<button class="expand-button">상세정보 펼쳐보기</button>
	</div>
	
	<div id="reviews" class="tab-content">
		<div id="reviewContent">리뷰 내용이 여기에 표시됩니다.</div>
	</div>

	<script>
    $(document).ready(function() {
        $('#reviewContent').load('3.html');
    });
</script>

	<script>
    	const tabs = document.querySelectorAll('.tab');
        const tabContents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const tabId = tab.getAttribute('data-tab');
                
                tabs.forEach(t => t.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));
                
                tab.classList.add('active');
                document.getElementById(tabId).classList.add('active');
            });
        });

        const sizeSelect = document.getElementById('size');
        const totalPrice = document.getElementById('total-price');
        const totalQuantity = document.getElementById('total-quantity');

        sizeSelect.addEventListener('change', () => {
            if (sizeSelect.value) {
                totalPrice.textContent = '85,900원';
                totalQuantity.textContent = '총 수량 1개';
            } else {
                totalPrice.textContent = '0원';
                totalQuantity.textContent = '총 수량 0개';
            }
            totalPrice.classList.toggle('price', sizeSelect.value !== '');
        });

        const expandButton = document.querySelector('.expand-button');
        const expandedContent = document.querySelector('.expanded-content');

        expandButton.addEventListener('click', () => {
            expandedContent.classList.toggle('active');
            if (expandedContent.classList.contains('active')) {
                expandButton.textContent = '상세정보 접기';
                expandButton.scrollIntoView({ behavior: 'smooth' });
            } else {
                expandButton.textContent = '상세정보 펼쳐보기';
                expandedContent.scrollIntoView({ behavior: 'smooth' });
            }
        });
    </script>


	<footer class="footer">
		<p>사업자등록번호 010-10-10101</p>
		<p>통신판매업신고번호 1010-1010-1010호</p>
		<p>대표이사 최수연 경기도 성남시 분당구 정자일로 95, 1784, 13561</p>
		<p>전화 1588-3819 이메일 egoempo@naver.com 사업자등록정보 확인</p>
	</footer>

</body>
</html>
