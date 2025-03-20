<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 40px;">학생성적등록</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2StudentInsert_detail.jsp">
			<table border="1" style="text-align: center;">
				<tr>
					<td>학번</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>