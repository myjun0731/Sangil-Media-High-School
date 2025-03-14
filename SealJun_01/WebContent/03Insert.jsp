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
	String sql = "select max(custno)+1 as custno from member_tbl_02";
	rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	String custno = rs.getString("custno");
	%>
	<jsp:include page="01Header.jsp"></jsp:include>
	<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
	<section style="justify-content: center; display: flex">
		<form action="03InsertDetail.jsp">
			<table border="1" style="text-align: center">
				<tr>
					<td>회원번호(자동생성)</td>
					<td><input type="text" readonly="readonly" name="custno" value="<%=custno%>"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="등록"> <input type="button" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>