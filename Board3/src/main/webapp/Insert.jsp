<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

form {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 400px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	width: 100px;
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: calc(100% - 20px);
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 16px;
}

input[type="button"] {
	background-color: #1f2a40;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

input[type="button"]:hover {
	background-color: #354563;
}

td[colspan="2"] {
	text-align: center;
}

td[colspan="2"] input[type="button"] {
	margin: 0 5px;
}
</style>
<script type="text/javascript">
	function son() {
		var f = document.kim;

		if (f.mid.value == "") {
			alert("아이디를 입력해주세요!");
			f.mid.focus();
			return false;
		} else if (f.mname.value == "") {
			alert("이름을 입력해주세요!");
			f.mname.focus();
			return false;
		} else if (f.mpw.value == "") {
			alert("비밀번호를 입력해주세요!");
			f.mpw.focus();
			return false;
		}
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<form action="InsertConfirm.jsp" name="kim">
		<h2 style="text-align: center; padding-bottom: 20px;">회원가입</h2>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="등록"
					onclick="son();"> <input type="button" value="로그인"
					onclick="location.href='loginhe.jsp'"></td>
			</tr>
		</table>
	</form>

</body>
</html>