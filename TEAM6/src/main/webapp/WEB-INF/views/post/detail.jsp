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
        
        .inputinput{
        border:1px solid white;
        width: 100%;
        height : 300px;
        outline-style: none;
        
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- 정경호 프론트 코드 --> 
 <div class="body-group">
        <div class="board-box">
            <h2><a href="<c:url value="/post/list"/>?bNum=${bNum}">${bName}</a></h2>
        </div>
        <br>
        <form action="<c:url value="/comment/insert"/>" method="post">
            <div class="board-postList">
            	<label>
            	<h3>제목 :${post.po_title }</h3> <span><h5 style="text-align: right;">날짜 :${post.changeDate()}</h5></span>
            	<h5 style="text-align: right;">작성자 :${post.po_me_id}(${name})
            	</h5>
            	</label>
                <c:if test="${post.po_me_id eq user.me_id }">
                 <a href="<c:url value="/post/update?num=${post.po_num}&bName=${bName}&bNum=${bNum}"/>" class="">게시글 수정</a> 
                 <a href = "<c:url value="/post/delete?num=${post.po_num}&bNum=${post.po_bo_num}"/>" class= "">게시글 삭제</a>
                </c:if>
                <table>
                <div class="hr"></div> <h5 style="text-align: right;">조회수 : ${post.po_views}</h5>
                <input  class="inputinput" type="text" readonly="readonly" style="outline-style: none;" value="${post.po_content}">
                    <div class="hr"></div>    
                    <div class="comment-insert">  
                        <label for="content">댓글</label>
                        <div class="btn-button">
                            <input type="hidden" name="num" value="${post.po_num }">
                            <input type="hidden" name="bNum" value="${bNum}">
                            <input type="hidden" name="bName" value="${bName}">   
                            <textarea  rows="1" id="content" name="content" class="textarea-comment" placeholder="Enter comment"></textarea>
                            <button type="submit" class="btn-comment-insert">등록</button>  
                        </div>
                        <span>
                       <%--  <a href='<c:url value="/"/>' class="btn-comment-del">삭제</a>
                        <a href='<c:url value="/"/>' class="btn-comment-update">수정</a> --%>
                        </span>
                        <br>
                        <div class="hr"></div>
                        <div class="comment-list">
                        <c:forEach items="${comments}" var="comment">
                            <span class="writer">${comment.co_me_id}</span>
                            <p>${comment.co_content}</p>
                             <c:if test="${comment.co_me_id eq user.me_id }">
                                <a href="<c:url value="/comment/update?bName=${bName}&bNum=${bNum}&cNum=${comment.co_num }"/>" class="">댓글 수정</a> 
                                <a href = "<c:url value="/comment/delete?cNum=${comment.co_num}&bNum=${bNum}&bName=${bName}"/>" class= "">댓글 삭제</a>
                             </c:if>      
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
<<!-- 댓글 리스트 조회 -->
<script type="text/javascript">
//댓글 페이지 정보를 가지고 있는 객체를 선언
let cri = {
	page : 1,
	search : "${board.bo_num}"
}

getCommentList(cri);

function getCommentList(cri){
	$.ajax({
		async : true,
		url : '<c:url value="/comment/list"/>', 
		type : 'post', 
		data : JSON.stringify(cri),
		//서버로 보낼 데이터 타입
		contentType : "application/json; charset=utf-8",
		//서버에서 보낸 데이터의 타입
		dataType : "json", 
		success : function (data){
			displayCommentList(data.list);
			displayCommentPagination(data.pm);
			$('.comment-total').text(data.pm.totalCount);
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
}

function displayCommentList(list){
	let str = '';
	if(list == null || list.length == 0){
		str = '<h3>등록된 댓글이 없습니다.</h3>';
		$('.box-comment-list').html(str);
		return;
	}
	for(item of list){
		let boxBtns = 
			`<span class="box-btn float-right">
				<button class="btn btn-outline-danger btn-comment-del" 
					data-num="\${item.cm_num}">삭제</button>
				<button class="btn btn-outline-danger btn-comment-update" 
					data-num="\${item.cm_num}">수정</button>
			</span>`;
		let btns = '${user.me_id}' == item.cm_me_id ? boxBtns : '';  
		str += 
		`
			<div class="box-comment row">
				<div class="col-3">\${item.cm_me_id}</div>
				<div class="col-9 clearfix input-group">
					<span class="text-comment">\${item.cm_content}</span>
					\${btns}
				</div>
			</div>
		`
	}
	$('.box-comment-list').html(str);
}
function displayCommentPagination(pm){
    
	let str = '';
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;		
	}
	for(let i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? 'active' : '';
		str += `
		<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`;	
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>`;	
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page-link',function(){
	cri.page = $(this).data('page');
	getCommentList(cri);
});
</script>
<!-- 댓글 등록 -->
<script type="text/javascript">
//댓글 등록 버튼의 클릭 이벤트를 등록
$(".btn-comment-insert").click(function(){
	//로그인 확인
	if(!checkLogin()){
		return;
	}
	
	//서버에 보낼 데이터를 생성 => 댓글 등록을 위한 정보 => 댓글 내용, 게시글 번호
	let comment = {
		cm_content : $('.textarea-comment').val(),
		cm_bo_num : '${board.bo_num}'
	}
	
	//내용이 비어있으면 내용을 입력하라고 알림
	if(comment.cm_content.length == 0){
		alert('댓글 내용을 작성하세요.');
		return;
	}
	
	//서버에 데이터를 전송
	$.ajax({
		async : true,
		url : '<c:url value="/comment/insert"/>', 
		type : 'post', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result){
				alert('댓글을 등록했습니다.');
				$('.textarea-comment').val('');
				cri.page = 1;
				getCommentList(cri);
			}else{
				alert('댓글을 등록하지 못했습니다.');
			}
		}, 
		error : function(xhr, textStatus, errorThrown){
			console.log(xhr);
			console.log(textStatus);
		}
	});
});

function checkLogin(){
	//로그인 했을 때
	if('${user.me_id}' != ''){
		return true;
	}
	//안했을 때
	if(confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하겠습니까?")){
		location.href = '<c:url value="/login"/>';
	}
	return false;
}

</script>
<!-- 댓글 삭제 -->
<script type="text/javascript">
//댓글 삭제 버튼 클릭시 alert(1)이 실행되도록 작성
$(document).on('click', '.btn-comment-del', function(){
	//서버로 보낼 데이터 생성
	let comment = {
		cm_num : $(this).data('num')
	}
	//서버로 데이터를 전송
	$.ajax({
		async : true,
		url : '<c:url value="/comment/delete"/>', 
		type : 'post', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result){
				alert('댓글을 삭제했습니다.');
				getCommentList(cri);
			}else{
				alert('댓글을 삭제하지 못했습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});	
});
</script>
<!-- 댓글 수정  -->
<script type="text/javascript">
$(document).on('click', '.btn-comment-update', function(){
	initComment();
	let contentBox = $(this).parents(".box-comment").find(".text-comment");
	//댓글을 수정할 수 있는 textarea로 변경
	let content = contentBox.text();
	let str = 
	`<textarea class="form-control">\${content}</textarea>`;
	contentBox.after(str);
	contentBox.hide();
	
	//수정/삭제버튼을 감추고
	$(this).parents(".box-comment").find('.box-btn').hide();
	
	//수정 완료 버튼을 추가
	let cm_num = $(this).data("num");
	str = `<button class="btn btn-outline-warning btn-complete" data-num="\${cm_num}">수정 완료</button>`;
	$(this).parents(".box-comment").find('.box-btn').after(str);
});

$(document).on('click', '.btn-complete', function(){
	//전송할 데이터를 생성=>댓글 수정 => 댓글 번호, [댓글 내용],
	let comment = {
		cm_content : $('.box-comment').find('textarea').val(),
		cm_num : $(this).data("num")
	}
	
	//서버에 ajax로 데이터를 전송 후 처리
	$.ajax({
		async : true, 
		url : '<c:url value="/comment/update"/>', 
		type : 'post', 
		data : JSON.stringify(comment), 
		contentType : "application/json; charset=utf-8",
		dataType : "json", 
		success : function (data){
			if(data.result){
				alert('댓글을 수정했습니다.');
				getCommentList(cri);
			}else{
				alert('댓글을 수정하지 못했습니다.');
			}
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
//수정 버튼을 누른 상태에서 다른 수정버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	$('.btn-complete').remove();
	$('.box-comment').find('textarea').remove();
	$('.box-btn').show();
	$('.text-comment').show();
}
</script>
</body>
</html>