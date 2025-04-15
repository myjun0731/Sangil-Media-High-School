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

	<h2 class="h2">접종예약조회</h2>

	<section class="section">
		<form action="2List_select.jsp" name="form">
			<table class="s_tbl" border="1">
				<tr>
					<td>접종예약번호 입력</td>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="예약조회" onclick="yhs()">
						<input type="button" value="홈으로" onclick="location.href='4Index.jsp'">
					</td>
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
			} else {
				f.submit();
			}
		}
	</script>
</body>
</html>