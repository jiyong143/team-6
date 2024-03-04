<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value="/"/>">Lost Ark</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<c:if test="${user == null}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/signup"/>">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/login"/>">로그인</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/category"/>">카테고리</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
	<form action="<c:url value="/category" />" method="get">
		<div class="mb-3 mt-3">
		    <label for="category" class="form-label">카테고리 명:</label>
		    <input type="text" class="form-control" id="category" placeholder="카테고리명을 입력하세요...." name="category">
	  	</div>
	  	<button class="btn btn-outline-warning col-12">카테고리 등록</button>
	</form>
</div>
</body>
</html>