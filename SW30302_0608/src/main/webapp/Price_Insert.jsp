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

	String MaxSql = "select max(saleno)+1 from tbl_sample_01";
	String PcodeSql = "select pcode,pname from tbl_item_01";
	String ScodeSql = "select scode,sname from tbl_server_01";

	ResultSet rs1 = conn.prepareStatement(MaxSql).executeQuery();
	ResultSet rs2 = conn.prepareStatement(PcodeSql).executeQuery();
	ResultSet rs3 = conn.prepareStatement(ScodeSql).executeQuery();

	rs1.next();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>판매등록</h2>
	<section>
		<form action="Price_Insert_Detail.jsp" name="form">
			<table border="1">
				<tr>
					<th>판매번호(자동발생)</th>
					<td><input type="text" name="saleno" readonly
						value="<%=rs1.getString(1)%>"></td>
				</tr>
				<tr>
					<td>제품등록일(자동발생)</td>
					<td><input type="text" name="saledate" readonly
						value="<%=Stdate%>"></td>
				</tr>
				<tr>
					<th>제품코드</th>
					<td><select name="pcode">
							<option value="N">선택</option>
							<%
							while (rs2.next()) {
							%>
							<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<th>판매서버</th>
					<td><select name="scode">
							<option value="N">선택</option>
							<%
							while (rs3.next()) {
							%>
							<option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<th>판매수량</th>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="등록"
						onclick="yhs()"> <input type="reset" value="다시쓰기"
						onclick="alert('다시쓰기를 눌렀다!')"></th>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
		function yhs() {
			var f = document.form;

			if (f.pcode.value == "N") {
				alert("제품코드 선택안됨!!!!");
				f.pcode.focus();
			} else if (f.scode.value == "N") {
				alert("판매서버 선택안됨!!!");
				f.scode.focus();
			} else if (f.amount.value == "") {
				alert("판매수량 입력안됨!!!");
				f.amount.focus();
			} else {
				alert("성공적으로 등록이 됨!!!");
				f.submit();
			}
		}
	</script>
</body>
</html>