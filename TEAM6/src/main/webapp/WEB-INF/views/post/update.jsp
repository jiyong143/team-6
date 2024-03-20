<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>What do you want to ask? - 게시글 수정</title>
<style>
a {
	color: #333;
	text-decoration: none;
}

h1 {
	text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	/* 그림자 추가 */
}

header, nav, body {
	background-color: white;
	padding: 20px;
}

.body-group {
	padding: 100px;
	margin-left: 150px;
	margin-right: 150px;
	padding-bottom: 150px;
}

nav a {
	color: #333;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 5px;
}

nav a:hover {
	background-color: #ddd;
	border-radius: 5px;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	position: relative;
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
}

.logo a {
	color: inherit;
	/* 상속된 텍스트 색상 사용 */
	text-decoration: none;
	/* 밑줄 제거 */
	font-size: 36px;
	/* 로고 텍스트 크기 늘리기 */
}

.login {
	position: fixed;
	top: 20px;
	right: 20px;
}

.login a {
	color: inherit;
	/* 기본 텍스트 색으로 설정 */
	text-decoration: none;
	/* 밑줄 제거 */
}

.recent-posts {
	width: calc(20% + 50px);
	position: absolute;
	top: calc(50% + 50px);
	left: 50%;
	transform: translateX(-50%);
	background-color: white;
	border-radius: 5px;
	padding: 20px;
	max-height: 300px;
	z-index: 1;
	overflow-y: auto;
	padding: 10px;
	display: none;
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
	position: relative;
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
	z-index: 9999;
	border: 0.5px solid white;
}

.close-button img {
	width: 30px;
	height: auto;
}

.board-box {
	border: 1px solid #ddd;
	transition: left 0.3s ease;
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	z-index: 1;
	width: 150px;
	padding-left: 20px;
}

.board-postList table {
	width: 100%;
	border-collapse: collapse;
}

.board-postList th {
	text-align: center;
	background-color: rgba(141, 102, 18, 0.5);
}

.copyright {
	background-color: #ffffff;
	text-align: center;
	margin-top: 20px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.board-postList th, .board-postList td {
	padding: 8px;
	border: 1px solid rgb(167, 159, 133);
}

/*------------me------------*/
.board-postList {
	border-radius: 10px;
	height: 100%;
	border: 1px solid #ddd;
	transition: left 0.3s ease;
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	box-sizing: border-box;
}

.hr {
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

.board-postList {
	padding-right: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.post-insert .title {
	height: 30px;
	margin-bottom: 10px;
}

.board-postList button {
	padding: 5px;
	background-color: rgba(141, 102, 18, 0.5);
	float: right;
	width: 100;
	height: 50%;
	margin-right: 10px;
	border-radius: 5px;
}

.post-insert .title:focus, .post-insert .content:focus {
	outline: none;
}

.post-insert .title, .post-insert .content {
	text-decoration: none;
	width: 100%;
	border: 1px solid rgba(141, 102, 18, 0.5);
	border-radius: 5px;
}

.post-insert textarea {
	min-height: 100%;
	max-height: 100%;
	min-width: 100%;
	max-width: 100%;
}

.board-box:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}

.board-postList:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<form action="<c:url value="/post/update"/>" method="post">
		<input type="hidden" name="num" value="${post.po_num}"> <input
			type="hidden" name="bNum" value="${bNum}"> <input
			type="hidden" name="bNum" value="${bName}">
		<div class="body-group">
			<div class="board-box">
				<h2>
					<a href="<c:url value="/post/list"/>?bNum=${bNum}">${bName}</a>
				</h2>
			</div>
			<br> <input type="hidden" name="bNum" value="${bNum}"> <input
				type="hidden" name="bName" value="${bName}">
			<div class="board-postList">
				<table>
					<div class="post-insert">
						<h2>게시글 수정</h2>
						<label for="title">제목</label> <input type="text" id="title"
							name="title" class="title" value="${post.po_title}">
					</div>
					<div class="post-insert">
						<label for="writer">아이디</label> <input type="text" id="writer"
							name="writer" class="title" value="${user.me_id}" readonly>
					</div>
					<div class="post-insert">
						<label for="name">작성자</label> <input type="text" id="name"
							name="name" class="title" value="${user.me_name}" readonly>
					</div>
					<div class="post-insert">
						<label for="content">내용</label>
						<textarea rows="15" id="content" name="content" class="content">${post.po_content}</textarea>
					</div>
					<button type="submit">글 수정</button>

				</table>
			</div>
	</form>
	</div>
	<script>
		function toggleCategory() {
			var category = document.getElementById("category");
			category.classList.toggle("open");
		}

		// 카테고리 토글 버튼 요소 가져오기
		var categoryToggle = document.querySelector('.category-toggle');

		// 카테고리 토글 버튼에 클릭 이벤트 리스너 추가
		categoryToggle.addEventListener('click', function() {
			// 클릭 시 clicked 클래스를 토글하여 스타일 변경
			this.classList.toggle('clicked');
		});

		var recentPosts = document.querySelector('.recent-posts');

		var rightBox = document.querySelector('.right-box');

		var closeButton = document.querySelector('.close-button');

		var isHidden = true;

		closeButton.addEventListener('click', function () {
            rightBox.style.transition = 'right 0.3s ease';
            rightBox.style.right = isHidden ? '0' : '-300px';
            this.classList.toggle('click');
            isHidden = !isHidden;
        });
	</script>
</body>
</html>