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
	<h2>�л� ���� ���</h2>
	<section>
		<form action="2St_Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>�й�</td>
					<td><input type="text" name="id"></td>
				</tr>
				<!-- �л� ���� ��� �������� �й�, ����, ����, ����, ���縦 �Է��ϴ� ���� �ֽ��ϴ�. ���⼭ ������ ������ radio�� �̿��Ͽ� 100�� 90�� 80�� 70������ �����Ͻÿ�. �׸��� �̿� �ش��ϴ� ��ȿ���˻絵 �Ϸ��Ͻÿ�. -->

				<tr>
					<td>����</td>
					<td><input type="radio" value="100" name="korean">100��
						<input type="radio" value="90" name="korean">90�� <input
						type="radio" value="80" name="korean">80�� <input
						type="radio" value="70" name="korean">70��</td>
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
				<tr style="text-align: center;">
					<td colspan="2"><input type="button" value="���"
						onclick="yhs()"></td>
				</tr>
			</table>
		</form>
	</section>

	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.id.value == "") {
				alert("�й� �Է� �ʿ�");
				f.id.focus();
				return false;
			} else if (!(f.korean.value.check)) {
				alert("���� ���� �Է� �ʿ�");
				f.korean.focus();
				return false;
			} else if (f.math.value == "") {
				alert("���� ���� �Է� �ʿ�");
				f.math.focus();
			} else if (f.english.value == "") {
				alert("���� ���� �Է� �ʿ�");
				f.english.focus();
				return false;
			} else if (f.history.value == "") {
				alert("���� ���� �Է� �ʿ�");
				f.history.focus();
				return false;
			} else {
				alert("��� �Ϸ�");
				f.submit();
			}
		}
	</script>
</body>
</html>