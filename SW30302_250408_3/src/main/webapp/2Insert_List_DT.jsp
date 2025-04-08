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
	<jsp:include page="Header.jsp"></jsp:include>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	PreparedStatement pstmt;
	int va = 0;
	String resvno = request.getParameter("resvno");
	String sql = "select ju.pname, ju.jumin, decode(substr(ju.jumin, 8,1), '1', '남', '2', '여'), tel,resvdate, va.resvtime, ho.hospname, ho.hosptel, ju.address, decode(va.vcode, 'V001', 'A백신', 'V002','B백신','V003','C백신') "
			+ "from tbl_hosp_202109 ho, tbl_vaccresv_202109 va, tbl_jumin_201809 ju "
			+ "where ju.jumin = va.jumin and va.hospcode = ho.hospcode and va.resvno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, resvno);

	va = pstmt.executeUpdate();
	rs = pstmt.executeQuery();
	rs.next();
	if (va == 1) {
		String Date = rs.getString(5).substring(0, 4) + "년" + rs.getString(5).substring(4, 6) + "월"
		+ rs.getString(5).substring(6, 8) + "일";

		String Time = rs.getString(6).substring(0, 2) + ":" + rs.getString(5).substring(3, 5);
	%>
	<h2 style="text-align: center; padding: 20px;">
		예약번호 :
		<%=resvno%>
		의 접종예약조회
	</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_List_DT.jsp">
			<table border="1" style="text-align: center;">
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
					<td><%=Date%></td>
					<td><%=Time%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
				</tr>
			</table>
			<div style="text-align: center;">
				<input type="button" value="돌아가기"
					onclick="location.href='2Insert_List.jsp'">
			</div>
		</form>
	</section>
	<%
	} else {
	%>
	<section style="justify-content: center; display: flex;">
		<h2 style="text-align: center; padding: 20px;">접종예약정보가 존재하지 않음!!!
		</h2>
	</section>
	<div style="text-align: center;">
		<input type="button" value="돌아가기"
			onclick="location.href='2Insert_List.jsp'">
	</div>
	<%
	}
	%>

</body>
</html>