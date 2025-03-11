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
		<h3>회원 목록 조회/수정</h3>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>


			<%
				request.setCharacterEncoding("UTF-8");

			JDBC jdbc = new JDBC();
			String sql = "SELECT * FROM member_tbl_02";

			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			jdbc.rs = jdbc.pstmt.executeQuery();

			while (jdbc.rs.next()) {
			%>

			<tr>
				<td><a href="input_D.jsp?custno=<%=jdbc.rs.getString(1)%>"><%=jdbc.rs.getString(1)%></a></td>
				<td><%=jdbc.rs.getString(2)%></td>
				<td><%=jdbc.rs.getString(3)%></td>
				<td><%=jdbc.rs.getString(4)%></td>
				<td><%=jdbc.rs.getString(5)%></td>
				<td><%=jdbc.rs.getString(6)%></td>
				<td><%=jdbc.rs.getString(7)%></td>
			</tr>
			<%
				}
			jdbc.close();
			%>
		</table>
	</section>
</body>
</html>