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
	<h2>학생 성적 등록</h2>
	<section>
		<form action="2St_Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="id"></td>
				</tr>
				<!-- 학생 성적 등록 폼에서는 학번, 국어, 수학, 영어, 역사를 입력하는 란이 있습니다. 여기서 국어의 점수는 radio를 이용하여 100점 90점 80점 70점으로 구현하시오. 그리고 이에 해당하는 유효성검사도 완료하시오. -->

				<tr>
					<td>국어</td>
					<td><input type="radio" value="100" name="korean">100점
						<input type="radio" value="90" name="korean">90점 <input
						type="radio" value="80" name="korean">80점 <input
						type="radio" value="70" name="korean">70점</td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<td>역사</td>
					<td><input type="text" name="history"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input type="button" value="등록"
						onclick="yhs()"></td>
				</tr>
			</table>
		</form>
	</section>

	<script type="text/javascript">
		function yhs() {
			var f = document.forms["form"];
			if (f.id.value == "") {
				alert("학번 입력 필요");
				f.id.focus();
				return false;
			} else if (!(f.korean.value.check)) {
				alert("국어 점수 입력 필요");
				f.korean.focus();
				return false;
			} else if (f.math.value == "") {
				alert("수학 점수 입력 필요");
				f.math.focus();
			} else if (f.english.value == "") {
				alert("영어 점수 입력 필요");
				f.english.focus();
				return false;
			} else if (f.history.value == "") {
				alert("역사 점수 입력 필요");
				f.history.focus();
				return false;
			} else {
				alert("등록 완료");
				f.submit();
			}
		}
	</script>
</body>
</html>