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
<%-- 	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;

	String sql = "";
	rs = conn.prepareStatement(sql).executeQuery();

	rs.next();
	%> --%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">�޴����/����</h2>
	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp">
			<table border="1" style="text-align: center;">
				<tr>
					<td>�޴��ڵ�</td>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td>�޴���</td>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td>�޴�����</td>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td>�޴�����</td>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="���">
					<input type="button" value="��ȸ" onclick="location.href='3Price.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>