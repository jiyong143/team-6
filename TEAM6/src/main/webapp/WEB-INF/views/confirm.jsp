<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
    let msg = '${msg}'; // 서버에서 받은 msg값을 변수에 저장
    if (msg != '') {
        if (confirm(msg)) { // 컨펌 대화상자를 통해 메시지를 보여줌
            location.href = '<c:url value="/${url}"/>'; // 확인 시, 지정된 URL로 이동
        } else {
        	 location.href = '<c:url value="/${url}"/>';
        }
    } else {
        location.href = '<c:url value="/${url}"/>'; // 메시지가 없으면 바로 지정된 URL로 이동
    }
</script>
</body>
</html>