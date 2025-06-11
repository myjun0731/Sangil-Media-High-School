<%@page import="java.sql.*"%>
<%@ page import="java.util.Date , java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	Date date = new Date();
	SimpleDateFormat sim = new SimpleDateFormat("YYYYMMdd");
	String Stdate = sim.format(date);

	String MaxSql = "select max(subStr(PCODE, 3,2))+1 from TBL_ITEM_01";
	ResultSet rs1 = conn.prepareStatement(MaxSql).executeQuery();
	rs1.next();
	
	String Code = "AA"+rs1.getString(1);
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>아이템등록</h2>
	<section>
		<form action="Item_Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>제품코드(자동발생)</th>
					<td><input type="text" name="PCODE" readonly
						value="<%=Code%>"></td>
				</tr>
				<tr>
					<th>제품이름</th>
					<td><input type="text" name="PNAME"></td>
				</tr>
				<tr>
					<th>제품종류</th>
					<td><input type="text" name="TYPE"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="PRICE"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="등록" onclick="yhs()">
						<input type="reset" value="다시쓰기"
						onclick="alert('다시쓰기를 눌렀다!')"></th>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;

			if (f.PNAME.value == "") {
				alert("제품이름 입력해주십시오.");
				f.PNAME.focus();
			} else if (f.TYPE.value == "") {
				alert("제품종류 입력해주십시오.");
				f.TYPE.focus();
			} else if (f.PRICE.value == "") {
				alert("가격 입력해주십시오.");
				f.PRICE.focus();
			} else {
				alert("성공적으로 등록이 됨!!!");
				f.submit();
			}
		}
	</script>
</body>
</html>