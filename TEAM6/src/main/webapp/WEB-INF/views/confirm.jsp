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
    let msg = '${msg}'; // �������� ���� msg���� ������ ����
    if (msg != '') {
        if (confirm(msg)) { // ���� ��ȭ���ڸ� ���� �޽����� ������
            location.href = '<c:url value="/${url}"/>'; // Ȯ�� ��, ������ URL�� �̵�
        } else {
        	 location.href = '<c:url value="/${url}"/>';
        }
    } else {
        location.href = '<c:url value="/${url}"/>'; // �޽����� ������ �ٷ� ������ URL�� �̵�
    }
</script>
</body>
</html>