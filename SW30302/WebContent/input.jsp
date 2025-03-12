<%@page import="common.JDBC"%>
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
			JDBC jdbc = new JDBC();
		try {
			String sql = "select max(custno)+1 from member_tbl_02";
			jdbc.rs = jdbc.conn.prepareStatement(sql).executeQuery();
			jdbc.rs.next();
		%>
		<form action="input_c.jsp" method="post">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" readonly name="custno"
						value="<%=jdbc.rs.getString(1)%>"></td>
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
					<td colspan="2"><input type="submit" value="등록">
					<a href="list.jsp"><input type="button" value="조회"></a>
					</td>
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

	<footer>
		<h2>상일미디어고 30302 Kim MyJun</h2>
	</footer>
</body>
</html>