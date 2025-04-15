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

.s_tbl td {
text-align: left;
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
					<th>접종예약번호</th>
					<td><input type="text" name="resvno">예) 20210001</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin">예) 710101-1000001</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td><input type="text" name="vcode">예) V001 ~ V003</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td><input type="text" name="hospcode">예) H001</td>
				</tr>
				<tr>
					<th>예약일자</th>
					<td><input type="text" name="resvdate">예) 20211231</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="resvtime">예) 1230</td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="등록" onclick="yhs()"> <input
						type="reset" value="다시쓰기"></th>
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