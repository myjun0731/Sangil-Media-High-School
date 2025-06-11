<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
}
header h1 {
  background-color: white;
  text-align: center;
  font-size: 40px;
  padding: 10px 0;
  border-bottom: 5px solid gray;
}

/* 메뉴바 전체를 꾸며요 */
.navbar {
  display: flex;
  background-color: white;
  border-bottom: 5px solid gray;
  padding: 5px 0;
}

/* 모든 메뉴 항목의 기본 스타일 */
.navbar a {
  margin-left: 10px; /* 메뉴 항목들 사이에 10픽셀 간격을 줍니다 */
  color: black;      /* 글씨 색깔을 검정색으로 설정합니다 */
  font-size: 20px;   /* 글씨 크기를 20픽셀로 설정합니다 */
  text-decoration: none; /* 밑줄을 제거하여 깔끔하게 보이게 합니다 */
}

/* "홈으로" 링크에만 항상 밑줄을 표시합니다 */
.navbar a.home {
  text-decoration: underline; /* 밑줄을 추가하여 강조합니다 */
}

footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 40px;
	background-color: silver;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 25px;
}

</style>
</head>
<body>
<header>
	<h1>지역별 특산물 매출관리 Ver 1.0</h1>
</header>
<nav class="navbar">
	<a href="01Insert.jsp">특산물등록</a>
	<a href="02List.jsp">특산물판매내역</a>
	<a href="03Index.jsp" class="home">홈으로</a>
</nav>

<footer>
	<p>상미고~~~~~~</p>
</footer>
</body>
</html>