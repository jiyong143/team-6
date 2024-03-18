<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
  <style>

        .body-group {
            padding: 100px;
            margin-left: 150px;
            margin-right: 150px;
            padding-bottom: 150px;
        }
       

        .category-toggle.open span:nth-child(1) {
            transform: rotate(45deg) translate(2px, 2px);
        }

        .category-toggle.open span:nth-child(2) {
            opacity: 0;
        }

        .category-toggle.open span:nth-child(3) {
            transform: rotate(-45deg) translate(2px, -2px);
        }

        .logo {

            text-align: center;
        }

        .logo a {
            color: inherit;
            /* 상속된 텍스트 색상 사용 */
            text-decoration: none;
            /* 밑줄 제거 */
            font-size: 36px;
            /* 로고 텍스트 크기 늘리기 */
        }

        .login {
            position: fixed;
            top: 20px;
            right: 20px;
        }

        .login a {
            color: inherit;
            /* 기본 텍스트 색으로 설정 */
            text-decoration: none;
            /* 밑줄 제거 */
        }
        .recent-posts {
            width: calc(20% + 50px);
            position: fixed;
            top: calc(50% + 50px);
            left: 50%;
            transform: translateX(-50%);
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            max-height: 300px;
            z-index: 1;
            overflow-y: auto;
            padding: 10px;
            display: none;
        }

        .recent-posts ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .recent-posts ul li {
            margin-bottom: 10px;
        }

        .recent-posts ul li a {
            color: black;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;

        }


        .close-button {
            position: fixed;
            top: 2%;
            right: 200px;
            cursor: pointer;
            background-color: white;
            z-index: 9999;
            border: 0.5px solid white;

        }

        .close-button img {
            width: 30px;
            height: auto;
        }

        .board-box {
            border: 1px solid #ddd;
            transition: left 0.3s ease;
            box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
            z-index: 1;
            width: 150px;
            padding-left: 20px;
        }

        .board-postList table {
            width: 100%;
            border-collapse: collapse;
        }

        .board-postList th {
            text-align: center;
            background-color: rgba(141, 102, 18, 0.5);
        }

        .copyright {
            background-color: #ffffff;
            text-align: center;
            margin-top: 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }



        .board-postList th,
        .board-postList td {
            padding: 8px;
            border: 1px solid rgb(167, 159, 133);
        }

        /*------------me------------*/
        .board-postList {
            border-radius: 10px;
            height: calc(100% - 50px);
            border: 1px solid #ddd;
            transition: left 0.3s ease;
            box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
            box-sizing: border-box;
        }

        .hr {
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .board-postList {
            padding-right: 20px;
            padding-bottom: 20px;
            padding-left: 20px;
        }

        .board-postList button {
            padding: 5px;
            background-color: rgba(141, 102, 18, 0.5);
            float: right;
            width: 100px;
            height: 50%;
            margin-right: 10px;
            border-radius: 5px;
        }

        .post-insert .title,
        .post-insert .content,
        .comment-insert .comment {
            text-decoration: none;
            width: 100%;
            border: 1px solid rgba(141, 102, 18, 0.5);
            border-radius: 5px;

        }
        .post-insert .title:focus,
        .post-insert .content:focus,
        .comment-insert :focus{
            outline: none;
        }
        .post-insert .title{
            height: 30px;
        }
        .comment-insert .comment{
            width: 85%;
            height: 100%;
        }
        .comment-insert button{
            width: 10%;
        }
        .btn-button{
            justify-content: space-between;
            width: 100%;
            display: flex;
            height: 50px;
        }
        .btn-button button{
             box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
            height: 100%;
        }
        .comment-list{
            margin-top: 10px;
            border: 1px solid #ddd;
            box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
        }
        .comment-list span{
            box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }
        .post-insert textarea{
            min-width: 100%;
            max-width: 100%;
            min-height: 250px;
            max-height: 250px;
        }
        .comment-insert textarea{
            min-width: 85%;
            max-width: 85%;
            min-height: 50px;
            max-height: 50px;
        }

    </style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>


<!-- 최지용 프론트 코드 -->

<div class="container">
   <%--   <h1>게시글 상세</h1>
     <div>
       <div >
			<label for="title" class="form-label">제목:</label>
			<input type="text" class="form-control" id="title" name="title" readonly value="${post.po_title }">
	   </div>
	   <div >
			<label for="id" >작성자 아이디:</label>
			<input type="text"  id="id" name="id"  readonly value="${post.po_me_id }">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="name" class="form-label">작성자 닉네임:</label>
			<input type="text" class="form-control" id="name" name="name"  readonly value="${name}">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="date" class="form-label">작성일자:</label>
			<input type="text" class="form-control" id="date" name="date" readonly value="${post.changeDate()}">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="view" class="form-label">조회수:</label>
			<input type="text" class="form-control" id="view" name="view" readonly value="${post.po_views }">
	   </div>
	   <div class="mb-3 mt-3">
			<label for="content" class="form-label">내용:</label>
			<textarea rows="10"  class="form-control" id="content" name="content" readonly >${post.po_content }</textarea>
	   </div>
	   <a href = "<c:url value="/post/list?bNum=${post.po_bo_num}"/>" class="btn btn-outline-dark">목록으로</a>
	   <c:if test="${post.po_me_id == user.me_id}"> <!-- 내가 작성한 게시글일 때만 삭제 버튼과 수정 버튼이 생기도록 -->
	      <a href="<c:url value="/post/update?num=${post.po_num}"/>" class="btn btn-outline-success">게시글 수정</a>
	      <a href = "<c:url value="/post/delete?num=${post.po_num}&bNum=${post.po_bo_num}"/>" class= "btn btn-outline-danger">게시글 삭제</a>
	   </c:if>
	   <a href = "<c:url value="/comment/insert?num=${num}"/>" class= "btn btn-outline-danger">댓글 작성</a>
     </div>
     <!-- 댓글 시작 -->
     <br>
     <h4>댓글</h4>
     <br>
     <table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>작성자 아이디</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
            <c:forEach items="${comments}" var="comment">
				<tr>
					<td>${comment.co_num}</td>
					<td>${comment.co_content}</td>
					<td>${comment.co_me_id}</td>
					<td>
					<c:if test="${user.me_id==comment.co_me_id}">
			             <a href = "<c:url value="/comment/delete?cNum=${comment.co_num}"/>" class= "btn btn-outline-danger">댓글 삭제</a>
			             <a href = "<c:url value="/comment/update?cNum=${comment.co_num}"/>" class= "btn btn-outline-danger">댓글 수정</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${comments.size() == 0 }">
				<tr>
					<th colspan="3">
						<h4 class="text-center">등록된 댓글이 없습니다.</h4>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
</div> --%>
<!-- 정경호 프론트 코드 --> 
 <div class="body-group">
        <div class="board-box">
            <h2><a href="<c:url value="/post/list"/>?bNum=${bNum}">${bName}</a></h2>
        </div>
        <br>
        <form action="<c:url value="/comment/insert"/>" method="post"> <!-- 여기에  댓글 등록 하는 링크 -->
            <div class="board-postList">
                <h3>${post.po_title } </h3>
                <h6>${post.po_me_id}(${name})</h6>
                <h6>${post.changeDate()}</h6>
                <table>
                <div class="hr"></div> 
                <h6>${post.po_content}</h6>
                
                    <div class="hr"></div>    
                    <div class="comment-insert">  
                        <label for="#">댓글</label>
                        <div class="btn-button">
                            <input type="hidden" name="num" value="${post.po_num }">
                            <input type="hidden" name="bNum" value="${bNum}">
                            <input type="hidden" name="bName" value="${bName}">   
                            <textarea  rows="1" id="content" name="content" class="content"></textarea>
                            <button>등록</button>  
                        </div>
                        <br>
                        <div class="hr"></div>
                        <div class="comment-list">
                        <c:forEach items="${comments}" var="comment">
                            <span class="writer">${comment.co_me_id}</span>
                            <p>${comment.co_content}</p>
                        <div class="hr"></div>
                        </c:forEach>
                         <c:if test="${comments.size() == 0 }">
						  <h4 class="text-center">등록된 댓글이 없습니다.</h4>
						 </c:if>
                        </div>
                    </div>
                </table>
            </div>
        </form>
    </div>

<!--  -->


 <script>
        function toggleCategory() {
            var category = document.getElementById("category");
            category.classList.toggle("open");
        }



        // 카테고리 토글 버튼 요소 가져오기
        var categoryToggle = document.querySelector('.category-toggle');

        // 카테고리 토글 버튼에 클릭 이벤트 리스너 추가
        categoryToggle.addEventListener('click', function () {
            // 클릭 시 clicked 클래스를 토글하여 스타일 변경
            this.classList.toggle('clicked');
        });


        // 최근 게시글 리스트 요소 가져오기
        var recentPosts = document.querySelector('.recent-posts');

        var rightBox = document.querySelector('.right-box');

        // 오른쪽 박스 가져오기
        var rightBox = document.querySelector('.right-box');

        // 닫기 버튼 가져오기
        var closeButton = document.querySelector('.close-button');



        // 오른쪽 박스가 숨겨져 있는지 여부를 저장하는 변수
        var isHidden = true;

        // 버튼 클릭 이벤트에 함수 연결
        closeButton.addEventListener('click', function () {
            // 오른쪽 박스가 숨겨져 있다면
            if (isHidden) {
                // 오른쪽으로 이동하여 보이는 애니메이션 효과 추가
                rightBox.style.transition = 'right 0.3s ease';
                // 오른쪽으로 이동하여 보임
                rightBox.style.right = '0';
            } else {
                // 오른쪽으로 이동하여 사라지는 애니메이션 효과 추가
                rightBox.style.transition = 'right 0.3s ease';
                // 오른쪽으로 이동하여 사라짐
                rightBox.style.right = '-300px'; // 오른쪽 박스의 너비만큼 이동
            }

            // 숨겨져 있는 상태에서는 보이는 상태로, 보이는 상태에서는 숨겨져 있는 상태로
            isHidden = !isHidden;
        });

    </script>
</body>
</html>