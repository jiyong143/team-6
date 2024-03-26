<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>What do you want to ask? - 로그인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
h1 {
	margin-top: 10%;
	text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	/* 그림자 추가 */
}

header, nav, body {
	background-color: white;
	padding: 20px;
}

nav a {
	color: #333;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 5px;
	text-shadow: 1px 1px 1px 1px black;
}

nav a:hover {
	background-color: #ddd;
	border-radius: 5px;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	position: fixed;
}

.category {
	position: fixed;
	top: 70px;
	/* 카테고리 박스가 나타날 위치 조정 */
	left: -400px;
	/* 왼쪽에서 시작 */
	width: 200px;
	/* 카테고리 칸 크기 수정 */
	background-color: white;
	border: 1px solid #ddd;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
	padding: 20px;
	/* 내부 여백 수정 */
	transition: left 0.3s ease;
	/* 왼쪽으로 이동하는 애니메이션 효과 */
	z-index: 1;
	/* 카테고리 박스가 버튼 위에 보이도록 설정 */
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
}

.category.open {
	left: 0;
	/* 왼쪽으로 이동하여 나타남 */
}

.category ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.category ul li {
	padding: 10px 0;
	/* 내부 여백 수정 */
	border-bottom: 1px solid #ddd;
}

.category ul li:last-child {
	border-bottom: none;
}

.category-toggle.clicked {
	box-shadow: inset 1px 1px 1px 1px black;
}

.category-toggle {
	position: fixed;
	top: 20px;
	left: 20px;
	cursor: pointer;
	z-index: 999;
	/* 다른 요소 위에 표시되도록 설정 */
	background-color: white;
	border-radius: 5px;
	padding: 5px;
}

.category-toggle span {
	display: block;
	width: 30px;
	height: 5px;
	background-color: black;
	margin-bottom: 5px;
	transition: transform 0.3s ease;
}

.category-toggle.open span:nth-child(1) {
	transform: rotate(45deg) translate(2px, 2px);
}

.category-toggle.open span:nth-child(2) {
	opacity: 0;
}

.category-toggle.open span:nth-child(3) {
	transform: rotate(-45deg) translate(2px, -2px);
}

.logo {
	text-align: center;
	margin-bottom: 20px;
}

.logo a {
	color: inherit;
	/* 상속된 텍스트 색상 사용 */
	text-decoration: none;
	/* 밑줄 제거 */
	font-size: 36px;
	/* 로고 텍스트 크기 늘리기 */
}

.join {
	position: fixed;
	top: 20px;
	right: 20px;
}

.join a {
	color: inherit;
	/* 기본 텍스트 색으로 설정 */
	text-decoration: none;
	/* 밑줄 제거 */
}

.copyright {
	background-color: #ffffff;
	text-align: center;
	margin-top: 20px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.ad-container {
	position: fixed;
	bottom: 10px;
	right: 10px;
	background-color: white;
	padding: 10px;
	border-top-left-radius: 20px;
	box-shadow: -2px -2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: center;
}

.ad-container img {
	max-width: 100%;
}

.recent-posts ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.recent-posts ul li {
	margin-bottom: 10px;
}

.recent-posts ul li a {
	color: black;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 5px;
}

.right-box-container {
	position: fixed;
	/* 오른쪽 박스와 버튼의 상대적인 위치 설정 */
}

.right-box {
	position: fixed;
	/* 화면에 고정 */
	top: 30%;
	right: -300px;
	/* 화면 오른쪽에서 0px 떨어진 위치 */
	transform: translateY(-50%);
	/* 세로 방향으로 중앙 정렬 */
	width: 200px;
	/* 너비 설정 */
	background-color: white;
	/* 배경색 지정 */
	padding: 20px;
	/* 내부 여백 설정 */
	border: 1px solid #ddd;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	box-shadow: -2px 1px 4px 1px rgba(141, 102, 18, 0.5);
	/* 왼쪽으로 그림자 생성 */
	z-index: 1;
	/* 다른 요소 위에 표시되도록 설정 */
}

.close-button {
	position: fixed;
	top: 2%;
	right: 200px;
	cursor: pointer;
	background-color: white;
	/* 버튼 배경색 */
	z-index: 9999;
	/* 오른쪽 박스보다 위에 표시되도록 설정 */
	border: 0.5px solid white;
}

.close-button img {
	width: 30px;
	/* 이미지 너비 조정 */
	height: auto;
	/* 이미지 높이 자동 조정 */
}

.login-group {
	background-color: #ffffff;
	border-radius: 8px;
	padding: 70px;
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	text-align: center;
	max-width: 400px;
	margin: 0 auto 100px;
}

.login-group:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}

.login {
	display: block;
	text-align: left;
	margin-bottom: 20px;
}

.login label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.login input[type="text"], .login input[type="password"] {
	width: 100%;
	padding: 15px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 17px;
}

.login-group button {
	width: 100%;
	padding: 15px;
	border: none;
	background-color: rgba(141, 102, 18, 0.5);
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.login-group button:hover {
	background-color: rgb(191, 150, 75);
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="login-group">
		<form action="<c:url value="/login"/>" method="post" id="loginForm">
			<h1 style="margin-top: 0">Log in</h1>
			<div class="login">
				<label style="margin-top: 30px" for="id"></label> <input type="text"
					id="id" placeholder="Enter id" name="id" required="required"> <label for="pw"></label>
				<input type="password" id="pw" placeholder="Enter pw" name="pw" required="required">
			</div>
			<button type="submit">Log in</button>
		</form>
	</div>

	<script>
		function toggleCategory() {
			var category = document.getElementById("category");
			category.classList.toggle("open");
		}

		var searchInput = document
				.querySelector('.search-container input[type=text]');

		var categoryToggle = document.querySelector('.category-toggle');

		categoryToggle.addEventListener('click', function() {
			// 클릭 시 토글
			this.classList.toggle('clicked');
		});

		var rightBox = document.querySelector('.right-box');
		var closeButton = document.querySelector('.close-button');
		var isHidden = true;

		closeButton.addEventListener('click', function() {
			rightBox.style.transition = 'right 0.3s ease';
			rightBox.style.right = isHidden ? '0' : '-300px';
			this.classList.toggle('click');
			isHidden = !isHidden;
		});
	</script>

</body>
</html>