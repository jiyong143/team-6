<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국민의 힘!</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
<form class="d-flex" action="<c:url value="/post/detail"/>">
	<input class="form-control me-5" type="text"  value="${pm.cri.search}" placeholder="What do you want to ask?">
	<button class="btn btn-primary" type="submit">search</button>
</form>

<body>
	<div class="logo">
		<h1>
			<a href="<c:url value="/"/>">국민의 힘</a>
		</h1>
	</div>
	<nav class="category-container">
		<div class="category-toggle" onclick="toggleCategory()">
			<span></span><span></span><span></span>
		</div>
		<div class="category" id="category">
			<h3>
				<hr>
				<span>${category.ca_title}</span>
			</h3>
				<hr>
			<ul>
				<li><a href="<c:url value="/post/list"/>">게시판</a></li>
			</ul>
		</div>
	</nav>


	<button class="close-button">
		<img
			src="data:image/png;base64,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"
			alt="버튼이미지">
	</button>
	<div class="right-box">
			<c:if test="${user == null }">
			<h2>환영합니다!</h2>
			<h3>로그인을 해주세요.</h3>
			</c:if>	
			<c:if test="${user != null }">
				<h2>아이디 : ${user.me_id}</h2>
				<p>이름 : ${user.me_name}</p>
				<p>이메일 : ${user.me_email}</p>
			</c:if>	
			<c:if test="${user != null }">
				<c:choose>
					<c:when test='${user.me_authority eq "admin"}'>권한 : 관리자</c:when>
					<c:otherwise>권한 : 회원 (${user.me_ms_state})</c:otherwise>
		 		</c:choose>
			</c:if>	
		 		<br>
		 		<br>
	 		<c:if test='${user != null && user.me_authority ne "admin" }'>
					<a href="<c:url value="/내정보 url"/>">내정보 관리</a>
			</c:if>
	 		<c:if test='${admin != null && user.me_authority eq "admin" }'>
					<a href="<c:url value="/관리자 url"/>">관리자 페이지</a>
			</c:if>
			<c:if test="${user != null }">
					<a href="<c:url value="/logout"/>">로그아웃</a>
			</c:if>
	</div>

	<div class="login">
		<c:if test="${user == null }">
			<a href="<c:url value="/login"/>">로그인</a> | <a href='/<c:url value="/signup"/>'>회원가입</a>
		</c:if>
	</div>
	<form action="<c:url value="/post/list"/>">
		<div class="search-container">
			<input type="text" placeholder="검색..."name="search" value="${pm.cri.search}" >
			<input type="hidden" name="search" value="po_title">
			<button type="submit"></button>
		</div>
	</form>
	<div class="recent-posts">
		<c:if test="${post == null }">
			<h2>게시글이 없습니다</h2>
		</c:if>
		<c:if test="${post != null }">
			<h2>최근 게시글</h2>
		<ul>
			<li><a href="${url}">${post.po_title}</a></li>
		</ul>
		</c:if>
	</div>
	<!-- 저작권 -->
	<div class="copyright">
		<p>© 2024 정경호. All rights reserved. | 광고 문의 010-4407-1418 | 이메일 :
			wkdrn002@naver.com | TEAM6</p>
	</div>

	<!-- 왼쪽,오른쪽 박스 / 검색창 / 검색창 호버시 게시글 나옴 -->
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

		// 검색창 요소 가져오기
		var searchContainer = document.querySelector('.search-container');

		// 최근 게시글 리스트 요소 가져오기
		var recentPosts = document.querySelector('.recent-posts');

		// 검색창에 마우스를 올리면 최근 게시글 리스트를 표시
		searchContainer.addEventListener('mouseenter', function() {
			recentPosts.style.display = 'block';
		});

		// 최근 게시글 리스트에서 마우스가 벗어나면 숨김
		recentPosts.addEventListener('mouseleave', function() {
			recentPosts.style.display = 'none';
		});

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