<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
h1 {
	margin-top: 10%;
	text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
	/* 그림자 추가 */
}

header, nav, body {
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

.signup-group {
	background-color: #ffffff;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	max-width: 1000px;
	margin: 0 auto 100px;
}

.sign {
	display: block;
	text-align: left;
	margin-bottom: 20px;
}

.sign label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.sign input[type="text"], .sign input[type="password"], .sign input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.signup-group button {
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

.signup-group button:hover {
	background-color: rgb(191, 150, 75);
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="signup-group">
	<h1>회원가입</h1>
	<form action="<c:url value="/signup"/>" method="post">
		<div class="sign">
			<label for="id" class="form-label">아이디(영문,숫자 조합 최소6자~최대8자)</label>
			<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
		</div>
		<div class="sign">
			<label for="pw" class="form-label">비번(특수문자(!@#$)와 영어,숫자 조합 최소8자~최대 14자)</label>
			<input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
		</div>
		<div class="sign">
			<label for="pw2" class="form-label">비번확인</label>
			<input type="password" class="form-control" id="pw2" placeholder="Enter pw2" name="pw2">
		</div>
		<div class="sign">
			<label for="birth" class="form-label">생년월일(주민등록 앞 6자리)</label>
			<input type="text" class="form-control" id="birth" placeholder="Enter birth" name="birth">
		</div>
		<div class="sign">
			<label for="name" class="form-label">닉네임(최대 5글자)</label>
			<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		</div>
		<div class="sign">
			<label for="phone" class="form-label">전화번호("-"제외한 번호 형식)</label>
			<input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
		</div>
		<div class="sign">
			<label for="email" class="form-label">이메일(이메일 형식)</label>
			<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		</div>
		<div class="sign">
			<label for="address" class="form-label">주소(양식 : OO시 OO구 OO동)</label>
			<input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">회원가입</button>
	</form>
</div>

<script type="text/javascript">
$("form").validate({
	//규칙
	rules : {
		id : {
			required : true, //message
			regex : /[a-zA-Z0-9]{6,8}$/ //\w : 영어 대소문자 + 숫자
		},
		pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#$]{8,14}$/
		},
		pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		email : {
			required : true,
			email : true
		},
		birth : {
			required : true,
			regex : /^[0-9]{6}$/
		},
		name : {
			required : true,
			regex : /^[ㄱ-힣]{1,5}$/
		},
		phone : {
			required : true,
			regex : /^[0-9]{11}$/
		},
		address : {
			required : true,
			regex : /^([가-힣])+(시) +([가-힣])+(구) +([가-힣])+(동)$/
		}
	},
	//규칙에 대한 메세지
	messages : {
		id : {
			required : "필수 항목입니다.", //message
			regex : "아이디는 숫자, 영문 6~8자 입니다."
		},
		pw : {
			required : "필수 항목입니다.",
			regex : "비번은 숫자, 영문, !@#$ 8~14자 입니다."
		},
		pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		email : {
			required : "필수 항목입니다.",
			email : "@를 붙여주세요."
		},
		birth : {
			required : "필수 항목입니다.",
			regex : "주민번호 앞 6자리를 적어주세요."
		},
		name : {
			required : "필수 항목입니다.",
			regex : "이름은 최대 5자 가능합니다."
		},
		phone : {
			required : "필수 항목입니다.",
			regex : "-제외한 11자리를 적어주세요."
		},
		address : {
			required : "필수 항목입니다.",
			regex : "양식은 OO시 OO구 OO동 입니다."
		}
	}
});

$.validator.addMethod(
	"regex",
	function (value, element, regexp) {
		var re = RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"정규표현식에 맞지 않습니다."
)

function toggleCategory() {
	var category = document.getElementById("category");
	category.classList.toggle("open");
}

var searchInput = document.querySelector('.search-container input[type=text]');

var categoryToggle = document.querySelector('.category-toggle');

categoryToggle.addEventListener('click', function() {
	// 클릭 시 토글
	this.classList.toggle('clicked');
});

var rightBox = document.querySelector('.right-box');
var closeButton = document.querySelector('.close-button');
var isHidden = true;

closeButton.addEventListener('click', function() {
	rightBox.style.transition = 'right 0.3s ease';
	rightBox.style.right = isHidden ? '0' : '-300px';
	isHidden = !isHidden;
});
</script>

</body>
</html>