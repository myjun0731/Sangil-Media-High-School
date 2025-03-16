<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function validateForm() {
		var form = document.forms["form"];
		var fields = [ "custname", "phone", "address", "joindate", "grade",
				"city" ];
		for (var i = 0; i < fields.length; i++) {
			var field = form[fields[i]];
			if (field.value.trim() == "") {
				alert(fields[i] + "을(를) 입력해 주세요.");
				field.focus();
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="01_Header.jsp"></jsp:include>

		<h2 style="text-align: center;">수정</h2>
	<section style="justify-content: center; display: flex">
		<%
		request.setCharacterEncoding("UTF-8");
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		PreparedStatement pstmt;
		ResultSet rs;
		String custno = request.getParameter("custno");
		String sql = "SELECT * FROM member_tbl_02 where custno = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		%>
		<form action="04_MemberList_edit.jsp?custno=<%=custno%>" name="form"
			onsubmit="return validateForm()">
			<table  border="1" style="text-align: center">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" 
						value="<%=rs.getString("custno")%>"></td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td><input type="text" name="custname" 
						value="<%=rs.getString("custname")%>"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" 
						value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" 
						value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" 
						value="<%=rs.getString("joindate").substring(0, 10)%>"></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td><input type="text" name="grade" 
						value="<%=rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<td>거주지역</td>
					<td><input type="text" name="city" 
						value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
		<%
		}
		%>
	</section>
</body>
</html>