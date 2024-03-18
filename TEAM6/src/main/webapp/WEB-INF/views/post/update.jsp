<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/post/update"/>" method="post">
		<h1>게시글 수정</h1>
		<input type="hidden" name="num" value="${post.po_num}">
		<input type="hidden" name="bNum" value="${post.po_bo_num}">
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">제목:</label>
		    <input type="text" class="form-control" id="title" name="title" value="${post.po_title}" placeholder="제목을 입력하세요.">
		</div>
		<div class="mb-3 mt-3">
		    <label for="writer" class="form-label">작성자 아이디:</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${user.me_id}" readonly>
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">작성자 닉네임:</label>
			<input type="text" class="form-control" id="name" name="name" value="${user.me_name}" readonly>
	   </div>
		<div class="mb-3 mt-3">
		    <label for="content" class="form-label">내용:</label>
		    <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">${post.po_content}</textarea>
		</div>
	 
		<button type="submit" class="btn btn-outline-success col-12">글 수정</button>
	</form>
</div>
</body>
</html>