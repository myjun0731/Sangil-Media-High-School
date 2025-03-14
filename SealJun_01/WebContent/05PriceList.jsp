<%@page import="java.sql.*"%>
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
		Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "select m1.custno, custname, grade, sum(amount*pcost) as total from member_tbl_02 m1, money_tbl_02 m2 where m1.custno = m2.custno group by m1.custno, custname, grade order by total DESC";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="01Header.jsp"></jsp:include>
	<h2 style="text-align: center;">회원목록조회/수정</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("custno")%></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("total")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
</body>
</html>