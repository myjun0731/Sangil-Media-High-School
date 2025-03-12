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
	<%
		request.setCharacterEncoding("UTF-8");
	JDBC jdbc = new JDBC();
	try {
		String sql = "select * from member_tbl_02";
		jdbc.rs = jdbc.conn.prepareStatement(sql).executeQuery();
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>화면목록 조회/수정</h2>
		<form action="input_I.jsp" method="post">
			<table>
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
				<%
					while (jdbc.rs.next()) {
				%>
				<tr>
					<td><a href="input_edit.jsp?custno=<%=jdbc.rs.getString(1)%>"><%=jdbc.rs.getString(1)%></a></td>
					<td><%=jdbc.rs.getString(2)%></td>
					<td><%=jdbc.rs.getString(3)%></td>
					<td><%=jdbc.rs.getString(4)%></td>
					<td><%=jdbc.rs.getString(5).substring(0, 10)%></td>
					<td><%=jdbc.rs.getString(6)%></td>
					<td><%=jdbc.rs.getString(7)%></td>
				</tr>
				<%
					}
				%>
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