<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/board/insert" />" method="post" >
		<div class="mb-3 mt-3">
		    <label for="category" class="form-label">카테고리</label>
		    <select class="form-control" id="category" name="category">
		    	<c:forEach items="${list}" var="category">
		    		<option value="${category.ca_num }">${category.ca_title}</option>
		    	</c:forEach>
		    </select>
	  	</div>
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">게시판 명</label>
		    <input type="text" class="form-control" id="title" placeholder="게시판 명을 입력하세요 . . ." name="title">
	  	</div>
	 
	  	<button class="btn btn-outline-warning col-12">게시판 등록</button>
	</form>
</div>
</body>
</html>