<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	section{
		position: fixed;
		top: 100px;
		width: 100%;
		height: 100%;
		width: 100%;
	}
	section h1{
		text-align: center;
	}
	section p{
		margin-left: 25px;
	}
	section table{
		margin: auto;
	}
</style>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "select "+
			"mem.custno, mem.custname, "+
			"case "+
			"when grade = 'A' then 'VIP' "+
			"when grade = 'B' then '일반' "+
			"when grade = 'C' then '직원' "+
			"end as 등급, "+
			"sum(pcost*amount) "+
			"from member_tbl_02 mem, money_tbl_02 mon "+
			"where mem.custno = mon.custno "+
			"group by mem.custno, mem.custname, mem.grade "+
			"order by sum(pcost*amount) desc";
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
%>
<title>List</title>
</head>
<body>
	<jsp:include page="01Header.jsp"></jsp:include>
	
	<section>
		<h1>회원매출조회</h1>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등극</th>
				<th>매출</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<%} %>
		</table>
	</section>
</body>
</html>