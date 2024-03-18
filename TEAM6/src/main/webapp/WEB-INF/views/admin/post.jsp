<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach items="${postList}" var="post">
			<tr>
				<td colspan="2">${post.po_num }</td>
				<td colspan="2">${post.po_bo_num }</td>
				<td colspan="2">${post.po_title}</td>
				<td colspan="2">${post.po_me_id}</td>
				<td colspan="2">${post.po_date}</td>
				<td><a
					href="<c:url value="/admin/postdelete?po_num=${post.po_num}"/>">
						<button type="submit">삭제</button>
				</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>