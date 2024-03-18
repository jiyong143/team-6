<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page="/WEB-INF/views/header.jsp" />
<style type="text/css">
.select-box {
	padding: 10px;
	background-color: white;
	border: 1px solid white;
}

.body-group {
	padding: 100px;
	margin-left: 150px;
	margin-right: 150px;
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
	position: fixed;
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

/* 번호 셀 스타일 */
.board-postList td:nth-child(1), .board-postList th:nth-child(1) {
	width: 5%;
	text-align: center;
}

/* 게시글 명 셀 스타일 */
.board-postList td:nth-child(2), .board-postList th:nth-child(2) {
	text-align: center;
	width: 30%;
}

/* 작성자 셀 스타일 */
.board-postList td:nth-child(3), .board-postList th:nth-child(3) {
	text-align: center;
	width: 10%;
}

/* 날짜 셀 스타일 */
.board-postList td:nth-child(4), .board-postList th:nth-child(4) {
	width: 15%;
	text-align: center;
}

/* 조회수 셀 스타일 */
.board-postList td:nth-child(5), .board-postList th:nth-child(5) {
	width: 10%;
	text-align: center;
}

.board-postList th, .board-postList td {
	padding: 8px;
	border: 1px solid rgb(167, 159, 133);
}

.board-postList {
	border-radius: 10px;
	height: calc(100% - 50px);
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

.copyright {
	background-color: #ffffff;
	text-align: center;
	margin-top: 20px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.board-postList button {
	padding: 5px;
	background-color: rgba(141, 102, 18, 0.5);
	float: right;
	width: 100px;
	height: 50%;
	margin-right: 10px;
	border-radius: 5px;
}

.pagination {
	display: flex;
	list-style: none;
	padding: 0;
	justify-content: center;
}

.pagination li {
	margin: 0 5px;
}

.pagination li.active {
	font-weight: bold;
}

.pagination a, .pagination span {
	padding: 8px 12px;
	border: 1px solid #ccc;
	color: #333;
	text-decoration: none;
	border-radius: 5px;
}

.pagination a:hover {
	background-color: #f0f0f0;
}

.write-button {
	float: right;
	padding: 8px 16px;
	background-color: rgba(141, 102, 18, 0.6);
	color: black;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
}

.write-button:hover {
	background-color: rgba(141, 102, 18, 1);
}

h2, h3 {
	text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
}
/* 리스트 박스 스타일 */
.lbox-group, .rbox-group {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.lbox, .rbox {
	background-color: #fff;
	border-radius: 8px;
	padding: 20px;
	transition: box-shadow 0.3s ease;
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 0.1);
	white-space: nowrap;
	max-height: 370px;
	text-overflow: ellipsis;
	overflow: hidden;  
}

/* 호버 효과와 그림자 효과 */
.lbox:hover, .rbox:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}
</style>

</head>

<body>
	<div class="body-group">
		<form action=<c:url value="/admin/manger"/>>
			<div>
				<!-- lbox 묶음 -->
				<div class="lbox-group">
					<div class="lbox">
						<table>
							<thead>
								<h2>카테고리 리스트</h2>
								<tr>
									<th colspan="2">번호</th>
									<th colspan="2">카테고리</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categoryList}" var="category">
									<tr>
										<td colspan="2">${category.ca_num}</td>
										<td colspan="2">${category.ca_title}</td>
										<td></td>

									</tr>
								</c:forEach>
								<a href="<c:url value="/category/list"/>" class="write-button">카테고리
									관리</a>
							</tbody>
						</table>
					</div>
					<div class="lbox">
						<table>
							<thead>
								<h2>게시판 리스트</h2>
								<tr>
									<th>번호</th>
									<th>게시판</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="board">
									<tr>
										<td>${board.bo_num }</td>
										<td>${board.bo_title}</td>
									</tr>
								</c:forEach>
								<a href="<c:url value="/board/list"/>" class="write-button">게시판관리</a>
							</tbody>
						</table>
					</div>
				</div>
				<!-- lbox묶음 끝 -->

				<!-- rbox 묶음  -->
				<div class="rbox-group">
					<div class="rbox">
						<table>
							<thead>
								<h2>게시글 리스트</h2>
								<tr>
									<th colspan="2">번호</th>
									<th colspan="2">게시글</th>
									<th colspan="2">작성자</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${postList}" var="post">
									<tr>
										<td colspan="2">${post.po_num }</td>
										<td colspan="2">${post.po_title}</td>
										<td colspan="2">${post.po_me_id}</td>
									</tr>
								</c:forEach>
								<a href="<c:url value="/admin/post"/>" class="write-button">게시글
									관리</a>
							</tbody>
						</table>
					</div>
					<div class="rbox">
						<table>
							<thead>
								<h2>회원 리스트</h2>
								<h3>전체회원수 : ${memberCount}</h3>
								<tr>
									<th colspan="2">아이디</th>
									<th colspan="2">이름</th>
									<th colspan="2">생년월일</th>
									<th colspan="2">권한</th>
									<th colspan="2">상태</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memberList}" var="member">
									<tr>
										<td colspan="2">${member.me_id }</td>
										<td colspan="2">${member.me_name }</td>
										<td colspan="2">${member.me_birth}</td>
										<td colspan="2">${member.me_authority}</td>
										<td colspan="2">${member.me_ms_state}</td>
									</tr>
								</c:forEach>
								<a href="<c:url value="/admin/member"/>" class="write-button">회원
									관리</a>
							</tbody>
						</table>
					</div>
				</div>
				<!-- rbox 묶음 끝 -->
			</div>
		</form>
	</div>
	<script>
		function toggleCategory() {
			var category = document.getElementById("category");
			category.classList.toggle("open");
		}

		// 검색창 요소를 가져옴
		var searchInput = document
				.querySelector('.search-container input[type=text]');

		// 카테고리 토글 버튼 요소 가져오기
		var categoryToggle = document.querySelector('.category-toggle');

		// 카테고리 토글 버튼에 클릭 이벤트 리스너 추가
		categoryToggle.addEventListener('click', function() {
			// 클릭 시 clicked 클래스를 토글하여 스타일 변경
			this.classList.toggle('clicked');
		});

		/*      // 검색창 요소 가져오기
		     var searchContainer = document.querySelector('.search-container');

		     // 최근 게시글 리스트 요소 가져오기
		     var recentPosts = document.querySelector('.recent-posts');

		     // 검색창에 마우스를 올리면 최근 게시글 리스트를 표시
		     searchContainer.addEventListener('mouseenter', function() {
		        recentPosts.style.display = 'block';
		     }); */

		/*    // 최근 게시글 리스트에서 마우스가 벗어나면 숨김
		   recentPosts.addEventListener('mouseleave', function() {
		      recentPosts.style.display = 'none';
		   }); */

		var rightBox = document.querySelector('.right-box');

		// 오른쪽 박스 가져오기
		var rightBox = document.querySelector('.right-box');

		// 닫기 버튼 가져오기
		var closeButton = document.querySelector('.close-button');

		// 오른쪽 박스가 숨겨져 있는지 여부를 저장하는 변수
		var isHidden = true;

		// 버튼 클릭 이벤트에 함수 연결
		closeButton.addEventListener('click', function() {
			// 오른쪽 박스가 숨겨져 있다면
			if (isHidden) {
				// 오른쪽으로 이동하여 보이는 애니메이션 효과 추가
				rightBox.style.transition = 'right 0.3s ease';
				// 오른쪽으로 이동하여 보임
				rightBox.style.right = '0';
			} else {
				// 오른쪽으로 이동하여 사라지는 애니메이션 효과 추가
				rightBox.style.transition = 'right 0.3s ease';
				// 오른쪽으로 이동하여 사라짐
				rightBox.style.right = '-300px'; // 오른쪽 박스의 너비만큼 이동
			}

			// 숨겨져 있는 상태에서는 보이는 상태로, 보이는 상태에서는 숨겨져 있는 상태로
			isHidden = !isHidden;
		});

		const categoryItems = document.querySelectorAll('.category li');
	</script>


</body>
</html>