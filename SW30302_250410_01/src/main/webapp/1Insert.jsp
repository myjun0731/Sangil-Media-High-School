<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<Style>
table th {
	text-align: center;
}
</Style>
	<jsp:include page="Header.jsp"></jsp:include>

	<h2 style="text-align: center; padding: 20px;">오디션 등록</h2>

	<section style="justify-content: center; display: flex;">
		<form action="1Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>참가번호</th>
					<td><input type="text" name="artist_id">*참가번호는
						(A000)4자리입니다.</td>
				</tr>
				<tr>
					<th>참가자명</th>
					<td><input type="text" name="artist_name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="artist_birth1">년 <input
						type="text" name="artist_birth2">월 <input type="text"
						name="artist_birth3">일</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="artist_gender" value="M">남성
						<input type="radio" name="artist_gender" value="F">여성</td>
				</tr>
				<tr>
					<th>특기</th>
					<td><select name="talent">
							<option>특기선택</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
					</select></td>
				</tr>
				<tr>
					<th>소속사</th>
					<td><input type="text" name="agency"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="오디션 등록"
						onclick="yhs();"> <input type="reset" value="다시쓰기">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];

			if (f.artist_id.value == "") {
				alert("참가번호 입력 필요!");
				f.artist_id.focus();
				return false;
			} else if (f.artist_name.value == "") {
				alert("참가자명 입력 필요!");
				f.artist_name.focus();
				return false;
			} else if (f.artist_birth1.value == "") {
				alert("년 입력 필요!");
				f.artist_birth1.focus();
				return false;
			} else if (f.artist_birth2.value == "") {
				alert("월 입력 필요!");
				f.artist_birth2.focus();
				return false;
			} else if (f.artist_birth3.value == "") {
				alert("일 입력 필요!");
				f.artist_birth3.focus();
				return false;
			} else if (!(f.artist_gender[0].checked || f.artist_gender[1].checked)) {
				alert("성별 선택 필요!");
				f.artist_gender.focus();
				return false;
			} else if (!(f.talent.value == "1" || f.talent.value == "2" || f.talent.value == "3")) {
				alert("특기 선택 필요!");
				f.talent.focus();
				return false;
			} else if (f.agency.value == "") {
				alert("소속사 입력 필요!");
				f.agency.focus();
				return false;
			} else {
				alert("등록 완료!");
				f.submit();
			}
		}
	</script>
</body>
</html>