<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
	
	String a = request.getParameter("search");
	String b = "'%"+a+"%'";
	
	String sql = "select * from member_tbl_02 where custname like "+ b;
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
%>
<title>Insert title here</title>
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
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5).substring(0,10) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%} %>
		</table>
	</section>
</body>
</html>