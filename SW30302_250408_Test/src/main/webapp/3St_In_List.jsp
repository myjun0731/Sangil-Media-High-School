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
	String sql = "SELECT " + "mt.id, " + "mt.name, " + "substr(mt.id, 0, 1), " + "substr(mt.id, 2, 2), "
			+ "substr(mt.id, 4, 3), " + "mt.gender, " + "st.korean, " + "st.math, " + "st.english, " + "st.history, "
			+ "sum(st.korean + st.math + st.english + st.history), "
			+ "sum(st.korean + st.math + st.english + st.history) / 4, "
			+ "ROW_NUMBER() OVER(ORDER BY sum(st.korean + st.math + st.english + st.history)) " + "FROM "
			+ "MEMBER_TBL mt, " + "score_tbl st " + "WHERE " + "mt.id = st.id " + "GROUP BY " + "mt.id, " + "mt.name, "
			+ "mt.gender, " + "st.korean, " + "st.math, " + "st.english, " + "st.history";

	rs = conn.prepareStatement(sql).executeQuery();
	ResultSet rs2;
	String sql2 = "SELECT " + "sum(st.korean), " + "sum(st.math), " + "sum(st.english), " + "sum(st.history), "
			+ "to_char(sum(st.korean)+ sum(st.math)+ sum(st.english) + sum(st.history), '999999.0'), "
			+ "(sum(st.korean)+ sum(st.math)+ sum(st.english) + sum(st.history)) / count(*) " + "FROM " + "score_tbl st";
	rs2 = conn.prepareStatement(sql2).executeQuery();
	rs2.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>학생조회</h2>
	<section>
		<table border="1">
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
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=rs.getString(13)%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="6"></td>
				<td>국어 총합</td>
				<td>수학 총합</td>
				<td>영어 총합</td>
				<td>역사 총합</td>
				<td>총합</td>
				<td>총평균</td>
				<td></td>
			</tr>
			<!-- 학생 성적 등록 폼에서는 학번, 국어, 수학, 영어, 역사를 입력하는 란이 있습니다. 여기서 국어의 점수는 radio를 이용하여 100점 90점 80점 70점으로 구현하시오. 그리고 이에 해당하는 유효성검사도 완료하시오. -->
			<tr>
				<td colspan="6"></td>
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
				<td></td>
			</tr>
		</table>
	</section>
</body>
</html>