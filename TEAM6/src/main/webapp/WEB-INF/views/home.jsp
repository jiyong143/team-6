<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
<form class="d-flex mb-3 mt-3" action="<c:url value="/post/list"/>">
	<input class="form-control me-5" type="text" value="${pm.cri.search}" placeholder="What do you want to ask?">
	<button class="btn btn-primary" id="search-btn" type="submit">search</button>
</form>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$("#search-btn").click(function() {
	$.ajax({
		url : '<c:url value="/post/list"/>',
		method : 'get',
		data {
			search,
			list
		},
		success : function(data) {
			alert(1);
		},
		error : function(hrx, status, error) {
			alert(2);
		}
	});
});
	
</script>

<table class="table table-hover">
	<thead>
	  <tr>
	    <th>번호</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>조회수</th>
	  </tr>
	</thead>
	<tbody>
	 <c:forEach items="${list}" var="post">
		<tr>
		  <td>${post.po_num}</td>
		  <td>
		  	<c:url var="url" value="/post/detail">
			<c:param name="num" value="${post.po_num}"/>
		</c:url>
		   	<a href="${url}">${post.po_title}</a>
		  </td>
		  <td>
		  	<c:url var="page" value="/post/list">
		   	<c:param name="type" value="writer"/>
		<c:param name="search" value="${post.po_me_id}"/>
		<c:param name="page" value="1"/>
		  	</c:url>
		  	<a href="${page}">${post.po_me_id}</a>
		  </td>
		  <td>${post.po_views}</td>
		</tr>
	</c:forEach>
	<c:if test="${list.size() == 0}">
		<tr>
			<th colspan="5">
				<h3>등록된 게시글이 없습니다.</h3>
			</th>
		</tr>
	</c:if>
	</tbody>
</table>
<ul class="pagination justify-content-center">
	<c:if test="${pm.prev}">
		<li class="page-item">
			<c:url var="prevUrl" value="/post/list">
				<c:param name="type" value="${pm.cri.type}"/>
				<c:param name="search" value="${pm.cri.search}"/>
				<c:param name="page" value="${pm.startPage-1}"/>
			</c:url>
			<a class="page-link" href="${prevUrl}">이전</a>
		</li>
	</c:if>
	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
		<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
			<c:url var="page" value="/post/list">
				<c:param name="type" value="${pm.cri.type}"/>
				<c:param name="search" value="${pm.cri.search}"/>
				<c:param name="page" value="${i}"/>
			</c:url>
			<a class="page-link" href="${page}">${i}</a>
		</li>
	</c:forEach>
	<c:if test="${pm.next}">
		<li class="page-item">
			<c:url var="nextUrl" value="/post/list">
				<c:param name="type" value="${pm.cri.type}"/>
				<c:param name="search" value="${pm.cri.search}"/>
				<c:param name="page" value="${pm.endPage+1}"/>
			</c:url>
			<a class="page-link" href="${nextUrl}">다음</a>
		</li>
	</c:if>
</ul>

	<h1>메인 페이지입니다.</h1>
	<c:forEach begin="1" end="4" var="i" step="2">
	${i },
	</c:forEach>
	<c:set var="name" value="홍길동1"/>
	${name}
	<c:if test='${name eq "홍길동" }'>홍길동입니다.</c:if>
	<c:choose>
		<c:when test='${name eq "홍길동" }'>홍길동입니다.</c:when>
		<c:otherwise>홍길동이 아닙니다.</c:otherwise>
	</c:choose>
	
	<!-- 서버에서 보낸 id가 "abc"로 되어 있으면  -->
	<input type="text" value="${id }">
	<br>
	<c:forTokens items="a|b|c|d" delims="|" var="ch">${ch }</c:forTokens>
	<br>
	<c:url value="/" var="url">
		<c:param name="name" value="홍길동"/>
		<c:param name="age" value="30"/>
	</c:url>
	${url}
</div>

<c:if test="${user ne null}">
<div class="container mt-3">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title"><내 정보></h4>
      <p class="card-text">아이디 : ${user.me_id}</p>
      <p class="card-text">닉네임 : ${user.me_name}</p>
      <p class="card-text">
      <c:choose>
		<c:when test='${user.me_authority eq "admin" }'>권한 : 관리자</c:when>
		<c:otherwise>권한 : 회원 (${user.me_ms_state})</c:otherwise>
	  </c:choose>
      </p>
      <a href="<c:url value="/member/update"/>" class="card-link">개인 정보 수정</a>
      <a href="<c:url value="/logout"/>" class="card-link">로그아웃</a>
    </div>
  </div>
</div>
</c:if>
</body>
</html>