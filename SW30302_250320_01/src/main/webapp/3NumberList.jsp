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

	String sql = "SELECT  " + "M.id,  " + "M.name,  " + "M.gender,  " + "S.korean,  " + "S.english,  " + "S.math,  "
			+ "S.history, " + "(S.korean + S.english + S.math + S.history) AS total_score, "
			+ "(S.korean + S.english + S.math + S.history) / 4 AS average_score, "
			+ "row_number() over (order by (S.korean + S.english + S.math + S.history)) as total_rank " + "FROM "
			+ "member_tbl M, score_tbl S " + "where M.id = S.id";

	String sql2 = "select sum(korean), sum(english), sum(math), sum(history), "
			+ "sum(sum(korean) + sum(english) + sum(math) + sum(history)), "
			+ "(sum(sum(korean) + sum(english) + sum(math) + sum(history))／count(korean + english + math + history)) "
			+ "from score_tbl " + "group by korean, english, math, history";

	rs = conn.prepareStatement(sql).executeQuery();
	rs2 = conn.prepareStatement(sql2).executeQuery();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center;">학생성적조회</h2>
	<section style="justify-content: center; display: flex;">
		<table border="1" style="text-align: center;">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(1).substring(0, 1)%></td>
				<td><%=rs.getString(1).substring(1, 3)%></td>
				<td><%=rs.getString(1).substring(3, 5)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
			</tr>
			<%
			}
			rs2.next();
			%>
			<tr>
				<td colspan="6"></td>
				<td>국어총합</td>
				<td>수학총합</td>
				<td>영어총합</td>
				<td>역사총합</td>
				<td>총합</td>
				<td>총평균</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="6"></td>
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
				<td></td>
			</tr>
		</table>
	</section>
</body>
</html>