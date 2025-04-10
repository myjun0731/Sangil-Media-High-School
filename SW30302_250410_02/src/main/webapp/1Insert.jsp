<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	ResultSet rs;
	String sql = "select max(custno)+1 from member_tbl_02";
	rs = conn.prepareStatement(sql).executeQuery();
	rs.next();
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	<h2 style="text-align: center; padding: 20px;">회원등록</h2>
	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1" style="text-align: center; display: flex;">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" value="<%=rs.getString(1)%>"
						name="custno"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:vip, B:일반,C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="yhs()"> <input
						type="button" value="조회" onclick="location.href='2Member_list.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>

	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.custno.value == "") {
				alert("회원번호 입력 필요.");
				f.custno.focus();
			} else if (f.custname.value == "") {
				alert("회원번호 입력 필요.");
				f.custname.focus();
			} else if (f.phone.value == "") {
				alert("회원번호 입력 필요.");
				f.phone.focus();
			} else if (f.address.value == "") {
				alert("회원번호 입력 필요.");
				f.address.focus();
			} else if (f.joindate.value == "") {
				alert("회원번호 입력 필요.");
				f.joindate.focus();
			} else if (f.grade.value == "") {
				alert("회원번호 입력 필요.");
				f.grade.focus();
			} else if (f.city.value == "") {
				alert("회원번호 입력 필요.");
				f.city.focus();
			} else {
				alert("등록완료");
				f.submit();
			}
		}
	</script>
</body>
</html>