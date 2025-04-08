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
	<h2 style="text-align: center; padding: 20px;">백신접종예약</h2>
	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1" style="text-align: center;">
				<tr>
					<td>접종예약번호</td>
					<td><input type="text" name="resvno">예) 20210001</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="jumin">예) 710101-1000001</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" name="vcode">예) V001-V003</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td><input type="text" name="hospcode">예) H001</td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td><input type="text" name="resvdate">예)20211231</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td><input type="text" name="resvtime">예) 1230</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록"
						onclick="yhs()"> <input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>

	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.resvno.value == "") {
				alert("접종예약번호 입력 필요!");
				f.resvno.focus();
			} else if (f.jumin.value == "") {
				alert("주민번호 입력 필요!");
				f.jumin.focus();
			} else if (f.vcode.value == "") {
				alert("접종예약번호 입력 필요!");
				f.vcode.focus();
			} else if (f.hospcode.value == "") {
				alert("예약일자 입력 필요!");
				f.hospcode.focus();
			} else if (f.resvdate.value == "") {
				alert("접종예약번호 입력 필요!");
				f.resvdate.focus();
			} else if (f.resvtime.value == "") {
				alert("예약시간 입력 필요!");
				f.resvtime.focus();
			} else {
				alert("예약 완료!");
				f.submit();
			}
		}
	</script>
</body>
</html>