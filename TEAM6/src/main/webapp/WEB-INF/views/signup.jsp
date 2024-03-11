<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
        <a href="<c:url value="/login"/>">로그인</a>
    </div>
    <div class="signup-group">
        <h2>회원가입</h2>
        <form name="join_form" id="join_form" method="post" action="<c:url value="/signup"/>">
            <div class="signup">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">
            </div>
            <div class="signup">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
            </div>
            <div class="signup">
                <label for="pw2">비밀번호 확인</label>
                <input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인">
            </div>
            <div class="signup">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
            </div>
            <div class="signup">
                <label for="birth">생년월일(주민등록 앞 6자리)</label>
                <input type="text" id="birth" name="birth" placeholder="생년월일을 입력하세요">
            </div>
            <div class="signup">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
            </div>
            <div class="signup">
                <label for="phone">핸드폰 번호("-"제외한 번호)</label>
                <input type="number" id="phone" name="phone" placeholder="핸드폰 번호를 입력하세요">
            </div>
            <div class="signup">
                <label for="address">주소(양식 : OO시 OO구 OO동)</label>
                <input type="text" id="address" name="address" placeholder="주소를 입력하세요">
            </div>
            <button type="submit">회원가입</button>
        </form>
    </div>

    <div class="copyright">
        <p>© 2024 정경호. All rights reserved. | 광고 문의 010-4407-1418 | 이메일 : wkdrn002@naver.com | TEAM6</p>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            jQuery.validator.addMethod("pwcheck", function (value, element) {
                return this.optional(element) || $('#pw').val() === $('#pw2').val();
            }, "비밀번호가 일치하지 않습니다.");

            $("#join_form").validate({
                rules: {
                    name: "required",
                    id: "required",
                    pw: {
                        required: true,
                        minlength: 5
                    },
                    pw2: {
                        required: true,
                        minlength: 5,
                        pwcheck: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: "required",
                    address: "required"
                },
                messages: {
                    name: "이름을 입력하세요",
                    id: "아이디를 입력하세요",
                    pw: {
                        required: "비밀번호를 입력하세요",
                        minlength: "영문 대·소문자, 숫자, 특수기호(!@#$) 8~14자만 사용가능합니다."
                    },
                    pw2: {
                        required: "비밀번호 확인을 입력하세요",
                        minlength: "영문 대·소문자, 숫자, 특수기호(!@#$) 8~14자만 사용가능합니다.",
                        pwcheck: "비밀번호가 일치하지 않습니다"
                    },
                    email: {
                        required: "이메일 주소를 입력하세요",
                        email: "유효한 이메일 주소를 입력하세요"
                    },
                    phone: "핸드폰 번호를 입력하세요",
                    address: "주소를 입력하세요"
                },
                errorElement: "div",
                errorClass: "error-message",
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass("error-border shake");
                    $(`label[for=${element.id}]`).addClass("error-text");
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass("error-border shake");
                    $(`label[for=${element.id}]`).removeClass("error-text");
                },
                errorPlacement: function(error, element) {
                    error.insertAfter(element);
                },
                submitHandler: function(form) {
                    if (confirm('가입하시겠습니까?')) {
                        form.submit();
                    } else {
                        // 아무것도 실행 안함
                    }
                }
            });
        });

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