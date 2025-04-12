<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined&family=Lato:wght@400;700&display=swap"
	rel="stylesheet" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
}

body {
	background-color: #f5f6fa;
	color: #2c3e50;
}

.content-section {
	display: flex;
	margin-top: 80px;
}

.sidebar {
	width: 300px;
	background-color: #dcdde1;
	min-height: calc(100vh - 80px);
}

/* HEADER는 고정, 높이 변화 없음 */
header {
	background-color: #1f2a40;
	color: white;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	z-index: 1;
	transition: all 0.3s ease;
}

.header-inner {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
}

header h1 {
	font-size: 24px;
	font-weight: 700;
	transition: opacity 0.3s ease;
}

.menu-button {
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 6px;
	padding: 6px;
	transition: background-color 0.3s;
}

.menu-button:hover {
	background-color: rgba(255, 255, 255, 0.1);
}

.material-symbols-outlined {
	font-size: 28px;
	color: white;
}

nav {
	position: absolute;
	top: 18px;
	left: 0;
	width: 100%;
	background-color: #1f2a40;
	opacity: 0;
	transform: translateY(-20px);
	transition: opacity 0.3s ease, transform 0.3s ease;
	text-align: center;
	z-index: 10;
	pointer-events: none;
	box-shadow: 0 30px 55px rgba(0, 0, 0, 0.3);
}

header.show-nav nav {
	opacity: 1;
	transform: translateY(0);
	pointer-events: auto;
}

nav h1 {
	padding: 10px;
}

nav ul {
	display: flex;
	justify-content: center;
	gap: 30px;
	margin-top: 50px;
	list-style: none;
}

nav ul li a {
	color: white;
	text-decoration: none;
	font-size: 16px;
	font-weight: 500;
	position: relative;
	text-align: center;
	bottom: 30px;
}

nav ul li a:before, nav ul li a:after {
	content: '';
	position: absolute;
	height: 2px;
	width: 100%;
	left: 0;
	bottom: -4px;
	transform: scaleX(0);
	transform-origin: left;
	transition: transform 0.3s ease;
	background-color: #fff;
}

nav ul li a:hover:before, nav ul li a:hover:after {
	transform: scaleX(1);
}

nav ul li a:hover {
	color: #fff;
}

footer {
	margin-top: 100px;
	padding: 20px 0;
	background-color: #f0f0f0;
	text-align: center;
	font-size: 0.9em;
	color: #555;
	bottom: 0px;
	position: fixed;
	width: 100%;
	text-align: center;
}
</style>
<script>
window.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('header');
    const menuButton = document.querySelector('.menu-button');
    const title = document.querySelector('h1');

    menuButton.addEventListener('mouseenter', () => {
        header.classList.add('show-nav');
        title.style.opacity = 0;
    });

    header.addEventListener('mouseleave', () => {
        header.classList.remove('show-nav');
        title.style.opacity = 1;
    });
});
</script>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select * from member_tbl";

boolean tt = false;

String id = (String) application.getAttribute("mid");

ResultSet rs = con.prepareStatement(sql).executeQuery();
boolean isAdmin = false;
if (rs.next()) {
    if ("1".equals(rs.getString(4))) {
        isAdmin = true;
    }
}
%>
</head>
<body>
	<header>
		<div class="header-inner">
			<h1>
				<a href="Board.jsp" style="color: #fff; text-decoration: none;">게시판
					Ver1.0</a>
			</h1>
			<div class="menu-button">
				<span class="material-symbols-outlined">menu</span>
			</div>
		</div>
		<nav>
			<h1 style="text-align: center; padding: 10px;">게시판 Ver1.0</h1>
			<%while(rs.next()){
				if(rs.getString(4).equals("1")){ %>
			<ul>
				<li><a href="Board.jsp">홈</a></li>
				<li><a href="BoardInsert.jsp">글쓰기</a></li>
				<li><a href="Mypage.jsp?id=<%=id%>">계정관리</a></li>
				<li><a href="announcement.jsp">공지사항</a></li>
			</ul>
			<%
			tt = true;
				}
			}
			if(tt == false){
			%>
			<ul>
				<li><a href="Board.jsp">홈</a></li>
				<li><a onclick="alert('로그인후 사용 가능합니다.')">글쓰기</a></li>
				<li><a href="loginhe.jsp">로그인</a></li>
				<li><a href="announcement.jsp">공지사항</a></li>
			</ul>
			<%} %>
		</nav>
	</header>
	<%
	    int year = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
	%>
	<footer>
		&copy;
		<%= year %>
		게시판 프로그램 | 바보들 All rights reserved.
	</footer>

</body>
</html>
