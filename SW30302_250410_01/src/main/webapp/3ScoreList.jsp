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
	String sql = "select po.serial_no, po.artist_id, art.artist_name, art.artist_birth, po.point,po.point, men.mento_name " +
			"from tbl_point_201905 po, tbl_artist_201905 art, tbl_mento_201905 men " +
			"where po.artist_id = art.artist_id and po.mento_id =  men.mento_id order by po.serial_no";
			
	rs = conn.prepareCall(sql).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">멘토점수조회</h2>

	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>채점번호</td>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>생년월일</td>
					<td>점수</td>
					<td>평점</td>
					<td>멘토</td>
				</tr>
				<%
				while (rs.next()) {
							String birth = rs.getString(4).substring(0, 4) + "년" + rs.getString(4).substring(4, 6) + "월"
							+ rs.getString(4).substring(6, 8) + "일";
						
						int Scor = rs.getInt(6);
						String Scor2 = "";
						
						switch(Scor/10){
						case 9:
							Scor2 = "A";
							break;
						case 8:
							Scor2 = "B";
							break;
						case 7:
							Scor2 = "C";
							break;
						case 6:
							Scor2 = "F";
							break;
						}
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=birth%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=Scor2%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</section>
</body>
</html>