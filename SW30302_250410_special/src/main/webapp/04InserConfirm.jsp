<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("number"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("date"));
	pstmt.setString(6, request.getParameter("rank"));
	pstmt.setString(7, request.getParameter("code"));
	
	pstmt.executeUpdate();
	
	response.sendRedirect("05List.jsp");
%>
</body>
</html>