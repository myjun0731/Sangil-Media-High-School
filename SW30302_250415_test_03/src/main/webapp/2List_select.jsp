<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
	padding: 20px;
}
.section {
	justify-content: center;
	display: flex;
}

.s_tbl {
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
	String resvno = request.getParameter("resvno");
	String sql = "select ju.pname, ju.jumin, decode(substr(ju.jumin, 8,1), '1', '남', '2', '여'), tel,resvdate, va.resvtime, ho.hospname, ho.hosptel, ju.address, decode(va.vcode, 'V001', 'A백신', 'V002','B백신','V003','C백신') "
			+ "from tbl_hosp_202109 ho, tbl_vaccresv_202109 va, tbl_jumin_201809 ju "
			+ "where ju.jumin = va.jumin and va.hospcode = ho.hospcode and resvno = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, resvno);
	rs = pstmt.executeQuery();
	rs.next();
	%>

	<jsp:include page="Header.jsp"></jsp:include>

	<h2 class="h2">백신접종예방</h2>

	<section class="section">
		<form action="2List_select.jsp" name="form">
			<table class="s_tbl" border="1">
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
			</table>
		</form>
		<input type="button" value="돌아가기" onclick="location.href='2List.jsp'">
	</section>
</body>
</html>