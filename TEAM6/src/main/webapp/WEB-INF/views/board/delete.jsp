<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">
		<c:choose>
			<c:when test="${board != null }">
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
								<c:if test="${board.bo_me_id == user.me_id }">
									<td><a
										href="<c:url value="/board/delete?num=${board.bo_num}"/>"
										class="btn btn-outline-danger">삭제</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="<c:url value="/board/insert"/>"
					class="btn btn-outline-danger">게시판 추가</a>
			</c:when>
			<c:otherwise>
				<h1>등록되지 않은 게시판이거나 삭제된 게시판입니다.</h1>
			</c:otherwise>
		</c:choose>
	</div>