<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
     <h1>게시글 상세</h1>
     <div>
       <div class="mb-3 mt-3">
			<label for="title" class="form-label">제목:</label>
			<input type="text" class="form-control" id="title" name="title" readonly value="${post.po_title }">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="id" class="form-label">작성자 아이디:</label>
			<input type="text" class="form-control" id="id" name="id"  readonly value="${post.po_me_id }">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="name" class="form-label">작성자 닉네임:</label>
			<input type="text" class="form-control" id="name" name="name"  readonly value="${name}">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="date" class="form-label">작성일자:</label>
			<input type="text" class="form-control" id="date" name="date" readonly value="${post.changeDate()}">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="view" class="form-label">조회수:</label>
			<input type="text" class="form-control" id="view" name="view" readonly value="${post.po_views }">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="content" class="form-label">내용:</label>
			<textarea rows="10"  class="form-control" id="content" name="content" readonly >${post.po_content }</textarea>
	   </div>
	   <a href = "<c:url value="/post/list"/>" class="btn btn-outline-dark">목록으로</a>
	   <c:if test="${post.po_me_id == user.me_id}"> <!-- 내가 작성한 게시글일 때만 삭제 버튼과 수정 버튼이 생기도록 -->
	      <a href="<c:url value="/post/update?num=${post.po_num}"/>" class="btn btn-outline-success">게시글 수정</a>
	      <a href = "<c:url value="/post/delete?num=${post.po_num}"/>" class= "btn btn-outline-danger">게시글 삭제</a>
	   </c:if>
	   <a href = "<c:url value="/comment/insert?num=${num}"/>" class= "btn btn-outline-danger">댓글 작성</a>
     </div>
     <!-- 댓글 시작 -->
     <br>
     <h4>댓글</h4>
     <br>
     <table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>작성자 아이디</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
            <c:forEach items="${comments}" var="comment">
				<tr>
					<td>${comment.co_num}</td>
					<td>${comment.co_content}</td>
					<td>${comment.co_me_id}</td>
					<td>
					<c:if test="${user.me_id==comment.co_me_id}">
			             <a href = "<c:url value="/comment/delete?cNum=${comment.co_num}"/>" class= "btn btn-outline-danger">댓글 삭제</a>
			             <a href = "<c:url value="/comment/update?cNum=${comment.co_num}"/>" class= "btn btn-outline-danger">댓글 수정</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${comments.size() == 0 }">
				<tr>
					<th colspan="3">
						<h4 class="text-center">등록된 댓글이 없습니다.</h4>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
</body>
</html>