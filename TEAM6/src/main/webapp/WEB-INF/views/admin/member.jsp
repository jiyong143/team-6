<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>What do you want to ask? - ȸ�� ����</title>

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
	/* ��ӵ� �ؽ�Ʈ ���� ��� */
	text-decoration: none;
	/* ���� ���� */
	font-size: 36px;
	/* �ΰ� �ؽ�Ʈ ũ�� �ø��� */
}

.login {
	position: fixed;
	top: 20px;
	right: 20px;
}

.login a {
	color: inherit;
	/* �⺻ �ؽ�Ʈ ������ ���� */
	text-decoration: none;
	/* ���� ���� */
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

/* ��ȣ �� ��Ÿ�� */
.board-postList td:nth-child(1), .board-postList th:nth-child(1) {
	width: 5%;
	text-align: center;
}

/* �Խñ� �� �� ��Ÿ�� */
.board-postList td:nth-child(2), .board-postList th:nth-child(2) {
	text-align: center;
	width: 30%;
}

/* �ۼ��� �� ��Ÿ�� */
.board-postList td:nth-child(3), .board-postList th:nth-child(3) {
	text-align: center;
	width: 10%;
}

/* ��¥ �� ��Ÿ�� */
.board-postList td:nth-child(4), .board-postList th:nth-child(4) {
	width: 15%;
	text-align: center;
}

/* ��ȸ�� �� ��Ÿ�� */
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
		<form action="<c:url value="/admin/delete"/>" method="post">
			<div class="board-postList">
				<h2>ȸ�� ����Ʈ</h2>

				<div class="hr"></div>
				<table>
					<thead>
						<tr>
							<th>�̸�</th>
							<th>���̵�</th>
							<th>�������</th>
							<th>����</th>
							<th>����</th>
							<th>��Ÿ</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="member">
							<tr>
								<td>${member.me_name }</td>
								<td>${member.me_id}</td>
								<td>${member.me_birth}</td>
								<td>${member.me_authority}</td>
								<td>${member.me_ms_state}</td>
								<td><a style="text-align: center;" class="btn write-button"
									href='<c:url value="/admin/delete?me_id=${member.me_id}"/>'>ȸ��Ż��</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</form>
	</div>
	<script>
		function toggleCategory() {
			var category = document.getElementById("category");
			category.classList.toggle("open");
		}

		// �˻�â ��Ҹ� ������
		var searchInput = document
				.querySelector('.search-container input[type=text]');

		// ī�װ� ��� ��ư ��� ��������
		var categoryToggle = document.querySelector('.category-toggle');

		// ī�װ� ��� ��ư�� Ŭ�� �̺�Ʈ ������ �߰�
		categoryToggle.addEventListener('click', function() {
			// Ŭ�� �� clicked Ŭ������ ����Ͽ� ��Ÿ�� ����
			this.classList.toggle('clicked');
		});

		// �˻�â ��� ��������
		var searchContainer = document.querySelector('.search-container');

		// �ֱ� �Խñ� ����Ʈ ��� ��������
		var recentPosts = document.querySelector('.recent-posts');

		// �˻�â�� ���콺�� �ø��� �ֱ� �Խñ� ����Ʈ�� ǥ��
		/*searchContainer.addEventListener('mouseenter', function() {
			recentPosts.style.display = 'block';
		}); */

		// �ֱ� �Խñ� ����Ʈ���� ���콺�� ����� ����
		/*	recentPosts.addEventListener('mouseleave', function() {
				recentPosts.style.display = 'none';
			});  */

		var rightBox = document.querySelector('.right-box');

		// ������ �ڽ� ��������
		var rightBox = document.querySelector('.right-box');

		// �ݱ� ��ư ��������
		var closeButton = document.querySelector('.close-button');

		// ������ �ڽ��� ������ �ִ��� ���θ� �����ϴ� ����
		var isHidden = true;

		// ��ư Ŭ�� �̺�Ʈ�� �Լ� ����
		closeButton.addEventListener('click', function() {
			// ������ �ڽ��� ������ �ִٸ�
			if (isHidden) {
				// ���������� �̵��Ͽ� ���̴� �ִϸ��̼� ȿ�� �߰�
				rightBox.style.transition = 'right 0.3s ease';
				// ���������� �̵��Ͽ� ����
				rightBox.style.right = '0';
			} else {
				// ���������� �̵��Ͽ� ������� �ִϸ��̼� ȿ�� �߰�
				rightBox.style.transition = 'right 0.3s ease';
				// ���������� �̵��Ͽ� �����
				rightBox.style.right = '-300px'; // ������ �ڽ��� �ʺ�ŭ �̵�
			}

			// ������ �ִ� ���¿����� ���̴� ���·�, ���̴� ���¿����� ������ �ִ� ���·�
			isHidden = !isHidden;
		});

		const categoryItems = document.querySelectorAll('.category li');
	</script>

</body>
</html>