<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <div class="container">
	<form action="<c:url value="/post/update"/>" method="post">
	<input type="hidden" name = "oName" value="${user.me_name}">
	<input type="hidden" name = "oPhone" value="${user.me_phone}">
	<input type="hidden" name = "oEmail" value="${user.me_email}">
		<h1>개인 정보 수정</h1>
		<div class="mb-3 mt-3">
		    <label for="id" class="form-label">아이디 :</label>
		    <input type="text" class="form-control" id="id" name="id" value="${user.me_id}" readonly>
		</div>
		<div class="mb-3 mt-3">
		    <label for="pw" class="form-label">새 비밀번호 :</label>
		    <input type="password" class="form-control" id="pw" name="pw">
		</div>
		<div class="mb-3 mt-3">
		    <label for="pw2" class="form-label">새 비밀번호 재입력 :</label>
		    <input type="password" class="form-control" id="pw2" name="pw2">
		</div>
		<div class="mb-3 mt-3">
		    <label for="birth" class="form-label">생년월일(주민등록 앞 6자리) : </label>
		    <input type="text" class="form-control" id="birth" name="birth" value="${user.me_birth}" readonly>
		</div>
		<div class="mb-3 mt-3">
		    <label for="name" class="form-label">새 닉네임 :</label>
		    <input type="text" class="form-control" id="name" name="name" value="${user.me_name}" placeholder="Enter new nickname">
		</div>
		<div class="mb-3 mt-3">
			<label for="phone" class="form-label">새 전화번호("-"제외한 번호):</label>
			<input type="text" class="form-control" id="phone" placeholder="Enter new phone" name="phone" value="${user.me_phone}">
		</div>
		<div class="mb-3 mt-3">
			<label for="email" class="form-label">새 이메일:</label>
			<input type="email" class="form-control" id="email" placeholder="Enter new  email" name="email" value="${user.me_email}">
		</div>
		<div class="mb-3 mt-3">
			<label for="address" class="form-label">새 주소(양식 : OO시 OO구 OO동):</label>
			<input type="text" class="form-control" id="address" placeholder="Enter new address" name="address" value="${user.me_address}">
		</div>
		<div class="mb-3 mt-3">
		    <label for="authority" class="form-label">권한 : </label>
		    <input type="text" class="form-control" id="authority" name="authority" value="${user.me_authority}" readonly>
		</div>
		<div class="mb-3 mt-3">
		    <label for="state" class="form-label">상태 : </label>
		    <input type="text" class="form-control" id="state" name="state" value="${user.me_ms_state}" readonly>
		</div>
		<button type="submit" class="btn btn-outline-success col-12">Update</button>
	</form>
  </div>
</body>
</html>