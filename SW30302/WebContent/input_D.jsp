<%@page import="common.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<table>
			<%
				request.setCharacterEncoding("UTF-8");

			String custno = request.getParameter("custno");

			String sql = "SELECT * FROM member_tbl_02 where custno = ?";

			JDBC jdbc = new JDBC();
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			jdbc.pstmt.setString(1, custno);
			jdbc.rs = jdbc.pstmt.executeQuery();
			while (jdbc.rs.next()) {
			%>
			<form action="UpDate.jsp?custno=<%=jdbc.rs.getString(1)%>" method="post">
				<table border="1">
					<tr>
						<td>회원번호</td>
						<td><%=jdbc.rs.getString(1)%></td>
					</tr>
					<tr>
						<td>회원이름</td>
						<td><input type="text" name="custname" required
							placeholder="<%=jdbc.rs.getString(2)%>"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" required
							placeholder="<%=jdbc.rs.getString(3)%>"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" required
							placeholder="<%=jdbc.rs.getString(4)%>"></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><input type="text" name="joindate" required
							placeholder="<%=jdbc.rs.getString(5)%>"></td>
					</tr>
					<tr>
						<td>고객등급</td>
						<td><input type="text" name="grade" required
							placeholder="<%=jdbc.rs.getString(6)%>"></td>
					</tr>
					<tr>
						<td>거주지역</td>
						<td><input type="text" name="city" required
							placeholder="<%=jdbc.rs.getString(7)%>"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정"></td>
					</tr>
				</table>
			</form>
			<%
				}
			%>
		
	</section>
</body>
</html>