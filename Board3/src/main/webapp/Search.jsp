<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 Ver1.0</title>

<!-- Google Fonts & Material Icons -->
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

.content-section {
	display: flex;
	margin-top: 80px;
}

.sidebar {
	width: 300px;
	background-color: #dcdde1;
	min-height: calc(100vh - 80px);
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
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "select * from member_tbl";
	
	boolean tt = false;
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
%>
</head>
<body>

	<jsp:include page="Header.jsp" />

	<section class="content-section">

		<div style="padding: 40px; flex: 1;">
			<!-- 🔍 검색바 -->
			<div
				style="display: flex; justify-content: center; margin-bottom: 20px;">
				<form action="Search.jsp" method="get"
					style="display: flex; gap: 10px;">
					<input type="text" name="keyword" placeholder="검색어를 입력하세요"
						style="padding: 10px 15px; width: 300px; border: 1px solid #ccc; border-radius: 6px;" />
					<button type="submit"
						style="padding: 10px 20px; background-color: #1f2a40; color: white; border: none; border-radius: 6px; cursor: pointer;">
						검색</button>
				</form>
			</div>

			<!-- 🌐 분야 선택바 -->
			<div
				style="display: flex; justify-content: center; overflow-x: auto; white-space: nowrap; margin-bottom: 30px; padding: 10px 0;">
				<form action="Board.jsp" method="get" style="display: inline-block;">
					<button type="submit" name="tag" value="all"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px; background-color: #1f2a40; color: white; cursor: pointer; font-size: 14px;">
						전체</button>
				</form>
				<form action="BoardTag.jsp" method="get"
					style="display: inline-block;">
					<button type="submit" name="tag" value="1"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px; background-color: #dcdde1; color: #2c3e50; cursor: pointer; font-size: 14px;">
						개발</button>
				</form>
				<form action="BoardTag.jsp" method="get"
					style="display: inline-block;">
					<button type="submit" name="tag" value="2"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px; background-color: #dcdde1; color: #2c3e50; cursor: pointer; font-size: 14px;">
						디자인</button>
				</form>
				<form action="BoardTag.jsp" method="get"
					style="display: inline-block;">
					<button type="submit" name="tag" value="3"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px; background-color: #dcdde1; color: #2c3e50; cursor: pointer; font-size: 14px;">
						마케팅</button>
				</form>
				<form action="BoardTag.jsp" method="get"
					style="display: inline-block;">
					<button type="submit" name="tag" value="4"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px; background-color: #dcdde1; color: #2c3e50; cursor: pointer; font-size: 14px;">
						여행</button>
				</form>
			</div>

			<!-- 📄 게시글 테이블 -->
			<table
				style="width: 100%; border-collapse: collapse; background-color: white; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
				<thead>
					<tr style="background-color: #1f2a40; color: white;">
						<th style="padding: 12px;">번호</th>
						<th style="padding: 12px;">제목</th>
						<th style="padding: 12px;">작성자</th>
						<th style="padding: 12px;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% 
							String key = request.getParameter("keyword");
							
							String word = "'%"+key+"%'";
							
							String sql2 = "select bid, title, mname, TO_CHAR(bdate, 'YY-MM-DD'), mid from board_tbl where title like "+word;
							
							System.out.println(sql2);
							
							PreparedStatement pstmt = con.prepareStatement(sql2);
							
							ResultSet rs2 = pstmt.executeQuery();
							while(rs2.next()) { %>
					<tr style="text-align: center; border-bottom: 1px solid #ddd;">
						<td style="padding: 12px;"><%= rs2.getString(1) %></td>
						<td style="padding: 12px; text-align: center;"><a
							href="view.jsp?id=<%= rs2.getString(1) %>&&mid=<%=rs2.getString(5) %>"
							style="text-decoration: none; color: #2c3e50;"><%= rs2.getString(2) %></a></td>
						<td style="padding: 12px;"><%= rs2.getString(3) %></td>
						<td style="padding: 12px;"><%= rs2.getString(4) %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>