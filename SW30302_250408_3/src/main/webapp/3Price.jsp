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
	ResultSet rs2;

	String sql =
			"select ho.hospcode, ho.hospname, count(ho.hospcode) " +
			"from tbl_hosp_202109 ho, tbl_vaccresv_202109 va " +
			"where va.hospcode = ho.hospcode " +
			"group by ho.hospcode, ho.hospname " +
			"order by ho.hospcode";
			

			
			rs = conn.prepareStatement(sql).executeQuery();
			
			String sql2 = "select count(hospcode) from tbl_vaccresv_202109";
			rs2 = conn.prepareStatement(sql2).executeQuery();
	rs2.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">접종인원통계</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
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
				<td>총건수</td>
				<td><%=rs2.getString(1) %></td>
			</tr>
		</table>
	</section>
</body>
</html>