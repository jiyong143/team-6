<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
<style type="text/css">
 
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="search-container">
		<form action="<c:url value="/"/>">
			<input type="text" placeholder="검색..." name="search"
				value="${search}">
			<button type="submit"></button>
		</form>
	</div>
	<div class="recent-posts">
		<c:if test="${list.size()!=0 }">
			<h2 style="text-align: center;">최근 게시글</h2>
		</c:if>
		<ul>
			<li><c:choose>
					<c:when test="${list.size() != 0}">
						<table class="table table-hover" style="margin: 0 auto;">
							<!-- 테이블을 중앙에 배치 -->
							<tr>
								<th style="text-align: center; width: 25%;">게시판</th>
								<th style="text-align: center; width: 25%;">제목</th>
								<th style="text-align: center; width: 25%;">아이디</th>
								<th style="text-align: center; width: 25%">날짜</th>
							</tr>
							<c:forEach items="${list}" var="post">
								<tr>
									 <td style="text-align: center;"><c:url var="boardUrl"
											value="/post/list">
											<c:param name="bNum" value="${post.getBoard().bo_num}" />
										</c:url> <a href="${boardUrl}">▶${post.getBoard().bo_title}</a></td> 
									<td style="text-align: center;"><c:url var="detailUrl"
											value="/post/detail">
											<c:param name="num" value="${post.po_num}" />
										</c:url> <a href="${detailUrl}">${post.po_title}</a></td>
									<td style="text-align: center;">${post.po_me_id}</td>
									<td style="text-align: center;">${post.changeDate()}</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>

					<c:otherwise>
						<tr>
							<th>
								<h4 style="text-align: center;">게시글이 없습니다.</h4>
							</th>
						</tr>
					</c:otherwise>

				</c:choose></li>
		</ul>
	</div>
	<!-- 왼쪽,오른쪽 박스 / 검색창 / 검색창 호버시 게시글 나옴 -->
	<script>
		function toggleCategory() {
			var category = document.getElementById("category");
			category.classList.toggle("open");
		}

      // 카테고리 토글 버튼에 클릭 이벤트 리스너 추가
      categoryToggle.addEventListener('click', function() {
         // 클릭 시 clicked 클래스를 토글하여 스타일 변경
         this.classList.toggle('clicked');
      });

      // 검색창 요소 가져오기
      var searchContainer = document.querySelector('.search-container');

      // 최근 게시글 리스트 요소 가져오기
      var recentPosts = document.querySelector('.recent-posts');

      // 검색창에 마우스를 올리면 최근 게시글 리스트를 표시
      searchContainer.addEventListener('mouseenter', function() {
         recentPosts.style.display = 'block';
      });

      /*    // 최근 게시글 리스트에서 마우스가 벗어나면 숨김
         recentPosts.addEventListener('mouseleave', function() {
            recentPosts.style.display = 'none';
         }); */

      var rightBox = document.querySelector('.right-box');

		/* 	// 최근 게시글 리스트에서 마우스가 벗어나면 숨김
			recentPosts.addEventListener('mouseleave', function() {
				recentPosts.style.display = 'none';
			}); */

      // 닫기 버튼 가져오기
      var closeButton = document.querySelector('.close-button');

      // 오른쪽 박스가 숨겨져 있는지 여부를 저장하는 변수
      var isHidden = true;

      // 버튼 클릭 이벤트에 함수 연결
      closeButton.addEventListener('click', function() {
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

      const categoryItems = document.querySelectorAll('.category li');
   </script>

			// 숨겨져 있는 상태에서는 보이는 상태로, 보이는 상태에서는 숨겨져 있는 상태로
			isHidden = !isHidden;
		});

		const categoryItems = document.querySelectorAll('.category li');
	</script>

</body>
</html>