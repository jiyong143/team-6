<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/post/update"/>" method="post">
		<h1>게시글 수정</h1>
		<input type="hidden" name="num" value="${post.po_num}">
		<div class="mb-3 mt-3">
		    <label for="board" class="form-label">게시판:</label>
		    <select class="form-control" id="board" name="board">
		    	<c:forEach items="${list}" var="board">
			    	<option value="${board.bo_num}">${board.bo_title}</option>
		    	</c:forEach>
		    </select>
		</div>
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">제목:</label>
		    <input type="text" class="form-control" id="title" name="title" value="${post.po_title}" placeholder="제목을 입력하세요.">
		</div>
		<div class="mb-3 mt-3">
		    <label for="writer" class="form-label">작성자 아이디:</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${user.me_id}" readonly>
		</div>
		<div class="mb-3 mt-3">
			<label for="name" class="form-label">작성자 닉네임:</label>
			<input type="text" class="form-control" id="name" name="name" value="${user.me_name}" readonly>
	   </div>
		<div class="mb-3 mt-3">
		    <label for="content" class="form-label">내용:</label>
		    <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">${post.po_content}</textarea>
		</div>
		<!-- 첨부파일 ERD cloud에 첨부파일(file) 추가하면 주석해제		
		<div class="mb-3 mt-3" id="attachment">
		    <label class="form-label">첨부파일:</label>
		    <c:forEach items="${fileList}" var="file">
		    	<span class="form-control">${file.fi_ori_name}<a href="#" class="btn-del" data-target="${file.fi_num}">X</a></span>
	    	</c:forEach>
	    	<c:forEach begin="1" end="${3 - fileList.size()}">
	    		<input type="file" name="file" class="form-control">
		    </c:forEach>
		</div>
		 -->
		<button type="submit" class="btn btn-outline-success col-12">글 수정</button>
	</form>
</div>
<!-- 첨부파일 ERD cloud에 첨부파일(file) 추가하면 주석해제
<script type="text/javascript">
	let btnDel = document.querySelectorAll(".btn-del");
	let attachment = document.querySelector("#attachment");
	
	btnDel.forEach((element)=>{
		element.onclick = function(e){
			e.preventDefault();
			//input hidden으로 삭제할 첨부파일 번호를 추가
			let num = this.getAttribute("data-target");
			let inputHidden = 
				createElement('input', null, {
					'type' : 'hidden',
					'name' : 'fi_num',
					'value': `\${num}`
				})
			attachment.prepend(inputHidden);
			//span태그를 삭제
			this.parentElement.remove();
			//input file 추가
			let inputFile =  
				createElement('input', null, {
					'type' : 'file',
					'name' : 'file',
					'class': 'form-control'
				});
			attachment.append(inputFile);
		}
	
	});

	function createElement(tagName, text, attrs){
		let element = document.createElement(tagName);
		if(text){
			let textNode = document.createTextNode(text);
			element.append(textNode);
		}
		if(!attrs){
			return element;
		}
		for(key in attrs){
			let attr = document.createAttribute(key);
			attr.value = attrs[key];
			element.setAttributeNode(attr);
		}
		return element;
	}
</script>
 -->
</body>
</html>