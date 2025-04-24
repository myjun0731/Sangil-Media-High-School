<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


section {
	width: 90%; 
	margin: 0 auto; 
	padding: 20px 0;
}

section h1 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse; 
	margin: 20px auto;
}

th, td {
	border: 1px solid #ccc; 
	padding: 8px 12px; 
	text-align: center;
}

th {
	background-color: #f2f2f2; 
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	ResultSet rs;
	ResultSet rs2;
	String sql = "select sa.sale_num, sp.s_name, to_char(sa.sale_date, 'YYYY-MM-DD'), re.r_name, sa.sale_count, to_char(sp.s_price,'999,999'), "
			+ "to_char(sum(sp.s_price*sale_count), '999,999,999') " + "from tbl_sales sa, tbl_specialty sp, tbl_region re "
			+ "where sa.r_code = re.r_code and sa.s_code = sp.s_code "
			+ "group by sa.sale_num, sp.s_name, sa.sale_date, re.r_name, sa.sale_count, sp.s_price "
			+ "order by sa.sale_num";
	rs = conn.prepareStatement(sql).executeQuery();

	String sql2 = "select to_char(sum(sum(sp.s_price*sa.sale_count)),'999,999,999') "
			+ "from tbl_specialty sp, tbl_sales sa " + "where sa.s_code = sp.s_code "
			+ "group by sa.sale_count, sp.s_price";
	rs2 = conn.prepareStatement(sql2).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2 style="text-align: center;">특산물 판매 내역</h2>
		<form action="05InsertDetail.jsp" name="form"
			onsubmit="return fn_submit();">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>판매일자</th>
					<th>지역</th>
					<th>수량</th>
					<th>단가(원)</th>
					<th>총액(원)</th>
				</tr>

				<%
				int Count = 0;
				while (rs.next()) {
					Count += rs.getInt(5);
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
				}
				rs2.next();
				%>

				<tr>
					<td colspan="3"></td>

					<td style="text-align: right;">합계</td>
					<td><%=Count%></td>
					<td></td>
					<td><%=rs2.getString(1)%></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>