<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 등록</title>
</head>
<style>
section {
	text-align: center;
	padding: 40px;
}

section form {
	display: inline-block;
	text-align: left;
}

section table {
	margin: 0 auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px 12px;
}

input[type="text"] {
	width: 200px;
	padding: 4px;
}

/* 버튼을 꾸며요 */
.btn {
	padding: 6px 12px;
	margin: 0 5px;
}
</style>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver"); // 오라클 데이터베이스 드라이버 불러오기
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // DB 연결

	String sql = "select count(*) +1 from tbl_specialty";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	rs.next();

	String Number = "T" + rs.getString(1);

	rs.close();
	conn.close();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">특산물 등록</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="InsertDetail.jsp" name="form">
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>특산물 번호(자동생성)</th>
					<td><input type="text" name="s_code" value="<%=Number%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>특산물 이름</th>
					<td><input type="text" name="s_name"></td>
				</tr>

				<tr>
					<th>특산물 가격</th>
					<td><input type="text" name="s_price"></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="등록" onclick="fn_submit(); return false;">
						<input type="button" value="조회" onclick="location.href='List.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>

	<!-- 5. 입력값이 비어있으면 경고창을 띄우는 기능 -->
	<script>
		function fn_submit() {
			var f = document.form;
			if (f.s_name.value.trim() === "") {
				alert("특산물 이름이 입력되지 않았습니다.");
				f.s_name.focus();
				return false;
			}
			if (f.s_price.value.trim() === "") {
				alert("특산물 가격이 입력되지 않았습니다.");
				f.s_price.focus();
				return false;
			}
			alert("정상적으로 등록되었습니다.");
			return true;
		}
	</script>
</body>
</html>