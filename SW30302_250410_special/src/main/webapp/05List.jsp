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
		text-align: center;
	}
</style>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "select custno, custname, phone, address, "+
			"to_char(joindate,'YYYY-MM-DD') as 날짜, "+
			"case "+
			"when grade = 'A' then 'VIP' "+
			"when grade = 'B' then '일반' "+
			"when grade = 'C' then '직원' "+
			"end as 등급, "+
			"city from member_tbl_02";
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
%>
<title>List</title>
</head>
<body>
	<jsp:include page="01Header.jsp"></jsp:include>
	
	<section>
		<h1>회원목록조회/수정</h1>
		<form action="09Search.jsp" style="text-align: center;">
			<input type="text" name="search">
			<input type="submit" value="검색">
		</form><br>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주직역</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><a href="07Edit.jsp?
				custno=<%=rs.getString(1) %>
				&custname=<%=rs.getString(2) %>
				&phone=<%=rs.getString(3) %>
				&address=<%=rs.getString(4) %>
				&joindate=<%=rs.getString(5) %>
				&grade=<%=rs.getString(6) %>
				&city=<%=rs.getString(7) %>
				"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%} %>
		</table>
	</section>
</body>
</html>