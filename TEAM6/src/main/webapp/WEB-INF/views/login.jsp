<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/login"/>" method="post">
	<h1>Log in</h1>
	<div class="mb-3 mt-3">
		<label for="id" class="form-label">ID:</label>
		<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
	</div>
	<div class="mb-3 mt-3">
		<label for="pw" class="form-label">password:</label>
		<input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
	</div>
		<button type="submit" class="btn btn-outline-danger col-12">Log in</button>
	</form>
</div>
</body>
</html>