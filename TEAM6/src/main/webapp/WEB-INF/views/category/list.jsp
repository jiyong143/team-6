<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
		<h1>카테고리 리스트</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2">번호</th>
					<th colspan="2">카테고리</th>
					<th colspan="6">기타</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="category">
					<tr>
						<td colspan="2">${category.ca_num}</td>
						<td colspan="2">${category.ca_title}</td>
						<td><a
							href="<c:url value="/category/delete?num=${category.ca_num}"/>"
							class="btn btn-outline-danger">삭제</a></td>
						<td><a
							href="<c:url value="/category/update?num=${category.ca_num}"/>">
								<button class="btn btn-outline-warning">수정</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="<c:url value="/category/insert"/>"
			class="btn btn-outline-danger">카테고리 추가</a>
	</div>
	
</body>
</html>