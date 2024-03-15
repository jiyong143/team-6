<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">

.select-box{
	outline-style:none;
	padding: 10px;
	background-color: white;
	border: 1px solid white;
}

a {
   color: black;
   text-decoration: none;
}

h1 {
   margin-top: 10%;
   text-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
   /* 그림자 추가 */
}

header, nav, body {
   background-color: white;
   padding: 20px;
}

nav a {
   color: #333;
   text-decoration: none;
   padding: 10px 20px;
   margin: 0 5px;
   text-shadow: 1px 1px 1px 1px black;
}

nav a:hover {
   background-color: #ddd;
   border-radius: 5px;
}

.container {
   max-width: 1200px;
   margin: 0 auto;
   position: fixed;
}

.category {
   position: fixed;
   top: 70px;
   left: -400px;
   width: 200px;
   background-color: white;
   border: 1px solid #ddd;
   border-top-right-radius: 15px;
   border-bottom-right-radius: 15px;
   padding: 20px;
   transition: left 0.3s ease;
   z-index: 1;
   box-shadow: 2px 2px 4px rgba(141, 102, 18, 0.5);
}

.category.open {
   left: 0;
}

.category ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
}

.category ul li {
   padding: 10px 0;
   border-bottom: 1px solid #ddd;
}

.category ul li:last-child {
   border-bottom: none;
}

.category-toggle.clicked {
   box-shadow: inset 1px 1px 1px 1px black;
}

.category-toggle {
   position: fixed;
   top: 20px;
   left: 20px;
   cursor: pointer;
   z-index: 999;
   background-color: white;
   border-radius: 5px;
   padding: 5px;
}

.category-toggle span {
   display: block;
   width: 30px;
   height: 5px;
   background-color: black;
   margin-bottom: 5px;
   transition: transform 0.3s ease;
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
   margin-bottom: 20px;
}

.logo a {
   color: inherit;
   text-decoration: none;
   font-size: 36px;
}

.login-box {
   position: fixed;
   top: 20px;
   right: 20px;
}

.login-box a {
   text-decoration: none;
}

.search-container {
   border: 1px solid black;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   display: flex;
   align-items: center;
   border-radius: 30px;
   overflow: hidden;
}

.search-container input[type=text] {
   padding: 15px;
   border: none;
   width: 400px;
   box-sizing: border-box;
   font-size: 26px;
   border-top-left-radius: 30px;
   border-bottom-left-radius: 30px;
   display: inline;
   outline: none;
}

.search-container button {
   position: relative;
   padding: 20px 25px;
   background-color: white;
   color: #fff;
   border: none;
   border-radius: 0 30px 30px 0;
   cursor: pointer;
   font-size: 18px;
   background-image:
      url('data:image/png;base64,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');
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center;
}

.copyright {
   background-color: #ffffff;
   text-align: center;
   margin-top: 20px;
   position: fixed;
   bottom: 0;
   width: 100%;
}

.ad-container {
   position: fixed;
   bottom: 10px;
   right: 10px;
   background-color: white;
   padding: 10px;
   border-top-left-radius: 20px;
   box-shadow: -2px -2px 5px rgba(0, 0, 0, 0.1);
   display: flex;
   align-items: center;
   justify-content: center;
}

/* 추가된 스타일 */
.recent-posts {
   width: 50%;
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

.right-box-container {
   position: fixed;
   /* 오른쪽 박스와 버튼의 상대적인 위치 설정 */
}

.right-box {
   position: fixed;
   /* 화면에 고정 */
   top: 30%;
   right: -300px;
   /* 화면 오른쪽에서 0px 떨어진 위치 */
   transform: translateY(-50%);
   /* 세로 방향으로 중앙 정렬 */
   width: 200px;
   /* 너비 설정 */
   background-color: white;
   /* 배경색 지정 */
   padding: 20px;
   /* 내부 여백 설정 */
   border: 1px solid #ddd;
   border-top-left-radius: 15px;
   border-bottom-left-radius: 15px;
   box-shadow: -2px 1px 4px 1px rgba(141, 102, 18, 0.5);
   /* 왼쪽으로 그림자 생성 */
   z-index: 1;
   /* 다른 요소 위에 표시되도록 설정 */
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

.right-box a {
   color: black;
   text-decoration: none;
   border: 1px solid black;
}
</style>
</head>
<body>
<body>
   <div class="logo">
      <h1>
         <a href='<c:url value="/" />'>What do you want to ask?</a>
      </h1>
   </div>
   <nav class="category-container">
      <div class="category-toggle" onclick="toggleCategory()">
         <span></span><span></span><span></span>
      </div>
      <div class="category" id="category">
         <div class="category-box">
            <c:forEach items="${categoryList}" var="category">
               <h3>${category.ca_title}</h3>
               <div class="board-list">
                  <c:forEach items="${category.getBoardInCategory()}" var="board">
                     <c:url var="url" value="/post/list">
                        <c:param name="bNum" value="${board.bo_num}" />
                     </c:url>
                     <hr>
                     <h5>
                        <li><a href="${url}">${board.bo_title}</a></li>
                     </h5>
                  </c:forEach>
               </div>
            </c:forEach>
         </div>
      </div>
   </nav>
   <button class="close-button">
      <img
         src="data:image/png;base64,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"
         alt="버튼이미지">
   </button>
   <div class="right-box">
      <c:if test="${user != null }">
         <h3>${user.me_name}</h3>
         <h4>${user.me_id}</h4>
         <p>이메일</p>
         <p>${user.me_email}</p>
         <p>${user.me_authority}</p>
         <c:choose>
            <c:when test='${!user.getMe_authority().equals("admin")}'>
               <a href='<c:url value="/member/update" />'>내정보 관리</a>
            </c:when>
            <c:when test='${user.getMe_authority().equals("admin")}'>
               <a href='<c:url value="/admin/manager"/>'>커뮤니티 관리</a>
            </c:when>
         </c:choose>
         <a href='<c:url value="/logout"/>'>로그아웃</a>
      </c:if>
      <c:if test="${user == null }">
         <h4>환영합니다.</h4>
         <p>로그인 후 이용가능</p>
      </c:if>
   </div>

   <div class="login-box">
      <c:if test="${user == null }">
         <a href='<c:url value="/login" />'>로그인</a> | <a
            href='<c:url value="/signup" />'>회원가입</a>
      </c:if>
   </div>


   <!-- 저작권 -->
   <div class="copyright">
      <p>© 2024 정경호. All rights reserved. | 광고 문의 010-4407-1418 | 이메일 :
         wkdrn002@naver.com | TEAM6</p>
   </div>

   <!-- 왼쪽,오른쪽 박스 / 검색창 / 검색창 호버시 게시글 나옴 -->
</body>
</html>