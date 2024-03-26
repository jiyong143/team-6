<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>What do you want to ask? - 관리자 페이지(커뮤니티 관리)</title>
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
	text-decoration: none;
	font-size: 36px;
}

.login {
	position: fixed;
	top: 20px;
	right: 20px;
}

.login a {
	color: inherit;
	text-decoration: none;
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

.board-postList td:nth-child(1), .board-postList th:nth-child(1) {
	width: 5%;
	text-align: center;
}

.board-postList td:nth-child(2), .board-postList th:nth-child(2) {
	text-align: center;
	width: 30%;
}

.board-postList td:nth-child(3), .board-postList th:nth-child(3) {
	text-align: center;
	width: 10%;
}

.board-postList td:nth-child(4), .board-postList th:nth-child(4) {
	width: 15%;
	text-align: center;
}

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
	min-height: 450px;
	max-height: 450px;
	width: 45%;
}

table tr td {
	width: 35%;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.lbox:hover, .rbox:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}

.date {
	color: rgba(141, 102, 18, 1);
	font-size: 25px;
	margin-bottom: 40px;
	margin-top: 90px;
	text-align: center;
}

.time {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
	color: rgba(141, 102, 18, 1);
}
</style>

</head>

<body>
	<div class="body-group">
		<form action=<c:url value="/admin/manger"/>>
			<div>
				<!-- lbox 묶음 -->
				<div class="lbox-group">
					<div class="lbox" style="width: 42%;">
						<table>
							<thead>
								<h2>카테고리 리스트</h2>
								<h3>전체 카테고리 수 : ${categoryCount}</h3>
								<tr>
									<th>번호</th>
									<th>카테고리</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${caList}" var="category">
									<tr>
										<td>${category.ca_num}</td>
										<td class="text-short">${category.ca_title}</td>
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
								<h3>전체 게시판 수 : ${boardCount}</h3>
								<tr>
									<th>번호</th>
									<th>게시판</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="board">
									<tr>
										<td>${board.bo_num }</td>
										<td class="text-short">${board.bo_title}</td>
									</tr>
								</c:forEach>
								<a href="<c:url value="/board/list"/>" class="write-button">게시판관리</a>
							</tbody>
						</table>
					</div>
					<div class="lbox" style="width: 50%">
						<table>
							<thead>
								<h2>댓글 리스트</h2>
								<h3>전체 댓글 수 : ${commentCount}</h3>
								<tr>
									<th>번호</th>
									<th>내용</th>
									<th>작성자</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${commentList}" var="comment">
									<tr>
										<td>${comment.co_num }</td>
										<td class="text-short">${comment.co_content}</td>
										<td>${comment.co_me_id}</td>
									</tr>
								</c:forEach>
								<a href="<c:url value="/admin/comment"/>" class="write-button">댓글관리</a>
							</tbody>
						</table>
					</div>
					<div class="lbox">
						<div class="date" id="date"></div>
						<div class="time" id="time"></div>
					</div>
				</div>
				<!-- lbox묶음 끝 -->

				<!-- rbox 묶음  -->
				<div class="rbox-group">
					<div class="rbox">
						<table>
							<thead>
								<h2>게시글 리스트</h2>
								<h3>전체 게시글수 : ${postCount}</h3>
								<tr>
									<th>번호</th>
									<th>게시글</th>
									<th>작성자</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${postList}" var="post">
									<tr>
										<td>${post.po_num }</td>
										<td class="text-short">${post.po_title}</td>
										<td>${post.po_me_id}</td>
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
								<h3>전체 회원수 : ${memberCount}</h3>
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
		var searchInput = document
				.querySelector('.search-container input[type=text]');
		var categoryToggle = document.querySelector('.category-toggle');
		var rightBox = document.querySelector('.right-box');
		var closeButton = document.querySelector('.close-button');
		var isHidden = true;

		categoryToggle.addEventListener('click', function() {
			this.classList.toggle('clicked');
		});

		closeButton.addEventListener('click', function() {
			rightBox.style.transition = 'right 0.3s ease';
			rightBox.style.right = isHidden ? '0' : '-300px';
			this.classList.toggle('click');
			isHidden = !isHidden;
		});
	</script>



	<script type="text/javascript">
		function setClock() {
			var dateInfo = new Date();
			var hour = modifyNumber(dateInfo.getHours());
			var min = modifyNumber(dateInfo.getMinutes());
			var sec = modifyNumber(dateInfo.getSeconds());
			var year = dateInfo.getFullYear();
			var month = dateInfo.getMonth() + 1; //monthIndex를 반환해주기 때문에 1을 더해준다.
			var date = dateInfo.getDate();
			document.getElementById("time").innerHTML = hour + ":" + min + ":"
					+ sec;
			document.getElementById("date").innerHTML = year + "년 " + month
					+ "월 " + date + "일";
		}
		function modifyNumber(time) {
			if (parseInt(time) < 10) {
				return "0" + time;
			} else
				return time;
		}
		window.onload = function() {
			setClock();
			setInterval(setClock, 1000); //1초마다 setClock 함수 실행
		}
	</script>

</body>
</html>