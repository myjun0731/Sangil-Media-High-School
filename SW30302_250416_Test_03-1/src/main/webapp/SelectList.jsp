<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
}

form {
	justify-content: center;
	display: flex;
}

h2, div {
	text-align: center;
	padding: 20px;
}

table {
	text-align: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;
	ResultSet rs;
	String Ft = request.getParameter("Ft");
	String Select = request.getParameter("Select");

	if (Ft.equals("ju.jumin1")) {
		Select = Select + "%";
		System.out.println("1" + Select);
		Ft = "ju.jumin";
	} else if (Ft.equals("ju.jumin2")) {
		Select = "%" + Select;
		System.out.println("2" + Select);
		Ft = "ju.jumin";
	}
	String sql = "select ju.pname, ju.jumin, decode(substr(ju.jumin, 8, 1), '1', '남', '2', '여'), ju.tel, va.resvdate, substr(va.resvtime, 0,2) || ':' || substr(va.resvtime, 3,2), ho.hospname, ho.hosptel, ho.hospaddr, decode(va.vcode, 'V001','A백신','V002','B백신','V003','C백신') "
			+ "from tbl_vaccresv_202108 va, tbl_hosp_202108 ho, tbl_jumin_201808 ju "
			+ "where va.jumin = ju.jumin and ho.hospcode = va.hospcode and " + Ft + " like ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, Select);
	rs = pstmt.executeQuery();
	%>

	<h2>조회 결과</h2>
	<form action="SelectList.jsp">
		<table class="tbl" border="1">
			<tr>
				<td>이름</td>
				<td>주민번호</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>예약일자</td>
				<td>예약시간</td>
				<td>병원명</td>
				<td>대표전화</td>
				<td>병원주소</td>
				<td>백신종류</td>
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
			</tr>
			<%
			}
			%>
		</table>
	</form>
	<div>
		<input type="button" value="돌아가기" onclick="location.href='Select.jsp'">
	</div>
</body>
</html>