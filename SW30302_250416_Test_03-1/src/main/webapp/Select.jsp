<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
}

form {
	justify-content: center;
	display: flex;
}

h2, div {
	text-align: center;
	padding: 20px;
}
table {
text-align: center;
}
</style>
</head>
<body>
	<h2>접종예약조회</h2>
	<form action="SelectList.jsp">
		<table class="tbl" border="1">
			<tr>
				<td>조회 검색 필터</td>
				<td><select name="Ft">
						<option value="ju.pname">이름</option>
						<option value="ju.jumin1">주민번호(앞자리)</option>
						<option value="ju.jumin2">주민번호(뒷자리)</option>
						<option value="substr(ju.jumin, 8, 1)">성별</option>
						<option value="ju.tel">전화번호</option>
						<option value="va.resvdate">예약일자</option>
						<option value="va.resvtime">예약시간</option>
						<option value="ho.hospname">병원명</option>
						<option value="ho.hosptel">대표전화</option>
						<option value="ho.hospaddr">병원주소</option>
						<option value="va.vcode">백신종류</option>
				</select></td>
			</tr>

			<tr>
				<td>입력 : </td>
				<td><input type="text" name="Select"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>
</body>
</html>