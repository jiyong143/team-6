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
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<h1>Sign up</h1>
	<form action="<c:url value="/signup"/>" method="post">
		<div class="mb-3 mt-3">
			<label for="id" class="form-label">아이디:</label>
			<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
		</div>
		<div class="mb-3 mt-3">
			<label for="pw" class="form-label">비번:</label>
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
			<label for="name" class="form-label">이름:</label>
			<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		</div>
		<div class="mb-3 mt-3">
			<label for="phone" class="form-label">전화번호("-"제외한 번호):</label>
			<input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">이메일:</label>
			<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		</div>
		<div class="mb-3 mt-3">
			<label for="address" class="form-label">주소(양식 : OO시 OO구 OO동):</label>
			<input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">Sign up</button>
	</form>
</div>
</body>
</html>