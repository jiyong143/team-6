<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <form action="<c:url value="/comment/insert"/>" method="post">
   <input type="hidden" name=num value="${num}">
   <h1>댓글 등록</h1>
   <div class="mb-3 mt-3">
			<label for="content" class="form-label">댓글</label>
			<textarea rows="10" class="form-control" id="content" placeholder="댓글" name="content" ></textarea>
   </div>
   <br>
		<button type="submit" class="btn btn-outline-success col-12">등록하기</button>
   </form>
</body>
</html>