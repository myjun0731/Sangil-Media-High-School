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
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String test = "0";
	
	String sql = "insert into member_tbl values(?,?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("mid"));
	pstmt.setString(2, request.getParameter("mname"));
	pstmt.setString(3, request.getParameter("mpw"));
	pstmt.setString(4, test);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("login.jsp");
%>
</body>
</html>