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
		<c:forEach items="${memberList}" var="member">
			<tr>
				<td colspan="2">${member.me_id}</td>
				<td colspan="2">${member.me_name }</td>
				<td colspan="2">${member.me_birth}</td>
				<td colspan="2">${member.me_authority}</td>
				<!-- ȸ������ ���� �����ϰ� �ϱ� -->
				<td colspan="2">${member.me_ms_state}</td>
				<td><a href='<c:url value="/admin/delete?me_id=${member.me_id}"/>'>����</a></td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>