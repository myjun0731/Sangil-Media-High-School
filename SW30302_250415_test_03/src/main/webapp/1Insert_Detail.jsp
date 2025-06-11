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
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;

	String resvno = request.getParameter("resvno");
	String jumin = request.getParameter("jumin");
	String vcode = request.getParameter("vcode");
	String hospcode = request.getParameter("hospcode");
	String resvdate = request.getParameter("resvdate");
	String resvtime = request.getParameter("resvtime");

	String sql = "insert into tbl_vaccresv_202109 values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, resvno);
	pstmt.setString(2, jumin);
	pstmt.setString(3, vcode);
	pstmt.setString(4, hospcode);
	pstmt.setString(5, resvdate);
	pstmt.setString(6, resvtime);
	pstmt.executeUpdate();
	response.sendRedirect("1Insert.jsp");
	%>
</body>
</html>