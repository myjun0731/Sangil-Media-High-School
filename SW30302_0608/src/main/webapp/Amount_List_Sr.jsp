<%@page import="java.sql.*"%>
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
	String select = request.getParameter("select");

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select " + "sa.saleno, " + "i.pname, " + "sa.saledate, " + "se.sname, " + "sa.amount, "
			+ "to_char(sum(i.price*sa.amount),'999,999,999')|| ' 메소', " + "sa.isbuy " + "from "
			+ "tbl_sample_01 sa,tbl_server_01 se,tbl_item_01 i " + "where "
			+ "i.pcode = sa.pcode and se.scode = sa.scode and i.pname like '%" + select + "%' " + "group by  "
			+ "sa.saleno, " + "i.pname, " + "sa.saledate, " + "se.sname, " + "sa.amount, " + "sa.isbuy " + "order by "
			+ "sa.saleno";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
		<form action="Amount_List_Sr.jsp" name="form1" class="Fr">
			<table>
				<tr>
					<td><input type="text" name="select" value="<%=select%>"><input
						type="submit" value="검색" onclick="return fn_submit();"></td>
				</tr>
			</table>
		</form>
	<section>
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품이름</td>
				<td>판매날짜</td>
				<td>서버이름</td>
				<td>갯수</td>
				<td>가격</td>
				<td>구매여부</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3).substring(0, 10)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><a
					href="Amount_List_UpDate.jsp?saleno=<%=rs.getString(1)%>"
					onclick="CK('<%=rs.getString(7)%>')"><%=rs.getString(7)%></a></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<script type="text/javascript">
		function CK(This) {
			if (This == 'N') {
				if (confirm("구매하시겠습니까?")) {
					alert("정상적으로 구매되었습니다.");
					return true;
				} else {
					alert("구매 취소");
					return false;
				}
			} else {
				if (confirm("판매하시겠습니까?")) {
					alert("정상적으로 판매되었습니다.");
					return true;
				} else {
					alert("판매 취소");
					return false;
				}

			}
		}
	</script>
</body>
</html>