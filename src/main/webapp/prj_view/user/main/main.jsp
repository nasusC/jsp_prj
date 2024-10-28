<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에고엠포리움</title>
<link rel="stylesheet" href="main.css?after">
<style>
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

.auth-buttons {
	display: flex;  
	align-items: center;  
}

.auth-button {
	background-color: #AF7DE7;  
	color: white; 
	border: 2px solid #7C3AED;  
	padding: 6px 12px;  
	border-radius: 4px; 
	cursor: pointer; 
	margin-left: 10px; 
}

.auth-button:hover {
	background-color: #8b5cf6; 
	border-color: #7c3aed;  
}
</style>
</head>
<body>

	<div class="header">
		<div class="header-content">
			<a href="main.html"> <img
				src="http://localhost/html_prj/common/images/EGO.png" alt="쇼핑몰 로고"></a>
		</div>

		<div class="search-and-login">
			<div class="search-bar">
				<input type="text" placeholder="검색...">
				<button aria-label="검색">🔍</button>
			</div>
			<div class="auth-buttons">
				<button class="login-button" onclick="location.href='login.html'">로그인</button>
				<button class="auth-button" id="logout-button"
					style="display: none;" onclick="logout()">로그아웃</button>
				<a href="mypage.html" id="mypage-button" style="display: none;"
					class="auth-button">마이페이지</a>
			</div>
		</div>
	</div>

	<div class="logo-container">
		<a href="main.html"> <img
			src="http://localhost/html_prj/common/images/EGO.png" alt="로고"
			class="main-logo"></a>
	</div>

	<div class="nav-section">
		<a href="#" class="nav-button active" onclick="refreshPage()">베스트상품</a>
		<a href="#" class="nav-button product-link" onclick="setActive(this)">전체상품</a>
		<div class="catalog">
			<ul>
				<li><a href="#" onclick="showAdidasProducts()">아디다스</a></li>
				<li><a href="#" onclick="showNikeProducts()">나이키</a></li>
				<li><a href="#" onclick="showNewbalanceProducts()">뉴발란스</a></li>
				<li><a href="#" onclick="showAsicsProducts()">아식스</a></li>
			</ul>
		</div>
		<a href="http://localhost/html_prj/project/notification.html"
			class="nav-button" onclick="setActive(this)">공지사항</a>
	</div>

	<!-- 콘텐츠 섹션 -->
	<div id="베스트상품" class="content" style="display: block;">
		<!-- 기본적으로 보이게 설정 -->
	</div>
	<div id="전체상품" class="content"></div>
	<div id="공지사항" class="content"></div>

	<script>
	
	function refreshPage() {
	    location.reload();  
	}

        function setActive(element) {
            const buttons = document.querySelectorAll('.nav-button');
            buttons.forEach(button => {
                button.classList.remove('active');
                button.style.color = 'gray';
            });

            element.classList.add('active');
            element.style.color = 'black';

            const contents = document.querySelectorAll('.content');
            contents.forEach(content => {
                content.style.display = 'none';
            });

            const contentId = element.textContent.trim();
            const contentElement = document.getElementById(contentId);

            if (contentId === '베스트상품') {
                document.querySelector('#전체상품').style.display = 'block'; // 전체상품을 보이게 함
            } else {
                const contentElement = document.getElementById(contentId);
                if (contentElement) {
                    contentElement.style.display = 'block';
                }
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            const bestButton = document.querySelector('.nav-button.active');
            if (bestButton) {
                setActive(bestButton);
            }
        });
		
        function showAdidasProducts() {
            const allProducts = document.querySelectorAll('.product-item');
            allProducts.forEach(product => {
                if (product.querySelector('h3').textContent.includes('아디다스')) {
                    product.style.display = 'block'; 
                } else {
                    product.style.display = 'none';  
                }
            });
        }
        
        function showNikeProducts() {
            const allProducts = document.querySelectorAll('.product-item');
            allProducts.forEach(product => {
                if (product.querySelector('h3').textContent.includes('나이키')) {
                    product.style.display = 'block';  
                } else {
                    product.style.display = 'none';  
                }
            });
        }
        
        function showNewbalanceProducts() {
            const allProducts = document.querySelectorAll('.product-item');
            allProducts.forEach(product => {
                if (product.querySelector('h3').textContent.includes('뉴발란스')) {
                    product.style.display = 'block';  
                } else {
                    product.style.display = 'none';  
                }
            });
        }
        
        function showAsicsProducts() {
            const allProducts = document.querySelectorAll('.product-item');
            allProducts.forEach(product => {
                if (product.querySelector('h3').textContent.includes('아식스')) {
                    product.style.display = 'block'; 
                } else {
                    product.style.display = 'none'; 
                }
            });
        }
        
        function login() {
            // 로그인 로직 구현
            document.getElementById('login-button').style.display = 'none';
            document.getElementById('logout-button').style.display = 'inline-block';
            document.getElementById('mypage-button').style.display = 'inline-block';
        }

        function logout() {
            // 로그아웃 로직 구현
            document.getElementById('login-button').style.display = 'inline-block';
            document.getElementById('logout-button').style.display = 'none';
            document.getElementById('mypage-button').style.display = 'none';
        }
    </script>

	<div class="banner">
		<p>배너</p>
	</div>

	<div class="product-title">전체상품</div>

	<div class="sort-options">
		<a href="#" class="sort-link">인기도순</a> | <a href="#" class="sort-link">최신등록순</a>
		| <a href="#" class="sort-link">낮은가격순</a> | <a href="#"
			class="sort-link">높은가격순</a>
	</div>

	<div class="product-grid">
		<div class="product-item">
			<a href="링크1"><img
				src="https://shop-phinf.pstatic.net/20240809_53/1723171578581JThbi_JPEG/3965795842208553_29931879.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>아디다스 오리지널스 삼바 OG 슈 클라우드 화이트 B75806</h3>
			<p>106,000원</p>
		</div>

		<div class="product-item">
			<a href="http://localhost/html_prj/project/2.html"> <img
				src="https://shop-phinf.pstatic.net/20240809_125/17231862398557dxaN_JPEG/54794268761660804_1841460053.jpg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 V2K 런 블랙 앤트러사이트 FD0736-001</h3>
			<p>85,900원</p>
		</div>

		<div class="product-item">
			<a href="링크3"><img
				src="https://shop-phinf.pstatic.net/20240809_158/1723171563315mVmGa_JPEG/53181237975814531_723098503.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>아디다스 오리지널스 삼바 OG 슈 코어 블랙 B75807</h3>
			<p>107,000원</p>
		</div>

		<div class="product-item">
			<a href="링크4"><img
				src="https://shop-phinf.pstatic.net/20240809_163/1723186190777nNxrA_JPEG/3251945541663246_1319180460.jpg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 V2K 런 서밋 화이트 메탈릭 실버 FD0736-100</h3>
			<p>85,900원</p>
		</div>

		<div class="product-item">
			<a href="링크5"><img
				src="https://shop-phinf.pstatic.net/20240809_57/1723171439937jIyb4_PNG/53181114567337212_629844738.png?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 1906R 하버 그레이 실버 메탈릭 M1906REH</h3>
			<p>109,000원</p>
		</div>

		<div class="product-item">
			<a href="링크6"><img
				src="https://shop-phinf.pstatic.net/20240809_169/1723171640136U3G4c_JPEG/1972013019296857_633890080.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>아디다스 오리지널스 삼바 OG 크림 화이트 ID0478</h3>
			<p>60,000원</p>
		</div>

		<div class="product-item">
			<a href="링크7"><img
				src="https://shop-phinf.pstatic.net/20240809_44/1723171272735phAzP_JPEG/1971645585927897_1116420390.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 줌 보메로 5 우먼스 코블스톤 앤 플랫 퓨터 FB8825-001</h3>
			<p>70,000원</p>
		</div>

		<div class="product-item">
			<a href="링크8"><img
				src="https://shop-phinf.pstatic.net/20240809_180/17231716097352dqYX_PNG/1971982623267479_490155415.png?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 1906R 하버 그레이 실버 메탈릭 M1906REH</h3>
			<p>80,000원</p>
		</div>

		<div class="product-item">
			<a href="링크9"><img
				src="https://shop-phinf.pstatic.net/20240809_109/1723186539189n3W5k_JPEG/3135303833404651_391281903.jpg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 530 스틸그레이 MR530KA</h3>
			<p>50,000원</p>
		</div>

		<div class="product-item">
			<a href="링크10"><img
				src="https://shop-phinf.pstatic.net/20240809_133/1723171368995YnaHR_JPEG/2758472776031937_2059794753.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 에어맥스97 트리플화이트 921826-101</h3>
			<p>60,000원</p>
		</div>

		<div class="product-item">
			<a href="링크11"><img
				src="https://shop-phinf.pstatic.net/20240809_40/1723186569927zqoyU_JPEG/49999464758241629_1113715627.jpg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 1906R 화이트 골드 M1906RA</h3>
			<p>109,000원</p>
		</div>

		<div class="product-item">
			<a href="링크12"><img
				src="https://shop-phinf.pstatic.net/20240809_211/1723171251240hQnwy_JPEG/41257739094869633_157176596.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 에어포스 1 07 로우 트리플블랙 CW2288-001</h3>
			<p>108,000원</p>
		</div>

		<div class="product-item">
			<a href="링크13"><img
				src="https://shop-phinf.pstatic.net/20240809_127/17231865021712A4Gm_JPEG/71547134981023224_542423486.jpg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 530 화이트 내츄럴 인디고 MR530SG</h3>
			<p>89,000원</p>
		</div>

		<div class="product-item">
			<a href="링크14"><img
				src="https://shop-phinf.pstatic.net/20240809_190/1723171060520YYUxw_JPEG/41257548378566491_1407071833.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>뉴발란스 530 프리미엄 빈티지 그레이 매터 MR530TG</h3>
			<p>89,000원</p>
		</div>

		<div class="product-item">
			<a href="링크15"><img
				src="https://shop-phinf.pstatic.net/20240809_105/1723171302340O8bJH_JPEG/53180976987350621_289983510.jpeg?type=f296_296"
				alt="상품 이미지"></a>
			<h3>나이키 줌 보메로 5 우먼스 포톤 더스트 앤 메탈릭 실버 FD0884-025</h3>
			<p>122,000원</p>
		</div>
	</div>



	<footer class="footer">
		<p>사업자등록번호 010-10-10101</p>
		<p>통신판매업신고번호 1010-1010-1010호</p>
		<p>대표이사 홍길동 경기도 성남시 분당구 정자일로 95, 1784, 13561</p>
		<p>전화 1588-3819 이메일 egoempo@naver.com 사업자등록정보 확인</p>
	</footer>

	<script>
</script>

</body>
</html>