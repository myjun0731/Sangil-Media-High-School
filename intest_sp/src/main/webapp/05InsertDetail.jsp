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
	Class.forName("oracle.jdbc.OracleDriver");
	PreparedStatement pstmt;
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String s_name = request.getParameter("s_name");
	String s_code = request.getParameter("s_code");
	String s_price = request.getParameter("s_price");
	
	pstmt= conn.prepareStatement("insert into tbl_specialty values (?,?,?)");
	pstmt.setString(1, s_code);
	pstmt.setString(2, s_name);
	pstmt.setString(3, s_price);
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	response.sendRedirect("04Insert.jsp");
	 
	 
%>
</body>
</html>