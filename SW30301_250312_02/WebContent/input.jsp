<%@page import="common.JDBC"%>
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
		request.setCharacterEncoding("UTF-8");
	JDBC jdbc = new JDBC();
	try {
		String sql = "select max(custno)+1 from member_tbl_02";
		jdbc.rs = jdbc.conn.prepareStatement(sql).executeQuery();
		jdbc.rs.next();
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>홈쇼핑 회원 등록</h2>
		<form action="input_I.jsp" method="post">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" readonly name="custno"
						value="<%=jdbc.rs.getString(1)%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"> <a
						href="member_list.jsp"><input type="button" value="조회"></a></td>
				</tr>
			</table>
		</form>
		<%
			} catch (Exception e) {
		%>
		<p style="color: red;">
			회원 등록 폼을 로드하는 중 오류 발생:
			<%=e.getMessage()%>
		</p>
		<%
			}
		%>
	</section>
	<footer>
		<h2>상미고 30302 KimMyJun</h2>
	</footer>
</body>
</html>