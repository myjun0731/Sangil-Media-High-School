<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
	padding: 20px;
}

.section {
	justify-content: center;
	display: flex;
}

.s_tbl {
	text-align: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;
	ResultSet rs;
	ResultSet rs2;
	String resvno = request.getParameter("resvno");
	String sql = "select ho.hospcode, ho.hospname, count(ho.hospcode) " + "from tbl_hosp_202109 ho, tbl_vaccresv_202109 va "
			+ "where va.hospcode = ho.hospcode " + "group by ho.hospcode, ho.hospname " + "order by ho.hospcode";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	String sql2 = "select count(va.hospcode) from tbl_vaccresv_202109 va";
	pstmt = conn.prepareStatement(sql2);
	rs2 = pstmt.executeQuery();
	rs2.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 class="h2">병원별 접종건수 통계</h2>

	<section class="section">
		<form action="2List_select.jsp" name="form">
			<table class="s_tbl" border="1">
				<tr>
					<td>병원코드</td>
					<td>병원명</td>
					<td>접종건수</td>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td></td>
					<td>총누계</td>
					<td><%=rs2.getString(1) %></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>