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
	<h2 style="text-align: center; padding: 20px;">����������ȸ</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Insert_List_DT.jsp">
			<table border="1" style="text-align: center;">
				<tr>
					<td>�����ȣ �Է��Ͻÿ�.</td>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td colspan="10"><input type="submit" value="������ȸ"> <input
						type="button" value="Ȩ����" onclick="location.href='4Index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>