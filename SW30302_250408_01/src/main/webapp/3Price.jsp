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
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;

	String sql = "";
	rs = conn.prepareStatement(sql).executeQuery();

	rs.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">메뉴현황</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>판매일자</td>
				<td>판매번호</td>
				<td>점포명</td>
				<td>판매메뉴</td>
				<td>사이즈</td>
				<td>판매수량</td>
				<td>판매금액</td>
				<td>수취구분</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
				<td><%=%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>