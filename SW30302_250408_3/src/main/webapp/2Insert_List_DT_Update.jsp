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

String resvno = request.getParameter("resvno");
String sql = "select * FROM tbl_vaccresv_202109 WHERE resvno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, resvno);

ResultSet rs = pstmt.executeQuery();
rs.next();
%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">�����������(����)</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_List_DT_Ch.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>���������ȣ</td>
					<td><input type="text" name="resvno"
						value="<%=rs.getString("resvno")%>" readonly>��) 20210001</td>
				</tr>
				<tr>
					<td>�ֹι�ȣ</td>
					<td><input type="text" name="jumin"
						value="<%=rs.getString("jumin")%>">��) 710101-1000001</td>
				</tr>
				<tr>
					<td>����ڵ�</td>
					<td><input type="text" name="vcode"
						value="<%=rs.getString("vcode")%>">��) V001-V003</td>
				</tr>
				<tr>
					<td>�����ڵ�</td>
					<td><input type="text" name="hospcode"
						value="<%=rs.getString("hospcode")%>">��) H001</td>
				</tr>
				<tr>
					<td>��������</td>
					<td><input type="text" name="resvdate"
						value="<%=rs.getString("resvdate")%>">"��)20211231</td>
				</tr>
				<tr>
					<td>����ð�</td>
					<td><input type="text" name="resvtime"
						value="<%=rs.getString("resvtime")%>">��) 1230</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="����"
						onclick="yhs()"> <input type="reset" value="�ٽþ���"></td>
				</tr>
			</table>
		</form>
	</section>

	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.resvno.value == "") {
				alert("���������ȣ �Է� �ʿ�!");
				f.resvno.focus();
			} else if (f.jumin.value == "") {
				alert("�ֹι�ȣ �Է� �ʿ�!");
				f.jumin.focus();
			} else if (f.vcode.value == "") {
				alert("���������ȣ �Է� �ʿ�!");
				f.vcode.focus();
			} else if (f.hospcode.value == "") {
				alert("�������� �Է� �ʿ�!");
				f.hospcode.focus();
			} else if (f.resvdate.value == "") {
				alert("���������ȣ �Է� �ʿ�!");
				f.resvdate.focus();
			} else if (f.resvtime.value == "") {
				alert("����ð� �Է� �ʿ�!");
				f.resvtime.focus();
			} else {
				alert("���� �Ϸ�!");
				f.submit();
			}
		}
	</script>
</body>
</html>