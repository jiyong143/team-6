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
				<c:forEach items="${categoryList}" var="category">
					<tr>
						<td colspan="2">${category.ca_num}</td>
						<td colspan="2">${category.ca_title}</td>
						<td><a
							href="<c:url value="/category/list"/>" >카테고리 관리</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1>게시판 리스트</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2">번호</th>
					<th colspan="2">카테고리</th>
					<th colspan="2">게시판</th>
					<th colspan="6">기타</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td colspan="2">${board.bo_num }</td>
						<td colspan="2">${board.category.ca_title}</td>
						<td colspan="2">${board.bo_title}</td>
						<td><a
							href="<c:url value="/board/list"/>">게시판관리</a></td>
						 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<h1>게시글 리스트</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2">번호</th>
					<th colspan="2">게시판</th>
					<th colspan="2">게시글</th>
					<th colspan="2">작성자</th>
					<th colspan="6">날짜</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${postList}" var="post">
					<tr>
						<td colspan="2">${post.po_num }</td>
						<td colspan="2">${post.po_bo_num }</td>
						<td colspan="2">${post.po_title}</td>
						<td colspan="2">${post.po_me_id}</td>
						<td colspan="2"> ${post.po_date} </td>
						<td><a
							href="<c:url value="/post/list"/>">게시글 관리</a></td>
						<td><a
							href="<c:url value="/post/update?po_num=${post.po_num}"/>">
								<button class="btn btn-outline-warning">수정</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1>회원 리스트</h1>
		<h3>전체회원수 : ${memberCount}</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2">아이디</th>
					<th colspan="2">이름</th>
					<th colspan="2">생년월일</th>
					<th colspan="2">권한</th>
					<th colspan="2">상태</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="member">
					<tr>
						<td colspan="2">${member.me_id }</td>
						<td colspan="2">${member.me_name }</td>
						<td colspan="2">${member.me_birth}</td>
						<td colspan="2">${member.me_authority}</td>
						<td colspan="2"> ${member.me_ms_state} </td>
						<td><a
							href="<c:url value="/post/delete?po_num=${post.po_num}"/>"
							class="btn btn-outline-danger">회원 관리</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
		
	<h3>전체회원수 : ${memberCount}</h3>
	
	
	
	</table>
</form>






</body>
</html>