<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국민의 힘</title>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<a href="<c:url value="/choice"/>">#</a>  <!--  한번 더 누르면 사라지게 해보기  -->
<jsp:include page="/WEB-INF/views/choice.jsp"/>


<div class="logo">
		<h1>
			<a href="<c:url value="/"/>">국민의 힘</a>
		</h1>
	</div>
	
	
	<form action="<c:url value="/search"/>">
		<div class="search-container">
			<input type="text" placeholder="제목 검색..." name="search">
			<button type="submit"></button>
		</div>
	</form>
	<c:if test="${postList.size()!=0}">
	<h5>'${count} 개' 의 게시글이 조회됐습니다.</h5>
	</c:if>
	<br>
	<table class="table table-hover">
    <tbody>
        <c:forEach items="${postList}" var="post">
      <tr>
        <td>
         <c:url var="url" value="/post/list">
               <c:param name="bNum" value="${post.getBoard().bo_num}"/>
         </c:url>  
          <a href="${url}">${post.getBoard().bo_title}</a>
          </td>
        <td>
           <c:url var="url" value="/post/detail">
               <c:param name="num" value="${post.po_num }"/>
           </c:url>
           <a href="${url}">${post.po_title}</a>   <!-- 로그인한 사람만 클릭해서 상세 화면 이동 가능 -->
        </td> 
        <td>${post.getFront()}...</td>    
        <td>${post.po_me_id}</td>        
        <td>${post.changeDate()}</td>    
      </tr>
       </c:forEach>
       <c:if test="${postList.size() == 0 }">
				<tr>
					<th colspan="5">
						<h4 class="text-center">만족하는 게시글이 없습니다.</h4>
					</th>
				</tr>
	   </c:if>
    </tbody>
  </table>
	


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