<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="input.jsp" method="post">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><%=jdbc.rs.getString(1)%></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="custname" required placeholder="<%=jdbc.rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" required placeholder="<%=jdbc.rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" required placeholder="<%=jdbc.rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" required placeholder="<%=jdbc.rs.getString(5)%>"></td>
			</tr>
			<tr>
				<td>고객등급</td>
				<td><input type="text" name="grade" required placeholder="<%=jdbc.rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td>거주지역</td>
				<td><input type="text" name="city" required placeholder="<%=jdbc.rs.getString(7)%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	<%
			} catch (Exception e) {
		%>
	<p style="color: red;">
		회원 등록 폼을 로드하는 중 오류 발생:
		<%=e.getMessage()%>
	</p>
	<%
			}
		%>
	</section>
</body>
</html>