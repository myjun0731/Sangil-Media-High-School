<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
	padding: 20px;
}
.section {
	justify-content: center;
	display: flex;
}

.s_tbl {
text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 class="h2">백신접종예방</h2>

	<section class="section">
		<form action="1Insert_Detail.jsp" name="form">
			<table class="s_tbl" border="1">
				<tr>
					<td>접종예약번호</td>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="jumin"></td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" name="vcode"></td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td><input type="text" name="hospcode"></td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td><input type="text" name="resvdate"></td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td><input type="text" name="resvtime"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="yhs()"> <input
						type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.resvno.value == "") {
				alert("예약번호 입력 필요!");
				f.resvno.focus();
				return false;
			} else if (f.jumin.value == "") {
				alert("주민번호 입력 필요!");
				f.jumin.focus();
				return false;
			} else if (f.vcode.value == "") {
				alert("백신코드 입력 필요!");
				f.vcode.focus();
				return false;
			} else if (f.hospcode.value == "") {
				alert("병원코드 입력 필요!");
				f.hospcode.focus();
				return false;
			} else if (f.resvdate.value == "") {
				alert("예약일자 입력 필요!");
				f.resvdate.focus();
				return false;
			} else if (f.resvtime.value == "") {
				alert("예약시간 입력 필요!");
				f.resvtime.focus();
				return false;
			} else {
				alert("예약 완료!");
				f.submit();
			}

		}
	</script>
</body>
</html>