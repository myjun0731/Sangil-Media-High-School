<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 Ver1.0</title>
<style>
section {
	justify-content: center;
	display: flex;
	height: auto;
}

.credit-container {
	text-align: center;
}

content-section {
	font-size: 1.2em;
	margin-bottom: 0.5em;
}

hr {
	width: 15%;
	margin: 0.5em auto;
	border-color: #ccc;
}

b {
	font-size: 1em;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<section class="content-section">
		<div class="credit-container">
			<h1 style="padding: 13px 0;">게시판 : 개발진</h1>
			<hr style="width: 15%;">
			<b>김유민<br>손예성<br>김명준<br>김인혁
			</b>
			<hr style="width: 5%;">
			<h1>디자인 : CSS</h1>
			<b>김명준</b>
			<hr style="width: 5%;">
			<h1>백엔드 : SQL & JSP</h1>
			<b>손예성</b><br> <b>김유민</b><br> <b>김인혁</b>
			<hr style="width: 5%;">
		</div>
	</section>
</body>
</html>