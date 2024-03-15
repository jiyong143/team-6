<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page="/WEB-INF/views/header.jsp" />


</head>

<body>
<form action=<c:url value="/admin/manger"/>>
	<table>
	<div> 
		서블릿에 카테고리 게시판 게시글 회원 리스트 
	관리자는 카테고리 추가 수정 삭제 기능
	관리자는 게시판 추가 수정 삭제 기능
	관리자는 게시글 삭제 기능만
	관리자는 회원 삭제, 상태변경 (이용중=>이용정지,이용정지=>이용중)
		<hr>
		카테고리 관리 박스 /admin/category 만들기 - 카테고리 리스트 서블릿 경로 - /admin/category
	</div>
	<div>
		게시판 관리 박스	/admin/board 만들기 - 게시판 리스트 서블릿 경로 - /admin/board
	</div>
	<div>
		게시글 관리 박스	/admin/post 만들기 - 게시글 리스트 서블릿 경로 - /admin/post
	</div>
	<div>
		회원 관리 박스 - /admin/member 만들기 회원 리스트 서블릿 경로 - /admin/member
	</div>
		
	
	
	
	
	
	
	
	
	
	</table>
</form>






</body>
</html>