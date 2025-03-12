<%@page import="common.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 매출 조회</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");

	JDBC jdbc = new JDBC();
	String sql = "select mem.custno, mem.custname, mem.grade, sum(mon.amount * mon.pcost) as total "
			+ "from member_tbl_02 mem, money_tbl_02 mon " + "where mem.custno = mon.custno "
			+ "group by mem.custno, mem.custname, mem.grade " + "order by mem.custno";

	jdbc.pstmt = jdbc.conn.prepareStatement(sql);
	jdbc.rs = jdbc.pstmt.executeQuery();
	%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h2>회원매출조회</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>

			<%
				while (jdbc.rs.next()) {
			%>
			<tr>
				<td><%=jdbc.rs.getString(1)%></td>
				<td><%=jdbc.rs.getString(2)%></td>
				<td><%=jdbc.rs.getString(3)%></td>
				<td><%=jdbc.rs.getString(4)%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<footer>
		<h2>상일미디어고 30302 Kim MyJun</h2>
	</footer>
</body>
</html>
