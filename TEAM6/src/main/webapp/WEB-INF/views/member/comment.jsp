<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
.search-container {
	margin-bottom: 10px;
}

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

.btn {
	padding: 12px 24px;
	background-color: rgba(141, 102, 18, 0.5);
	color: #333;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: rgba(141, 102, 18, 2);
	color: #fff;
}

.board-postList:hover {
	box-shadow: 0px 0px 20px rgba(141, 102, 18, 1);
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="body-group">
		<br>
		<div class="board-postList">
			<h2>댓글 리스트</h2>
			<div class="hr"></div>
			<table>
				<thead>
					<tr>
						<th>댓글번호</th>
						<th>게시글제목</th>
						<th>댓글내용</th>
						<th>작성자</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${commentList}" var="comment">
						<tr>
							<td>${comment.co_num }</td>
							<td>${comment.post.po_title }</td>
							<td>${comment.co_content}</td>
							<td>${comment.co_me_id}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>