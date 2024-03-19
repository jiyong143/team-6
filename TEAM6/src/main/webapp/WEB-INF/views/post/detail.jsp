<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<style>
.body-group {
	padding: 100px;
	margin-left: 150px;
	margin-right: 150px;
	padding-bottom: 150px;
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

.board-postList button {
	padding: 5px;
	background-color: rgba(141, 102, 18, 0.5);
	float: right;
	width: 100px;
	height: 50%;
	margin-right: 10px;
	border-radius: 5px;
}

.post-insert .title, .post-insert .content, .comment-insert .comment {
	text-decoration: none;
	width: 100%;
	border: 1px solid rgba(141, 102, 18, 0.5);
	border-radius: 5px;
}

.post-insert .title:focus, .post-insert .content:focus, .comment-insert :focus
	{
	outline: none;
}

.post-insert .title {
	height: 30px;
}

.comment-insert .comment {
	width: 85%;
	height: 100%;
}

.comment-insert button {
	width: 10%;
}

.btn-button {
	justify-content: space-between;
	width: 100%;
	display: flex;
	height: 50px;
}

.btn-button button {
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	height: 100%;
}

.comment-list {
	margin-top: 10px;
	border: 1px solid #ddd;
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
}

.comment-list span {
	box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

.post-insert textarea {
	min-width: 100%;
	max-width: 100%;
	min-height: 250px;
	max-height: 250px;
}

.comment-insert textarea {
	min-width: 85%;
	max-width: 85%;
	min-height: 50px;
	max-height: 50px;
}

.inputinput {
	border: 1px solid white;
	width: 100%;
	height: 300px;
	outline-style: none;
}

.btn {
	padding: 10px;
	background-color: rgba(141, 102, 18, 0.8);
	color: #333;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
	margin-bottom: 50px;
}

.btn:hover {
	background-color: rgba(141, 102, 18, 2);
	color: #fff;
}
.gr {
margin-top: 20px;
}
.input-input {
      white-space: pre-wrap; /* 자동으로 줄 바꿈되도록 설정 */
    border: 1px solid white;
    min-width:1300px;
    max-width:1300px;
    min-height: 400px;
    max-height: 400px;
    outline-style: none;
    vertical-align: top; 
    line-height: normal; /* 줄 간격을 기본값으로 설정 */
    padding: 5px; /* 내부 여백 추가 */
    box-sizing: border-box; /* 내부 여백이 요소의 크기에 포함되도록 설정 */
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 정경호 프론트 코드 -->
	<div class="body-group">
		<div class="board-box">
			<h2>
				<a href="<c:url value="/post/list"/>?bNum=${bNum}">${bName}</a>
			</h2>
		</div>
		<br>
		<form action="<c:url value="/comment/insert"/>" method="post">
			<div class="board-postList">
				<label>
					<h3 style="margin-top: 50px;">제목 : ${post.po_title }</h3>
					<h5 style="text-align: right;">날짜 : ${post.changeDate()}</h5>
					<h5 style="text-align: right;">작성자 : ${post.po_me_id}
						(${name})</h5>
				
				</label>
				<c:if test="${post.po_me_id eq user.me_id }">
					<a href="<c:url value="/post/update?num=${post.po_num}"/>"
						class="btn">게시글 수정</a>
					<a
						href="<c:url value="/post/delete?num=${post.po_num}&bNum=${post.po_bo_num}"/>"
						class="btn">게시글 삭제</a>
				</c:if>

				<div class="hr gr"></div>
					<h5 style="text-align: right;">조회수 : ${post.po_views}</h5>	
				<textarea class="input-input"  readonly="readonly" >${post.po_content}</textarea>
				<div class="comment-insert">
					<label for="content">댓글</label>
					<div class="btn-button">
						<input type="hidden" name="num" value="${post.po_num }"> <input
							type="hidden" name="bNum" value="${bNum}"> <input
							type="hidden" name="bName" value="${bName}">
						<textarea rows="1" id="content" name="content" class="content"
							placeholder="Enter comment"></textarea>
						<button type="submit">등록</button>
					</div>
					<br>
					<div class="hr"></div>
					<div class="comment-list">
						<c:forEach items="${comments}" var="comment">
							<span class="writer">${comment.co_me_id}</span>
							<p class="p">${comment.co_content}</p>
							<div class="hr"></div>
						</c:forEach>
						<c:if test="${comments.size() == 0 }">
							<h4 class="text-center">등록된 댓글이 없습니다.</h4>
						</c:if>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!--  -->


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

		// 최근 게시글 리스트 요소 가져오기
		var recentPosts = document.querySelector('.recent-posts');

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
	</script>
</body>
</html>