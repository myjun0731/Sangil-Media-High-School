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
	text-align: center;
	padding-left: 12px;
	text-decoration: none;
}

footer {
	position: fixed;
	bottom: 0px;
	background-color: black;
	padding: 15px 0;
	width: 100%;
}

footer {
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

section table th {
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<h1>과정평가형 정보처리산업기사 성적관리 프로그램 ver 2022-05</h1>
	</header>
	<nav>
		<a href="List.jsp">전체성적조회</a> <a href="Insert.jsp">개인성적등록</a> <a
			href="NumberList.jsp">개인별성적통계</a> <a href="Index.jsp">홈으로</a>
	</nav>

	<footer>
		<p>몰랴.</p>
	</footer>
</body>
</html>