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
<!-- jquery validation -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<h1>Sign up</h1>
	<form action="<c:url value="/signup"/>" method="post">
		<div class="mb-3 mt-3">
			<label for="id" class="form-label">아이디(영문,숫자 조합 최소6자~최대8자):</label>
			<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
		</div>
		<div class="mb-3 mt-3">
			<label for="pw" class="form-label">비번(특수문자(!@#$)와 영어,숫자 조합 최소8자~최대 14자) :</label>
			<input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
		</div>
		<div class="mb-3 mt-3">
			<label for="pw2" class="form-label">비번확인:</label>
			<input type="password" class="form-control" id="pw2" placeholder="Enter pw2" name="pw2">
		</div>
		<div class="mb-3 mt-3">
			<label for="birth" class="form-label">생년월일(주민등록 앞 6자리):</label>
			<input type="text" class="form-control" id="birth" placeholder="Enter birth" name="birth">
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">닉네임(최대 5글자):</label>
			<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		</div>
		<div class="mb-3 mt-3">
			<label for="phone" class="form-label">전화번호("-"제외한 번호 형식):</label>
			<input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">이메일(이메일 형식):</label>
			<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		</div>
		<div class="mb-3 mt-3">
			<label for="address" class="form-label">주소(양식 : OO시 OO구 OO동):</label>
			<input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">Sign up</button>
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
</script>

</body>
</html>