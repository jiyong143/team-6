<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            margin: 0 auto 100px;

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

        .login input[type="text"],
        .login input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .login-group button {
            width: 200px;
            padding: 10px;
            border: none;
            background-color: rgba(141, 102, 18, 0.5);
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-group button:hover {
            background-color:
                rgb(191, 150, 75);
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

    <div class="join">
		<a href="<c:url value="/signup"/>">회원가입</a>
    </div>
    <div class="login-group">
        <h2>로그인</h2>
        <form id="loginForm">
            <div class="login">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="login">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요" required>
            </div>
            <button type="submit">로그인</button>
        </form>
    </div>

    <div class="copyright">
        <p>© 2024 정경호. All rights reserved. | 광고 문의 010-4407-1418 | 이메일 : wkdrn002@naver.com | TEAM6</p>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#loginForm').on('submit', function (e) {
                e.preventDefault(); // 폼 기본 제출 방지

                var id = $('#id').val();
                var pw = $('#pw').val();

                if (id == '' || pw == '') {
                    alert('아이디와 비밀번호를 모두 입력하세요.');
                    return false;
                }

                // AJAX
                $.ajax({
                    url: '/login',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        id: id,
                        pw: pw
                    },
                    success: function (response) {
                        // 로그인 성공
                        if (response.success) {
                            alert('로그인 성공');
                            window.location.href = '/home';
                        } else {
                            alert('로그인 실패: ' + response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert('로그인 요청 실패: ' + error);
                    }
                });
            });
        });

        function toggleCategory() {
            var category = document.getElementById("category");
            category.classList.toggle("open");
        }

        var searchInput = document.querySelector('.search-container input[type=text]');

        var categoryToggle = document.querySelector('.category-toggle');

        categoryToggle.addEventListener('click', function () {
            // 클릭 시 토글
            this.classList.toggle('clicked');
        });

        var rightBox = document.querySelector('.right-box');
        var closeButton = document.querySelector('.close-button');
        var isHidden = true; 

        closeButton.addEventListener('click', function () {
            rightBox.style.transition = 'right 0.3s ease';
            rightBox.style.right = isHidden ? '0' : '-300px';
            isHidden = !isHidden;
        });
    </script>
</body>
</html>