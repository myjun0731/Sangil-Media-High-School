<%@page import="java.util.Scanner"%>
<%@ page import="java.sql.*" %>
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
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	ResultSet rs; 
	PreparedStatement pstmt;
	
	String sql = "Update member_tbl set tf = 0 where tf = 1 and mid = ?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("mid"));
	
	pstmt.executeUpdate();
	
	response.sendRedirect("Board.jsp");
	%>
</body>
</html>