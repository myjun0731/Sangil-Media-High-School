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
	String sql = "select artist_id ,artist_name, artist_birth, decode(artist_gender, 'F', '여', 'M', '남') , decode(talent, '1', '보컬', '2','댄스', '3', '랩'), agency from tbl_artist_201905";
	rs = conn.prepareCall(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">참가자 목록 조회</h2>

	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>특기</td>
					<td>소속사</td>
				</tr>
				<%
				while (rs.next()) {
					String birth = rs.getString(3).substring(0,4)+"년"+rs.getString(3).substring(4,6)+"월"+rs.getString(3).substring(6,8)+"일";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=birth%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</section>
</body>
</html>