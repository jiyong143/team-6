<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>What do you want to ask?</title>
    <style>
        h1 {
            margin-top: 10%;
            text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
            /* 그림자 추가 */
        }

        header,
        nav,
        body {
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
            position: relative;
        }

        .category {
            position: absolute;
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
            position: absolute;
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

        .login {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .login a {
            color: inherit;
            /* 기본 텍스트 색으로 설정 */
            text-decoration: none;
            /* 밑줄 제거 */
        }

        .search-container {
            border: 1px solid black;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            align-items: center;
            /* 세로 가운데 정렬 */
            border-radius: 30px;
            overflow: hidden;


        }

        .search-container input[type=text] {
            padding: 15px;
            border: none;
            width: 400px;
            /* 검색창 너비 조정 */
            box-sizing: border-box;
            font-size: 26px;
            /* 검색창 폰트 크기 조정 */
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            display: inline;
            outline: none;



        }

        .search-container button {
            padding: 20px 25px;
            background-color: white;
            color: #fff;
            border: none;
            border-radius: 0 30px 30px 0;
            cursor: pointer;
            font-size: 18px;
            background-image: url('data:image/png;base64,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');
            background-size: contain;
            /* 배경 이미지 크기 조절 */
            background-repeat: no-repeat;
            /* 배경 이미지 반복 제거 */
            background-position: center;
            /* 배경 이미지 위치 조절 */


        }

        .copyright {
            text-align: center;
            margin-top: 20px;
            position: absolute;
            bottom: 20px;
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

        /* 추가된 스타일 */
        .recent-posts {
            width: calc(20% + 50px);
            position: absolute;
            top: calc(50% + 50px);
            /* 검색창 밑에 보이기 */
            left: 50%;
            transform: translateX(-50%);
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            max-height: 300px;
            /* 최대 높이 지정 */
            z-index: 1;
            /* 다른 요소 위에 표시되도록 설정 */
            overflow-y: auto;
            /* 스크롤바 추가 */
            padding: 10px;
            display: none;
            /* 초기에는 숨김 */
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

        .right-box {
            position: fixed;
            /* 화면에 고정 */
            top: 20%;
            right: 0;
            /* 화면 오른쪽에서 20px 떨어진 위치 */
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

        .right-box-container {
            position: relative;
            /* 오른쪽 박스와 버튼의 상대적인 위치 설정 */
        }

        .right-box {
            position: fixed;
            /* 화면에 고정 */
            top: 20%;
            right: 0;
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
            position: absolute;
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

      
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1><a href="<c:url value="/"/>">What do you want to ask?</a></h1>
        </div>
    </header>
    <nav class="category-container">
        <div class="category-toggle" onclick="toggleCategory()"><span></span><span></span><span></span></div>
        <div class="category" id="category">
            <ul>
                <li>카테고리 1</li>
                <li>카테고리 2</li>
                <li>카테고리 3</li>
                <li>카테고리 4</li>
                <li>카테고리 5</li>
                <li>카테고리 6</li>
                <li>카테고리 7</li>
            </ul>
        </div>
    </nav>
    <button class="close-button">
        <img src="data:image/png;base64,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"
            alt="버튼이미지">
    </button>
    <div class="right-box">
        <c:if test="${user ne null}">
			<div class="card">
			    <div class="card-body">
			        <h4 class="card-title">내 정보</h4>
			        <p class="card-text">아이디 : ${user.me_id}</p>
			        <p class="card-text">닉네임 : ${user.me_name}</p>
			        <p class="card-text">
			        <c:choose>
			            <c:when test='${user.me_authority eq "admin" }'>권한 : 관리자</c:when>
			            <c:otherwise>권한 : 회원 (${user.me_ms_state})</c:otherwise>
			        </c:choose>
			        </p>
			        <a href="<c:url value="/member/update"/>" class="card-link">개인 정보 수정</a>
			        <a href="<c:url value="/logout"/>" class="card-link">로그아웃</a>
			    </div>
			</div>
        </c:if>
    </div>

    <div class="login">
            <a href="<c:url value="/login"/>">로그인</a> | <a href="<c:url value="/signup"/>">회원가입</a>
    </div>
    
    <div class="copyright">
        <p>© 2024 정경호. All rights reserved. | 광고 문의 010-4407-1418 | 이메일 : wkdrn002@naver.com | TEAM6</p>
    </div>
     
    <script>
        function toggleCategory() {
            var category = document.getElementById("category");
            category.classList.toggle("open");
        }
        

        // 검색창 요소를 가져옴
        var searchInput = document.querySelector('.search-container input[type=text]');

        // 카테고리 토글 버튼 요소 가져오기
        var categoryToggle = document.querySelector('.category-toggle');

        // 카테고리 토글 버튼에 클릭 이벤트 리스너 추가
        categoryToggle.addEventListener('click', function () {
            // 클릭 시 clicked 클래스를 토글하여 스타일 변경
            this.classList.toggle('clicked');
        });

        // 검색창 요소 가져오기
        var searchContainer = document.querySelector('.search-container');
        // 최근 게시글 리스트 요소 가져오기
        var recentPosts = document.querySelector('.recent-posts');

        // 검색창에 마우스를 올리면 최근 게시글 리스트를 표시
        searchContainer.addEventListener('mouseenter', function () {
            recentPosts.style.display = 'block';
        });

        // 최근 게시글 리스트에서 마우스가 벗어나면 숨김
        recentPosts.addEventListener('mouseleave', function () {
            recentPosts.style.display = 'none';
        });

        var rightBox = document.querySelector('.right-box');

        // 닫기 버튼 가져오기
        var closeButton = document.querySelector('.close-button');

        // 오른쪽 박스 가져오기
        var rightBox = document.querySelector('.right-box');

        // 오른쪽 박스가 숨겨져 있는지 여부를 저장하는 변수
        var isHidden = true;

        // 버튼 클릭 이벤트에 함수 연결
        closeButton.addEventListener('click', function () {
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

        categoryItems.forEach(item => {
            item.addEventListener('mouseenter', () => {
                categoryItems.forEach(item => {
                    item.style.backgroundColor = ''; // 모든 요소의 배경색 초기화
                });
                item.style.backgroundColor = 'green'; // 현재 요소만 빨간색으로 변경
            });
        });
    </script>
</body>
</html>