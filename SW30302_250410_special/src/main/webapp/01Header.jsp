<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	header{
		position: fixed;
		background-color: black;
		top: 0px;
		left: 0px;
		height: 60px;
		width: 100%;
		text-align: center;
		color: white;
		line-height: 20px;
	}
	nav{
		position: fixed;
		background-color: gray;
		top: 60px;
		left: 0px;
		height: 40px;
		width: 100%;
		line-height: 40px;
	}
	nav a{
		color: white;
		margin-left: 10px;
	}
	footer{
		position: fixed;
		background-color: black;
		bottom:0px;
		left: 0px;
		height: 50px;
		width: 100%;
		text-align: center;
		color: white;
		line-height: 10px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav>
		<a href="03Insert.jsp">회원등록</a>
		<a href="05List.jsp">회원목록조회/수정</a>
		<a href="06MonyeList.jsp">회원매출조회</a>
		<a href="02Main.jsp">홈으로</a>
	</nav>
	<footer>
		<h3>HRDKOREA Copyright @ 2016 All right reserved,,,,,,,of Korea</h3>
	</footer>
</body>
</html>