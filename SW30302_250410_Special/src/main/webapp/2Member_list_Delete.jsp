custno<%@page import="java.sql.*"%>
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
	PreparedStatement pstmt;

	String sql = "DELETE FROM member_tbl_02 WHERE custno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custno"));
	pstmt.executeUpdate();
	response.sendRedirect("2Member_list.jsp");
	%>
</body>
</html>