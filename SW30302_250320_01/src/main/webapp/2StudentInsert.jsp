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
	<h2 style="text-align: center; padding: 40px;">�л��������</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2StudentInsert_detail.jsp" name="form"
			onsubmit="yhs(); return false;">
			<table border="1" style="text-align: center;">
				<tr>
					<td>�й�</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="history"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="���"></td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];

			if (f["id"].value === "") {
				alert("�й��� �Էµ��� �ʾҽ��ϴ�.");
				f["id"].focus();
				return false;
			}
			if (f["korean"].value === "") {
				alert("���������� �Էµ��� �ʾҽ��ϴ�.");
				f["korean"].focus();
				return false;
			}
			if (f["math"].value === "") {
				alert("���������� �Էµ��� �ʾҽ��ϴ�.");
				f["math"].focus();
				return false;
			}
			if (f["english"].value === "") {
				alert("���������� �Էµ��� �ʾҽ��ϴ�.");
				f["english"].focus();
				return false;
			}
			if (f["history"].value === "") {
				alert("���� ������ �Էµ��� �ʾҽ��ϴ�.");
				f["history"].focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>