<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

form {
	background-color: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	width: 600px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 12px 10px;
	vertical-align: top;
}

td:first-child {
	width: 80px;
	font-weight: 600;
	color: #1f2a40;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
	resize: vertical;
}

input[type="submit"], input[type="button"] {
	padding: 10px 20px;
	background-color: #1f2a40;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #34495e;
}

.button-row {
	text-align: right;
	padding-top: 10px;
}
</style>
</head>

<body>
	<form action="BoardInsertConfirm.jsp">
		<h2 style="text-align: center; padding: 20px 0;">게시글 작성</h2>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" required style="resize: none;"></textarea></td>
			</tr>
		</table>
		<div class="button-row" colspan="2" style="text-align: center;">
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>