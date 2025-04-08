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
	String sql = "select ju.pname, ju.jumin, decode(substr(ju.jumin, 8,1), '1', '��', '2', '��'), tel,resvdate, va.resvtime, ho.hospname, ho.hosptel, ju.address, decode(va.vcode, 'V001', 'A���', 'V002','B���','V003','C���') "
			+ "from tbl_hosp_202109 ho, tbl_vaccresv_202109 va, tbl_jumin_201809 ju "
			+ "where ju.jumin = va.jumin and va.hospcode = ho.hospcode and va.resvno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, resvno);

	va = pstmt.executeUpdate();
	rs = pstmt.executeQuery();
	rs.next();
	if (va == 1) {
		String Date = rs.getString(5).substring(0, 4) + "��" + rs.getString(5).substring(4, 6) + "��"
		+ rs.getString(5).substring(6, 8) + "��";

		String Time = rs.getString(6).substring(0, 2) + ":" + rs.getString(5).substring(3, 5);
	%>
	<h2 style="text-align: center; padding: 20px;">
		�����ȣ :
		<%=resvno%>
		�� ����������ȸ
	</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_List_DT.jsp">
			<table border="1" style="text-align: center;">
				<tr>
					<td>�̸�</td>
					<td>�ֹι�ȣ</td>
					<td>����</td>
					<td>��ȭ��ȣ</td>
					<td>��������</td>
					<td>����ð�</td>
					<td>������</td>
					<td>��ǥ��ȭ</td>
					<td>�����ּ�</td>
					<td>�������</td>
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
				<input type="button" value="���ư���"
					onclick="location.href='2Insert_List.jsp'">
			</div>
		</form>
	</section>
	<%
	} else {
	%>
	<section style="justify-content: center; display: flex;">
		<h2 style="text-align: center; padding: 20px;">�������������� �������� ����!!!
		</h2>
	</section>
	<div style="text-align: center;">
		<input type="button" value="���ư���"
			onclick="location.href='2Insert_List.jsp'">
	</div>
	<%
	}
	%>

</body>
</html>