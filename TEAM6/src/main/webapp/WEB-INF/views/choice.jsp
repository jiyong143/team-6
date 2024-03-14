<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 게시판 선택</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:forEach items="${categoryList}" var="category">
   <h5>${category.ca_title}</h5>
   <c:forEach items="${category.getBoardInCategory()}" var="board">
   <c:url var="url" value="/post/list">
               <c:param name="bNum" value="${board.bo_num }"/>
           </c:url>
   <a href="${url}">${board.bo_title}</a> 
   </c:forEach>
</c:forEach>
</body>
</html>