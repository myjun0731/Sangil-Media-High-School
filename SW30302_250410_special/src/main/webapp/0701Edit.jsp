<%@page import="java.util.LinkedList"%>
<%@page import="java.awt.geom.Path2D"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
section {
	position: fixed;
	top: 100px;
	width: 100%;
	height: 100%;
	width: 100%;
}

section h1 {
	text-align: center;
}

section p {
	margin-left: 25px;
}

section table {
	margin: auto;
}
</style>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
LinkedList<Integer> list = new LinkedList<>();

boolean bol = false;
String custno_sql = "select custno from member_tbl_02";
PreparedStatement custno_pstmt = con.prepareStatement(custno_sql);
ResultSet custno_rs = custno_pstmt.executeQuery();
String number = request.getParameter("num");
String custno = "";

while (custno_rs.next()) {
	if (number.equals(number)) {
		bol = true;
		list.addFirst(custno_rs.getString("custno"));
		custno = number; // 이어서 --!
	} else {

		bol = false;
	}
}
%>
<title>Insert</title>
</head>
<body>
	<jsp:include page="01Header.jsp"></jsp:include>
	<%
	try {
	%>
	<section>
		<%
		String sql = "select * from member_tbl_02 where custno = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);

		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String dd = rs.getString(1);
		String dd2 = rs.getString(2);
		String dd3 = rs.getString(3);
		String dd4 = rs.getString(4);
		String dd5 = rs.getString(5);
		String dd6 = rs.getString(6);
		String dd7 = rs.getString(7);
		rs.close();
		%>
		<h1>홈쇼핑 회원 수정</h1>
		<form action="08Edit.jsp" name="form">
			<table border="1">
				<tr>
					<th>학원번호</th>
					<td><input type="text" name="number" readonly="readonly"
						value="<%=dd%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="name" value="<%=dd2%>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=dd3%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=dd4%>""></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="date"
						value="<%=dd5.substring(0, 10)%>"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="rank" value="<%=dd6%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="code" value="<%=dd7%>"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<%
						int after = Integer.parseInt(number) + 1;
						int before = Integer.parseInt(number) - 1;
						%> <input type="button" value="<<=이전"
						onclick="location.href='0701Edit.jsp?num=<%=before%>'"> <input
						type="submit" value="수 정" onclick="son(); return false;">
						<input type="button" value="조 회"
						onclick="location.href='05List.jsp'"> <input type="button"
						value="이후=>>"
						onclick="location.href='0701Edit.jsp?num=<%=after%>'">
					</td>
				</tr>
			</table>
		</form>
		<form action="10Delete.jsp"
			style="text-align: center; margin-top: 10px;"
			onsubmit="return confirm('회원탈퇴 할거임??');">
			<input type="hidden" name="delete" value="<%=number%>"> <input
				type="submit" value="회원탈퇴">
		</form>
	</section>
	<%
	} catch (Exception e) {
	%>

	<h2 style="text-align: center;">존재하지 않는 번호입니다!</h2>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql2 = "select max(custno) from member_tbl_02";
	String sql3 = "select min(custno) from member_tbl_02";
	PreparedStatement pstmt2 = con2.prepareStatement(sql2);
	PreparedStatement pstmt3 = con2.prepareStatement(sql3);

	ResultSet rs2 = pstmt2.executeQuery();
	ResultSet rs3 = pstmt3.executeQuery();
	rs2.next();
	rs3.next();

	int num = Integer.parseInt(request.getParameter("num"));
	if (num > rs2.getInt(1)) {
		int num2 = num - 1;
	%>
	<div style="text-align: center;">
		<input type="button" value="<<=이전"
			onclick="location.href='0701Edit.jsp?num=<%=num2%>'">
	</div>
	<%
	} else if (num < rs3.getInt(1)) {
	int num3 = num + 1;
	%>
	<div style="text-align: center;">
		<input type="button" value="이후=>>"
			onclick="location.href='0701Edit.jsp?num=<%=num3%>'">
	</div>
	<%
	}

	}
	%>

</body>
</html>