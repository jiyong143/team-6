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
<form action="<c:url value="/post/list"/>">
		<div class="input-group">
			<select class="form-control" name="type">
				<option value="po_title" <c:if test='${pm.cri.type == "po_title"}'>selected</c:if>>제목</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
			<button class="btn btn-outline-success">검색</button>
		</div>
	</form>
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