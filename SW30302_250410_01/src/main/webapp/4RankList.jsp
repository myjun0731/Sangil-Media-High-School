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
	String sql = "select po.artist_id, art.artist_name, sum(po.point), to_char(sum(po.point)/ count(*), '9999.99'), "
			+ "row_number() over(order by sum(po.point) DESC) "
			+ "from tbl_point_201905 po, tbl_artist_201905 art, tbl_mento_201905 men "
			+ "where po.artist_id = art.artist_id and po.mento_id =  men.mento_id "
			+ "group by po.artist_id, art.artist_name " + "order by sum(po.point) DESC";
	rs = conn.prepareCall(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">참가자등수조회</h2>

	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>총점</td>
					<td>평균</td>
					<td>등수</td>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</section>
</body>
</html>