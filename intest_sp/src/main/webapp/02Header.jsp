<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

header {
	border-bottom: 5px solid gray;

}

header h1{
	background-color: white; 
	text-align: center;
	font-size: 40px;
	padding: 10px 0;
}
.navbar {
	display: flex;
	background-color: white;
	border-bottom: 5px solid gray;
	padding: 5px 0;
}

.navbar a {
	margin-left: 10px;
	color: black;
	font-size: 20px;
	text-decoration: none;
}

.navbar a.home-link{
	text-decoration: underline;
}
</style>
</head>
<body>
<header>
	<h1>지역별 특산물 매출관리 Ver 1.0</h1>
</header>
<nav class="navbar">
	<a href="04Insert.jsp">특산물등록</a>
	<a href="06List.jsp">특산물판매내역</a>
	<a href="01Index.jsp" class="home-link">홈으로</a>
</nav>
</body>
</html>