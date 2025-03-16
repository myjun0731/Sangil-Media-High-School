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
	String sql = "select * from member_tbl_02";
	rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="01_Header.jsp"></jsp:include>
	<h2 style="text-align: center;">회원목록 조회/수정</h2>
	<section style="justify-content: center; display: flex">
		<table border="1" style="text-align: center">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>회원전화</td>
				<td>회원주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>도시코드</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><a
					href="04_MemberList_Update.jsp?custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=rs.getString("joindate").substring(0, 10)%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("city")%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>