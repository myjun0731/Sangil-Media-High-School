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

header {
	background-color: black;
	padding: 20px 0;
}

header h1 {
	color: white;
	text-align: center;
}

nav {
	background-color: gray;
	padding: 12px 0;
}

nav a {
	color: white;
	padding-left: 12px;
	text-decoration: none;
}

footer {
	position: fixed;
	background-color: black;
	padding: 20px 0;
	width: 100%;
	bottom: 0px;
}

footer p {
	color: white;
	text-align: center;
}

h2 {
	text-align: center;
	padding: 20px;
}

section {
	display: flex;
	justify-content: center;
}

section table {
text-align: center;
}
.Fr table {
	display: flex;
	justify-content: center;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<header>
		<h1>서버별 옥션 재고관리 ver 1.2.337</h1>
	</header>
	<nav>
		<a href="Item_Insert.jsp">아이템등록</a>
		<a href="Price_Insert.jsp">판매등록</a>
		<a href="Item_List.jsp">아이템현황</a>
		<a href="Amount_List.jsp">재고현황</a>
		<a href="Index.jsp">홈</a>
	</nav>

	<footer>
		<p>몰라.</p>
	</footer>
</body>
</html>