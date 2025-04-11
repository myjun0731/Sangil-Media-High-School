<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.jsp" name="kim">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mid">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="mpw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="son();">
					<input type="button" value="회원가입" onclick="location.href='Insert.jsp'">
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function son() {
			var f = document.kim;
			
			if(f.mid.value == ""){
				alert("김인혁 병신!");
				f.mid.focus();
				return false;
			}
			else if(f.mpw.value == ""){
				alert("김인혁 찐따!");
				f.mpw.focus();
				return false;
			}
			f.submit();
		}
	</script>
</body>
</html>