<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="container">
		<h1>게시판 리스트</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>게시판</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.bo_num }</td>
						<td>${board.category.ca_title}</td>
						<td><a href="">${board.bo_title}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="<c:url value="/board/insert"/>"
			class="btn btn-outline-danger">게시판 추가</a>
	</div>
</body>
</html>