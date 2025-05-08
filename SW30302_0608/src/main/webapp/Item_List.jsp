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

	String SelectSql = "select PCODE,PNAME,decode(TYPE, 'C','기타', 'B', '소비', 'A', '장비'),PRICE from TBL_ITEM_01 order by PCODE";
	ResultSet rs = conn.prepareStatement(SelectSql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>아이템현황</h2>
	<section>
		<table border="1">
			<tr>
				<th>제품코드</th>
				<th>제품이름</th>
				<th>제품종류</th>
				<th>가격</th>
				<th>삭제</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="Item_List_Delete.jsp?pcode=<%=rs.getString(1)%>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>