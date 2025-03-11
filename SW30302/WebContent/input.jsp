<%@ page import="java.sql.*"%>
<%@ page import="common.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h3>회원 등록</h3>

		<%
			request.setCharacterEncoding("UTF-8");

		try {
			// 요청 파라미터가 있는 경우에만 세션에 값을 저장합니다.
			String custno = request.getParameter("id");
			String custname = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String joindate = request.getParameter("joindate");
			String grade = request.getParameter("grade");
			String city = request.getParameter("city");
		%>
		<form action="input_E.jsp" method="post">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" required></td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td><input type="text" name="custname" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" required></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" required></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td><input type="text" name="grade" required></td>
				</tr>
				<tr>
					<td>거주지역</td>
					<td><input type="text" name="city" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
		<%
			} catch (Exception e) {
		%>
		<p style="color: red;">
			회원 등록 폼을 로드하는 중 오류 발생:
			<%=e.getMessage()%>
		</p>
		<%
			}
		%>
	</section>
</body>
</html>