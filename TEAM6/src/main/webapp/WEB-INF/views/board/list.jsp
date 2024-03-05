<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판1</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
    <h1>게시글 리스트</h1>
    <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
        <c:forEach items="${postList}" var="post">
      <tr>
        <td>${post.po_num}</td>
        <td>
           <a href="<c:url value=""/>">${post.po_title}</a>  
        </td>          
        <td>${post.po_me_id}</td>     
        <td>${post.po_date}</td>    
        <td>${post.po_views}</td>
      </tr>
       </c:forEach>
    </tbody>
  </table>
  <a href="<c:url value="/post/insert"/>" class="btn btn-outline-primary">게시글 등록</a>
</div>
</body>
</html>